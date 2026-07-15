"""
Management command для парсинга изображений товаров с Newegg.
Использует Google Images + Playwright Stealth для обхода защиты.

Стратегия:
  Newegg (newegg.com) блокирует прямые запросы через Cloudflare Turnstile.
  Google Images НЕ использует Turnstile и показывает изображения с neweggimages.com.
  Мы ищем через Google Images, фильтруем ссылки на neweggimages.com,
  применяем CDN-разжатие и скачиваем.

Стратегия «разжатия» CDN URL:
  Newegg сжимает изображения через CDN (ProductImageCompressAll300, ProductImageCompressAll1280 и т.д.)
  Заменяем сжатый путь на полноразмерный оригинал.

Требования к качеству:
  - Минимальная ширина: 800px
  - Минимальный размер файла: 20KB
  - Приоритет форматов: PNG > WEBP > JPEG
  - Максимум 8 изображений на товар

Использование:
    python manage.py scrape_newegg_images                  # все товары без фото
    python manage.py scrape_newegg_images --limit=10        # только 10 товаров
    python manage.py scrape_newegg_images --product=slug1,slug2  # только указанные
    python manage.py scrape_newegg_images --force           # перезаписать существующие
    python manage.py scrape_newegg_images --quality=high    # только ≥ 800px (по умолчанию)
    python manage.py scrape_newegg_images --headless        # запуск без GUI (по умолч. с GUI)
"""

import os
import re
import io
import time
import json
import random
from urllib.parse import quote_plus

import requests
from PIL import Image
from bs4 import BeautifulSoup
from django.core.management.base import BaseCommand
from django.core.files.base import ContentFile
from products.models import Product, ProductImage

# =============================================================================
# Playwright импорты
# =============================================================================
from playwright.sync_api import sync_playwright

# =============================================================================
# Константы
# =============================================================================
DUCKDUCKGO_IMAGES_URL = 'https://duckduckgo.com/?q={query}&iax=images&ia=images'
REQUEST_DELAY = 1.0
MAX_IMAGES_PER_PRODUCT = 3
MIN_IMAGE_WIDTH = 800      # px — исключает маленькие preview/thumbnails
MIN_IMAGE_SIZE = 50_000     # bytes — исключает слишком лёгкие изображения

# Newegg CDN patterns: заменяем сжатый путь на оригинал
CDN_UNCOMPRESS_PATTERNS = [
    (r'/ProductImageCompressAll\d+/', '/ProductImage/'),
    (r'/ProductImageCompressAll1280/', '/ProductImage/'),
    (r'/ProductImageCompressAll300/', '/ProductImage/'),
    (r'/ProductImageCompressAll/', '/ProductImage/'),
    (r'/ProductImageAll\d+/', '/ProductImage/'),
    (r'\?width=\d+&height=\d+', ''),
    (r'&width=\d+&height=\d+', ''),
    (r'/sw\d+/', '/'),
    (r'/w\d+/', '/'),
    (r'/h\d+/', '/'),
    (r'/80x80/', '/'),
]

USER_AGENTS = [
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',
]

# Селекторы DuckDuckGo Images (актуальные на 2025)
DUCK_IMG_FIGURE_SELECTOR = 'figure.nsogf_Hpj9UUxfhcwQd5'
DUCK_IMG_SRC_SELECTOR = 'img[src*="external-content.duckduckgo.com/iu/"]'

def random_ua() -> str:
    return random.choice(USER_AGENTS)


def uncompressed_url(url: str) -> str:
    """«Разжимает» Newegg CDN URL, заменяя сжатый путь на оригинальный."""
    for pattern, replacement in CDN_UNCOMPRESS_PATTERNS:
        url = re.sub(pattern, replacement, url)
    # Убираем дублирующиеся слеши (кроме http://)
    url = re.sub(r'(?<!:)/+', '/', url)
    return url


def build_search_query(product: Product) -> str:
    """Строит поисковый запрос: название бренда + модель."""
    brand_names = list(product.brands.values_list('name', flat=True))
    words = re.sub(r'[^\w\s-]', '', product.name).split()
    brand_words = set()
    for bn in brand_names:
        brand_words.update(bn.lower().split())

    significant = [w for w in words if len(w) > 2 and w.lower() not in brand_words][:5]
    name_part = ' '.join(significant)
    brand_part = ' '.join(brand_names) if brand_names else ''
    query = f'{brand_part} {name_part}'.strip()
    return query if query else product.name


