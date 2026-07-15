"""
Management command для парсинга данных о товарах с Newegg.

Для каждой переданной категории (URL поиска Newegg) парсит список товаров,
извлекает название, цену, бренд, характеристики (specs table) и выводит
структурированный JSON/словарь, готовый для вставки в seed_data.py.

Использование:
    python manage.py scrape_newegg_products --category-url="https://www.newegg.com/p/pl?d=processors"
    python manage.py scrape_newegg_products --search="RTX 4080"
    python manage.py scrape_newegg_products --limit=10 --output=products_dump.py
"""

import re
import time
import json
import random
import requests
from urllib.parse import quote_plus, urljoin
from django.core.management.base import BaseCommand
from bs4 import BeautifulSoup

NEWEGG_BASE = 'https://www.newegg.com'
NEWEGG_SEARCH_URL = f'{NEWEGG_BASE}/p/pl?d={{query}}'
REQUEST_DELAY = 0.8

USER_AGENTS = [
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',
]


def random_ua() -> str:
    return random.choice(USER_AGENTS)


def fetch_page(url: str, timeout: int = 25) -> BeautifulSoup | None:
    """Загружает страницу и возвращает парсер BeautifulSoup."""
    try:
        resp = requests.get(
            url,
            headers={'User-Agent': random_ua(), 'Accept-Language': 'en-US,en;q=0.9'},
            timeout=timeout,
        )
        resp.raise_for_status()
        return BeautifulSoup(resp.text, 'html.parser')
    except requests.RequestException:
        return None


# ---------------------------------------------------------------------------
# STEP 1: поиск товаров по категории / запросу
# ---------------------------------------------------------------------------

def parse_search_results(soup: BeautifulSoup, limit: int = 0) -> list[dict]:
    """
    Извлекает список товаров со страницы результатов поиска Newegg.
    Возвращает список словарей с ключами: name, url, price, image.
    """
    products = []

    # Newegg рендерит товары внутри .item-cell
    cells = soup.select('.item-cell')
    if not cells:
        # Альтернативный селектор (обновлённый лейаут 2024+)
        cells = soup.select('[class*="item-container"], .product-item, '
                            '.list-item, .result-item')

    for cell in cells:
        if limit > 0 and len(products) >= limit:
            break

        # Название и ссылка
        name_el = cell.select_one('.item-title, [title], a[class*="title"], '
                                   '.product-title, h3 a')
        if not name_el:
            continue

        name = name_el.get('title') or name_el.get_text(strip=True)
        if not name or len(name) < 5:
            continue

        link_el = cell.select_one('a[href*="/p/"], a[href*="/product/"]')
        url = None
        if link_el:
            href = link_el.get('href', '')
            url = href if href.startswith('http') else urljoin(NEWEGG_BASE, href)

        # Цена
        price_el = cell.select_one('.price-current, [class*="price-current"], '
                                    '[class*="price"], .product-price')
        price = None
        if price_el:
            price_text = price_el.get_text(strip=True)
            price_match = re.search(r'[\d,]+\.?\d*', price_text)
            if price_match:
                price = float(price_match.group().replace(',', ''))

        # Картинка
        img_el = cell.select_one('img[src], img[data-src]')
        image = None
        if img_el:
            image = img_el.get('src') or img_el.get('data-src')

        products.append({
            'name': name,
            'url': url,
            'price': price,
            'image': image,
        })

    return products


# ---------------------------------------------------------------------------
# STEP 2: парсинг страницы товара (спецификации)
# ---------------------------------------------------------------------------

def parse_product_specs(product_url: str) -> dict:
    """
    Заходит на страницу товара и извлекает:
    - Бренд
    - Таблицу спецификаций (ключ → значение)
    - Рейтинг
    Возвращает словарь.
    """
    soup = fetch_page(product_url)
    if not soup:
        return {}

    result: dict = {
        'brand': None,
        'rating': None,
        'review_count': None,
        'specs': {},
        'description': '',
    }

    # --- Бренд ---
    brand_el = soup.select_one('[class*="brand"], [itemprop="brand"] span, '
                                '.product-brand a, .brand-name')
    if brand_el:
        result['brand'] = brand_el.get_text(strip=True)

    # --- Рейтинг ---
    rating_el = soup.select_one('[itemprop="ratingValue"], .rating-value, '
                                 '[class*="rating"] span')
    if rating_el:
        try:
            result['rating'] = float(rating_el.get_text(strip=True))
        except ValueError:
            pass

    review_el = soup.select_one('[itemprop="reviewCount"], .review-count')
    if review_el:
        try:
            result['review_count'] = int(re.sub(r'\D', '', review_el.get_text(strip=True)))
        except ValueError:
            pass

    # --- Таблица спецификаций ---
    # Newegg: specs обычно в таблице внутри #product-details или .product-specs
    spec_tables = soup.select('#product-details table, .product-specs table, '
                               '[class*="spec"] table, [class*="Spec"] table, '
                               '.table-spec, table[class*="spec"]')

    for table in spec_tables:
        rows = table.select('tr')
        for row in rows:
            th = row.select_one('th, .spec-name, .spec-label, td:first-child')
            td = row.select_one('td:last-child, .spec-value, .spec-desc')
            if th and td:
                key = th.get_text(strip=True).rstrip(':').strip()
                value = td.get_text(strip=True)
                if key and value and len(key) > 1:
                    result['specs'][key] = value

    # Если таблиц нет, пробуем definition list
    if not result['specs']:
        dl_rows = soup.select('dl dt, .spec-row .spec-name, .detail-row')
        for i, dt in enumerate(dl_rows):
            key = dt.get_text(strip=True).rstrip(':').strip()
            dd = dt.find_next('dd') or dt.find_next(class_=re.compile(r'spec-value|spec-desc'))
            if dd and key:
                value = dd.get_text(strip=True)
                if value:
                    result['specs'][key] = value

    # --- Описание (первые 300 символов) ---
    desc_el = soup.select_one('[class*="description"], [class*="overview"], '
                               '#product-overview, .product-desc')
    if desc_el:
        result['description'] = desc_el.get_text(strip=True)[:500]

    return result


