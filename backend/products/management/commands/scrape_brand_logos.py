"""
Management command для скачивания высококачественных логотипов брендов.

Использует products.scraping.ScaperHttpClient для HTTP-слоя
(retry, UA rotation, rate-limiting).

Источники (по убыванию качества):
  1. Wikipedia — парсинг infobox-логотипа со страницы бренда
  2. Google Favicon API (128×128 PNG)
  3. SimpleIcons CDN (SVG-иконки)
  4. SVG-заглушка (инициал бренда в цветном круге)

Все логотипы конвертируются в PNG (400px по ширине) с сохранением пропорций.
SVG-источники растеризуются через Cairo.

Использование:
    python manage.py scrape_brand_logos                    # скачать все недостающие
    python manage.py scrape_brand_logos --force             # перезаписать существующие
    python manage.py scrape_brand_logos --brand=intel,asus  # только указанные
"""

import re
import time
import io
from urllib.parse import quote_plus

import requests
from django.core.management.base import BaseCommand
from django.core.files.base import ContentFile
from bs4 import BeautifulSoup
from products.models import Brand
from products.scraping import ScraperHttpClient

try:
    import cairosvg
    CAIRO_AVAILABLE = True
except ImportError:
    CAIRO_AVAILABLE = False

from PIL import Image

# =============================================================================
# КОНФИГУРАЦИЯ
# =============================================================================

TARGET_LOGO_WIDTH = 400  # px — ширина для ресайза
MIN_LOGO_WIDTH = 100     # px — меньше этого считаем плохим качеством

# Маппинг названий брендов → Wikipedia page title
WIKIPEDIA_TITLES: dict[str, str] = {
    'intel': 'Intel',
    'amd': 'AMD',
    'nvidia': 'Nvidia',
    'asus': 'Asus',
    'msi': 'Micro-Star_International',
    'gigabyte': 'Gigabyte_Technology',
    'samsung': 'Samsung_Electronics',
    'lg': 'LG_Electronics',
    'dell': 'Dell',
    'hp': 'Hewlett-Packard',
    'lenovo': 'Lenovo',
    'corsair': 'Corsair_Gaming',
    'kingston': 'Kingston_Technology',
    'western-digital': 'Western_Digital',
    'seagate': 'Seagate_Technology',
    'logitech': 'Logitech',
    'razer': 'Razer_Inc.',
    'acer': 'Acer_Inc.',
    'cooler-master': 'Cooler_Master',
    'be-quiet': 'Be_quiet!',
    'seasonic': 'Sea_Sonic_Electronics',
    'hyperx': 'HyperX',
    'steelseries': 'SteelSeries',
    'benq': 'BenQ',
    'noctua': 'Noctua_(company)',
    'deepcool': 'Deepcool',
    'arctic': 'Arctic_(company)',
    'gskill': 'G.Skill',
    'crucial': 'Crucial_(brand)',
    'asrock': 'ASRock',
    'evga': 'EVGA_Corporation',
    'fractal-design': 'Fractal_Design',
    'nzxt': 'NZXT',
    'lian-li': 'Lian_Li_Industrial_Co.',
    'teamgroup': 'Team_Group',
    'patriot': 'Patriot_Memory',
    'toshiba': 'Toshiba',
    'keychron': 'Keychron',
    'ducky': 'Ducky_Channel',
    'zowie': 'Zowie',
    'apple': 'Apple_Inc.',
    'thermalright': 'Thermalright',
}

# Маппинг для SimpleIcons CDN
SIMPLEICONS_MAP: dict[str, str] = {
    'intel': 'intel',
    'amd': 'amd',
    'nvidia': 'nvidia',
    'asus': 'asus',
    'msi': 'msi',
    'gigabyte': 'gigabyte',
    'samsung': 'samsung',
    'lg': 'lg',
    'dell': 'dell',
    'hp': 'hp',
    'lenovo': 'lenovo',
    'corsair': 'corsair',
    'kingston': 'kingston',
    'western-digital': 'westerndigital',
    'seagate': 'seagate',
    'logitech': 'logitech',
    'razer': 'razer',
    'hyperx': 'hyperx',
    'acer': 'acer',
    'apple': 'apple',
    'cooler-master': 'coolermaster',
    'be-quiet': 'bequiet',
    'seasonic': 'seasonic',
    'steelseries': 'steelseries',
    'benq': 'benq',
    'gskill': 'gskill',
    'toshiba': 'toshiba',
}

FALLBACK_COLORS = [
    '#1061cd', '#212121', '#e53935', '#43a047', '#fb8c00',
    '#8e24aa', '#00acc1', '#6d4c41', '#546e7a', '#d81b60',
]

