"""
Management command для скачивания высококачественных логотипов брендов.

Источники (по убыванию качества):
  1. Wikipedia — парсинг infobox-логотипа со страницы бренда
  2. SimpleIcons CDN (SVG-иконки)
  3. Google Favicon API (128×128 PNG)
  4. SVG-заглушка (инициал бренда в цветном круге)

Все логотипы конвертируются в PNG (400px по ширине) с сохранением пропорций.
SVG-источники растеризуются через Cairo (если доступен).

Использование:
    python manage.py scrape_brand_logos                    # скачать все недостающие
    python manage.py scrape_brand_logos --force             # перезаписать существующие
    python manage.py scrape_brand_logos --brand=intel,asus  # только указанные
    python manage.py scrape_brand_logos --threads=4         # параллельная загрузка
"""

import re
import time
import io
import random
import concurrent.futures
from urllib.parse import quote_plus
import requests
from django.core.management.base import BaseCommand
from django.core.files.base import ContentFile
from bs4 import BeautifulSoup
from products.models import Brand

try:
    import cairosvg
    CAIRO_AVAILABLE = True
except ImportError:
    CAIRO_AVAILABLE = False

from PIL import Image

# =============================================================================
# КОНФИГУРАЦИЯ
# =============================================================================

REQUEST_DELAY = 0.3
RETRY_DELAY = 2.0
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
    'adata': 'ADATA_(company)',
    'pny': 'PNY_Technologies',
    'plextor': 'Plextor',
    'silicon-power': 'Silicon_Power',
    'transcend': 'Transcend_(company)',
    'xpg': 'XPG_(gaming_brand)',
    'cougar': 'Cougar_(company)',
    'chieftec': 'Chieftec',
    'zalman': 'Zalman',
}

# Маппинг для SimpleIcons CDN (полный для всех брендов, где есть иконка)
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
    # Дополненные бренды:
    'noctua': 'noctua',
    'deepcool': 'deepcool',
    'arctic': 'arctic',
    'asrock': 'asrock',
    'evga': 'evga',
    'nzxt': 'nzxt',
    'lian-li': 'lianli',
    'teamgroup': 'teamgroup',
    'patriot': 'patriot',
    'keychron': 'keychron',
    'zowie': 'zowie',
    'thermalright': 'thermalright',
    'adata': 'adata',
    'pny': 'pny',
    'transcend': 'transcend',
    'zalman': 'zalman',
    'cougar': 'cougar',
}

FALLBACK_COLORS = [
    '#1061cd', '#212121', '#e53935', '#43a047', '#fb8c00',
    '#8e24aa', '#00acc1', '#6d4c41', '#546e7a', '#d81b60',
]

WIKIPEDIA_API = 'https://en.wikipedia.org/w/api.php'

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


def fetch_url(url: str, timeout: int = 20) -> requests.Response | None:
    """Безопасный GET-запрос с User-Agent."""
    try:
        resp = requests.get(url, headers={'User-Agent': random_ua()}, timeout=timeout)
        resp.raise_for_status()
        return resp
    except requests.RequestException:
        return None


def fetch_soup(url: str, timeout: int = 20) -> BeautifulSoup | None:
    """GET-запрос + BeautifulSoup."""
    resp = fetch_url(url, timeout)
    if resp:
        return BeautifulSoup(resp.text, 'html.parser')
    return None


# =============================================================================
# ИСТОЧНИК 1: Wikipedia (улучшенный парсинг)
# =============================================================================

def wikipedia_logo_url(wikipedia_title: str) -> str | None:
    """
    Парсит страницу Wikipedia и извлекает URL логотипа.

    Стратегия:
      A. Парсим infobox HTML — ищем <img> внутри .infobox с class="logo" или
         по атрибуту alt~="logo". Это самый точный способ.
      B. Если не нашли — берём изображение статьи (pageimages API) — менее
         точно, но часто работает для логотипов.
      C. Парсим "logo" из infobox vcard.

    Возвращает полный URL изображения (с https:) или None.
    """
    page_url = f'https://en.wikipedia.org/wiki/{quote_plus(wikipedia_title)}'
    soup = fetch_soup(page_url)
    if not soup:
        return None

    # Способ A: Ищем .infobox:first img с alt~="logo" ИЛИ внутри .ib-logo
    infobox = soup.select_one('.infobox')
    if infobox:
        # Ищем логотип по нескольким селекторам
        for selector in (
            '.ib-logo img',
            '.infobox-image img',
            'img[alt*="logo" i]',
            'img[alt*="Logo" i]',
            'img[alt*="логотип" i]',
            'td.infobox-image img',
            'tr > td > .image > img',
        ):
            img = infobox.select_one(selector)
            if img:
                src = _normalize_wiki_src(img.get('src'))
                if src:
                    return src

        # Если специфичные селекторы не сработали — берём первую картинку
        # внутри infobox, которая похожа на логотип (не флаг, не фото)
        for img in infobox.select('img[src*="logo" i]'):
            src = _normalize_wiki_src(img.get('src'))
            if src:
                return src

    # Способ B: MediaWiki pageimages API (запасной)
    api_url = (
        f'{WIKIPEDIA_API}?action=query&titles={quote_plus(wikipedia_title)}'
        f'&prop=pageimages&format=json&pithumbsize=800'
    )
    resp = fetch_url(api_url)
    if resp:
        try:
            data = resp.json()
            for page_info in data.get('query', {}).get('pages', {}).values():
                thumbnail = page_info.get('thumbnail')
                if thumbnail and 'source' in thumbnail:
                    return thumbnail['source']
        except (ValueError, KeyError):
            pass

    return None


