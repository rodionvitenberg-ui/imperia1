"""
Management command: привязывает физические файлы изображений к товарам и брендам.

Сканирует папки media/product_images/ и media/brand_logos/,
сопоставляет имена файлов со слагами товаров/брендов и создаёт связи.

Использование:
    python manage.py attach_media                          # сухой прогон (--dry-run по умолчанию)
    python manage.py attach_media --apply                  # реальное создание записей
    python manage.py attach_media --apply --rebrand        # обновить логотипы брендов из папки brand_logos
    python manage.py attach_media --force                  # удалить старые записи ProductImage и создать заново
"""

import os
import re

from django.conf import settings
from django.core.management.base import BaseCommand, CommandError
from django.db import transaction

from products.models import Product, Brand, ProductImage


def find_product_by_name_stem(stem: str) -> Product | None:
    """
    Ищет товар по стеблю имени файла.
    Стебель = имя файла без расширения, где всё до первого _ или -
    считается slug'ом товара (с допуском).
    Пробует точное совпадение slug, потом LIKE.
    """
    # 1. Пробуем точное совпадение slug
    qs = Product.objects.filter(slug=stem)
    if qs.exists():
        return qs.first()

    # 2. Пробуем slug содержит stem
    qs = Product.objects.filter(slug__startswith=stem)
    if qs.exists():
        return qs.first()

    # 3. Пробуем slug содержит stem (без дефисов на конце)
    stem_clean = stem.rstrip('-_')
    if stem_clean != stem:
        qs = Product.objects.filter(slug=stem_clean)
        if qs.exists():
            return qs.first()

    # 4. Пробуем name содержит stem (транслитерированный поиск)
    for p in Product.objects.all():
        slugified = p.slug
        if stem_clean in slugified or slugified in stem_clean:
            return p

    return None


def get_stem(filename: str) -> str:
    """Извлекает стебель из имени файла: 'intel-core-i9-14900k_main.jpg' → 'intel-core-i9-14900k'"""
    name, _ = os.path.splitext(filename)
    # Удаляем суффиксы _main, _01, _02, _gallery, -main, -01 и т.п.
    name = re.sub(r'[-_](?:main|gallery|\d{2,3}|360|poster)$', '', name, flags=re.IGNORECASE)
    return name


def classify_file(filename: str) -> str:
    """Определяет image_type по имени файла."""
    name, _ = os.path.splitext(filename.lower())
    if 'main' in name:
        return 'main'
    elif '360' in name or 'panorama' in name:
        return '360'
    elif 'poster' in name or 'video' in name:
        return 'video_poster'
    return 'gallery'


class Command(BaseCommand):
    help = 'Привязывает файлы изображений из media к товарам и брендам'

    def add_arguments(self, parser):
        parser.add_argument('--apply', action='store_true', help='Реально создавать записи (без флага — dry-run)')
        parser.add_argument('--force', action='store_true', help='Удалить старые ProductImage перед созданием')
        parser.add_argument('--rebrand', action='store_true', help='Обновить логотипы брендов из brand_logos/')

    def handle(self, *args, **options):
        media_root = settings.MEDIA_ROOT
        dry_run = not options.get('apply')
        force = options.get('force', False)
        rebrand = options.get('rebrand', False)

        if not os.path.isdir(media_root):
            raise CommandError(f'MEDIA_ROOT не существует: {media_root}')

        self.stdout.write(f'📁 MEDIA_ROOT: {media_root}')
        self.stdout.write(f'{"🔍 DRY RUN" if dry_run else "⚡ APPLY MODE"} — никакие изменения не будут сохранены\n')

        # ─── Товары ────────────────────────────────────────────────────
        prod_dir = os.path.join(media_root, 'product_images')
        if not os.path.isdir(prod_dir):
            self.stdout.write(self.style.WARNING(f'Папка {prod_dir} не найдена, пропускаем товары'))
        else:
            self._process_products(prod_dir, dry_run, force)

        # ─── Бренды ────────────────────────────────────────────────────
        brand_dir = os.path.join(media_root, 'brand_logos')
        if not os.path.isdir(brand_dir):
            self.stdout.write(self.style.WARNING(f'Папка {brand_dir} не найдена, пропускаем бренды'))
        else:
            self._process_brands(brand_dir, dry_run, rebrand)

        self.stdout.write(self.style.SUCCESS('\n✅ Готово!'))

    def _process_products(self, prod_dir: str, dry_run: bool, force: bool):
        """Обрабатывает изображения товаров."""
        files = sorted([
            f for f in os.listdir(prod_dir)
            if os.path.isfile(os.path.join(prod_dir, f))
               and not f.startswith('.')
        ])

        self.stdout.write(f'\n📸 Найдено файлов в product_images/: {len(files)}')

        if force:
            count_before = ProductImage.objects.count()
            if not dry_run:
                ProductImage.objects.all().delete()
            self.stdout.write(
                f'{"🗑 Удалено" if not dry_run else "🔍 Будет удалено"} '
                f'{count_before} записей ProductImage'
            )

        # Группируем файлы по стеблю
        grouped: dict[str, list[str]] = {}
        for f in files:
            stem = get_stem(f)
            grouped.setdefault(stem, []).append(f)

        matched = 0
        created = 0
        skipped = 0

        for stem, file_list in grouped.items():
            product = find_product_by_name_stem(stem)

            if not product:
                skipped += 1
                if dry_run:
                    self.stdout.write(f'  ❌ {stem}: товар не найден ({", ".join(file_list)})')
                continue

            matched += 1
            if dry_run:
                self.stdout.write(f'  ✅ {product.slug}: {", ".join(file_list)}')
                continue

            # Сортируем: main — первым
            file_list_sorted = sorted(file_list, key=classify_file)
            for idx, fname in enumerate(file_list_sorted):
                rel_path = os.path.join('product_images', fname).replace('\\', '/')
                img_type = classify_file(fname)
                is_main = img_type == 'main'

                ProductImage.objects.get_or_create(
                    product=product,
                    image=rel_path,
                    defaults={
                        'alt_text': product.name,
                        'image_type': img_type,
                        'is_main': is_main,
                        'sort_order': idx,
                    },
                )
                created += 1

        self.stdout.write(
            f'\n📊 Итого: товаров сопоставлено {matched}, '
            f'{"создано" if not dry_run else "будет создано"} {created} записей, '
            f'пропущено (нет товара) {skipped}'
        )

    def _process_brands(self, brand_dir: str, dry_run: bool, rebrand: bool):
        """Обрабатывает логотипы брендов."""
        files = sorted([
            f for f in os.listdir(brand_dir)
            if os.path.isfile(os.path.join(brand_dir, f))
               and not f.startswith('.')
        ])

        self.stdout.write(f'\n🏷 Найдено файлов в brand_logos/: {len(files)}')

        if not rebrand:
            self.stdout.write(self.style.WARNING(
                'Пропускаем бренды (используй --rebrand для обновления логотипов)'
            ))
            return

        for fname in files:
            stem, ext = os.path.splitext(fname)
            # Убираем суффиксы
            stem = re.sub(r'[-_](?:logo|icon)$', '', stem, flags=re.IGNORECASE)

            brand = Brand.objects.filter(slug=stem).first()
            if not brand:
                # Попробуем по названию
                brand = Brand.objects.filter(slug__startswith=stem).first()

            if not brand:
                self.stdout.write(f'  ❌ {stem}: бренд не найден')
                continue

            rel_path = os.path.join('brand_logos', fname).replace('\\', '/')
            if dry_run:
                self.stdout.write(f'  ✅ {brand.slug}: {rel_path}')
            else:
                brand.logo = rel_path