def is_valid_image(content: bytes, content_type: str = '') -> tuple[bool, int, int, int]:
    """
    Проверяет, что изображение соответствует требованиям качества.
    Возвращает кортеж (True/False, ширина, высота, размер_в_байтах).
    """
    w, h = 0, 0
    size = len(content)

    if size < MIN_IMAGE_SIZE:
        return False, w, h, size

    try:
        img = Image.open(io.BytesIO(content))
        w, h = img.width, img.height
        if w < MIN_IMAGE_WIDTH:
            return False, w, h, size
    except Exception:
        return False, w, h, size

    return True, w, h, size


# =============================================================================
# Playwright-функции
# =============================================================================

def _create_browser(headless: bool = False):
    """
    Создаёт экземпляр браузера Playwright с применением stealth-дополнений.
    """
    from playwright_stealth import Stealth

    p = sync_playwright().start()
    browser = p.chromium.launch(
        headless=headless,
        args=[
            '--no-sandbox',
            '--disable-blink-features=AutomationControlled',
            '--disable-dev-shm-usage',
        ],
    )
    context = browser.new_context(
        user_agent=random_ua(),
        viewport={'width': 1920, 'height': 1080},
        locale='en-US',
        timezone_id='America/New_York',
    )
    page = context.new_page()

    # Применяем stealth
    Stealth().apply_stealth_sync(page)

    return p, browser, page


def _close_browser(p, browser):
    """Закрывает браузер и завершает Playwright."""
    try:
        browser.close()
    except Exception:
        pass
    try:
        p.stop()
    except Exception:
        pass


def _extract_original_url(duck_url: str) -> str | None:
    """
    Извлекает оригинальный URL изображения из DuckDuckGo-прокси.
    DuckDuckGo проксирует изображения через:
      //external-content.duckduckgo.com/iu/?u=https%3A%2F%2Foriginal.url...
    Извлекает и декодирует параметр u=.
    """
    import urllib.parse
    try:
        parsed = urllib.parse.urlparse(duck_url)
        params = urllib.parse.parse_qs(parsed.query)
        if 'u' in params:
            return params['u'][0]
    except Exception:
        pass
    return None


def search_duckduckgo_images(query: str, page) -> list[str]:
    """
    Ищет изображения через DuckDuckGo Images (без капч и Cloudflare).
    Кликает на каждое изображение, чтобы открыть модалку,
    затем забирает оригинальный URL из кнопки "View File" (ссылка href).
    Фильтрует по качеству при скачивании (is_valid_image).
    Возвращает список оригинальных URL изображений.
    """
    search_url = DUCKDUCKGO_IMAGES_URL.format(query=quote_plus(query))

    try:
        page.goto(search_url, wait_until='domcontentloaded', timeout=30000)
    except Exception:
        return []

    # Ждём загрузки результатов — ждём появления хотя бы одного тега img
    try:
        page.wait_for_selector('figure.nsogf_Hpj9UUxfhcwQd5', timeout=15000)
    except Exception:
        pass

    # Даём время на рендеринг
    time.sleep(2)

    # Скроллим вниз, чтобы подгрузить больше изображений
    for _ in range(5):
        try:
            page.evaluate('window.scrollBy(0, 1200)')
            time.sleep(0.5)
        except Exception:
            break

    image_urls: set[str] = set()

    # === Кликаем на каждую figure, чтобы открыть модалку и взять оригинал ===
    figures = page.locator('figure.nsogf_Hpj9UUxfhcwQd5').all()
    for figure in figures[:10]:  # максимум 10 попыток
        try:
            # Скроллим до figure и кликаем
            figure.scroll_into_view_if_needed(timeout=3000)
            figure.click(timeout=5000)
            time.sleep(0.8)

            # Ждём появления модалки
            page.wait_for_selector('a.Gr22SUHQb8xKdEwTxIxe', timeout=5000)

            # Берём оригинальный URL из кнопки "View File"
            view_link = page.locator('a.Gr22SUHQb8xKdEwTxIxe').first
            if view_link.count() > 0:
                href = view_link.get_attribute('href')
                if href and href.startswith('http'):
                    image_urls.add(href)

            # Закрываем модалку (Escape)
            page.keyboard.press('Escape')
            time.sleep(0.3)
        except Exception:
            try:
                page.keyboard.press('Escape')
            except Exception:
                pass
            continue

    return list(image_urls)