SIMPLE_ICONS_CDN = 'https://cdn.simpleicons.org/{slug}'

# =============================================================================
# ИСТОЧНИК 1: Wikipedia
# =============================================================================

def wikipedia_logo_url(http: ScraperHttpClient, wikipedia_title: str) -> str | None:
    """
    Парсит страницу Wikipedia и извлекает URL логотипа из infobox-таблицы
    или с mediawiki API.
    """
    # Способ A: MediaWiki API — получаем изображение страницы
    api_url = (
        f'https://en.wikipedia.org/w/api.php?action=query&titles={quote_plus(wikipedia_title)}'
        f'&prop=pageimages&format=json&pithumbsize=800'
    )
    try:
        body, _ = http.get(api_url, timeout=15)
        data = __import__('json').loads(body)
        pages = data.get('query', {}).get('pages', {})
        for page_info in pages.values():
            if 'thumbnail' in page_info:
                return page_info['thumbnail']['source']
            if 'pageimage' in page_info:
                file_name = page_info['pageimage']
                file_url = (
                    f'https://en.wikipedia.org/w/api.php?action=query'
                    f'&titles=Image:{quote_plus(file_name)}'
                    f'&prop=imageinfo&iiprop=url&format=json'
                )
                file_body, _ = http.get(file_url, timeout=15)
                file_data = __import__('json').loads(file_body)
                file_pages = file_data.get('query', {}).get('pages', {})
                for finfo in file_pages.values():
                    ii = finfo.get('imageinfo', [])
                    if ii:
                        return ii[0].get('url')
    except (requests.RequestException, KeyError, ValueError):
        pass

    # Способ B: Парсинг HTML-страницы — ищем логотип в infobox
    page_url = f'https://en.wikipedia.org/wiki/{quote_plus(wikipedia_title)}'
    soup = http.get_soup(page_url)
    if soup:
        infobox = soup.select_one('.infobox img, .infobox-image img, '
                                   '.mw-file-element, img[alt*="logo" i]')
        if infobox:
            src = infobox.get('src')
            if src and src.startswith('//'):
                src = 'https:' + src
            if src and 'wiki' in src:
                return src

    return None


# =============================================================================
# ИСТОЧНИК 2: Google Favicon API
# =============================================================================

def google_favicon_url(domain: str) -> str:
    return f'https://www.google.com/s2/favicons?domain={domain}&sz=128'


# =============================================================================
# ОБРАБОТКА ИЗОБРАЖЕНИЙ
# =============================================================================

def process_image(content: bytes, content_type: str, brand_slug: str) -> ContentFile | None:
    """
    Обрабатывает скачанное изображение:
    - SVG → PNG (через cairosvg)
    - Ресайз до TARGET_LOGO_WIDTH с сохранением пропорций
    - Сохраняет как PNG
    Возвращает ContentFile для Brand.logo.save()
    """
    try:
        is_svg = 'svg' in content_type.lower() or b'<svg' in content[:100].lower()

        if is_svg and CAIRO_AVAILABLE:
            # Растеризация SVG → PNG
            png_bytes = cairosvg.svg2png(bytestring=content, output_width=TARGET_LOGO_WIDTH)
            return ContentFile(png_bytes, name=f'{brand_slug}.png')

        if is_svg:
            # Cairo недоступен — сохраняем как SVG
            return ContentFile(content, name=f'{brand_slug}.svg')

        # Растровое изображение
        img = Image.open(io.BytesIO(content))
        img = img.convert('RGBA')

        # Проверяем минимальную ширину
        if img.width < MIN_LOGO_WIDTH:
            return None

        # Ресайз с сохранением пропорций
        if img.width > TARGET_LOGO_WIDTH:
            ratio = TARGET_LOGO_WIDTH / img.width
            new_height = int(img.height * ratio)
            img = img.resize((TARGET_LOGO_WIDTH, new_height), Image.LANCZOS)

        # Сохраняем как PNG
        output = io.BytesIO()
        img.save(output, format='PNG', optimize=True)
        return ContentFile(output.getvalue(), name=f'{brand_slug}.png')

    except Exception:
        return None


# =============================================================================
# SVG-ЗАГЛУШКА
# =============================================================================

def generate_fallback_svg(name: str, color: str) -> str:
    letter = name.strip()[0].upper() if name.strip() else '?'
    return f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="48" fill="{color}"/>
  <text x="50" y="62" text-anchor="middle" fill="white" font-size="36"
        font-family="Arial, sans-serif" font-weight="bold">{letter}</text>
