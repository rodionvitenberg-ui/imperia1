"""
Management command для заполнения базы тестовыми данными:
категории, бренды, атрибуты, товары с вариантами, стоками и атрибутами.

Все слаги — строго ASCII (латиница). Единицы измерения — международные.
Теги — на английском языке.

Использование:
    python manage.py seed_data            # заполнить (пропускает существующие)
    python manage.py seed_data --clear    # очистить всё и заполнить заново
"""

from django.core.management.base import BaseCommand
from django.utils.text import slugify as _django_slugify
from django.db import transaction

from products.models import (
    Category, Brand, Attribute, Tag, Product, ProductVariant,
    ProductAttribute, ProductImage, Stock,
)

# =============================================================================
# Транслитерация кириллицы → латиница (для авто-слагов)
# =============================================================================

CYRILLIC_TO_LATIN = {
    'а': 'a', 'б': 'b', 'в': 'v', 'г': 'g', 'д': 'd', 'е': 'e', 'ё': 'yo',
    'ж': 'zh', 'з': 'z', 'и': 'i', 'й': 'y', 'к': 'k', 'л': 'l', 'м': 'm',
    'н': 'n', 'о': 'o', 'п': 'p', 'р': 'r', 'с': 's', 'т': 't', 'у': 'u',
    'ф': 'f', 'х': 'h', 'ц': 'ts', 'ч': 'ch', 'ш': 'sh', 'щ': 'sch',
    'ъ': '', 'ы': 'y', 'ь': '', 'э': 'e', 'ю': 'yu', 'я': 'ya',
    'А': 'a', 'Б': 'b', 'В': 'v', 'Г': 'g', 'Д': 'd', 'Е': 'e', 'Ё': 'yo',
    'Ж': 'zh', 'З': 'z', 'И': 'i', 'Й': 'y', 'К': 'k', 'Л': 'l', 'М': 'm',
    'Н': 'n', 'О': 'o', 'П': 'p', 'Р': 'r', 'С': 's', 'Т': 't', 'У': 'u',
    'Ф': 'f', 'Х': 'h', 'Ц': 'ts', 'Ч': 'ch', 'Ш': 'sh', 'Щ': 'sch',
    'Ъ': '', 'Ы': 'y', 'Ь': '', 'Э': 'e', 'Ю': 'yu', 'Я': 'ya',
    '№': 'n', '«': '', '»': '', '"': '', '\'': '', '(': '', ')': '',
}


def transliterate(text: str) -> str:
    """Транслитерирует кириллицу в латиницу."""
    result = ''
    for ch in text:
        result += CYRILLIC_TO_LATIN.get(ch, ch)
    return result


def slugify(value: str) -> str:
    """Генерирует ASCII-слаг: транслитерация кириллицы + django slugify."""
    transliterated = transliterate(value)
    return _django_slugify(transliterated)


# =============================================================================
# ДАННЫЕ ДЛЯ ЗАПОЛНЕНИЯ
# =============================================================================

CATEGORY_TREE = [
    {
        "name": "Комплектующие",
        "slug": "components",
        "header_order": 1,
        "children": [
            {"name": "Процессоры", "slug": "processors"},
            {"name": "Видеокарты", "slug": "videocards"},
            {"name": "Материнские платы", "slug": "motherboards"},
            {"name": "Оперативная память", "slug": "ram"},
            {"name": "Накопители SSD", "slug": "ssd"},
            {"name": "Жёсткие диски", "slug": "hdd"},
            {"name": "Блоки питания", "slug": "psu"},
            {"name": "Корпуса", "slug": "cases"},
            {"name": "Охлаждение", "slug": "cooling"},
        ],
    },
    {
        "name": "Компьютеры",
        "slug": "computers",
        "header_order": 2,
        "children": [
            {"name": "Игровые ПК", "slug": "gaming-pcs"},
            {"name": "Офисные ПК", "slug": "office-pcs"},
            {"name": "Рабочие станции", "slug": "workstations"},
            {"name": "Игровые ноутбуки", "slug": "gaming-laptops"},
            {"name": "Ультрабуки", "slug": "ultrabooks"},
            {"name": "Рабочие ноутбуки", "slug": "work-laptops"},
        ],
    },
    {
        "name": "Мониторы",
        "slug": "monitors",
        "header_order": 3,
        "children": [
            {"name": "Игровые мониторы", "slug": "gaming-monitors"},
            {"name": "Профессиональные мониторы", "slug": "professional-monitors"},
            {"name": "Офисные мониторы", "slug": "office-monitors"},
        ],
    },
    {
        "name": "Периферия",
        "slug": "peripherals",
        "header_order": 4,
        "children": [
            {"name": "Клавиатуры", "slug": "keyboards"},
            {"name": "Мыши", "slug": "mice"},
            {"name": "Гарнитуры", "slug": "headsets"},
            {"name": "Коврики", "slug": "mousepads"},
        ],
    },
    {
        "name": "МФУ и принтеры",
        "slug": "mfu-printers",
        "header_order": 5,
        "children": [
            {"name": "Цветные МФУ и принтеры", "slug": "color-mfu-printers"},
            {"name": "Картриджи, чернила и пр.", "slug": "cartridges-inks"},
        ],
    },
    {
        "name": "Аксессуары",
        "slug": "accessories",
        "header_order": 6,
        "children": [
            {"name": "Кабели и переходники", "slug": "cables-adapters"},
            {"name": "Чехлы и сумки", "slug": "cases-bags"},
            {"name": "Веб-камеры", "slug": "webcams"},
        ],
    },
]

# (name, slug, country, website)
BRANDS = [
    ("Intel", "intel", "USA", "https://www.intel.com"),
    ("AMD", "amd", "USA", "https://www.amd.com"),
    ("NVIDIA", "nvidia", "USA", "https://www.nvidia.com"),
    ("ASUS", "asus", "Taiwan", "https://www.asus.com"),
    ("MSI", "msi", "Taiwan", "https://www.msi.com"),
    ("Gigabyte", "gigabyte", "Taiwan", "https://www.gigabyte.com"),
    ("Samsung", "samsung", "South Korea", "https://www.samsung.com"),
    ("LG", "lg", "South Korea", "https://www.lg.com"),
    ("Dell", "dell", "USA", "https://www.dell.com"),
    ("HP", "hp", "USA", "https://www.hp.com"),
    ("Lenovo", "lenovo", "China", "https://www.lenovo.com"),
    ("Corsair", "corsair", "USA", "https://www.corsair.com"),
    ("Kingston", "kingston", "USA", "https://www.kingston.com"),
    ("Seagate", "seagate", "Ireland", "https://www.seagate.com"),
    ("Western Digital", "western-digital", "USA", "https://www.westerndigital.com"),
    ("Logitech", "logitech", "Switzerland", "https://www.logitech.com"),
    ("Razer", "razer", "USA", "https://www.razer.com"),
    ("Acer", "acer", "Taiwan", "https://www.acer.com"),
    ("Cooler Master", "cooler-master", "Taiwan", "https://www.coolermaster.com"),
    ("be quiet!", "be-quiet", "Germany", "https://www.bequiet.com"),
    ("Seasonic", "seasonic", "Taiwan", "https://www.seasonic.com"),
    ("HyperX", "hyperx", "USA", "https://www.hyperxgaming.com"),
    ("SteelSeries", "steelseries", "Denmark", "https://www.steelseries.com"),
    ("BenQ", "benq", "Taiwan", "https://www.benq.com"),
    ("Noctua", "noctua", "Austria", "https://www.noctua.at"),
    ("DeepCool", "deepcool", "China", "https://www.deepcool.com"),
    ("Arctic", "arctic", "Germany", "https://www.arctic.de"),
    ("G.Skill", "gskill", "Taiwan", "https://www.gskill.com"),
    ("Crucial", "crucial", "USA", "https://www.crucial.com"),
    ("ASRock", "asrock", "Taiwan", "https://www.asrock.com"),
    ("EVGA", "evga", "USA", "https://www.evga.com"),
    ("Fractal Design", "fractal-design", "Sweden", "https://www.fractal-design.com"),
    ("NZXT", "nzxt", "USA", "https://www.nzxt.com"),
    ("Lian Li", "lian-li", "Taiwan", "https://www.lian-li.com"),
    ("TeamGroup", "teamgroup", "Taiwan", "https://www.teamgroup.com"),
    ("Patriot", "patriot", "USA", "https://www.patriot.com"),
    ("Toshiba", "toshiba", "Japan", "https://www.toshiba.com"),
    ("Keychron", "keychron", "China", "https://www.keychron.com"),
    ("Ducky", "ducky", "Taiwan", "https://www.duckychannel.com"),
    ("Zowie", "zowie", "Taiwan", "https://www.zowie.com"),
    ("Apple", "apple", "USA", "https://www.apple.com"),
    ("Thermalright", "thermalright", "China", "https://www.thermalright.com"),
]

