"""
Management command для парсинга высококачественных изображений товаров с Newegg.

Использует модули из products.scraping:
  - ScraperHttpClient (retry, UA rotation, rate-limiting)
  - NeweggAdapter (DonorSite seam — поиск и извлечение image URL)
  - ImagePipeline (download → validate → dedup → attach)

Стратегия «разжатия» CDN URL реализована в NeweggAdapter._uncompress_url().

Использование:
    python manage.py scrape_newegg_images                  # все товары без фото
    python manage.py scrape_newegg_images --limit=10        # только 10 товаров
    python manage.py scrape_newegg_images --product=slug1,slug2  # только указанные
    python manage.py scrape_newegg_images --force           # перезаписать существующие
"""

import re
import time

from django.core.management.base import BaseCommand
from products.models import Product
from products.scraping import ScraperHttpClient, NeweggAdapter, ImagePipeline


class Command(BaseCommand):
    help = 'Парсит изображения товаров с Newegg в высоком качестве'

    def add_arguments(self, parser):
        parser.add_argument('--limit', type=int, default=0, help='Лимит товаров')
        parser.add_argument(
            '--product', type=str, default='', help='Список slug-ов через запятую'
        )
        parser.add_argument(
            '--force', action='store_true', help='Перезаписать существующие'
        )

    def handle(self, *args, **options):
        limit = options['limit']
        product_filter = options['product']
        force = options['force']

        if product_filter:
            slugs = [s.strip() for s in product_filter.split(',')]
            products = Product.objects.filter(slug__in=slugs)
        else:
            if force:
                products = Product.objects.all()
            else:
                products = Product.objects.filter(images__isnull=True)

        if limit > 0:
            products = products[:limit]

        total = products.count()
        if total == 0:
            self.stdout.write(self.style.WARNING('Нет товаров для обработки.'))
            return

        # Instantiate the deep modules once
        http = ScraperHttpClient(delay=0.8, max_retries=3)
        donor = NeweggAdapter(http)
        pipeline = ImagePipeline(http)

        success = 0
        no_results = 0
        no_images = 0

        self.stdout.write(
            f'🖼️  Поиск изображений для {total} товаров (pipeline: http→donor→images)...\n'
        )

        for idx, product in enumerate(products, start=1):
            self.stdout.write(f'  [{idx}/{total}] {product.name[:70]}')
            self.stdout.flush()

            query = self._build_search_query(product)
            self.stdout.write(f'\n    Поиск: "{query}"')

            # Step 1 — search via DonorSite seam
            results = donor.search(query, limit=1)
            if not results or not results[0].url:
                no_results += 1
                self.stdout.write(
                    self.style.WARNING('    ✗ Товар не найден на Newegg')
                )
                if idx < total:
                    time.sleep(http.delay)
                continue

            product_url = results[0].url
            self.stdout.write(f'    → {product_url}')

            # Step 2 — get image URLs via DonorSite seam
            image_urls = donor.get_images(product_url)
            if not image_urls:
                no_images += 1
                self.stdout.write(
                    self.style.WARNING('    ✗ Изображения не найдены')
                )
                if idx < total:
                    time.sleep(http.delay)
                continue

            self.stdout.write(f'    → Найдено URL: {len(image_urls)}')

            # Step 3 — download & attach via ImagePipeline
            downloaded = 0
            for i, img_url in enumerate(image_urls):
                if downloaded >= pipeline.max_per_product:
                    break

                candidate = pipeline.download(
                    img_url, referer='https://www.newegg.com/'
                )
                if candidate is None:
                    continue

                obj = pipeline.attach_to_product(
                    product,
                    candidate,
                    is_main=(downloaded == 0),
                    sort_order=i,
                )
                if obj is not None:
                    downloaded += 1

            if downloaded > 0:
                success += 1
                self.stdout.write(
                    self.style.SUCCESS(f'    ✓ Скачано {downloaded} изображений')
                )
            else:
                no_images += 1
                self.stdout.write(
                    self.style.WARNING('    ✗ Нет изображений нужного качества')
                )

            if idx < total:
                time.sleep(http.delay)

        # Summary
        self.stdout.write('')
        self.stdout.write(self.style.SUCCESS('Завершено:'))
        self.stdout.write(f'  Успешно (товаров): {success}')
        self.stdout.write(f'  Не найдено на Newegg: {no_results}')
        self.stdout.write(f'  Нет изображений: {no_images}')

    # ------------------------------------------------------------------
    # Helpers (command-level, not scraping logic)
    # ------------------------------------------------------------------

    @staticmethod
    def _build_search_query(product: Product) -> str:
        """Build a donor search query: brand name + significant name words."""
        brand_names = list(product.brands.values_list('name', flat=True))
        words = re.sub(r'[^\w\s-]', '', product.name).split()
        brand_words: set[str] = set()
        for bn in brand_names:
            brand_words.update(bn.lower().split())

        significant = [
            w
            for w in words
            if len(w) > 2 and w.lower() not in brand_words
        ][:5]
        name_part = ' '.join(significant)
        brand_part = ' '.join(brand_names) if brand_names else ''
        query = f'{brand_part} {name_part}'.strip()
        return query if query else product.name