</svg>'''


# =============================================================================
# MAIN COMMAND
# =============================================================================

class Command(BaseCommand):
    help = 'Скачивает логотипы брендов (Wikipedia + Favicon + SimpleIcons + fallback) в высоком качестве'

    def add_arguments(self, parser):
        parser.add_argument('--force', action='store_true', help='Перезаписать существующие')
        parser.add_argument('--brand', type=str, default='', help='Список брендов через запятую (slug)')

    def handle(self, *args, **options):
        force = options['force']
        brand_filter = options['brand']

        brands = Brand.objects.all()
        if brand_filter:
            slugs = [s.strip() for s in brand_filter.split(',')]
            brands = brands.filter(slug__in=slugs)

        if not brands.exists():
            self.stdout.write(self.style.WARNING('Нет брендов для обработки.'))
            return

        total = brands.count()
        stats = {'wikipedia': 0, 'favicon': 0, 'simpleicons': 0, 'fallback': 0, 'skipped': 0, 'errors': 0}

        self.stdout.write(f'🎨 Загрузка логотипов для {total} брендов...\n')
        color_idx = 0

        # Use ScraperHttpClient for all HTTP — retry, UA rotation, rate-limiting
        http = ScraperHttpClient(delay=0.6, max_retries=3)

        for idx, brand in enumerate(brands, start=1):
            if brand.logo and not force:
                stats['skipped'] += 1
                self.stdout.write(f'  [{idx}/{total}] {brand.name} ⏭ skip (уже есть)')
                continue

            self.stdout.write(f'  [{idx}/{total}] {brand.name:25s}', ending='')
            self.stdout.flush()
            success = False

            # --- Попытка 1: Wikipedia ---
            wiki_title = WIKIPEDIA_TITLES.get(brand.slug, brand.name.replace(' ', '_'))
            if wiki_title:
                logo_url = wikipedia_logo_url(http, wiki_title)
                if logo_url:
                    try:
                        body, ct = http.get(logo_url, timeout=20)
                        logo_file = process_image(body, ct, brand.slug)
                        if logo_file:
                            brand.logo.save(logo_file.name, logo_file, save=True)
                            self.stdout.write(self.style.SUCCESS(' ✓ Wikipedia'))
                            stats['wikipedia'] += 1
                            success = True
                    except requests.RequestException:
                        pass

            if success:
                time.sleep(http.delay)
                continue

            # --- Попытка 2: Google Favicon ---
            if brand.website:
                domain = re.match(r'https?://(?:www\.)?([^/]+)', brand.website)
                if domain:
                    favicon_url = google_favicon_url(domain.group(1))
                    try:
                        body, ct = http.get(favicon_url, timeout=15)
                        if len(body) > 500:  # не пустая иконка
                            logo_file = process_image(body, 'image/png', brand.slug)
                            if logo_file:
                                brand.logo.save(logo_file.name, logo_file, save=True)
                                self.stdout.write(self.style.SUCCESS(' ✓ Favicon'))
                                stats['favicon'] += 1
                                success = True
                    except requests.RequestException:
                        pass

            if success:
                time.sleep(http.delay)
                continue

            # --- Попытка 3: SimpleIcons ---
            icon_slug = SIMPLEICONS_MAP.get(brand.slug, brand.slug)
            simple_url = SIMPLE_ICONS_CDN.format(slug=icon_slug)
            try:
                body, ct = http.get(simple_url, timeout=15)
                logo_file = process_image(body, 'image/svg+xml', brand.slug)
                if logo_file:
                    brand.logo.save(logo_file.name, logo_file, save=True)
                    self.stdout.write(self.style.SUCCESS(' ✓ SimpleIcons'))
                    stats['simpleicons'] += 1
                    success = True
            except requests.RequestException:
                pass

            if success:
                time.sleep(http.delay)
                continue

            # --- Попытка 4: SVG fallback ---
            color = FALLBACK_COLORS[color_idx % len(FALLBACK_COLORS)]
            color_idx += 1
            svg_content = generate_fallback_svg(brand.name, color)
            file_name = f'{brand.slug}.svg'
            brand.logo.save(file_name, ContentFile(svg_content.encode('utf-8')), save=True)
            self.stdout.write(self.style.WARNING(f' ⚡ SVG-fallback ({color})'))
            stats['fallback'] += 1
            time.sleep(0.1)

        # Итог
        self.stdout.write('')
        self.stdout.write(self.style.SUCCESS('Загрузка завершена:'))
        self.stdout.write(f'  Wikipedia: {stats["wikipedia"]}')
        self.stdout.write(f'  Favicon: {stats["favicon"]}')
        self.stdout.write(f'  SimpleIcons: {stats["simpleicons"]}')
        self.stdout.write(f'  Fallback: {stats["fallback"]}')
        self.stdout.write(f'  Пропущено: {stats["skipped"]}')
        self.stdout.write(f'  Ошибок: {stats["errors"]}')