# (name, slug, type, unit) — единицы измерения строго международные
ATTRIBUTES = [
    # Процессоры
    ("Частота процессора", "cpu-frequency", "int", "GHz"),
    ("Макс. частота (Boost)", "max-boost-frequency", "int", "GHz"),
    ("Количество ядер", "cores", "int", ""),
    ("Количество потоков", "threads", "int", ""),
    ("Сокет", "socket", "enum", ""),
    ("Техпроцесс", "manufacturing-tech", "str", ""),
    ("TDP", "tdp", "int", "W"),
    # Видеокарты
    ("Объём видеопамяти", "vram", "int", "GB"),
    ("Тип видеопамяти", "vram-type", "enum", ""),
    ("Шина памяти", "memory-bus", "int", "bit"),
    # ОЗУ
    ("Объём ОЗУ", "ram-capacity", "int", "GB"),
    ("Тип ОЗУ", "ram-type", "enum", ""),
    ("Частота ОЗУ", "ram-frequency", "int", "MHz"),
    ("Количество планок", "ram-modules", "int", ""),
    # Накопители
    ("Объём накопителя", "storage-capacity", "int", "GB"),
    ("Тип накопителя", "storage-type", "enum", ""),
    ("Форм-фактор", "form-factor", "enum", ""),
    ("Скорость чтения", "read-speed", "int", "MB/s"),
    ("Скорость записи", "write-speed", "int", "MB/s"),
    # Блоки питания
    ("Мощность БП", "psu-wattage", "int", "W"),
    ("Сертификат", "certification", "enum", ""),
    ("Модульность", "modularity", "enum", ""),
    # Мониторы
    ("Диагональ экрана", "screen-size", "str", ""),
    ("Разрешение", "resolution", "str", ""),
    ("Тип матрицы", "panel-type", "enum", ""),
    ("Частота обновления", "refresh-rate", "int", "Hz"),
    ("Время отклика", "response-time", "int", "ms"),
    ("Изогнутый", "curved", "bool", ""),
    ("Яркость", "brightness", "int", "cd/m²"),
    # Ноутбуки
    ("Диагональ ноутбука", "laptop-screen-size", "str", ""),
    ("Процессор (модель)", "cpu-model", "str", ""),
    ("Видеокарта (модель)", "gpu-model", "str", ""),
    ("Объём RAM", "laptop-ram", "int", "GB"),
    ("Объём SSD", "laptop-ssd", "int", "GB"),
    ("Вес", "weight", "str", ""),
    ("Цвет", "color", "str", ""),
    # Периферия
    ("Подсветка", "backlight", "bool", ""),
    ("Беспроводной", "wireless", "bool", ""),
    ("Механические переключатели", "mechanical-switches", "bool", ""),
]

ENUM_OPTIONS = {
    "Сокет": ["LGA1700", "LGA1200", "AM5", "AM4", "TR4", "sTRX4"],
    "Тип видеопамяти": ["GDDR6", "GDDR6X", "GDDR5", "GDDR5X", "HBM2"],
    "Тип ОЗУ": ["DDR5", "DDR4", "DDR3"],
    "Тип накопителя": ["SSD", "HDD", "NVMe", "M.2 SATA"],
    "Форм-фактор": ['2.5"', '3.5"', 'M.2 2280', 'M.2 2230', 'mSATA', 'ATX', 'microATX', 'Mini-ITX'],
    "Сертификат": ["80+ Bronze", "80+ Silver", "80+ Gold", "80+ Platinum", "80+ Titanium", "80+"],
    "Модульность": ["Non-modular", "Semi-modular", "Fully modular"],
    "Тип матрицы": ["IPS", "VA", "TN", "OLED", "Nano IPS", "Fast IPS"],
}

# =============================================================================
# ТОВАРЫ  (80+ товаров, расширенный ассортимент)
# =============================================================================