# ---------------------------------------------------------------------------
# STEP 3: маппинг на нашу модель атрибутов
# ---------------------------------------------------------------------------

# Словарь сопоставления ключей из Newegg → наши Attribute.name (русские)
SPEC_MAPPING = {
    # Процессоры
    'CPU Socket Type': 'Сокет',
    'Socket': 'Сокет',
    'Number of Cores': 'Количество ядер',
    'Cores': 'Количество ядер',
    'Number of Threads': 'Количество потоков',
    'Threads': 'Количество потоков',
    'Operating Frequency': 'Частота процессора',
    'Base Clock': 'Частота процессора',
    'Max Turbo Frequency': 'Макс. частота (Boost)',
    'Boost Clock': 'Макс. частота (Boost)',
    'L3 Cache': None,  # нет такого атрибута — игнорируем
    'Manufacturing Tech': 'Техпроцесс',
    'Thermal Design Power': 'TDP',
    'TDP': 'TDP',
    # Видеокарты
    'GPU': None,
    'Video Memory': 'Объём видеопамяти',
    'Memory Size': 'Объём видеопамяти',
    'Memory Type': 'Тип видеопамяти',
    'Memory Interface': 'Шина памяти',
    'Memory Bus': 'Шина памяти',
    'Core Clock': None,
    # ОЗУ
    'Capacity': 'Объём ОЗУ',
    'Type': 'Тип ОЗУ',
    'Speed': 'Частота ОЗУ',
    'Memory Speed': 'Частота ОЗУ',
    'Number of Modules': 'Количество планок',
    # Накопители
    'Storage Capacity': 'Объём накопителя',
    'Drive Type': 'Тип накопителя',
    'Form Factor': 'Форм-фактор',
    'Max Sequential Read': 'Скорость чтения',
    'Max Sequential Write': 'Скорость записи',
    'Read Speed': 'Скорость чтения',
    'Write Speed': 'Скорость записи',
    # Блоки питания
    'Maximum Power': 'Мощность БП',
    'Wattage': 'Мощность БП',
    'Power': 'Мощность БП',
    '80 Plus': 'Сертификат',
    'Certification': 'Сертификат',
    'Modular': 'Модульность',
    'Modular Type': 'Модульность',
    # Мониторы
    'Screen Size': 'Диагональ экрана',
    'Display Size': 'Диагональ экрана',
    'Resolution': 'Разрешение',
    'Maximum Resolution': 'Разрешение',
    'Panel Type': 'Тип матрицы',
    'Display Type': 'Тип матрицы',
    'Refresh Rate': 'Частота обновления',
    'Response Time': 'Время отклика',
    'Brightness': 'Яркость',
    'Curved': 'Изогнутый',
    'Curved Surface Screen': 'Изогнутый',
    # Ноутбуки
    'Screen': 'Диагональ ноутбука',
    'CPU': 'Процессор (модель)',
    'Processor': 'Процессор (модель)',
    'GPU/VPU': 'Видеокарта (модель)',
    'Graphics': 'Видеокарта (модель)',
    'Memory': 'Объём RAM',
    'RAM': 'Объём RAM',
    'SSD': 'Объём SSD',
    'Storage': 'Объём SSD',
    'Weight': 'Вес',
    'Color': 'Цвет',
}


def parse_spec_value(key: str, value: str) -> str | int | float | bool | None:
    """
    Парсит строковое значение спецификации в типизированное.
    """
    # Булевы
    if value.lower() in ('yes', 'true'):
        return True
    if value.lower() in ('no', 'false', 'none'):
        return False

    # Числовые с единицами — извлекаем число
    num_match = re.search(r'([\d,]+\.?\d*)\s*(GB|TB|MHz|GHz|W|ms|Hz|bit|MB|cd)?', value, re.IGNORECASE)
    if num_match:
        num = float(num_match.group(1).replace(',', ''))
        unit = num_match.group(2)
        # Конвертация
        if unit and unit.upper() == 'TB':
            num *= 1000  # в ГБ
        if unit and unit.upper() == 'KHZ':
            num /= 1000  # в МГц (редко)
        # Если целое — возвращаем int
        if num == int(num):
            return int(num)
        return num

    # Строки — оставляем как есть
    return value.strip()


