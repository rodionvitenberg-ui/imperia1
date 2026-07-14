"""
Candidate 2 — DonorSite seam: one interface, N donor adapters.

Interface:
    DonorSite.search(query) → list[ProductRef]
    DonorSite.get_product_details(url) → ProductDetails
    DonorSite.get_images(url) → list[str]

Adapters:
    NeweggAdapter   — scrapes newegg.com (live CSS selectors)
    FixtureAdapter  — returns canned data from dicts (test double)

Two adapters make a real seam. Commands call donor.search() without
knowing which site backs it.
"""

from __future__ import annotations

import json
import re
from dataclasses import dataclass, field
from typing import Protocol
from urllib.parse import quote_plus, urljoin

from bs4 import BeautifulSoup

from .http_client import HttpClientInterface

# ═══════════════════════════════════════════════════════════════════════════════
# Domain types
# ═══════════════════════════════════════════════════════════════════════════════


@dataclass
class ProductRef:
    """Lightweight reference found on a donor's search results page."""

    name: str
    url: str | None = None
    price: float | None = None
    thumbnail_url: str | None = None


@dataclass
class ProductDetails:
    """Full details scraped from a donor's product detail page."""

    brand: str | None = None
    rating: float | None = None
    review_count: int | None = None
    description: str = ""
    specs: dict[str, str] = field(default_factory=dict)
    attributes: list[dict] = field(default_factory=list)
    # attributes is a list of {"name": "...", "value": ...} for seed_data compatibility


# ═══════════════════════════════════════════════════════════════════════════════
# Interface
# ═══════════════════════════════════════════════════════════════════════════════


class DonorSite(Protocol):
    """Interface that every donor adapter must satisfy."""

    def search(self, query: str, *, limit: int = 10) -> list[ProductRef]:
        """Search for products by query string."""

    def get_product_details(self, url: str) -> ProductDetails:
        """Scrape full product details from a product page."""

    def get_images(self, url: str) -> list[str]:
        """Return a list of image URLs from a product page."""


# ═══════════════════════════════════════════════════════════════════════════════
# Adapter: Newegg
# ═══════════════════════════════════════════════════════════════════════════════

# CDN "uncompress" patterns — strip Newegg's resize parameters
CDN_UNCOMPRESS_PATTERNS: list[tuple[str, str]] = [
    (r"/ProductImageCompressAll\d+/", "/ProductImage/"),
    (r"/ProductImageCompressAll1280/", "/ProductImage/"),
    (r"/ProductImageCompressAll300/", "/ProductImage/"),
    (r"/ProductImageCompressAll/", "/ProductImage/"),
    (r"/ProductImageAll\d+/", "/ProductImage/"),
    (r"\?width=\d+&height=\d+", ""),
    (r"&width=\d+&height=\d+", ""),
    (r"/sw\d+/", "/"),
    (r"/w\d+/", "/"),
    (r"/h\d+/", "/"),
    (r"/80x80/", "/"),
]

# SPEC_MAPPING: Newegg spec keys → Russian attribute names (CONTEXT.md vocabulary)
SPEC_MAPPING: dict[str, str] = {
    # Processors
    "CPU Socket Type": "Сокет",
    "Socket": "Сокет",
    "Number of Cores": "Количество ядер",
    "Cores": "Количество ядер",
    "Number of Threads": "Количество потоков",
    "Threads": "Количество потоков",
    "Operating Frequency": "Частота процессора",
    "Base Clock": "Частота процессора",
    "Max Turbo Frequency": "Макс. частота (Boost)",
    "Boost Clock": "Макс. частота (Boost)",
    "Manufacturing Tech": "Техпроцесс",
    "Thermal Design Power": "TDP",
    "TDP": "TDP",
    # GPUs
    "Video Memory": "Объём видеопамяти",
    "Memory Size": "Объём видеопамяти",
    "Memory Type": "Тип видеопамяти",
    "Memory Interface": "Шина памяти",
    "Memory Bus": "Шина памяти",
    # RAM
    "Capacity": "Объём ОЗУ",
    "Type": "Тип ОЗУ",
    "Speed": "Частота ОЗУ",
    "Memory Speed": "Частота ОЗУ",
    "Number of Modules": "Количество планок",
    # Storage
    "Storage Capacity": "Объём накопителя",
    "Drive Type": "Тип накопителя",
    "Form Factor": "Форм-фактор",
    "Max Sequential Read": "Скорость чтения",
    "Max Sequential Write": "Скорость записи",
    "Read Speed": "Скорость чтения",
    "Write Speed": "Скорость записи",
    # PSUs
    "Maximum Power": "Мощность БП",
    "Wattage": "Мощность БП",
    "Power": "Мощность БП",
    "80 Plus": "Сертификат",
    "Certification": "Сертификат",
    "Modular": "Модульность",
    "Modular Type": "Модульность",
    # Monitors
    "Screen Size": "Диагональ экрана",
    "Display Size": "Диагональ экрана",
    "Resolution": "Разрешение",
    "Maximum Resolution": "Разрешение",
    "Panel Type": "Тип матрицы",
    "Display Type": "Тип матрицы",
    "Refresh Rate": "Частота обновления",
    "Response Time": "Время отклика",
    "Brightness": "Яркость",
    "Curved": "Изогнутый",
    "Curved Surface Screen": "Изогнутый",
    # Laptops
    "Screen": "Диагональ ноутбука",
    "CPU": "Процессор (модель)",
    "Processor": "Процессор (модель)",
    "GPU/VPU": "Видеокарта (модель)",
    "Graphics": "Видеокарта (модель)",
    "Memory": "Объём RAM",
    "RAM": "Объём RAM",
    "SSD": "Объём SSD",
    "Storage": "Объём SSD",
    "Weight": "Вес",
    "Color": "Цвет",
}

