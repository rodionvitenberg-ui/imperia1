"""
Management command для заполнения базы тестовыми данными:
категории, бренды, атрибуты, товары с вариантами, стоками и атрибутами.

Использование:
    python manage.py seed_data            # заполнить (пропускает существующие)
    python manage.py seed_data --clear    # очистить всё и заполнить заново
"""

from django.core.management.base import BaseCommand
from django.utils.text import slugify as _slugify
from django.db import transaction


def slugify(value):
    """slugify с поддержкой кириллицы."""
    return _slugify(value, allow_unicode=True)


from products.models import (
    Category, Brand, Attribute, Tag, Product, ProductVariant,
    ProductAttribute, ProductImage, Stock,
)


# =============================================================================
# ДАННЫЕ ДЛЯ ЗАПОЛНЕНИЯ
# =============================================================================

CATEGORY_TREE = {
    "Комплектующие": {
        "header_order": 1,
        "children": [
            "Процессоры",
            "Видеокарты",
            "Материнские платы",
            "Оперативная память",
            "Накопители SSD",
            "Жёсткие диски",
            "Блоки питания",
            "Корпуса",
            "Охлаждение",
        ]
    },
    "Готовые ПК": {
        "header_order": 2,
        "children": ["Игровые ПК", "Офисные ПК", "Рабочие станции"],
    },
    "Ноутбуки": {
        "header_order": 3,
        "children": ["Игровые ноутбуки", "Ультрабуки", "Рабочие ноутбуки"],
    },
    "Мониторы": {
        "header_order": 4,
        "children": ["Игровые мониторы", "Профессиональные мониторы", "Офисные мониторы"],
    },
    "Периферия": {
        "header_order": 5,
        "children": ["Клавиатуры", "Мыши", "Гарнитуры", "Коврики"],
    },
    "Аксессуары": {
        "header_order": 6,
        "children": ["Кабели и переходники", "Чехлы и сумки", "Веб-камеры"],
    },
}

BRANDS = [
    ("Intel", "США", "https://www.intel.com"),
    ("AMD", "США", "https://www.amd.com"),
    ("NVIDIA", "США", "https://www.nvidia.com"),
    ("ASUS", "Тайвань", "https://www.asus.com"),
    ("MSI", "Тайвань", "https://www.msi.com"),
    ("Gigabyte", "Тайвань", "https://www.gigabyte.com"),
    ("Samsung", "Южная Корея", "https://www.samsung.com"),
    ("LG", "Южная Корея", "https://www.lg.com"),
    ("Dell", "США", "https://www.dell.com"),
    ("HP", "США", "https://www.hp.com"),
    ("Lenovo", "Китай", "https://www.lenovo.com"),
    ("Corsair", "США", "https://www.corsair.com"),
    ("Kingston", "США", "https://www.kingston.com"),
    ("Seagate", "Ирландия", "https://www.seagate.com"),
    ("Western Digital", "США", "https://www.westerndigital.com"),
    ("Logitech", "Швейцария", "https://www.logitech.com"),
    ("Razer", "США", "https://www.razer.com"),
    ("Acer", "Тайвань", "https://www.acer.com"),
    ("Cooler Master", "Тайвань", "https://www.coolermaster.com"),
    ("be quiet!", "Германия", "https://www.bequiet.com"),
    ("Seasonic", "Тайвань", "https://www.seasonic.com"),
    ("HyperX", "США", "https://www.hyperxgaming.com"),
    ("SteelSeries", "Дания", "https://www.steelseries.com"),
    ("BenQ", "Тайвань", "https://www.benq.com"),
]