def map_specs_to_attributes(raw_specs: dict) -> list[dict]:
    """
    Преобразует сырые спеки из Newegg в список атрибутов для seed_data.
    Возвращает список словарей вида:
        {"name": "Частота процессора", "value": 3.2, "type": "int"}
    """
    attributes = []
    for raw_key, raw_value in raw_specs.items():
        attr_name = SPEC_MAPPING.get(raw_key)
        if attr_name is None:
            continue  # не маппим

        parsed = parse_spec_value(raw_key, raw_value)
        if parsed is None:
            continue

        attributes.append({
            'name': attr_name,
            'value': parsed,
        })

    return attributes


# ---------------------------------------------------------------------------
# MAIN COMMAND
# ---------------------------------------------------------------------------

class Command(BaseCommand):
    help = 'Парсит данные товаров с Newegg и выводит структурированный результат.'

    def add_arguments(self, parser):
        parser.add_argument('--search', type=str, default='', help='Поисковый запрос')
        parser.add_argument('--category-url', type=str, default='',
                            help='Прямая ссылка на категорию/поиск Newegg')
        parser.add_argument('--limit', type=int, default=10, help='Макс. количество товаров')
        parser.add_argument('--output', type=str, default='',
                            help='Путь к файлу для сохранения результата (JSON)')
        parser.add_argument('--pages', type=int, default=1,
                            help='Количество страниц результатов для обхода')

    def handle(self, *args, **options):
        search = options['search']
        category_url = options['category_url']
        limit = options['limit']
        output_file = options['output']
        pages = options['pages']

        # Формируем URL для поиска
        if category_url:
            base_url = category_url
        elif search:
            base_url = NEWEGG_SEARCH_URL.format(query=quote_plus(search))
        else:
            self.stdout.write(self.style.ERROR(
                'Укажите --search или --category-url'
            ))
            return

        all_products = []

        # Обходим страницы результатов
        for page in range(1, pages + 1):
            page_url = base_url
            if page > 1:
                sep = '&' if '?' in base_url else '?'
                page_url = f'{base_url}{sep}page={page}'

            self.stdout.write(f'📄 Страница {page}: {page_url}')

            soup = fetch_page(page_url)
            if not soup:
                self.stdout.write(self.style.WARNING('  ✗ Не удалось загрузить страницу'))
                continue

            products = parse_search_results(soup, limit=limit - len(all_products))
            self.stdout.write(f'  → Найдено товаров на странице: {len(products)}')

            for idx, prod in enumerate(products, start=1):
                if limit > 0 and len(all_products) >= limit:
                    break

                self.stdout.write(f'    [{len(all_products)+1}/{limit}] {prod["name"][:80]}')
                self.stdout.flush()

                if prod['url']:
                    time.sleep(REQUEST_DELAY)
                    details = parse_product_specs(prod['url'])
                    prod['brand'] = details.get('brand') or prod.get('brand', '')
                    prod['rating'] = details.get('rating')
                    prod['review_count'] = details.get('review_count')
                    prod['specs'] = details.get('specs', {})
                    prod['description'] = details.get('description', '')
                    # Маппим спецификации на наши атрибуты
                    prod['attributes'] = map_specs_to_attributes(details.get('specs', {}))
                else:
                    prod['specs'] = {}
                    prod['attributes'] = []
                    prod['description'] = ''

                all_products.append(prod)
                self.stdout.write(f'      ✓ Бренд: {prod.get("brand", "—")}, '
                                  f'Цена: {prod.get("price", "—")}, '
                                  f'Атрибутов: {len(prod.get("attributes", []))}')

            if limit > 0 and len(all_products) >= limit:
                break

            if page < pages:
                time.sleep(REQUEST_DELAY)

        # Вывод результата
        self.stdout.write('')
        self.stdout.write(self.style.SUCCESS(f'✅ Всего собрано товаров: {len(all_products)}'))

        if output_file:
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(all_products, f, ensure_ascii=False, indent=2)
            self.stdout.write(f'💾 Сохранено в {output_file}')
        else:
            # Краткий вывод в консоль
            for p in all_products:
                self.stdout.write(f'\n{p["name"]}')
                self.stdout.write(f'  Цена: {p.get("price")}')
                self.stdout.write(f'  Бренд: {p.get("brand")}')
                self.stdout.write(f'  Атрибуты ({len(p.get("attributes", []))}):')
                for a in p.get('attributes', []):
                    self.stdout.write(f'    - {a["name"]}: {a["value"]}')