def _normalize_wiki_src(src: str | None) -> str | None:
    """Нормализует src атрибут из Wikipedia в полный URL."""
    if not src:
        return None
    if src.startswith('//'):
        return 'https:' + src
    if src.startswith('/'):
        return 'https://en.wikipedia.org' + src
    if src.startswith('http://') or src.startswith('https://'):
        return src
    return None


# =============================================================================
# ИСТОЧНИК 2: SimpleIcons CDN
# =============================================================================

SIMPLE_ICONS_CDN = 'https://cdn.simpleicons.org/{slug}'


# =============================================================================
# ИСТОЧНИК 3: Google Favicon API
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
        is_svg = 'svg' in content_type.lower() or bool(re.search(b'<svg', content[:200]))
        if not is_svg:
            # Проверяем content-type
            is_svg = 'image/svg+xml' in content_type

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
# ЛОГИКА ЗАГРУЗКИ ДЛЯ ОДНОГО БРЕНДА
# =============================================================================

def fetch_brand_logo(brand_slug: str, brand_name: str, brand_website: str,
                     wiki_title: str | None, force: bool = False) -> dict:
    """
    Загружает логотип для одного бренда.
    Возвращает словарь с результатом: {'brand': name, 'source': ..., 'success': bool}
    """
    try:
        brand = Brand.objects.get(slug=brand_slug)
    except Brand.DoesNotExist:
        return {'brand': brand_slug, 'success': False, 'source': 'error', 'detail': 'not_found'}

    if brand.logo and not force:
        return {'brand': brand_name, 'success': True, 'source': 'skipped'}

    success = False
    source = None

    # --- Попытка 1: Wikipedia ---
    if wiki_title:
        for attempt in range(2):  # 2 попытки
            logo_url = wikipedia_logo_url(wiki_title)
            if logo_url:
                resp = fetch_url(logo_url, timeout=20)
                if resp:
                    logo_file = process_image(resp.content, resp.headers.get('content-type', ''), brand_slug)
                    if logo_file:
                        brand.logo.save(logo_file.name, logo_file, save=True)
                        brand.logo_provenance = 'wikipedia'
                        brand.save(update_fields=['logo', 'logo_provenance'])
                        success = True
                        source = 'wikipedia'
                        break
            if not success and attempt == 0:
                time.sleep(RETRY_DELAY)
            else:
                break

    if success:
        return {'brand': brand_name, 'success': True, 'source': source}

    # --- Попытка 2: SimpleIcons ---
    icon_slug = SIMPLEICONS_MAP.get(brand_slug, brand_slug)
    simple_url = SIMPLE_ICONS_CDN.format(slug=icon_slug)
    for attempt in range(2):
        resp = fetch_url(simple_url, timeout=15)
        if resp:
            logo_file = process_image(resp.content, 'image/svg+xml', brand_slug)
            if logo_file:
                brand.logo.save(logo_file.name, logo_file, save=True)
                brand.logo_provenance = 'simpleicons'
                brand.save(update_fields=['logo', 'logo_provenance'])
                success = True
                source = 'simpleicons'
                break
        if not success and attempt == 0:
            time.sleep(RETRY_DELAY)
        else:
            break

    if success:
        return {'brand': brand_name, 'success': True, 'source': source}

    # --- Попытка 3: Google Favicon ---
    if brand_website:
        domain_match = re.match(r'https?://(?:www\.)?([^/]+)', brand_website)
        if domain_match:
            domain = domain_match.group(1)
            favicon_url = google_favicon_url(domain)
            for attempt in range(2):
                resp = fetch_url(favicon_url, timeout=15)
                if resp and len(resp.content) > 500:
                    logo_file = process_image(resp.content, 'image/png', brand_slug)
                    if logo_file:
                        brand.logo.save(logo_file.name, logo_file, save=True)
                        brand.logo_provenance = 'favicon'
                        brand.save(update_fields=['logo', 'logo_provenance'])
                        success = True
                        source = 'favicon'
                        break
                if not success and attempt == 0:
                    time.sleep(RETRY_DELAY)
                else:
                    break

    if success:
        return {'brand': brand_name, 'success': True, 'source': source}

    # --- Попытка 4: SVG fallback ---
    return {'brand': brand_name, 'success': False, 'source': None}


