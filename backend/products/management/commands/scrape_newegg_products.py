"""
Management command для парсинга данных о товарах с Newegg.

Использует модули из products.scraping:
  - ScraperHttpClient (retry, UA rotation, rate-limiting)
  - NeweggAdapter (DonorSite seam — search, product details, spec parsing)

Для каждой переданной категории (URL поиска Newegg) парсит список товаров,
извлекает название, цену, бренд, характеристики (specs table) и выводит
структурированный JSON/словарь, готовый для вставки в seed_data.py.

Использование:
    python manage.py scrape_newegg_products --category-url="https://www.newegg.com/p/pl?d=processors"
    python manage.py scrape_newegg_products --search="RTX 4080"
    python manage.py scrape_newegg_products --limit=10 --output=products_dump.py
"""

import json
import time
from urllib.parse import quote_plus

from django.core.management.base import BaseCommand
from products.scraping import ScraperHttpClient, NeweggAdapter, ProductRef

NEWEGG_SEARCH_URL = "https://www.newegg.com/p/pl?d={query}"


class Command(BaseCommand):
    help = 'Парсит данные товаров с Newegg и выводит структурированный результат.'

    def add_arguments(self, parser):
        parser.add_argument('--search', type=str, default='', help='Поисковый запрос')
        parser.add_argument(
            '--category-url', type=str, default='',
            help='Прямая ссылка на категорию/поиск Newegg',
        )
        parser.add_argument(
            '--limit', type=int, default=10, help='Макс. количество товаров'
        )
        parser.add_argument(
            '--output', type=str, default='',
            help='Путь к файлу для сохранения результата (JSON)',
        )
        parser.add_argument(
            '--pages', type=int, default=1,
            help='Количество страниц результатов для обхода',
        )

    def handle(self, *args, **options):
        search = options['search']
        category_url = options['category_url']
        limit = options['limit']
        output_file = options['output']
        pages = options['pages']

        if category_url:
            base_url = category_url
        elif search:
            base_url = NEWEGG_SEARCH_URL.format(query=quote_plus(search))
        else:
            self.stdout.write(self.style.ERROR(
                'Укажите --search или --category-url'
            ))
            return

        # Instantiate deep modules once
        http = ScraperHttpClient(delay=0.8, max_retries=3)
        donor = NeweggAdapter(http)

        all_products: list[dict] = []

        for page in range(1, pages + 1):
            page_url = base_url
            if page > 1:
                sep = '&' if '?' in base_url else '?'
                page_url = f'{base_url}{sep}page={page}'

            self.stdout.write(f'📄 Страница {page}: {page_url}')

            soup = http.get_soup(page_url)
            if soup is None:
                self.stdout.write(
                    self.style.WARNING('  ✗ Не удалось загрузить страницу')
                )
                continue

            # Parse search results using the adapter's internal parser
            # (we need raw pagination support — search + parse)
            products = donor._parse_search_results(
                soup, limit=limit - len(all_products)
            )
            self.stdout.write(
                f'  → Найдено товаров на странице: {len(products)}'
            )

            for prod in products:
                if limit > 0 and len(all_products) >= limit:
                    break

                self.stdout.write(
                    f'    [{len(all_products)+1}/{limit}] {prod.name[:80]}'
                )
                self.stdout.flush()

                detail: dict = {
                    'name': prod.name,
                    'url': prod.url,
                    'price': prod.price,
                    'image': prod.thumbnail_url,
                    'brand': '',
                    'rating': None,
                    'review_count': None,
                    'specs': {},
                    'attributes': [],
                    'description': '',
                }

                if prod.url:
                    time.sleep(http.delay)
                    details = donor.get_product_details(prod.url)
                    detail['brand'] = details.brand or ''
                    detail['rating'] = details.rating
                    detail['review_count'] = details.review_count
                    detail['specs'] = details.specs
                    detail['description'] = details.description
                    detail['attributes'] = details.attributes

                all_products.append(detail)
                self.stdout.write(
                    f'      ✓ Бренд: {detail.get("brand", "—")}, '
                    f'Цена: {detail.get("price", "—")}, '
                    f'Атрибутов: {len(detail.get("attributes", []))}'
                )

                if limit > 0 and len(all_products) >= limit:
                    break

            if limit > 0 and len(all_products) >= limit:
                break

            if page < pages:
                time.sleep(http.delay)

        # Output
        self.stdout.write('')
        self.stdout.write(
            self.style.SUCCESS(f'✅ Всего собрано товаров: {len(all_products)}')
        )

        if output_file:
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(all_products, f, ensure_ascii=False, indent=2)
            self.stdout.write(f'💾 Сохранено в {output_file}')
        else:
            for p in all_products:
                self.stdout.write(f'\n{p["name"]}')
                self.stdout.write(f'  Цена: {p.get("price")}')
                self.stdout.write(f'  Бренд: {p.get("brand")}')
                self.stdout.write(
                    f'  Атрибуты ({len(p.get("attributes", []))}):'
                )
                for a in p.get('attributes', []):
                    self.stdout.write(f'    - {a["name"]}: {a["value"]}')