ATTRIBUTES = [
    ("Частота процессора", "int", "ГГц"),
    ("Макс. частота (Boost)", "int", "ГГц"),
    ("Количество ядер", "int", ""),
    ("Количество потоков", "int", ""),
    ("Сокет", "enum", ""),
    ("Техпроцесс", "str", ""),
    ("TDP", "int", "Вт"),
    ("Объём видеопамяти", "int", "ГБ"),
    ("Тип видеопамяти", "enum", ""),
    ("Шина памяти", "int", "бит"),
    ("Объём ОЗУ", "int", "ГБ"),
    ("Тип ОЗУ", "enum", ""),
    ("Частота ОЗУ", "int", "МГц"),
    ("Количество планок", "int", ""),
    ("Объём накопителя", "int", "ГБ"),
    ("Тип накопителя", "enum", ""),
    ("Форм-фактор", "enum", ""),
    ("Скорость чтения", "int", "МБ/с"),
    ("Скорость записи", "int", "МБ/с"),
    ("Мощность БП", "int", "Вт"),
    ("Сертификат", "enum", ""),
    ("Модульность", "enum", ""),
    ("Диагональ экрана", "str", ""),
    ("Разрешение", "str", ""),
    ("Тип матрицы", "enum", ""),
    ("Частота обновления", "int", "Гц"),
    ("Время отклика", "int", "мс"),
    ("Изогнутый", "bool", ""),
    ("Яркость", "int", "кд/м²"),
    ("Диагональ ноутбука", "str", ""),
    ("Процессор (модель)", "str", ""),
    ("Видеокарта (модель)", "str", ""),
    ("Объём RAM", "int", "ГБ"),
    ("Объём SSD", "int", "ГБ"),
    ("Вес", "str", ""),
    ("Цвет", "str", ""),
    ("Подсветка", "bool", ""),
    ("Беспроводной", "bool", ""),
    ("Механические переключатели", "bool", ""),
]

ENUM_OPTIONS = {
    "Сокет": ["LGA1700", "LGA1200", "AM5", "AM4", "TR4"],
    "Тип видеопамяти": ["GDDR6", "GDDR6X", "GDDR5", "HBM2"],
    "Тип ОЗУ": ["DDR5", "DDR4", "DDR3"],
    "Тип накопителя": ["SSD", "HDD", "NVMe", "M.2 SATA"],
    "Форм-фактор": ["2.5\"", "3.5\"", "M.2 2280", "mSATA"],
    "Сертификат": ["80+ Bronze", "80+ Silver", "80+ Gold", "80+ Platinum", "80+ Titanium"],
    "Модульность": ["Немодульный", "Полумодульный", "Полностью модульный"],
    "Тип матрицы": ["IPS", "VA", "TN", "OLED"],
}