NEWEGG_BASE = "https://www.newegg.com"
NEWEGG_SEARCH_URL = f"{NEWEGG_BASE}/p/pl?d={{query}}"


@dataclass
class NeweggAdapter:
    """
    Scrapes newegg.com.

    Usage:
        client = ScraperHttpClient(delay=0.8)
        donor = NeweggAdapter(client)
        results = donor.search("RTX 4080", limit=5)
        details = donor.get_product_details(results[0].url)
        images = donor.get_images(results[0].url)
    """

    http: HttpClientInterface

    # ------------------------------------------------------------------
    # DonorSite interface
    # ------------------------------------------------------------------

    def search(self, query: str, *, limit: int = 10) -> list[ProductRef]:
        url = NEWEGG_SEARCH_URL.format(query=quote_plus(query))
        soup = self.http.get_soup(url)
        if soup is None:
            return []

        return self._parse_search_results(soup, limit)

    def get_product_details(self, url: str) -> ProductDetails:
        soup = self.http.get_soup(url)
        if soup is None:
            return ProductDetails()

        return self._parse_product_page(soup)

    def get_images(self, url: str) -> list[str]:
        soup = self.http.get_soup(url)
        if soup is None:
            return []

        return self._parse_image_urls(soup)

    # ------------------------------------------------------------------
    # Search result parsing
    # ------------------------------------------------------------------

    def _parse_search_results(
        self, soup: BeautifulSoup, limit: int
    ) -> list[ProductRef]:
        products: list[ProductRef] = []
        cells = soup.select(".item-cell")
        if not cells:
            cells = soup.select(
                '[class*="item-container"], .product-item, .list-item, .result-item'
            )

        for cell in cells:
            if len(products) >= limit:
                break

            name_el = cell.select_one(
                ".item-title, [title], a[class*='title'], .product-title, h3 a"
            )
            if not name_el:
                continue

            name = name_el.get("title") or name_el.get_text(strip=True)
            if not name or len(name) < 5:
                continue

            link_el = cell.select_one('a[href*="/p/"], a[href*="/product/"]')
            url = None
            if link_el:
                href = link_el.get("href", "")
                url = href if href.startswith("http") else urljoin(NEWEGG_BASE, href)

            price_el = cell.select_one(
                ".price-current, [class*='price-current'], [class*='price'], .product-price"
            )
            price = None
            if price_el:
                price_text = price_el.get_text(strip=True)
                price_match = re.search(r"[\d,]+\.?\d*", price_text)
                if price_match:
                    price = float(price_match.group().replace(",", ""))

            img_el = cell.select_one("img[src], img[data-src]")
            thumbnail = None
            if img_el:
                thumbnail = img_el.get("src") or img_el.get("data-src")

            products.append(
                ProductRef(name=name, url=url, price=price, thumbnail_url=thumbnail)
            )

        return products

    # ------------------------------------------------------------------
    # Product detail page parsing
    # ------------------------------------------------------------------

    def _parse_product_page(self, soup: BeautifulSoup) -> ProductDetails:
        result = ProductDetails()

        # Brand
        brand_el = soup.select_one(
            '[class*="brand"], [itemprop="brand"] span, .product-brand a, .brand-name'
        )
        if brand_el:
            result.brand = brand_el.get_text(strip=True)

        # Rating
        rating_el = soup.select_one(
            '[itemprop="ratingValue"], .rating-value, [class*="rating"] span'
        )
        if rating_el:
            try:
                result.rating = float(rating_el.get_text(strip=True))
            except ValueError:
                pass

        review_el = soup.select_one('[itemprop="reviewCount"], .review-count')
        if review_el:
            try:
                result.review_count = int(
                    re.sub(r"\D", "", review_el.get_text(strip=True))
                )
            except ValueError:
                pass

        # Specs table
        spec_tables = soup.select(
            "#product-details table, .product-specs table, "
            '[class*="spec"] table, [class*="Spec"] table, '
            '.table-spec, table[class*="spec"]'
        )
        for table in spec_tables:
            for row in table.select("tr"):
                th = row.select_one("th, .spec-name, .spec-label, td:first-child")
                td = row.select_one("td:last-child, .spec-value, .spec-desc")
                if th and td:
                    key = th.get_text(strip=True).rstrip(":").strip()
                    value = td.get_text(strip=True)
                    if key and value and len(key) > 1:
                        result.specs[key] = value

        # Fallback: definition list
        if not result.specs:
            for dt in soup.select("dl dt, .spec-row .spec-name, .detail-row"):
                key = dt.get_text(strip=True).rstrip(":").strip()
                dd = dt.find_next("dd") or dt.find_next(
                    class_=re.compile(r"spec-value|spec-desc")
                )
                if dd and key:
                    value = dd.get_text(strip=True)
                    if value:
                        result.specs[key] = value

        # Description
        desc_el = soup.select_one(
            '[class*="description"], [class*="overview"], '
            "#product-overview, .product-desc"
        )
        if desc_el:
            result.description = desc_el.get_text(strip=True)[:500]

        # Map specs to attributes
        result.attributes = self._map_specs_to_attributes(result.specs)

        return result

    # ------------------------------------------------------------------
    # Image URL extraction
    # ------------------------------------------------------------------

    def _parse_image_urls(self, soup: BeautifulSoup) -> list[str]:
        image_urls: set[str] = set()

        # Gallery images
        for img in soup.select(
            ".product-view-img img, .main-img-slider img, "
            ".gallery-wrap img, .img-container img, "
            '[class*="gallery"] img, [class*="product-view"] img, '
            '[class*="swiper"] img, [class*="carousel"] img'
        ):
            src = (
                img.get("src")
                or img.get("data-src")
                or img.get("data-original")
                or ""
            )
            if src and (
                "neweggimages.com" in src
                or "newegg.com" in src
                or src.startswith("http")
            ):
                clean = self._uncompress_url(src)
                if "80x80" not in clean and "thumb" not in clean.lower():
                    image_urls.add(clean)

        # Open Graph
        og_image = soup.find("meta", property="og:image")
        if og_image and og_image.get("content"):
            image_urls.add(self._uncompress_url(og_image["content"]))

        # JSON-LD
        for script in soup.select('script[type="application/ld+json"]'):
            try:
                data = json.loads(script.string)
                if isinstance(data, dict):
                    img = data.get("image")
                    if isinstance(img, str):
                        image_urls.add(self._uncompress_url(img))
                    elif isinstance(img, list):
                        for i in img:
                            if isinstance(i, str):
                                image_urls.add(self._uncompress_url(i))
            except (json.JSONDecodeError, TypeError):
                pass

        return list(image_urls)

    # ------------------------------------------------------------------
    # Helpers
    # ------------------------------------------------------------------

    @staticmethod
    def _uncompress_url(url: str) -> str:
        """Strip Newegg CDN resize/compress parameters from URL."""
        for pattern, replacement in CDN_UNCOMPRESS_PATTERNS:
            url = re.sub(pattern, replacement, url)
        url = re.sub(r"(?<!:)/+", "/", url)
        return url

    def _map_specs_to_attributes(self, raw_specs: dict[str, str]) -> list[dict]:
        """Map raw Newegg spec keys to Russian attribute names."""
        attributes: list[dict] = []
        for raw_key, raw_value in raw_specs.items():
            attr_name = SPEC_MAPPING.get(raw_key)
            if attr_name is None:
                continue
            parsed = self._parse_spec_value(raw_key, raw_value)
            if parsed is None:
                continue
            attributes.append({"name": attr_name, "value": parsed})
        return attributes

    @staticmethod
    def _parse_spec_value(key: str, value: str):
        """Parse a raw spec string into a typed value."""
        if value.lower() in ("yes", "true"):
            return True
        if value.lower() in ("no", "false", "none"):
            return False

        num_match = re.search(
            r"([\d,]+\.?\d*)\s*(GB|TB|MHz|GHz|W|ms|Hz|bit|MB|cd)?",
            value,
            re.IGNORECASE,
        )
        if num_match:
            num = float(num_match.group(1).replace(",", ""))
            unit = num_match.group(2)
            if unit and unit.upper() == "TB":
                num *= 1000
            if unit and unit.upper() == "KHZ":
                num /= 1000
            if num == int(num):
                return int(num)
            return num

        return value.strip()


# ═══════════════════════════════════════════════════════════════════════════════
# Adapter: Fixture (test double)
# ═══════════════════════════════════════════════════════════════════════════════


@dataclass
class FixtureAdapter:
    """
    Test double: returns canned data, no HTTP, no parsing.

    Usage:
        donor = FixtureAdapter(
            search_results={"RTX 4080": [ProductRef(name="RTX 4080", url="...")]},
            product_details={"https://..." : ProductDetails(brand="NVIDIA")},
            images={"https://...": ["https://img.example.com/1.jpg"]},
        )
    """

    search_results: dict[str, list[ProductRef]] = field(default_factory=dict)
    product_details: dict[str, ProductDetails] = field(default_factory=dict)
    images: dict[str, list[str]] = field(default_factory=dict)

    def search(self, query: str, *, limit: int = 10) -> list[ProductRef]:
        results = self.search_results.get(query, [])
        return results[:limit]

    def get_product_details(self, url: str) -> ProductDetails:
        return self.product_details.get(url, ProductDetails())

    def get_images(self, url: str) -> list[str]:
        return self.images.get(url, [])