def download_and_save_images(
    image_urls: list[str],
    product: Product,
    quality: str,
    stdout,
    style,
    debug: bool = False,
) -> int:
    """
    Скачивает изображения, валидирует качество и сохраняет в ProductImage.
    Возвращает количество успешно скачанных изображений.
    """
    downloaded = 0

    for i, img_url in enumerate(image_urls):
        if downloaded >= MAX_IMAGES_PER_PRODUCT:
            break

        full_url = uncompressed_url(img_url)

        try:
            img_resp = requests.get(
                full_url,
                headers={'User-Agent': random_ua(), 'Referer': 'https://www.newegg.com/'},
                timeout=25,
            )
            img_resp.raise_for_status()

            # Валидация качества
            valid, w, h, size = is_valid_image(img_resp.content)
            if debug:
                stdout.write(f'      ⏺ {full_url[-60:]} → {w}x{h} {size//1024}KB')
            if quality == 'high' and not valid:
                if debug:
                    stdout.write(f'        ↳ отсеяно (мало: {w}x{h} {size//1024}KB < {MIN_IMAGE_WIDTH}px / {MIN_IMAGE_SIZE//1024}KB)')
                continue

            content_type = img_resp.headers.get('content-type', '')
            ext = '.webp' if 'webp' in content_type else '.jpg'
            if 'png' in content_type:
                ext = '.png'

            file_name = f'{product.slug}_{i}{ext}'

            ProductImage.objects.create(
                product=product,
                image=ContentFile(img_resp.content, name=file_name),
                is_main=(i == 0),
                image_type='main' if i == 0 else 'gallery',
                alt_text=product.name,
                sort_order=i,
            )
            downloaded += 1

        except requests.RequestException:
            continue

    return downloaded


# =============================================================================
# Django Command
# =============================================================================

