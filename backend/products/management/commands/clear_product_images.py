"""
Management command для полной очистки изображений товаров.
Удаляет ВСЕ ProductImage записи из БД и файлы с диска.

Использование:
    python manage.py clear_product_images           # сухой прогон (ничего не удаляет)
    python manage.py clear_product_images --force   # реальное удаление
"""

from django.core.management.base import BaseCommand
from products.models import ProductImage
import shutil
import os
from django.conf import settings


class Command(BaseCommand):
    help = 'Полная очистка изображений товаров'

    def add_arguments(self, parser):
        parser.add_argument('--force', action='store_true',
                            help='Реальное удаление (без флага — сухой прогон)')

    def handle(self, *args, **options):
        force = options['force']

        count = ProductImage.objects.count()
        self.stdout.write(f'Найдено изображений в БД: {count}')

        if force:
            # Удаляем файлы с диска
            media_root = settings.MEDIA_ROOT
            product_images_dir = os.path.join(media_root, 'product_images')
            if os.path.exists(product_images_dir):
                shutil.rmtree(product_images_dir)
                self.stdout.write(f'  📁 Удалена директория: {product_images_dir}')

            # Удаляем записи из БД
            deleted, _ = ProductImage.objects.all().delete()
            self.stdout.write(self.style.SUCCESS(f'  ✅ Удалено записей: {deleted}'))

            # Создаём пустую директорию заново
            os.makedirs(product_images_dir, exist_ok=True)
            self.stdout.write(f'  📁 Создана пустая директория: {product_images_dir}')
        else:
            self.stdout.write(self.style.WARNING(
                '  ⚠️ Сухой прогон. Добавьте --force для реального удаления.'
            ))