# =============================================================================
# MAIN COMMAND
# =============================================================================

class Command(BaseCommand):
    help = 'Скачивает логотипы брендов (Wikipedia + SimpleIcons + Favicon + fallback)'

    def add_arguments(self, parser):
        parser.add_argument('--force', action='store_true', help='Перезаписать существующие')
        parser.add_argument('--brand', type=str, default='', help='Список брендов через запятую (slug)')
        parser.add_argument('--threads', type=int, default=3,
                            help='Количество потоков для параллельной загрузки (по умолчанию 3)')

    def handle(self, *args, **options):
        force = options['force']
        brand_filter = options['brand']
        max_workers = options['threads']

        brands = Brand.objects.all()
        if brand_filter:
            slugs = [s.strip() for s in brand_filter.split(',')]
            brands = brands.filter(slug__in=slugs)

        if not brands.exists():
            self.stdout.write(self.style.WARNING('Нет брендов для обработки.'))
            return

        total = brands.count()
        stats = {'wikipedia': 0, 'simpleicons': 0, 'favicon': 0, 'fallback': 0, 'skipped': 0, 'errors': 0}
        color_idx = 0

        self.stdout.write(f'🎨 Загрузка логотипов для {total} брендов...\n')

        # Собираем данные для параллельной обработки
        brand_tasks = []
        for brand in brands:
            wiki_title = WIKIPEDIA_TITLES.get(brand.slug, None)
            brand_tasks.append((
                brand.slug, brand.name, brand.website or '', wiki_title, force
            ))

        # Параллельный проход для Wikipedia + SimpleIcons + Favicon
        results = []
        with concurrent.futures.ThreadPoolExecutor(max_workers=max_workers) as executor:
            futures = {
                executor.submit(fetch_brand_logo, slug, name, website, wiki, force):
                    (slug, name)
                for slug, name, website, wiki, force in brand_tasks
            }
            for future in concurrent.futures.as_completed(futures):
                slug, name = futures[future]
                try:
                    result = future.result()
                    results.append(result)
                except Exception:
                    stats['errors'] += 1
                    results.append({'brand': name, 'success': False, 'source': 'error', 'detail': 'exception'})

        # Применяем fallback для тех, кто не получил логотип
        for brand in brands:
            # Проверяем, что бренд не получил логотип
            result = next((r for r in results if r['brand'] == brand.name), None)
            if result and result['success']:
                continue
            if brand.logo and not force:
                continue

            # SVG fallback
            color = FALLBACK_COLORS[color_idx % len(FALLBACK_COLORS)]
            color_idx += 1
            svg_content = generate_fallback_svg(brand.name, color)
            file_name = f'{brand.slug}.svg'
            brand.logo.save(file_name, ContentFile(svg_content.encode('utf-8')), save=True)
            brand.logo_provenance = 'fallback'
            brand.save(update_fields=['logo', 'logo_provenance'])

        # Выводим результаты
        self.stdout.write('')
        for r in results:
            if r['success']:
                source = r.get('source', '?')
                if source == 'skipped':
                    stats['skipped'] += 1
                elif source == 'wikipedia':
                    stats['wikipedia'] += 1
                elif source == 'simpleicons':
                    stats['simpleicons'] += 1
                elif source == 'favicon':
                    stats['favicon'] += 1
            elif r.get('source') == 'error':
                stats['errors'] += 1

        # Считаем fallback-и: те, что не получили логотип, но Brand.logo теперь есть
        fallback_count = Brand.objects.filter(logo_provenance='fallback').count()
        stats['fallback'] = fallback_count

        self.stdout.write('')
        self.stdout.write(self.style.SUCCESS('Загрузка завершена:'))
        self.stdout.write(f'  Wikipedia:   {stats["wikipedia"]}')
        self.stdout.write(f'  SimpleIcons: {stats["simpleicons"]}')
        self.stdout.write(f'  Favicon:     {stats["favicon"]}')
        self.stdout.write(f'  Fallback:    {stats["fallback"]}')
        self.stdout.write(f'  Пропущено:   {stats["skipped"]}')
        self.stdout.write(f'  Ошибок:      {stats["errors"]}')