class Command(BaseCommand):
    help = 'Парсит изображения товаров с Newegg через Google Images (Playwright + Stealth)'

    def add_arguments(self, parser):
        parser.add_argument('--limit', type=int, default=0, help='Лимит товаров')
        parser.add_argument('--product', type=str, default='', help='Список slug-ов через запятую')
        parser.add_argument('--force', action='store_true', help='Перезаписать существующие')
        parser.add_argument('--quality', type=str, default='high',
                            choices=['high', 'any'],
                            help='high — только ≥800px; any — без фильтрации (default: high)')
        parser.add_argument('--headless', action='store_true',
                            help='Запуск без GUI (по умолчанию: с GUI для отладки)')
        parser.add_argument('--debug', action='store_true',
                            help='Режим отладки: скриншоты и дамп HTML')
        parser.add_argument('--wait-for-captcha', action='store_true',
                            help='Ожидать ручного прохождения капчи перед началом парсинга')

    def handle(self, *args, **options):
        # Разрешаем ORM-доступ, т.к. Playwright Sync API использует asyncio под капотом
        os.environ['DJANGO_ALLOW_ASYNC_UNSAFE'] = 'true'

        # Устанавливаем значение по умолчанию для поля provenance (существует в БД, но не в модели)
        from django.db import connection
        with connection.cursor() as cursor:
            cursor.execute(
                "ALTER TABLE products_productimage ALTER COLUMN provenance SET DEFAULT 'web'"
            )

        limit = options['limit']
        product_filter = options['product']
        force = options['force']
        quality = options['quality']
        headless = options['headless']
        debug = options.get('debug', False)
        wait_for_captcha = options.get('wait_for_captcha', False)

        # === Debug: директория ===
        debug_dir = None
        if debug:
            import pathlib
            debug_dir = pathlib.Path(__file__).resolve().parent.parent.parent / 'debug_scrape'
            debug_dir.mkdir(exist_ok=True)

        # === Получаем список товаров ===
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

        success = 0
        no_results = 0
        no_images = 0
        low_quality = 0

        self.stdout.write(
            f'🖼️  Поиск изображений для {total} товаров '
            f'(Google Images | качество: {quality}) '
            f'| Playwright {"headless" if headless else "GUI"} | Stealth ON\n'
        )

        # === Запускаем Playwright браузер (один на всю сессию) ===
        p, browser, page = _create_browser(headless=headless)

        # === Режим ожидания ручного прохождения капчи ===
        if wait_for_captcha:
            self.stdout.write(self.style.WARNING(
                '🛡️  Режим ожидания капчи. Браузер открыт.'))
            self.stdout.write(self.style.WARNING(
                '    Пройди капчу (если появится) вручную в окне браузера.'))
            self.stdout.write(self.style.WARNING(
                '    После успешного прохождения — нажми Enter в терминале.'))
            try:
                page.goto('https://www.google.com/imghp', wait_until='domcontentloaded', timeout=15000)
            except Exception:
                pass
            input()
            try:
                page.wait_for_function(
                    '() => !document.title.includes("Just a moment")',
                    timeout=120000
                )
                self.stdout.write(self.style.SUCCESS('    ✅ Капча пройдена!'))
            except Exception:
                self.stdout.write(self.style.WARNING(
                    '    ⚠️ Возможно капча не пройдена, пробуем продолжить...'))
            self.stdout.write('')

        try:
            for idx, product in enumerate(products, start=1):
                self.stdout.write(f'  [{idx}/{total}] {product.name[:70]}')
                self.stdout.flush()

                query = build_search_query(product)
                self.stdout.write(f'\n    Поиск: "{query}"')

                # Debug: скриншот
                if debug and debug_dir:
                    try:
                        page.screenshot(path=str(debug_dir / f'search_{product.slug}.png'), full_page=True)
                        self.stdout.write(f'    📸 Скриншот: debug_scrape/search_{product.slug}.png')
                    except Exception:
                        pass

                # Шаг 1: поиск изображений через Google Images
                image_urls = search_duckduckgo_images(query, page)

                if not image_urls:
                    no_images += 1
                    self.stdout.write(self.style.WARNING('    ✗ Изображения не найдены через DuckDuckGo Images'))
                    # Debug: дамп HTML
                    if debug and debug_dir:
                        try:
                            html = page.content()
                            with open(debug_dir / f'search_{product.slug}.html', 'w') as f:
                                f.write(html)
                            self.stdout.write(f'    📄 HTML дамп: debug_scrape/search_{product.slug}.html')
                        except Exception as e:
                            self.stdout.write(f'    ⚠️ Ошибка debug: {e}')
                    if idx < total:
                        time.sleep(REQUEST_DELAY)
                    continue

                self.stdout.write(f'    → Найдено URL с neweggimages.com: {len(image_urls)}')
                # Debug: показываем найденные URL
                if debug:
                    for u in image_urls[:5]:
                        self.stdout.write(f'      {u[:120]}')

                # Шаг 2: скачивание с валидацией качества
                downloaded = download_and_save_images(
                    image_urls, product, quality,
                    self.stdout, self.style,
                    debug=debug,
                )

                if downloaded > 0:
                    success += 1
                    self.stdout.write(
                        self.style.SUCCESS(f'    ✓ Скачано {downloaded} изображений')
                    )
                    # Показываем первые URL для наглядности
                    for u in list(image_urls)[:3]:
                        self.stdout.write(f'      {u[:100]}')
                else:
                    no_images += 1
                    self.stdout.write(
                        self.style.WARNING('    ✗ Нет изображений нужного качества')
                    )

                if idx < total:
                    time.sleep(REQUEST_DELAY)

        finally:
            _close_browser(p, browser)

        # Итог
        self.stdout.write('')
        self.stdout.write(self.style.SUCCESS('Завершено:'))
        self.stdout.write(f'  Успешно (товаров): {success}')
        self.stdout.write(f'  Не найдено на Newegg: {no_results}')
        self.stdout.write(f'  Нет изображений: {no_images}')
        self.stdout.write(f'  Отсеяно (низкое качество): {low_quality}')