PRODUCTS = [
    # ────────────────────────────────────────────────────────────────────
    # ПРОЦЕССОРЫ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Intel Core i9-14900K",
        "slug": "intel-core-i9-14900k",
        "price": 48500,
        "category": "Комплектующие > Процессоры",
        "brands": ["Intel"],
        "tags": ["flagship", "gaming", "raptor-lake", "unlocked"],
        "is_favorite": True,
        "attributes": {
            "Частота процессора": ("int", 3.2),
            "Макс. частота (Boost)": ("int", 6.0),
            "Количество ядер": ("int", 24),
            "Количество потоков": ("int", 32),
            "Сокет": ("enum", "LGA1700"),
            "TDP": ("int", 253),
        },
    },
    {
        "name": "Intel Core i7-14700K",
        "slug": "intel-core-i7-14700k",
        "price": 34200,
        "category": "Комплектующие > Процессоры",
        "brands": ["Intel"],
        "tags": ["gaming", "raptor-lake", "unlocked"],
        "attributes": {
            "Частота процессора": ("int", 3.4),
            "Макс. частота (Boost)": ("int", 5.6),
            "Количество ядер": ("int", 20),
            "Количество потоков": ("int", 28),
            "Сокет": ("enum", "LGA1700"),
            "TDP": ("int", 253),
        },
    },
    {
        "name": "Intel Core i5-14600K",
        "slug": "intel-core-i5-14600k",
        "price": 27500,
        "category": "Комплектующие > Процессоры",
        "brands": ["Intel"],
        "tags": ["mid-range", "gaming", "raptor-lake", "unlocked"],
        "attributes": {
            "Частота процессора": ("int", 3.5),
            "Макс. частота (Boost)": ("int", 5.3),
            "Количество ядер": ("int", 14),
            "Количество потоков": ("int", 20),
            "Сокет": ("enum", "LGA1700"),
            "TDP": ("int", 181),
        },
    },
    {
        "name": "Intel Core i3-14100F",
        "slug": "intel-core-i3-14100f",
        "price": 12400,
        "category": "Комплектующие > Процессоры",
        "brands": ["Intel"],
        "tags": ["budget", "entry-level", "raptor-lake"],
        "is_new": True,
        "attributes": {
            "Частота процессора": ("int", 3.5),
            "Макс. частота (Boost)": ("int", 4.7),
            "Количество ядер": ("int", 4),
            "Количество потоков": ("int", 8),
            "Сокет": ("enum", "LGA1700"),
            "TDP": ("int", 110),
        },
    },
    {
        "name": "AMD Ryzen 9 7950X3D",
        "slug": "amd-ryzen-9-7950x3d",
        "price": 57800,
        "category": "Комплектующие > Процессоры",
        "brands": ["AMD"],
        "tags": ["flagship", "gaming", "3d-v-cache", "zen-4"],
        "is_favorite": True,
        "attributes": {
            "Частота процессора": ("int", 4.2),
            "Макс. частота (Boost)": ("int", 5.7),
            "Количество ядер": ("int", 16),
            "Количество потоков": ("int", 32),
            "Сокет": ("enum", "AM5"),
            "TDP": ("int", 120),
        },
    },
    {
        "name": "AMD Ryzen 7 7800X3D",
        "slug": "amd-ryzen-7-7800x3d",
        "price": 33800,
        "category": "Комплектующие > Процессоры",
        "brands": ["AMD"],
        "tags": ["gaming", "3d-v-cache", "zen-4"],
        "is_favorite": True,
        "attributes": {
            "Частота процессора": ("int", 4.2),
            "Макс. частота (Boost)": ("int", 5.0),
            "Количество ядер": ("int", 8),
            "Количество потоков": ("int", 16),
            "Сокет": ("enum", "AM5"),
            "TDP": ("int", 120),
        },
    },
    {
        "name": "AMD Ryzen 5 7600X",
        "slug": "amd-ryzen-5-7600x",
        "price": 21800,
        "category": "Комплектующие > Процессоры",
        "brands": ["AMD"],
        "tags": ["mid-range", "gaming", "zen-4"],
        "attributes": {
            "Частота процессора": ("int", 4.7),
            "Макс. частота (Boost)": ("int", 5.3),
            "Количество ядер": ("int", 6),
            "Количество потоков": ("int", 12),
            "Сокет": ("enum", "AM5"),
            "TDP": ("int", 105),
        },
    },
    {
        "name": "AMD Ryzen 9 9950X",
        "slug": "amd-ryzen-9-9950x",
        "price": 62400,
        "category": "Комплектующие > Процессоры",
        "brands": ["AMD"],
        "tags": ["flagship", "productivity", "zen-5", "unlocked"],
        "is_new": True,
        "attributes": {
            "Частота процессора": ("int", 4.3),
            "Макс. частота (Boost)": ("int", 5.7),
            "Количество ядер": ("int", 16),
            "Количество потоков": ("int", 32),
            "Сокет": ("enum", "AM5"),
            "TDP": ("int", 170),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # ВИДЕОКАРТЫ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "NVIDIA GeForce RTX 4090",
        "slug": "nvidia-geforce-rtx-4090",
        "price": 158000,
        "category": "Комплектующие > Видеокарты",
        "brands": ["NVIDIA", "ASUS"],
        "tags": ["flagship", "gaming", "rtx", "dlss-3", "4k"],
        "is_favorite": True,
        "attributes": {
            "Объём видеопамяти": ("int", 24),
            "Тип видеопамяти": ("enum", "GDDR6X"),
            "Шина памяти": ("int", 384),
        },
    },
    {
        "name": "NVIDIA GeForce RTX 4080 Super",
        "slug": "nvidia-geforce-rtx-4080-super",
        "price": 82600,
        "category": "Комплектующие > Видеокарты",
        "brands": ["NVIDIA", "MSI"],
        "tags": ["gaming", "rtx", "dlss-3", "4k"],
        "attributes": {
            "Объём видеопамяти": ("int", 16),
            "Тип видеопамяти": ("enum", "GDDR6X"),
            "Шина памяти": ("int", 256),
        },
    },
    {
        "name": "NVIDIA GeForce RTX 4070 Super",
        "slug": "nvidia-geforce-rtx-4070-super",
        "price": 54200,
        "category": "Комплектующие > Видеокарты",
        "brands": ["NVIDIA", "Gigabyte"],
        "tags": ["gaming", "rtx", "dlss-3", "1440p"],
        "attributes": {
            "Объём видеопамяти": ("int", 12),
            "Тип видеопамяти": ("enum", "GDDR6X"),
            "Шина памяти": ("int", 192),
        },
    },
    {
        "name": "NVIDIA GeForce RTX 4060 Ti",
        "slug": "nvidia-geforce-rtx-4060-ti",
        "price": 36400,
        "category": "Комплектующие > Видеокарты",
        "brands": ["NVIDIA", "ASUS"],
        "tags": ["mid-range", "gaming", "rtx", "dlss-3", "1080p"],
        "attributes": {
            "Объём видеопамяти": ("int", 8),
            "Тип видеопамяти": ("enum", "GDDR6"),
            "Шина памяти": ("int", 128),
        },
    },
    {
        "name": "AMD Radeon RX 7900 XTX",
        "slug": "amd-radeon-rx-7900-xtx",
        "price": 74800,
        "category": "Комплектующие > Видеокарты",
        "brands": ["AMD", "Gigabyte"],
        "tags": ["flagship", "gaming", "rdna-3", "4k"],
        "attributes": {
            "Объём видеопамяти": ("int", 24),
            "Тип видеопамяти": ("enum", "GDDR6"),
            "Шина памяти": ("int", 384),
        },
    },
    {
        "name": "AMD Radeon RX 7800 XT",
        "slug": "amd-radeon-rx-7800-xt",
        "price": 41600,
        "category": "Комплектующие > Видеокарты",
        "brands": ["AMD", "Gigabyte"],
        "tags": ["gaming", "rdna-3", "1440p"],
        "attributes": {
            "Объём видеопамяти": ("int", 16),
            "Тип видеопамяти": ("enum", "GDDR6"),
            "Шина памяти": ("int", 256),
        },
    },
    {
        "name": "AMD Radeon RX 7600",
        "slug": "amd-radeon-rx-7600",
        "price": 24800,
        "category": "Комплектующие > Видеокарты",
        "brands": ["AMD", "ASUS"],
        "tags": ["mid-range", "gaming", "rdna-3", "1080p"],
        "is_new": True,
        "attributes": {
            "Объём видеопамяти": ("int", 8),
            "Тип видеопамяти": ("enum", "GDDR6"),
            "Шина памяти": ("int", 128),
        },
    },
    {
        "name": "Intel Arc A770 16GB",
        "slug": "intel-arc-a770-16gb",
        "price": 27600,
        "category": "Комплектующие > Видеокарты",
        "brands": ["Intel", "ASUS"],
        "tags": ["mid-range", "gaming", "intel-arc", "xess"],
        "is_new": True,
        "attributes": {
            "Объём видеопамяти": ("int", 16),
            "Тип видеопамяти": ("enum", "GDDR6"),
            "Шина памяти": ("int", 256),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # МАТЕРИНСКИЕ ПЛАТЫ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "ASUS ROG STRIX Z790-F Gaming WiFi",
        "slug": "asus-rog-strix-z790-f-gaming-wifi",
        "price": 34200,
        "category": "Комплектующие > Материнские платы",
        "brands": ["ASUS"],
        "tags": ["gaming", "ddr5", "wi-fi", "atx"],
        "attributes": {
            "Сокет": ("enum", "LGA1700"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "ATX"),
        },
    },
    {
        "name": "Gigabyte Z790 AORUS Elite AX",
        "slug": "gigabyte-z790-aorus-elite-ax",
        "price": 25800,
        "category": "Комплектующие > Материнские платы",
        "brands": ["Gigabyte"],
        "tags": ["gaming", "ddr5", "wi-fi", "atx"],
        "attributes": {
            "Сокет": ("enum", "LGA1700"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "ATX"),
        },
    },
    {
        "name": "ASUS TUF Gaming B760-PLUS WiFi",
        "slug": "asus-tuf-gaming-b760-plus-wifi",
        "price": 18300,
        "category": "Комплектующие > Материнские платы",
        "brands": ["ASUS"],
        "tags": ["mid-range", "ddr5", "wi-fi", "atx"],
        "attributes": {
            "Сокет": ("enum", "LGA1700"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "ATX"),
        },
    },
    {
        "name": "MSI MAG B650 TOMAHAWK WiFi",
        "slug": "msi-mag-b650-tomahawk-wifi",
        "price": 19800,
        "category": "Комплектующие > Материнские платы",
        "brands": ["MSI"],
        "tags": ["gaming", "ddr5", "am5", "atx"],
        "attributes": {
            "Сокет": ("enum", "AM5"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "ATX"),
        },
    },
    {
        "name": "ASRock B650M Pro RS WiFi",
        "slug": "asrock-b650m-pro-rs-wifi",
        "price": 14200,
        "category": "Комплектующие > Материнские платы",
        "brands": ["ASRock"],
        "tags": ["mid-range", "ddr5", "am5", "microatx"],
        "is_new": True,
        "attributes": {
            "Сокет": ("enum", "AM5"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "microATX"),
        },
    },
    {
        "name": "MSI MPG X670E Carbon WiFi",
        "slug": "msi-mpg-x670e-carbon-wifi",
        "price": 43200,
        "category": "Комплектующие > Материнские платы",
        "brands": ["MSI"],
        "tags": ["flagship", "ddr5", "am5", "atx"],
        "attributes": {
            "Сокет": ("enum", "AM5"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "ATX"),
        },
    },
    {
        "name": "Gigabyte B550 AORUS Elite V2",
        "slug": "gigabyte-b550-aorus-elite-v2",
        "price": 12800,
        "category": "Комплектующие > Материнские платы",
        "brands": ["Gigabyte"],
        "tags": ["mid-range", "ddr4", "am4", "atx"],
        "attributes": {
            "Сокет": ("enum", "AM4"),
            "Тип ОЗУ": ("enum", "DDR4"),
            "Форм-фактор": ("enum", "ATX"),
        },
    },
    {
        "name": "ASUS ROG Crosshair X670E Hero",
        "slug": "asus-rog-crosshair-x670e-hero",
        "price": 58600,
        "category": "Комплектующие > Материнские платы",
        "brands": ["ASUS"],
        "tags": ["flagship", "ddr5", "am5", "overclocking"],
        "attributes": {
            "Сокет": ("enum", "AM5"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "ATX"),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # ОПЕРАТИВНАЯ ПАМЯТЬ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz",
        "slug": "kingston-fury-beast-ddr5-32gb-2x16-5600mhz",
        "price": 9600,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Kingston"],
        "tags": ["ddr5", "5600mhz", "dual-channel"],
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 5600),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB",
        "slug": "corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb",
        "price": 10200,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Corsair"],
        "tags": ["ddr5", "6000mhz", "rgb", "dual-channel"],
        "variants": [
            {"name": "32GB (2×16) 6000MHz", "sku": "CMK32GX5M2B6000", "price_override": None},
            {"name": "64GB (2×32) 6000MHz", "sku": "CMK64GX5M2B6000", "price_override": 18500},
        ],
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 6000),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz",
        "slug": "gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz",
        "price": 11800,
        "category": "Комплектующие > Оперативная память",
        "brands": ["G.Skill"],
        "tags": ["ddr5", "6400mhz", "rgb", "dual-channel", "overclocking"],
        "is_new": True,
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 6400),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "Crucial Pro DDR5 32GB (2×16GB) 5600MHz",
        "slug": "crucial-pro-ddr5-32gb-2x16-5600mhz",
        "price": 8400,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Crucial"],
        "tags": ["ddr5", "5600mhz", "dual-channel"],
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 5600),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "Crucial Pro DDR4 32GB (2×16GB) 3200MHz",
        "slug": "crucial-pro-ddr4-32gb-2x16-3200mhz",
        "price": 6200,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Crucial"],
        "tags": ["ddr4", "3200mhz", "dual-channel", "budget"],
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR4"),
            "Частота ОЗУ": ("int", 3200),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz",
        "slug": "teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz",
        "price": 21600,
        "category": "Комплектующие > Оперативная память",
        "brands": ["TeamGroup"],
        "tags": ["ddr5", "6000mhz", "rgb", "64gb", "dual-channel"],
        "is_new": True,
        "attributes": {
            "Объём ОЗУ": ("int", 64),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 6000),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz",
        "slug": "patriot-viper-steel-ddr4-16gb-2x8-3600mhz",
        "price": 4200,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Patriot"],
        "tags": ["ddr4", "3600mhz", "budget", "dual-channel"],
        "attributes": {
            "Объём ОЗУ": ("int", 16),
            "Тип ОЗУ": ("enum", "DDR4"),
            "Частота ОЗУ": ("int", 3600),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz",
        "slug": "kingston-fury-renegade-ddr5-32gb-2x16-7200mhz",
        "price": 13400,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Kingston"],
        "tags": ["ddr5", "7200mhz", "overclocking", "dual-channel"],
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 7200),
            "Количество планок": ("int", 2),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # SSD (6)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Samsung 990 PRO 2TB NVMe M.2",
        "slug": "samsung-990-pro-2tb-nvme-m2",
        "price": 15600,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Samsung"],
        "tags": ["nvme", "pcie-4", "high-end"],
        "attributes": {
            "Объём накопителя": ("int", 2000),
            "Тип накопителя": ("enum", "NVMe"),
            "Форм-фактор": ("enum", "M.2 2280"),
            "Скорость чтения": ("int", 7450),
            "Скорость записи": ("int", 6900),
        },
        "variants": [
            {"name": "1TB", "sku": "MZ-V9P1T0BW", "price_override": 8700},
            {"name": "2TB", "sku": "MZ-V9P2T0BW", "price_override": None},
            {"name": "4TB", "sku": "MZ-V9P4T0BW", "price_override": 27400},
        ],
    },
    {
        "name": "WD Black SN850X 1TB NVMe M.2",
        "slug": "wd-black-sn850x-1tb-nvme-m2",
        "price": 8300,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Western Digital"],
        "tags": ["nvme", "pcie-4", "gaming"],
        "attributes": {
            "Объём накопителя": ("int", 1000),
            "Тип накопителя": ("enum", "NVMe"),
            "Форм-фактор": ("enum", "M.2 2280"),
            "Скорость чтения": ("int", 7300),
            "Скорость записи": ("int", 6300),
        },
    },
    {
        "name": "Kingston KC3000 2TB NVMe M.2",
        "slug": "kingston-kc3000-2tb-nvme-m2",
        "price": 13200,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Kingston"],
        "tags": ["nvme", "pcie-4", "high-end"],
        "attributes": {
            "Объём накопителя": ("int", 2000),
            "Тип накопителя": ("enum", "NVMe"),
            "Форм-фактор": ("enum", "M.2 2280"),
            "Скорость чтения": ("int", 7000),
            "Скорость записи": ("int", 7000),
        },
    },
    {
        "name": "Crucial T700 1TB NVMe M.2 PCIe 5.0",
        "slug": "crucial-t700-1tb-nvme-m2-pcie-5",
        "price": 14200,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Crucial"],
        "tags": ["nvme", "pcie-5", "high-end", "next-gen"],
        "is_new": True,
        "attributes": {
            "Объём накопителя": ("int", 1000),
            "Тип накопителя": ("enum", "NVMe"),
            "Форм-фактор": ("enum", "M.2 2280"),
            "Скорость чтения": ("int", 11700),
            "Скорость записи": ("int", 9500),
        },
    },
    {
        "name": "Samsung 870 EVO 1TB SATA 2.5\"",
        "slug": "samsung-870-evo-1tb-sata-25",
        "price": 7200,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Samsung"],
        "tags": ["sata", "ssd", "reliable", "budget"],
        "attributes": {
            "Объём накопителя": ("int", 1000),
            "Тип накопителя": ("enum", "SSD"),
            "Форм-фактор": ("enum", '2.5"'),
            "Скорость чтения": ("int", 560),
            "Скорость записи": ("int", 530),
        },
    },
    {
        "name": "WD Blue SN580 1TB NVMe M.2",
        "slug": "wd-blue-sn580-1tb-nvme-m2",
        "price": 5800,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Western Digital"],
        "tags": ["nvme", "pcie-4", "budget", "entry-level"],
        "attributes": {
            "Объём накопителя": ("int", 1000),
            "Тип накопителя": ("enum", "NVMe"),
            "Форм-фактор": ("enum", "M.2 2280"),
            "Скорость чтения": ("int", 4150),
            "Скорость записи": ("int", 4150),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # ЖЁСТКИЕ ДИСКИ (4)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Seagate BarraCuda 4TB HDD 3.5\"",
        "slug": "seagate-barracuda-4tb-hdd-35",
        "price": 6900,
        "category": "Комплектующие > Жёсткие диски",
        "brands": ["Seagate"],
        "tags": ["hdd", "5400rpm", "storage"],
        "attributes": {
            "Объём накопителя": ("int", 4000),
            "Тип накопителя": ("enum", "HDD"),
            "Форм-фактор": ("enum", '3.5"'),
        },
    },
    {
        "name": "WD Red Plus 8TB NAS HDD 3.5\"",
        "slug": "wd-red-plus-8tb-nas-hdd-35",
        "price": 16800,
        "category": "Комплектующие > Жёсткие диски",
        "brands": ["Western Digital"],
        "tags": ["hdd", "nas", "7200rpm", "cmr"],
        "is_new": True,
        "attributes": {
            "Объём накопителя": ("int", 8000),
            "Тип накопителя": ("enum", "HDD"),
            "Форм-фактор": ("enum", '3.5"'),
        },
    },
    {
        "name": "Toshiba N300 12TB NAS HDD 3.5\"",
        "slug": "toshiba-n300-12tb-nas-hdd-35",
        "price": 23400,
        "category": "Комплектующие > Жёсткие диски",
        "brands": ["Toshiba"],
        "tags": ["hdd", "nas", "7200rpm", "high-capacity"],
        "attributes": {
            "Объём накопителя": ("int", 12000),
            "Тип накопителя": ("enum", "HDD"),
            "Форм-фактор": ("enum", '3.5"'),
        },
    },
    {
        "name": "Seagate IronWolf 4TB NAS HDD 3.5\"",
        "slug": "seagate-ironwolf-4tb-nas-hdd-35",
        "price": 8600,
        "category": "Комплектующие > Жёсткие диски",
        "brands": ["Seagate"],
        "tags": ["hdd", "nas", "5900rpm", "cmr"],
        "attributes": {
            "Объём накопителя": ("int", 4000),
            "Тип накопителя": ("enum", "HDD"),
            "Форм-фактор": ("enum", '3.5"'),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # БЛОКИ ПИТАНИЯ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Corsair RM850x (2024) 850W 80+ Gold",
        "slug": "corsair-rm850x-2024-850w-80plus-gold",
        "price": 11200,
        "category": "Комплектующие > Блоки питания",
        "brands": ["Corsair"],
        "tags": ["modular", "850w", "gold"],
        "attributes": {
            "Мощность БП": ("int", 850),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Fully modular"),
        },
    },
    {
        "name": "be quiet! Dark Power 13 1000W 80+ Titanium",
        "slug": "be-quiet-dark-power-13-1000w-80plus-titanium",
        "price": 22600,
        "category": "Комплектующие > Блоки питания",
        "brands": ["be quiet!"],
        "tags": ["quiet", "modular", "1000w", "titanium"],
        "is_favorite": True,
        "attributes": {
            "Мощность БП": ("int", 1000),
            "Сертификат": ("enum", "80+ Titanium"),
            "Модульность": ("enum", "Fully modular"),
        },
    },
    {
        "name": "Seasonic Focus GX-750 750W 80+ Gold",
        "slug": "seasonic-focus-gx-750-750w-80plus-gold",
        "price": 8900,
        "category": "Комплектующие > Блоки питания",
        "brands": ["Seasonic"],
        "tags": ["modular", "750w", "gold", "compact"],
        "attributes": {
            "Мощность БП": ("int", 750),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Fully modular"),
        },
    },
    {
        "name": "Cooler Master MWE Gold 650 V2 650W 80+ Gold",
        "slug": "cooler-master-mwe-gold-650-v2-650w-80plus-gold",
        "price": 6500,
        "category": "Комплектующие > Блоки питания",
        "brands": ["Cooler Master"],
        "tags": ["budget", "650w", "gold", "non-modular"],
        "attributes": {
            "Мощность БП": ("int", 650),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Non-modular"),
        },
    },
    {
        "name": "EVGA SuperNOVA 850 GT 850W 80+ Gold",
        "slug": "evga-supernova-850-gt-850w-80plus-gold",
        "price": 10300,
        "category": "Комплектующие > Блоки питания",
        "brands": ["EVGA"],
        "tags": ["modular", "850w", "gold"],
        "attributes": {
            "Мощность БП": ("int", 850),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Fully modular"),
        },
    },
    {
        "name": "Corsair RM750e 750W 80+ Gold",
        "slug": "corsair-rm750e-750w-80plus-gold",
        "price": 8200,
        "category": "Комплектующие > Блоки питания",
        "brands": ["Corsair"],
        "tags": ["modular", "750w", "gold", "low-noise"],
        "attributes": {
            "Мощность БП": ("int", 750),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Fully modular"),
        },
    },
    {
        "name": "DeepCool PQ1000M 1000W 80+ Gold",
        "slug": "deepcool-pq1000m-1000w-80plus-gold",
        "price": 12700,
        "category": "Комплектующие > Блоки питания",
        "brands": ["DeepCool"],
        "tags": ["modular", "1000w", "gold", "atx-3"],
        "is_new": True,
        "attributes": {
            "Мощность БП": ("int", 1000),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Fully modular"),
        },
    },
    {
        "name": "be quiet! Pure Power 12 M 750W 80+ Gold",
        "slug": "be-quiet-pure-power-12-m-750w-80plus-gold",
        "price": 9600,
        "category": "Комплектующие > Блоки питания",
        "brands": ["be quiet!"],
        "tags": ["quiet", "semi-modular", "750w", "gold", "atx-3"],
        "attributes": {
            "Мощность БП": ("int", 750),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Semi-modular"),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # КОРПУСА (6)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Cooler Master MasterBox TD500 Mesh V2",
        "slug": "cooler-master-masterbox-td500-mesh-v2",
        "price": 8200,
        "category": "Комплектующие > Корпуса",
        "brands": ["Cooler Master"],
        "tags": ["mid-tower", "mesh", "rgb", "tempered-glass"],
        "attributes": {
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Fractal Design North Charcoal Black",
        "slug": "fractal-design-north-charcoal-black",
        "price": 12400,
        "category": "Комплектующие > Корпуса",
        "brands": ["Fractal Design"],
        "tags": ["mid-tower", "wood", "mesh", "elegant"],
        "is_new": True,
        "attributes": {
            "Подсветка": ("bool", False),
            "Цвет": ("str", "Charcoal Black"),
        },
    },
    {
        "name": "NZXT H7 Flow",
        "slug": "nzxt-h7-flow",
        "price": 10800,
        "category": "Комплектующие > Корпуса",
        "brands": ["NZXT"],
        "tags": ["mid-tower", "airflow", "minimalist", "tempered-glass"],
        "attributes": {
            "Подсветка": ("bool", False),
            "Цвет": ("str", "White"),
        },
    },
    {
        "name": "Corsair 4000D Airflow",
        "slug": "corsair-4000d-airflow",
        "price": 8200,
        "category": "Комплектующие > Корпуса",
        "brands": ["Corsair"],
        "tags": ["mid-tower", "airflow", "budget", "tempered-glass"],
        "attributes": {
            "Подсветка": ("bool", False),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Lian Li O11 Dynamic EVO",
        "slug": "lian-li-o11-dynamic-evo",
        "price": 14800,
        "category": "Комплектующие > Корпуса",
        "brands": ["Lian Li"],
        "tags": ["mid-tower", "dual-chamber", "tempered-glass", "watercooling"],
        "is_favorite": True,
        "attributes": {
            "Подсветка": ("bool", False),
            "Цвет": ("str", "White"),
        },
    },
    {
        "name": "be quiet! Silent Base 802",
        "slug": "be-quiet-silent-base-802",
        "price": 13500,
        "category": "Комплектующие > Корпуса",
        "brands": ["be quiet!"],
        "tags": ["mid-tower", "silent", "insulated", "modular"],
        "attributes": {
            "Подсветка": ("bool", False),
            "Цвет": ("str", "Black"),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # ОХЛАЖДЕНИЕ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Noctua NH-D15 chromax.black",
        "slug": "noctua-nh-d15-chromax-black",
        "price": 9200,
        "category": "Комплектующие > Охлаждение",
        "brands": ["Noctua"],
        "tags": ["air-cooling", "dual-tower", "140mm", "quiet", "high-end"],
        "is_favorite": True,
        "attributes": {
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "DeepCool AK620",
        "slug": "deepcool-ak620",
        "price": 5400,
        "category": "Комплектующие > Охлаждение",
        "brands": ["DeepCool"],
        "tags": ["air-cooling", "dual-tower", "120mm", "budget"],
        "attributes": {
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "be quiet! Dark Rock Pro 4",
        "slug": "be-quiet-dark-rock-pro-4",
        "price": 7800,
        "category": "Комплектующие > Охлаждение",
        "brands": ["be quiet!"],
        "tags": ["air-cooling", "dual-tower", "120mm", "quiet"],
        "attributes": {
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Arctic Liquid Freezer II 360",
        "slug": "arctic-liquid-freezer-ii-360",
        "price": 9600,
        "category": "Комплектующие > Охлаждение",
        "brands": ["Arctic"],
        "tags": ["aio", "360mm", "quiet", "watercooling"],
        "attributes": {
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Corsair iCUE H150i Elite LCD XT",
        "slug": "corsair-icue-h150i-elite-lcd-xt",
        "price": 18200,
        "category": "Комплектующие > Охлаждение",
        "brands": ["Corsair"],
        "tags": ["aio", "360mm", "rgb", "lcd-display", "high-end"],
        "attributes": {
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Cooler Master Hyper 212 Halo Black",
        "slug": "cooler-master-hyper-212-halo-black",
        "price": 3200,
        "category": "Комплектующие > Охлаждение",
        "brands": ["Cooler Master"],
        "tags": ["air-cooling", "single-tower", "120mm", "budget", "rgb"],
        "attributes": {
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "NZXT Kraken X63 RGB 280mm",
        "slug": "nzxt-kraken-x63-rgb-280mm",
        "price": 14200,
        "category": "Комплектующие > Охлаждение",
        "brands": ["NZXT"],
        "tags": ["aio", "280mm", "rgb", "mirror-display"],
        "attributes": {
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Thermalright Peerless Assassin 120 SE",
        "slug": "thermalright-peerless-assassin-120-se",
        "price": 3800,
        "category": "Комплектующие > Охлаждение",
        "brands": ["Thermalright"],
        "tags": ["air-cooling", "dual-tower", "120mm", "budget", "best-value"],
        "attributes": {
            "Цвет": ("str", "Silver"),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # МОНИТОРЫ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Samsung Odyssey G7 27\" QHD 240Hz Curved",
        "slug": "samsung-odyssey-g7-27-qhd-240hz-curved",
        "price": 43200,
        "category": "Мониторы > Игровые мониторы",
        "brands": ["Samsung"],
        "tags": ["gaming", "240hz", "qhd", "curved", "va"],
        "attributes": {
            "Диагональ экрана": ("str", '27"'),
            "Разрешение": ("str", "2560×1440 (QHD)"),
            "Тип матрицы": ("enum", "VA"),
            "Частота обновления": ("int", 240),
            "Время отклика": ("int", 1),
            "Изогнутый": ("bool", True),
            "Яркость": ("int", 350),
        },
    },
    {
        "name": "LG UltraGear 27GP850-B 27\" QHD 165Hz Nano IPS",
        "slug": "lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips",
        "price": 34600,
        "category": "Мониторы > Игровые мониторы",
        "brands": ["LG"],
        "tags": ["gaming", "165hz", "nano-ips", "qhd", "hdr"],
        "attributes": {
            "Диагональ экрана": ("str", '27"'),
            "Разрешение": ("str", "2560×1440 (QHD)"),
            "Тип матрицы": ("enum", "Nano IPS"),
            "Частота обновления": ("int", 165),
            "Время отклика": ("int", 1),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 400),
        },
    },
    {
        "name": "ASUS ROG Swift PG32UCDM 32\" 4K 240Hz OLED",
        "slug": "asus-rog-swift-pg32ucdm-32-4k-240hz-oled",
        "price": 112000,
        "category": "Мониторы > Игровые мониторы",
        "brands": ["ASUS"],
        "tags": ["gaming", "oled", "4k", "240hz", "flagship"],
        "is_favorite": True,
        "attributes": {
            "Диагональ экрана": ("str", '32"'),
            "Разрешение": ("str", "3840×2160 (4K)"),
            "Тип матрицы": ("enum", "OLED"),
            "Частота обновления": ("int", 240),
            "Время отклика": ("int", 0.03),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 1000),
        },
    },
    {
        "name": "Dell S2722QC 27\" 4K 60Hz IPS",
        "slug": "dell-s2722qc-27-4k-60hz-ips",
        "price": 28600,
        "category": "Мониторы > Офисные мониторы",
        "brands": ["Dell"],
        "tags": ["office", "4k", "ips", "usb-c", "productivity"],
        "attributes": {
            "Диагональ экрана": ("str", '27"'),
            "Разрешение": ("str", "3840×2160 (4K)"),
            "Тип матрицы": ("enum", "IPS"),
            "Частота обновления": ("int", 60),
            "Время отклика": ("int", 4),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 350),
        },
    },
    {
        "name": "Gigabyte M27Q 27\" QHD 170Hz IPS",
        "slug": "gigabyte-m27q-27-qhd-170hz-ips",
        "price": 26800,
        "category": "Мониторы > Игровые мониторы",
        "brands": ["Gigabyte"],
        "tags": ["gaming", "170hz", "ips", "qhd", "kvm"],
        "attributes": {
            "Диагональ экрана": ("str", '27"'),
            "Разрешение": ("str", "2560×1440 (QHD)"),
            "Тип матрицы": ("enum", "IPS"),
            "Частота обновления": ("int", 170),
            "Время отклика": ("int", 1),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 350),
        },
    },
    {
        "name": "BenQ PD2705U 27\" 4K 60Hz IPS Designer Monitor",
        "slug": "benq-pd2705u-27-4k-60hz-ips-designer",
        "price": 38400,
        "category": "Мониторы > Профессиональные мониторы",
        "brands": ["BenQ"],
        "tags": ["professional", "4k", "ips", "color-accurate", "usb-c"],
        "attributes": {
            "Диагональ экрана": ("str", '27"'),
            "Разрешение": ("str", "3840×2160 (4K)"),
            "Тип матрицы": ("enum", "IPS"),
            "Частота обновления": ("int", 60),
            "Время отклика": ("int", 5),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 350),
        },
    },
    {
        "name": "ASUS ProArt PA278QV 27\" QHD 75Hz IPS",
        "slug": "asus-proart-pa278qv-27-qhd-75hz-ips",
        "price": 26400,
        "category": "Мониторы > Профессиональные мониторы",
        "brands": ["ASUS"],
        "tags": ["professional", "qhd", "ips", "color-accurate", "budget"],
        "attributes": {
            "Диагональ экрана": ("str", '27"'),
            "Разрешение": ("str", "2560×1440 (QHD)"),
            "Тип матрицы": ("enum", "IPS"),
            "Частота обновления": ("int", 75),
            "Время отклика": ("int", 5),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 350),
        },
    },
    {
        "name": "LG 27GN950-B 27\" 4K 144Hz Nano IPS",
        "slug": "lg-27gn950-b-27-4k-144hz-nano-ips",
        "price": 62400,
        "category": "Мониторы > Игровые мониторы",
        "brands": ["LG"],
        "tags": ["gaming", "4k", "144hz", "nano-ips", "hdr600"],
        "is_new": True,
        "attributes": {
            "Диагональ экрана": ("str", '27"'),
            "Разрешение": ("str", "3840×2160 (4K)"),
            "Тип матрицы": ("enum", "Nano IPS"),
            "Частота обновления": ("int", 144),
            "Время отклика": ("int", 1),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 600),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # НОУТБУКИ (8)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "ASUS ROG Zephyrus G16 (2025) 16\" Ultra 9 / RTX 4070",
        "slug": "asus-rog-zephyrus-g16-2025-ultra9-rtx4070",
        "price": 154000,
        "category": "Компьютеры > Игровые ноутбуки",
        "brands": ["ASUS"],
        "tags": ["gaming", "rtx-4070", "ultra-9", "240hz", "oled"],
        "is_favorite": True,
        "attributes": {
            "Диагональ ноутбука": ("str", '16"'),
            "Процессор (модель)": ("str", "Intel Core Ultra 9 285H"),
            "Видеокарта (модель)": ("str", "NVIDIA RTX 4070 8GB"),
            "Объём RAM": ("int", 32),
            "Объём SSD": ("int", 1000),
        },
        "variants": [
            {"name": "Ultra 9 / RTX 4070 / 32GB / 1TB", "sku": "GU605MI-QR107W", "price_override": None},
            {"name": "Ultra 7 / RTX 4060 / 16GB / 512GB", "sku": "GU605MI-QR064W", "price_override": 124000},
        ],
    },
    {
        "name": "Lenovo Legion Pro 5 16IRX9 16\" i9 / RTX 4060",
        "slug": "lenovo-legion-pro-5-16irx9-i9-rtx4060",
        "price": 132000,
        "category": "Компьютеры > Игровые ноутбуки",
        "brands": ["Lenovo"],
        "tags": ["gaming", "rtx-4060", "i9", "165hz"],
        "attributes": {
            "Диагональ ноутбука": ("str", '16"'),
            "Процессор (модель)": ("str", "Intel Core i9-14900HX"),
            "Видеокарта (модель)": ("str", "NVIDIA RTX 4060 8GB"),
            "Объём RAM": ("int", 16),
            "Объём SSD": ("int", 1000),
        },
    },
    {
        "name": "Acer Predator Helios 16 16\" i7 / RTX 4070",
        "slug": "acer-predator-helios-16-i7-rtx4070",
        "price": 126000,
        "category": "Компьютеры > Игровые ноутбуки",
        "brands": ["Acer"],
        "tags": ["gaming", "rtx-4070", "i7", "240hz", "mini-led"],
        "is_new": True,
        "attributes": {
            "Диагональ ноутбука": ("str", '16"'),
            "Процессор (модель)": ("str", "Intel Core i7-14700HX"),
            "Видеокарта (модель)": ("str", "NVIDIA RTX 4070 8GB"),
            "Объём RAM": ("int", 16),
            "Объём SSD": ("int", 1000),
        },
    },
    {
        "name": "Apple MacBook Pro 16\" M4 Pro",
        "slug": "apple-macbook-pro-16-m4-pro",
        "price": 224000,
        "category": "Компьютеры > Рабочие ноутбуки",
        "brands": ["Apple"],
        "tags": ["workstation", "m4-pro", "liquid-retina-xdr", "macos"],
        "is_favorite": True,
        "attributes": {
            "Диагональ ноутбука": ("str", '16.2"'),
            "Процессор (модель)": ("str", "Apple M4 Pro"),
            "Видеокарта (модель)": ("str", "Integrated 20-core"),
            "Объём RAM": ("int", 24),
            "Объём SSD": ("int", 512),
        },
        "variants": [
            {"name": "M4 Pro 24GB / 512GB", "sku": "MBP16-M4P-24-512", "price_override": None},
            {"name": "M4 Pro 48GB / 1TB", "sku": "MBP16-M4P-48-1T", "price_override": 278000},
        ],
    },
    {
        "name": "Apple MacBook Air 15\" M4",
        "slug": "apple-macbook-air-15-m4",
        "price": 118000,
        "category": "Компьютеры > Ультрабуки",
        "brands": ["Apple"],
        "tags": ["ultrabook", "m4", "fanless", "lightweight", "macos"],
        "is_new": True,
        "attributes": {
            "Диагональ ноутбука": ("str", '15.3"'),
            "Процессор (модель)": ("str", "Apple M4"),
            "Видеокарта (модель)": ("str", "Integrated 10-core"),
            "Объём RAM": ("int", 16),
            "Объём SSD": ("int", 256),
        },
    },
    {
        "name": "Dell XPS 15 9530 15.6\" i7 / RTX 4060",
        "slug": "dell-xps-15-9530-i7-rtx4060",
        "price": 148000,
        "category": "Компьютеры > Рабочие ноутбуки",
        "brands": ["Dell"],
        "tags": ["ultrabook", "premium", "oled", "productivity"],
        "attributes": {
            "Диагональ ноутбука": ("str", '15.6"'),
            "Процессор (модель)": ("str", "Intel Core i7-13700H"),
            "Видеокарта (модель)": ("str", "NVIDIA RTX 4060 6GB"),
            "Объём RAM": ("int", 16),
            "Объём SSD": ("int", 512),
        },
    },
    {
        "name": "HP Spectre x360 16\" Ultra 7 / Intel Arc",
        "slug": "hp-spectre-x360-16-ultra7-intel-arc",
        "price": 132000,
        "category": "Компьютеры > Ультрабуки",
        "brands": ["HP"],
        "tags": ["ultrabook", "2-in-1", "oled", "touch-screen", "premium"],
        "attributes": {
            "Диагональ ноутбука": ("str", '16"'),
            "Процессор (модель)": ("str", "Intel Core Ultra 7 155H"),
            "Видеокарта (модель)": ("str", "Intel Arc Integrated"),
            "Объём RAM": ("int", 16),
            "Объём SSD": ("int", 1000),
        },
    },
    {
        "name": "Lenovo ThinkPad X1 Carbon Gen 12 14\" Ultra 7",
        "slug": "lenovo-thinkpad-x1-carbon-gen12-ultra7",
        "price": 168000,
        "category": "Компьютеры > Рабочие ноутбуки",
        "brands": ["Lenovo"],
        "tags": ["business", "lightweight", "thinkpad", "enterprise"],
        "attributes": {
            "Диагональ ноутбука": ("str", '14"'),
            "Процессор (модель)": ("str", "Intel Core Ultra 7 155H"),
            "Видеокарта (модель)": ("str", "Intel Arc Integrated"),
            "Объём RAM": ("int", 32),
            "Объём SSD": ("int", 1000),
            "Вес": ("str", "1.09 kg"),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # МЫШИ (6)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "Logitech G Pro X Superlight 2",
        "slug": "logitech-g-pro-x-superlight-2",
        "price": 12400,
        "category": "Периферия > Мыши",
        "brands": ["Logitech"],
        "tags": ["wireless", "60g", "hero-2", "competitive", "esports"],
        "is_favorite": True,
        "attributes": {
            "Беспроводной": ("bool", True),
            "Цвет": ("str", "Black"),
        },
        "variants": [
            {"name": "Black", "sku": "910-006636", "price_override": None},
            {"name": "White", "sku": "910-006637", "price_override": None},
            {"name": "Pink", "sku": "910-006638", "price_override": None},
        ],
    },
    {
        "name": "Razer DeathAdder V3 Pro",
        "slug": "razer-deathadder-v3-pro",
        "price": 13100,
        "category": "Периферия > Мыши",
        "brands": ["Razer"],
        "tags": ["wireless", "63g", "focus-pro-30k", "ergonomic"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Logitech G502 X Plus",
        "slug": "logitech-g502-x-plus",
        "price": 11600,
        "category": "Периферия > Мыши",
        "brands": ["Logitech"],
        "tags": ["wireless", "rgb", "hero-25k", "multi-button"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Razer Basilisk V3 Pro",
        "slug": "razer-basilisk-v3-pro",
        "price": 14800,
        "category": "Периферия > Мыши",
        "brands": ["Razer"],
        "tags": ["wireless", "rgb", "focus-pro-30k", "multi-scroll"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "SteelSeries Rival 5",
        "slug": "steelseries-rival-5",
        "price": 5400,
        "category": "Периферия > Мыши",
        "brands": ["SteelSeries"],
        "tags": ["wired", "rgb", "85g", "multi-button", "budget"],
        "attributes": {
            "Беспроводной": ("bool", False),
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Black"),
        },
    },
    {
        "name": "Zowie EC2-C",
        "slug": "zowie-ec2-c",
        "price": 6800,
        "category": "Периферия > Мыши",
        "brands": ["Zowie"],
        "tags": ["wired", "competitive", "esports", "no-software", "ergonomic"],
        "attributes": {
            "Беспроводной": ("bool", False),
            "Подсветка": ("bool", False),
            "Цвет": ("str", "Black"),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # КЛАВИАТУРЫ (6)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "SteelSeries Apex Pro TKL (2025) Wireless",
        "slug": "steelseries-apex-pro-tkl-2025-wireless",
        "price": 18900,
        "category": "Периферия > Клавиатуры",
        "brands": ["SteelSeries"],
        "tags": ["wireless", "omnipoint-3", "rgb", "tkl", "adjustable-actuation"],
        "attributes": {
            "Механические переключатели": ("bool", True),
            "Подсветка": ("bool", True),
            "Беспроводной": ("bool", True),
        },
    },
    {
        "name": "Razer BlackWidow V4 Pro",
        "slug": "razer-blackwidow-v4-pro",
        "price": 17400,
        "category": "Периферия > Клавиатуры",
        "brands": ["Razer"],
        "tags": ["wired", "rgb", "full-size", "macro-keys", "green-switch"],
        "attributes": {
            "Механические переключатели": ("bool", True),
            "Подсветка": ("bool", True),
            "Беспроводной": ("bool", False),
        },
    },
    {
        "name": "Logitech G915 TKL Wireless",
        "slug": "logitech-g915-tkl-wireless",
        "price": 16800,
        "category": "Периферия > Клавиатуры",
        "brands": ["Logitech"],
        "tags": ["wireless", "low-profile", "rgb", "tkl", "mechanical"],
        "attributes": {
            "Механические переключатели": ("bool", True),
            "Подсветка": ("bool", True),
            "Беспроводной": ("bool", True),
        },
    },
    {
        "name": "Keychron Q1 Pro QMK/VIA Wireless",
        "slug": "keychron-q1-pro-qmk-via-wireless",
        "price": 14200,
        "category": "Периферия > Клавиатуры",
        "brands": ["Keychron"],
        "tags": ["wireless", "rgb", "75%", "aluminum", "hot-swap", "qmk"],
        "is_new": True,
        "attributes": {
            "Механические переключатели": ("bool", True),
            "Подсветка": ("bool", True),
            "Беспроводной": ("bool", True),
        },
    },
    {
        "name": "Ducky One 3 Classic TKL",
        "slug": "ducky-one-3-classic-tkl",
        "price": 9600,
        "category": "Периферия > Клавиатуры",
        "brands": ["Ducky"],
        "tags": ["wired", "rgb", "tkl", "pbt-keycaps", "cherry-mx"],
        "attributes": {
            "Механические переключатели": ("bool", True),
            "Подсветка": ("bool", True),
            "Беспроводной": ("bool", False),
        },
    },
    {
        "name": "Corsair K70 RGB Pro",
        "slug": "corsair-k70-rgb-pro",
        "price": 12800,
        "category": "Периферия > Клавиатуры",
        "brands": ["Corsair"],
        "tags": ["wired", "rgb", "full-size", "cherry-mx", "media-controls"],
        "attributes": {
            "Механические переключатели": ("bool", True),
            "Подсветка": ("bool", True),
            "Беспроводной": ("bool", False),
        },
    },

    # ────────────────────────────────────────────────────────────────────
    # ГАРНИТУРЫ (4)
    # ────────────────────────────────────────────────────────────────────
    {
        "name": "HyperX Cloud III Wireless",
        "slug": "hyperx-cloud-iii-wireless",
        "price": 13200,
        "category": "Периферия > Гарнитуры",
        "brands": ["HyperX"],
        "tags": ["wireless", "120h-battery", "closed-back"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Подсветка": ("bool", False),
        },
    },
    {
        "name": "SteelSeries Arctis Nova Pro Wireless",
        "slug": "steelseries-arctis-nova-pro-wireless",
        "price": 28600,
        "category": "Периферия > Гарнитуры",
        "brands": ["SteelSeries"],
        "tags": ["wireless", "anc", "hi-fi", "flagship", "hot-swap-battery"],
        "is_favorite": True,
        "attributes": {
            "Беспроводной": ("bool", True),
            "Подсветка": ("bool", False),
        },
    },
    {
        "name": "Razer BlackShark V2 Pro (2024)",
        "slug": "razer-blackshark-v2-pro-2024",
        "price": 16800,
        "category": "Периферия > Гарнитуры",
        "brands": ["Razer"],
        "tags": ["wireless", "70h-battery", "competitive", "esports"],
        "is_new": True,
        "attributes": {
            "Беспроводной": ("bool", True),
            "Подсветка": ("bool", False),
        },
    },
    {
        "name": "Logitech G Pro X 2 Lightspeed",
        "slug": "logitech-g-pro-x-2-lightspeed",
        "price": 19600,
        "category": "Периферия > Гарнитуры",
        "brands": ["Logitech"],
        "tags": ["wireless", "50h-battery", "competitive", "esports", "graphene-driver"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Подсветка": ("bool", False),
        },
    },
]


# =============================================================================
# MANAGEMENT COMMAND
# =============================================================================

class Command(BaseCommand):
    help = "Заполняет БД тестовыми данными для магазина компьютерной техники."

    def add_arguments(self, parser):
        parser.add_argument(
            "--clear",
            action="store_true",
            help="Очистить все данные перед заполнением.",
        )

    def handle(self, *args, **options):
        if options["clear"]:
            self._clear_data()

        with transaction.atomic():
            self._create_attributes()
            self._create_brands()
            self._create_categories()
            self._create_products()

        self.stdout.write(self.style.SUCCESS("✅ База данных успешно заполнена!"))

    # ------------------------------------------------------------------
    # HELPERS
    # ------------------------------------------------------------------

    def _clear_data(self):
        self.stdout.write("🧹 Очистка старых данных...")
        Stock.objects.all().delete()
        ProductAttribute.objects.all().delete()
        ProductImage.objects.all().delete()
        ProductVariant.objects.all().delete()
        Product.objects.all().delete()
        Tag.objects.all().delete()
        Category.objects.all().delete()
        Brand.objects.all().delete()
        Attribute.objects.all().delete()

    def _get_or_create_attr(self, name, slug, type_, unit):
        attr, created = Attribute.objects.get_or_create(
            slug=slug,
            defaults={
                "name": name,
                "type": type_,
                "unit": unit,
                "enum_options": ENUM_OPTIONS.get(name),
            },
        )
        if not created:
            updated = False
            if attr.type != type_:
                attr.type = type_
                updated = True
            if attr.unit != unit:
                attr.unit = unit
                updated = True
            enum_opts = ENUM_OPTIONS.get(name)
            if enum_opts and attr.enum_options != enum_opts:
                attr.enum_options = enum_opts
                updated = True
            if updated:
                attr.save()
        return attr

    def _create_attributes(self):
        self.stdout.write("📋 Атрибуты...")
        created = 0
        for name, slug, type_, unit in ATTRIBUTES:
            attr = self._get_or_create_attr(name, slug, type_, unit)
            if attr.pk:
                created += 1
        self.stdout.write(f"   → {created} шт.")

    def _create_brands(self):
        self.stdout.write("🏷️ Бренды...")
        created = 0
        for name, slug, country, website in BRANDS:
            _, is_new = Brand.objects.get_or_create(
                slug=slug,
                defaults={"name": name, "country": country, "website": website},
            )
            if is_new:
                created += 1
        self.stdout.write(f"   → {created} шт.")

    def _create_categories(self):
        """Создаёт дерево категорий из flat-списка с явными slug-ами."""
        self.stdout.write("📁 Категории...")
        total = 0

        def make_tree(items, parent=None):
            nonlocal total
            for item in items:
                name = item["name"]
                slug = item.get("slug", slugify(name))
                header_order = item.get("header_order", 0)
                cat, created = Category.objects.update_or_create(
                    slug=slug,
                    defaults={"name": name, "parent": parent, "header_order": header_order},
                )
                if created:
                    total += 1
                else:
                    updated = False
                    if cat.parent != parent:
                        cat.parent = parent
                        updated = True
                    if cat.header_order != header_order:
                        cat.header_order = header_order
                        updated = True
                    if updated:
                        cat.save()
                # Рекурсивно обрабатываем детей
                children = item.get("children", [])
                if children:
                    make_tree(children, parent=cat)

        make_tree(CATEGORY_TREE)
        self.stdout.write(f"   → {total} шт.")

    def _find_category(self, path):
        """Ищет категорию по цепочке имён. Использует явные slug-и из CATEGORY_TREE."""
        parts = [x.strip() for x in path.split(">")]
        parent = None
        
        # Собираем slug-и из CATEGORY_TREE для точного поиска
        def collect_slugs(items):
            result = {}
            for item in items:
                name = item["name"]
                result[name] = item.get("slug", slugify(name))
                for child in item.get("children", []):
                    result[child["name"]] = child.get("slug", slugify(child["name"]))
            return result
        
        all_slugs = collect_slugs(CATEGORY_TREE)
        
        for name in parts:
            cat_slug = all_slugs.get(name, slugify(name))
            cat, _ = Category.objects.get_or_create(
                slug=cat_slug,
                defaults={"name": name, "parent": parent},
            )
            parent = cat
        return parent

    def _create_products(self):
        self.stdout.write("🛒 Товары...")
        product_count = 0
        variant_count = 0

        for pdata in PRODUCTS:
            product_slug = pdata.get("slug", slugify(pdata["name"]))
            if Product.objects.filter(slug=product_slug).exists():
                continue

            cat = self._find_category(pdata["category"])

            product = Product.objects.create(
                name=pdata["name"],
                slug=product_slug,
                description=pdata.get(
                    "description",
                    f"{pdata['name']} — отличный выбор для сборки или апгрейда вашего ПК.",
                ),
                price=pdata["price"],
                is_favorite=pdata.get("is_favorite", False),
                is_new=pdata.get("is_new", False),
            )
            product.categories.add(cat)

            for brand_name in pdata.get("brands", []):
                try:
                    brand = Brand.objects.get(name=brand_name)
                except Brand.DoesNotExist:
                    brand_slug = slugify(brand_name)
                    brand, _ = Brand.objects.get_or_create(
                        slug=brand_slug,
                        defaults={"name": brand_name},
                    )
                product.brands.add(brand)

            for tag_name in pdata.get("tags", []):
                tag_slug = slugify(tag_name)
                tag, _ = Tag.objects.get_or_create(
                    slug=tag_slug,
                    defaults={"name": tag_name},
                )
                product.feature_tags.add(tag)

            for attr_name, (attr_type, value) in pdata.get("attributes", {}).items():
                # Находим атрибут по имени
                try:
                    attribute = Attribute.objects.get(name=attr_name)
                except Attribute.DoesNotExist:
                    attr_slug = slugify(attr_name)
                    attribute, _ = Attribute.objects.get_or_create(
                        slug=attr_slug,
                        defaults={
                            "name": attr_name,
                            "type": attr_type,
                            "unit": "",
                            "enum_options": ENUM_OPTIONS.get(attr_name),
                        },
                    )
                pa, created = ProductAttribute.objects.get_or_create(
                    product=product,
                    attribute=attribute,
                )
                if created:
                    pa.set_typed_value(value)
                    pa.save()

            Stock.objects.get_or_create(
                product=product,
                warehouse="default",
                defaults={"quantity": 50, "reserved": 0},
            )

            for vdata in pdata.get("variants", []):
                variant = ProductVariant.objects.create(
                    product=product,
                    sku=vdata["sku"],
                    name=vdata["name"],
                    price_override=vdata.get("price_override"),
                    is_active=True,
                    sort_order=variant_count % 10,
                )
                Stock.objects.get_or_create(
                    variant=variant,
                    warehouse="default",
                    defaults={"quantity": 30, "reserved": 0},
                )
                variant_count += 1

            product_count += 1

        self.stdout.write(f"   → {product_count} товаров, {variant_count} вариантов")