PRODUCTS = [
    {
        "name": "Intel Core i9-14900K",
        "price": 48500,
        "category": "Комплектующие > Процессоры",
        "brands": ["Intel"],
        "tags": ["флагман", "игровой", "Raptor Lake"],
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
        "name": "AMD Ryzen 7 7800X3D",
        "price": 33800,
        "category": "Комплектующие > Процессоры",
        "brands": ["AMD"],
        "tags": ["игровой", "3D V-Cache"],
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
        "name": "NVIDIA GeForce RTX 4080 Super",
        "price": 82600,
        "category": "Комплектующие > Видеокарты",
        "brands": ["NVIDIA", "ASUS"],
        "tags": ["игровой", "RTX", "DLSS 3"],
        "attributes": {
            "Объём видеопамяти": ("int", 16),
            "Тип видеопамяти": ("enum", "GDDR6X"),
            "Шина памяти": ("int", 256),
        },
    },
    {
        "name": "AMD Radeon RX 7800 XT",
        "price": 41600,
        "category": "Комплектующие > Видеокарты",
        "brands": ["AMD", "Gigabyte"],
        "tags": ["игровой", "RDNA 3"],
        "attributes": {
            "Объём видеопамяти": ("int", 16),
            "Тип видеопамяти": ("enum", "GDDR6"),
            "Шина памяти": ("int", 256),
        },
    },
    {
        "name": "ASUS ROG STRIX Z790-F",
        "price": 34200,
        "category": "Комплектующие > Материнские платы",
        "brands": ["ASUS"],
        "tags": ["игровой", "DDR5", "Wi-Fi"],
        "attributes": {
            "Сокет": ("enum", "LGA1700"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "M.2 2280"),
        },
    },
    {
        "name": "MSI MAG B650 TOMAHAWK",
        "price": 19800,
        "category": "Комплектующие > Материнские платы",
        "brands": ["MSI"],
        "tags": ["игровой", "DDR5", "AM5"],
        "attributes": {
            "Сокет": ("enum", "AM5"),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Форм-фактор": ("enum", "M.2 2280"),
        },
    },
    {
        "name": "Kingston Fury Beast DDR5 32 ГБ (2×16 ГБ)",
        "price": 9600,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Kingston"],
        "tags": ["DDR5", "5600 МГц"],
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 5600),
            "Количество планок": ("int", 2),
        },
    },
    {
        "name": "Corsair Vengeance DDR5 32 ГБ (2×16 ГБ)",
        "price": 10200,
        "category": "Комплектующие > Оперативная память",
        "brands": ["Corsair"],
        "tags": ["DDR5", "6000 МГц", "RGB"],
        "attributes": {
            "Объём ОЗУ": ("int", 32),
            "Тип ОЗУ": ("enum", "DDR5"),
            "Частота ОЗУ": ("int", 6000),
            "Количество планок": ("int", 2),
        },
        "variants": [
            {"name": "32 ГБ (2×16) 6000 МГц", "sku": "CMK32GX5M2B6000", "price_override": None},
            {"name": "64 ГБ (2×32) 6000 МГц", "sku": "CMK64GX5M2B6000", "price_override": 18500},
        ],
    },
    {
        "name": "Samsung 990 PRO 2 ТБ NVMe",
        "price": 15600,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Samsung"],
        "tags": ["NVMe", "PCIe 4.0"],
        "attributes": {
            "Объём накопителя": ("int", 2000),
            "Тип накопителя": ("enum", "NVMe"),
            "Форм-фактор": ("enum", "M.2 2280"),
            "Скорость чтения": ("int", 7450),
            "Скорость записи": ("int", 6900),
        },
        "variants": [
            {"name": "1 ТБ", "sku": "MZ-V9P1T0BW", "price_override": 8700},
            {"name": "2 ТБ", "sku": "MZ-V9P2T0BW", "price_override": None},
            {"name": "4 ТБ", "sku": "MZ-V9P4T0BW", "price_override": 27400},
        ],
    },
    {
        "name": "WD Black SN850X 1 ТБ NVMe",
        "price": 8300,
        "category": "Комплектующие > Накопители SSD",
        "brands": ["Western Digital"],
        "tags": ["NVMe", "PCIe 4.0", "игровой"],
        "attributes": {
            "Объём накопителя": ("int", 1000),
            "Тип накопителя": ("enum", "NVMe"),
            "Форм-фактор": ("enum", "M.2 2280"),
            "Скорость чтения": ("int", 7300),
            "Скорость записи": ("int", 6300),
        },
    },
    {
        "name": "Seagate BarraCuda 4 ТБ",
        "price": 6900,
        "category": "Комплектующие > Жёсткие диски",
        "brands": ["Seagate"],
        "tags": ["HDD", "5400 RPM"],
        "attributes": {
            "Объём накопителя": ("int", 4000),
            "Тип накопителя": ("enum", "HDD"),
            "Форм-фактор": ("enum", "3.5\""),
        },
    },
    {
        "name": "Corsair RM850x (2024)",
        "price": 11200,
        "category": "Комплектующие > Блоки питания",
        "brands": ["Corsair"],
        "tags": ["модульный"],
        "attributes": {
            "Мощность БП": ("int", 850),
            "Сертификат": ("enum", "80+ Gold"),
            "Модульность": ("enum", "Полностью модульный"),
        },
    },
    {
        "name": "be quiet! Dark Power 13 1000W",
        "price": 22600,
        "category": "Комплектующие > Блоки питания",
        "brands": ["be quiet!"],
        "tags": ["тихий", "модульный"],
        "attributes": {
            "Мощность БП": ("int", 1000),
            "Сертификат": ("enum", "80+ Titanium"),
            "Модульность": ("enum", "Полностью модульный"),
        },
    },
    {
        "name": "Samsung Odyssey G7 27\"",
        "price": 43200,
        "category": "Мониторы > Игровые мониторы",
        "brands": ["Samsung"],
        "tags": ["240 Гц", "QHD", "изогнутый"],
        "attributes": {
            "Диагональ экрана": ("str", "27\""),
            "Разрешение": ("str", "2560×1440 (QHD)"),
            "Тип матрицы": ("enum", "VA"),
            "Частота обновления": ("int", 240),
            "Время отклика": ("int", 1),
            "Изогнутый": ("bool", True),
            "Яркость": ("int", 350),
        },
    },
    {
        "name": "LG UltraGear 27GP850-B",
        "price": 34600,
        "category": "Мониторы > Игровые мониторы",
        "brands": ["LG"],
        "tags": ["165 Гц", "Nano IPS", "HDR"],
        "attributes": {
            "Диагональ экрана": ("str", "27\""),
            "Разрешение": ("str", "2560×1440 (QHD)"),
            "Тип матрицы": ("enum", "IPS"),
            "Частота обновления": ("int", 165),
            "Время отклика": ("int", 1),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 400),
        },
    },
    {
        "name": "ASUS ROG Swift PG32UCDM",
        "price": 112000,
        "category": "Мониторы > Профессиональные мониторы",
        "brands": ["ASUS"],
        "tags": ["OLED", "4K", "240 Гц"],
        "attributes": {
            "Диагональ экрана": ("str", "32\""),
            "Разрешение": ("str", "3840×2160 (4K)"),
            "Тип матрицы": ("enum", "OLED"),
            "Частота обновления": ("int", 240),
            "Время отклика": ("int", 0.03),
            "Изогнутый": ("bool", False),
            "Яркость": ("int", 1000),
        },
    },
    {
        "name": "ASUS ROG Zephyrus G16 (2025)",
        "price": 154000,
        "category": "Ноутбуки > Игровые ноутбуки",
        "brands": ["ASUS"],
        "tags": ["RTX 4070", "Ultra 9", "240 Гц"],
        "attributes": {
            "Диагональ ноутбука": ("str", "16\""),
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
        "name": "Lenovo Legion Pro 5 16IRX9",
        "price": 132000,
        "category": "Ноутбуки > Игровые ноутбуки",
        "brands": ["Lenovo"],
        "tags": ["RTX 4060", "i9", "165 Гц"],
        "attributes": {
            "Диагональ ноутбука": ("str", "16\""),
            "Процессор (модель)": ("str", "Intel Core i9-14900HX"),
            "Видеокарта (модель)": ("str", "NVIDIA RTX 4060 8GB"),
            "Объём RAM": ("int", 16),
            "Объём SSD": ("int", 1000),
        },
    },
    {
        "name": "MacBook Pro 16\" M4 Pro",
        "price": 224000,
        "category": "Ноутбуки > Рабочие ноутбуки",
        "brands": ["Samsung"],
        "tags": ["M4 Pro", "Liquid Retina XDR"],
        "attributes": {
            "Диагональ ноутбука": ("str", "16.2\""),
            "Процессор (модель)": ("str", "Apple M4 Pro"),
            "Видеокарта (модель)": ("str", "Интегрированная 20-ядерная"),
            "Объём RAM": ("int", 24),
            "Объём SSD": ("int", 512),
        },
        "variants": [
            {"name": "M4 Pro 24GB / 512GB", "sku": "MBP16-M4P-24-512", "price_override": None},
            {"name": "M4 Pro 48GB / 1TB", "sku": "MBP16-M4P-48-1T", "price_override": 278000},
        ],
    },
    {
        "name": "Logitech G Pro X Superlight 2",
        "price": 12400,
        "category": "Периферия > Мыши",
        "brands": ["Logitech"],
        "tags": ["беспроводная", "60 г", "HERO 2"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Цвет": ("str", "Чёрный"),
        },
        "variants": [
            {"name": "Чёрный", "sku": "910-006636", "price_override": None},
            {"name": "Белый", "sku": "910-006637", "price_override": None},
            {"name": "Розовый", "sku": "910-006638", "price_override": None},
        ],
    },
    {
        "name": "Razer DeathAdder V3 Pro",
        "price": 13100,
        "category": "Периферия > Мыши",
        "brands": ["Razer"],
        "tags": ["беспроводная", "63 г", "Focus Pro 30K"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Цвет": ("str", "Чёрный"),
        },
    },
    {
        "name": "SteelSeries Apex Pro TKL (2025)",
        "price": 18900,
        "category": "Периферия > Клавиатуры",
        "brands": ["SteelSeries"],
        "tags": ["OmniPoint 3.0", "RGB", "TKL"],
        "attributes": {
            "Механические переключатели": ("bool", True),
            "Подсветка": ("bool", True),
            "Беспроводной": ("bool", True),
        },
    },
    {
        "name": "HyperX Cloud III Wireless",
        "price": 13200,
        "category": "Периферия > Гарнитуры",
        "brands": ["HyperX"],
        "tags": ["беспроводная", "120 ч"],
        "attributes": {
            "Беспроводной": ("bool", True),
            "Подсветка": ("bool", False),
        },
    },
    {
        "name": "Cooler Master MasterBox TD500 Mesh V2",
        "price": 8200,
        "category": "Комплектующие > Корпуса",
        "brands": ["Cooler Master"],
        "tags": ["Mid-Tower", "mesh"],
        "attributes": {
            "Подсветка": ("bool", True),
            "Цвет": ("str", "Чёрный"),
        },
    },
    {
        "name": "Intel Core i5-14600K",
        "price": 27500,
        "category": "Комплектующие > Процессоры",
        "brands": ["Intel"],
        "tags": ["средний", "игровой", "Raptor Lake"],
        "attributes": {
            "Частота процессора": ("int", 3.5),
            "Макс. частота (Boost)": ("int", 5.3),
            "Количество ядер": ("int", 14),
            "Количество потоков": ("int", 20),
            "Сокет": ("enum", "LGA1700"),
            "TDP": ("int", 181),
        },
    },
]


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

    def _get_or_create_attr(self, name, type_, unit):
        slug = slugify(name)
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
        for name, type_, unit in ATTRIBUTES:
            attr = self._get_or_create_attr(name, type_, unit)
            if attr.pk:
                created += 1
        self.stdout.write(f"   → {created} шт.")

    def _create_brands(self):
        self.stdout.write("🏷️ Бренды...")
        created = 0
        for name, country, website in BRANDS:
            slug = slugify(name)
            _, is_new = Brand.objects.get_or_create(
                slug=slug,
                defaults={"name": name, "country": country, "website": website},
            )
            if is_new:
                created += 1
        self.stdout.write(f"   → {created} шт.")

    def _create_categories(self):
        self.stdout.write("📁 Категории...")
        Category.objects.all().delete()
        total = 0

        def make_tree(data, parent=None):
            nonlocal total
            for name, info in data.items():
                slug = slugify(name)
                header_order = info.get("header_order", 0) if isinstance(info, dict) else 0
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
                if "children" in info:
                    sub_data = {child: {} for child in info["children"]}
                    make_tree(sub_data, parent=cat)

        make_tree(CATEGORY_TREE)
        self.stdout.write(f"   → {total} шт.")

    def _find_category(self, path):
        """Ищет категорию по цепочке имён. Создаёт недостающие."""
        parts = [x.strip() for x in path.split(">")]
        parent = None
        for name in parts:
            slug = slugify(name)
            cat, _ = Category.objects.get_or_create(
                slug=slug,
                defaults={"name": name, "parent": parent},
            )
            parent = cat
        return parent

    def _create_products(self):
        self.stdout.write("🛒 Товары...")
        product_count = 0
        variant_count = 0

        for pdata in PRODUCTS:
            slug = slugify(pdata["name"])
            if Product.objects.filter(slug=slug).exists():
                continue

            cat = self._find_category(pdata["category"])

            product = Product.objects.create(
                name=pdata["name"],
                slug=slug,
                description=f"{pdata['name']} — отличный выбор для сборки или апгрейда вашего ПК.",
                price=pdata["price"],
                is_favorite=(pdata.get("is_favorite", False)),
                is_new=pdata.get("is_new", len(PRODUCTS) % 4 == 0),
            )
            product.categories.add(cat)

            for brand_name in pdata.get("brands", []):
                brand = Brand.objects.get(name=brand_name)
                product.brands.add(brand)

            for tag_name in pdata.get("tags", []):
                tag, _ = Tag.objects.get_or_create(
                    slug=slugify(tag_name),
                    defaults={"name": tag_name},
                )
                product.feature_tags.add(tag)

            for attr_name, (attr_type, value) in pdata.get("attributes", {}).items():
                attribute = self._get_or_create_attr(attr_name, attr_type, "")
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