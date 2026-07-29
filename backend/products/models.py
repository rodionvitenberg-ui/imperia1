from django.db import models
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


class Brand(models.Model):
    """Модель бренда (производителя)"""
    name = models.CharField(max_length=100, unique=True, verbose_name="Название бренда")
    slug = models.SlugField(max_length=100, unique=True)
    logo = models.ImageField(upload_to='brand_logos/', blank=True, null=True, verbose_name="Логотип")
    description = models.TextField(blank=True, verbose_name="Описание бренда")
    country = models.CharField(max_length=100, blank=True, verbose_name="Страна происхождения")
    website = models.URLField(blank=True, verbose_name="Официальный сайт")
    logo_provenance = models.CharField(max_length=30, blank=True, default='manual', verbose_name="Источник логотипа",
                                       help_text="Откуда взят логотип: manual, newegg_scrape, etc.")
    is_active = models.BooleanField(default=True, verbose_name="Активен",
                                    help_text="Отключайте, чтобы скрыть бренд на сайте без удаления из БД.")

    class Meta:
        verbose_name = "Бренд"
        verbose_name_plural = "Бренды"

    def __str__(self):
        return self.name


class Tag(models.Model):
    """Модель тега-фичи товара (IPS, OLED, Curved, HDR, Встроенные колонки и т.д.)"""
    name = models.CharField(max_length=100, unique=True, verbose_name="Название тега")
    slug = models.SlugField(max_length=100, unique=True)

    class Meta:
        verbose_name = "Тег"
        verbose_name_plural = "Теги"

    def __str__(self):
        return self.name


class Category(models.Model):
    """Модель категорий товаров (Электроника, Комплектующие и т.д.)"""
    name = models.CharField(max_length=200, verbose_name="Название категории")
    slug = models.SlugField(max_length=200, unique=True)
    image = models.ImageField(upload_to='category_images/', blank=True, null=True, verbose_name="Изображение",
                              help_text="Изображение для карточки категории на странице каталога.")
    parent = models.ForeignKey(
        'self',
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name='children',
        verbose_name="Родительская категория"
    )

    header_order = models.IntegerField(
        default=0,
        verbose_name="Порядок в хедере",
        help_text="0 — скрыто из меню. 1, 2, 3... — порядок отображения слева направо."
    )

    brands = models.ManyToManyField(Brand, blank=True, verbose_name="Бренды категории")
    attributes = models.ManyToManyField('Attribute', blank=True, verbose_name="Атрибуты категории")

    # Контент категории
    page_description = models.TextField(blank=True, verbose_name="Описание категории",
                                        help_text="Текстовый блок перед списком товаров. Поддерживает HTML.")
    # SEO-поля
    meta_title = models.CharField(max_length=255, blank=True, verbose_name="Meta Title",
                                  help_text="Если не указан, используется название категории.")
    meta_description = models.TextField(blank=True, verbose_name="Meta Description")
    h1 = models.CharField(max_length=255, blank=True, verbose_name="Заголовок H1",
                          help_text="Если не указан, используется название категории.")
    noindex = models.BooleanField(default=False, verbose_name="Запретить индексацию",
                                  help_text="Если включено, страница не будет индексироваться поисковиками.")

    class Meta:
        verbose_name = "Категория"
        verbose_name_plural = "Категории"
        ordering = ['header_order', 'name']

    def __str__(self):
        return self.name


class Attribute(models.Model):
    """
    Модель-справочник атрибутов/характеристик товаров.
    Поддерживает 4 типа значений: строка, целое число, булево, перечисление (enum).
    """
    TYPE_CHOICES = [
        ('str', 'Строка'),
        ('int', 'Целое число'),
        ('bool', 'Булево (Да/Нет)'),
        ('enum', 'Перечисление'),
    ]

    name = models.CharField(max_length=100, unique=True, verbose_name="Название атрибута")
    slug = models.SlugField(max_length=100, unique=True)
    unit = models.CharField(max_length=100, blank=True, verbose_name="Единица измерения")
    type = models.CharField(
        max_length=10,
        choices=TYPE_CHOICES,
        default='str',
        verbose_name="Тип значения",
        help_text="Определяет, как хранится и фильтруется значение атрибута."
    )
    enum_options = models.JSONField(
        blank=True,
        null=True,
        verbose_name="Варианты перечисления",
        help_text="Список допустимых значений для типа 'enum', например: [\"Красный\", \"Синий\", \"Чёрный\"]"
    )

    class Meta:
        verbose_name = "Атрибут"
        verbose_name_plural = "Атрибуты"
        indexes = [
            models.Index(fields=['type', 'slug']),
        ]

    def __str__(self):
        return self.name

    def clean(self):
        super().clean()
        if self.type == 'enum' and not self.enum_options:
            raise ValidationError({'enum_options': _('Для типа "enum" необходимо указать варианты перечисления.')})


class Product(models.Model):
    """Основная модель товара."""
    name = models.CharField(max_length=255, verbose_name="Название товара")
    description = models.TextField(verbose_name="Описание")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")
    categories = models.ManyToManyField(Category, related_name='products', verbose_name="Категории")
    is_active = models.BooleanField(default=True, verbose_name="Активен")
    is_new = models.BooleanField(default=False, verbose_name="Новинка")
    is_favorite = models.BooleanField(default=False, verbose_name="Популярный")
    brands = models.ManyToManyField(Brand, blank=True, verbose_name="Бренды")
    feature_tags = models.ManyToManyField(Tag, blank=True, verbose_name="Теги-фичи")
    slug = models.SlugField(max_length=255, unique=True, verbose_name="URL-слаг")

    # SEO-поля
    meta_title = models.CharField(max_length=255, blank=True, verbose_name="Meta Title",
                                  help_text="Если не указан, используется название товара.")
    meta_description = models.TextField(blank=True, verbose_name="Meta Description")
    h1 = models.CharField(max_length=255, blank=True, verbose_name="Заголовок H1",
                          help_text="Если не указан, используется название товара.")
    noindex = models.BooleanField(default=False, verbose_name="Запретить индексацию",
                                  help_text="Если включено, страница товара не будет индексироваться поисковиками.")

    class Meta:
        verbose_name = "Товар"
        verbose_name_plural = "Товары"

    def __str__(self):
        return self.name

    @property
    def average_rating(self):
        from django.db.models import Avg
        avg = self.reviews.aggregate(Avg('rating'))['rating__avg']
        return round(avg, 1) if avg else 0

    @property
    def reviews_count(self):
        return self.reviews.count()

    @property
    def min_variant_price(self):
        min_price = self.variants.filter(is_active=True).aggregate(
            models.Min('price_override')
        )['price_override__min']
        if min_price is not None:
            return min_price
        return self.price

    @property
    def has_variants(self):
        return self.variants.filter(is_active=True).exists()


class ProductVariant(models.Model):
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='variants',
        verbose_name="Товар"
    )
    sku = models.CharField(max_length=100, unique=True, verbose_name="Артикул (SKU)")
    name = models.CharField(max_length=255, verbose_name="Название варианта",
                            help_text="Например: «16 ГБ / 512 ГБ SSD, Чёрный»")
    price_override = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        blank=True,
        null=True,
        verbose_name="Цена варианта",
        help_text="Если не указана, используется цена товара."
    )
    is_active = models.BooleanField(default=True, verbose_name="Активен")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")

    class Meta:
        verbose_name = "Вариант товара"
        verbose_name_plural = "Варианты товаров"
        ordering = ['sort_order', 'sku']
        indexes = [
            models.Index(fields=['product', 'is_active']),
        ]

    def __str__(self):
        return f"{self.product.name} — {self.name}"

    def get_price(self):
        return self.price_override if self.price_override is not None else self.product.price


class ProductImage(models.Model):
    IMAGE_TYPE_CHOICES = [
        ('main', 'Основное фото'),
        ('gallery', 'Галерея'),
        ('360', 'Панорама 360°'),
        ('video_poster', 'Постер видео'),
    ]

    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='images',
        null=True,
        blank=True,
        verbose_name="Товар"
    )
    variant = models.ForeignKey(
        ProductVariant,
        on_delete=models.CASCADE,
        related_name='images',
        null=True,
        blank=True,
        verbose_name="Вариант"
    )
    image = models.ImageField(upload_to='product_images/', verbose_name="Изображение")
    alt_text = models.CharField(max_length=255, blank=True, verbose_name="Alt-текст")
    image_type = models.CharField(
        max_length=20,
        choices=IMAGE_TYPE_CHOICES,
        default='gallery',
        verbose_name="Тип изображения"
    )
    provenance = models.CharField(
        max_length=30,
        blank=True,
        default='web',
        verbose_name="Источник изображения",
        help_text="Откуда получено изображение: web, newegg_scrape, manual, etc."
    )
    is_main = models.BooleanField(default=False, verbose_name="Основное изображение")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")

    class Meta:
        verbose_name = "Изображение товара"
        verbose_name_plural = "Изображения товаров"
        ordering = ['sort_order', 'id']

    def __str__(self):
        target = self.product or self.variant
        return f"Изображение для {target}"

    def clean(self):
        super().clean()
        if not self.product and not self.variant:
            raise ValidationError(_('Изображение должно быть привязано либо к товару, либо к варианту.'))
        if self.product and self.variant:
            raise ValidationError(_('Изображение не может быть привязано одновременно к товару и варианту.'))

    def save(self, *args, **kwargs):
        # Автоматически генерируем alt_text из названия товара, если не задан
        if not self.alt_text:
            target = self.product or (self.variant.product if self.variant else None)
            if target:
                image_type_label = dict(self.IMAGE_TYPE_CHOICES).get(self.image_type, '')
                parts = [target.name]
                if self.image_type == 'main':
                    parts.append('— основное фото')
                elif self.image_type == 'gallery' and image_type_label:
                    pass  # для галереи не добавляем уточнение
                elif image_type_label:
                    parts.append(f'— {image_type_label.lower()}')
                self.alt_text = ' '.join(parts)[:255]
        super().save(*args, **kwargs)


class ProductAttribute(models.Model):
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='attributes',
        null=True,
        blank=True,
        verbose_name="Товар"
    )
    variant = models.ForeignKey(
        ProductVariant,
        on_delete=models.CASCADE,
        related_name='attributes',
        null=True,
        blank=True,
        verbose_name="Вариант товара"
    )
    attribute = models.ForeignKey(Attribute, on_delete=models.CASCADE, verbose_name="Атрибут")
    value_str = models.CharField(max_length=1024, blank=True, verbose_name="Строковое значение")
    value_int = models.IntegerField(null=True, blank=True, verbose_name="Числовое значение")
    value_bool = models.BooleanField(null=True, blank=True, verbose_name="Булево значение")
    value_enum = models.CharField(max_length=255, blank=True, verbose_name="Значение перечисления")

    class Meta:
        verbose_name = "Атрибут товара"
        verbose_name_plural = "Атрибуты товаров"
        indexes = [
            models.Index(fields=['product', 'attribute']),
            models.Index(fields=['variant', 'attribute']),
            models.Index(fields=['attribute', 'value_int']),
            models.Index(fields=['attribute', 'value_enum']),
        ]
        constraints = [
            models.UniqueConstraint(
                fields=['product', 'attribute'],
                name='unique_product_attribute',
                condition=models.Q(variant__isnull=True),
            ),
            models.UniqueConstraint(
                fields=['variant', 'attribute'],
                name='unique_variant_attribute',
            ),
        ]

    def __str__(self):
        target = self.product or self.variant
        return f"{target} - {self.attribute.name}: {self.get_display_value()}"

    def get_display_value(self):
        if self.attribute.type == 'int' and self.value_int is not None:
            unit = f" {self.attribute.unit}" if self.attribute.unit else ""
            return f"{self.value_int}{unit}"
        elif self.attribute.type == 'bool':
            return "Да" if self.value_bool else "Нет"
        elif self.attribute.type == 'enum':
            return self.value_enum
        return self.value_str

    def set_typed_value(self, value):
        attr_type = self.attribute.type
        self.value_str = ''
        self.value_int = None
        self.value_bool = None
        self.value_enum = ''

        if attr_type == 'str':
            self.value_str = str(value) if value is not None else ''
        elif attr_type == 'int':
            self.value_int = int(value) if value is not None else None
            self.value_str = str(value) if value is not None else ''
        elif attr_type == 'bool':
            self.value_bool = bool(value)
            self.value_str = "Да" if value else "Нет"
        elif attr_type == 'enum':
            self.value_enum = str(value) if value is not None else ''
            self.value_str = self.value_enum

    def clean(self):
        super().clean()
        if not self.product and not self.variant:
            raise ValidationError(_('Атрибут должен быть привязан либо к товару, либо к варианту.'))
        if self.product and self.variant:
            raise ValidationError(_('Атрибут не может быть привязан одновременно к товару и варианту.'))
        if self.attribute.type == 'enum' and self.value_enum:
            options = self.attribute.enum_options or []
            if self.value_enum not in options:
                raise ValidationError({
                    'value_enum': _('Значение «%(val)s» не входит в допустимые варианты: %(opts)s') % {
                        'val': self.value_enum,
                        'opts': ', '.join(options),
                    }
                })


class Stock(models.Model):
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='stock_records',
        null=True,
        blank=True,
        verbose_name="Товар"
    )
    variant = models.ForeignKey(
        ProductVariant,
        on_delete=models.CASCADE,
        related_name='stock_records',
        null=True,
        blank=True,
        verbose_name="Вариант товара"
    )
    warehouse = models.CharField(
        max_length=100,
        default='default',
        verbose_name="Склад",
        help_text="Идентификатор склада (например, 'msk', 'spb').",
    )
    quantity = models.PositiveIntegerField(default=0, verbose_name="Количество на складе")
    reserved = models.PositiveIntegerField(default=0, verbose_name="Зарезервировано")

    class Meta:
        verbose_name = "Складской остаток"
        verbose_name_plural = "Складские остатки"
        indexes = [
            models.Index(fields=['product', 'warehouse']),
            models.Index(fields=['variant', 'warehouse']),
        ]
        constraints = [
            models.UniqueConstraint(
                fields=['product', 'warehouse'],
                name='unique_product_warehouse',
                condition=models.Q(variant__isnull=True),
            ),
            models.UniqueConstraint(
                fields=['variant', 'warehouse'],
                name='unique_variant_warehouse',
            ),
        ]

    def __str__(self):
        target = self.product or self.variant
        return f"Склад «{self.warehouse}»: {target} — {self.quantity} шт."

    @property
    def available(self):
        return max(0, self.quantity - self.reserved)

    @property
    def in_stock(self):
        return self.available > 0

    def clean(self):
        super().clean()
        if not self.product and not self.variant:
            raise ValidationError(_('Остаток должен быть привязан либо к товару, либо к варианту.'))
        if self.product and self.variant:
            raise ValidationError(_('Остаток не может быть привязан одновременно к товару и варианту.'))


class Review(models.Model):
    RATING_CHOICES = [
        (1, '1 звезда'),
        (2, '2 звезды'),
        (3, '3 звезды'),
        (4, '4 звезды'),
        (5, '5 звезд')
    ]

    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='reviews',
        verbose_name="Товар"
    )
    customer = models.ForeignKey(
        'customers.Customer',
        on_delete=models.CASCADE,
        verbose_name="Клиент"
    )
    rating = models.IntegerField(
        choices=RATING_CHOICES,
        verbose_name="Оценка"
    )
    text = models.TextField(blank=True, verbose_name="Текст отзыва")
    verified_purchase = models.BooleanField(
        default=False,
        verbose_name="Подтверждённая покупка",
        help_text="Отзыв от клиента, который действительно купил этот товар."
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Дата обновления")

    class Meta:
        verbose_name = "Отзыв"
        verbose_name_plural = "Отзывы"
        unique_together = ('product', 'customer')
        ordering = ['-created_at']

    def __str__(self):
        return f"Оценка {self.rating}/5 для {self.product.name} от {self.customer}"


class ReviewImage(models.Model):
    review = models.ForeignKey(
        Review,
        on_delete=models.CASCADE,
        related_name='images',
        verbose_name="Отзыв"
    )
    image = models.ImageField(upload_to='review_images/', verbose_name="Изображение")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")

    class Meta:
        verbose_name = "Фото отзыва"
        verbose_name_plural = "Фото отзывов"
        ordering = ['sort_order', 'id']

    def __str__(self):
        return f"Фото к отзыву {self.review_id}"


class PriceHistory(models.Model):
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='price_history',
        null=True,
        blank=True,
        verbose_name="Товар"
    )
    variant = models.ForeignKey(
        'ProductVariant',
        on_delete=models.CASCADE,
        related_name='price_history',
        null=True,
        blank=True,
        verbose_name="Вариант"
    )
    old_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Старая цена")
    new_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Новая цена")
    changed_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата изменения")
    reason = models.CharField(
        max_length=255,
        blank=True,
        verbose_name="Причина изменения",
        help_text="Например: «Акция», «Изменение курса», «Обновление прайса поставщика»."
    )

    class Meta:
        verbose_name = "История цены"
        verbose_name_plural = "История цен"
        ordering = ['-changed_at']
        indexes = [
            models.Index(fields=['product', '-changed_at']),
            models.Index(fields=['variant', '-changed_at']),
        ]

    def __str__(self):
        target = self.product or self.variant
        return f"{target}: {self.old_price} → {self.new_price} ({self.changed_at:%d.%m.%Y})"


class PromoCampaign(models.Model):
    name = models.CharField(max_length=255, verbose_name="Название акции")
    slug = models.SlugField(max_length=255, unique=True, verbose_name="URL-слаг")
    description = models.TextField(blank=True, verbose_name="Описание акции")
    is_active = models.BooleanField(default=True, verbose_name="Активна")
    start_date = models.DateTimeField(verbose_name="Дата начала")
    end_date = models.DateTimeField(verbose_name="Дата окончания")
    banner_image = models.ImageField(upload_to='promo_banners/', blank=True, null=True, verbose_name="Баннер")
    priority = models.IntegerField(default=0, verbose_name="Приоритет",
                                   help_text="Чем выше число, тем приоритетнее акция при наложении.")

    class Meta:
        verbose_name = "Акция"
        verbose_name_plural = "Акции"
        ordering = ['-priority', '-start_date']

    def __str__(self):
        return self.name


class Discount(models.Model):
    DISCOUNT_TYPE_CHOICES = [
        ('fixed', 'Фиксированная сумма'),
        ('percent', 'Процент'),
        ('new_price', 'Фиксированная цена'),
    ]

    promo_campaign = models.ForeignKey(
        PromoCampaign,
        on_delete=models.CASCADE,
        related_name='discounts',
        null=True,
        blank=True,
        verbose_name="Акция",
        help_text="Оставьте пустым, если скидка не привязана к акции."
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='discounts',
        null=True,
        blank=True,
        verbose_name="Товар"
    )
    variant = models.ForeignKey(
        'ProductVariant',
        on_delete=models.CASCADE,
        related_name='discounts',
        null=True,
        blank=True,
        verbose_name="Вариант"
    )
    category = models.ForeignKey(
        Category,
        on_delete=models.CASCADE,
        related_name='discounts',
        null=True,
        blank=True,
        verbose_name="Категория",
        help_text="Скидка применяется ко всем товарам в категории."
    )
    discount_type = models.CharField(max_length=10, choices=DISCOUNT_TYPE_CHOICES, verbose_name="Тип скидки")
    value = models.DecimalField(
        max_digits=10, decimal_places=2, verbose_name="Значение",
        help_text="Для fixed — сумма в валюте, для percent — процент (0–100), для new_price — новая цена."
    )
    is_active = models.BooleanField(default=True, verbose_name="Активна")
    start_date = models.DateTimeField(verbose_name="Дата начала")
    end_date = models.DateTimeField(verbose_name="Дата окончания")
    min_quantity = models.PositiveIntegerField(default=1, verbose_name="Минимальное количество")

    class Meta:
        verbose_name = "Скидка"
        verbose_name_plural = "Скидки"
        ordering = ['-start_date']
        indexes = [
            models.Index(fields=['product', 'is_active']),
            models.Index(fields=['variant', 'is_active']),
            models.Index(fields=['category', 'is_active']),
        ]


class ProductVideo(models.Model):
    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, related_name='videos', verbose_name="Товар"
    )
    title = models.CharField(max_length=255, blank=True, verbose_name="Название видео")
    url = models.URLField(verbose_name="Ссылка на видео", help_text="YouTube, Vimeo или прямая ссылка на MP4.")
    platform = models.CharField(max_length=50, blank=True, verbose_name="Платформа")
    thumbnail = models.ImageField(upload_to='video_thumbnails/', blank=True, null=True, verbose_name="Превью-изображение")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата добавления")

    class Meta:
        verbose_name = "Видео товара"
        verbose_name_plural = "Видео товаров"
        ordering = ['sort_order', '-created_at']


class Supplier(models.Model):
    name = models.CharField(max_length=200, verbose_name="Название поставщика")
    slug = models.SlugField(max_length=200, unique=True)
    contact_person = models.CharField(max_length=200, blank=True, verbose_name="Контактное лицо")
    email = models.EmailField(blank=True, verbose_name="Email")
    phone = models.CharField(max_length=50, blank=True, verbose_name="Телефон")
    website = models.URLField(blank=True, verbose_name="Сайт")
    is_active = models.BooleanField(default=True, verbose_name="Активен")
    notes = models.TextField(blank=True, verbose_name="Заметки")

    class Meta:
        verbose_name = "Поставщик"
        verbose_name_plural = "Поставщики"
        ordering = ['name']


class Warranty(models.Model):
    DURATION_UNIT_CHOICES = [
        ('days', 'Дней'),
        ('months', 'Месяцев'),
        ('years', 'Лет'),
    ]
    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, related_name='warranties', verbose_name="Товар"
    )
    title = models.CharField(max_length=255, verbose_name="Название")
    duration_value = models.PositiveIntegerField(default=12, verbose_name="Срок")
    duration_unit = models.CharField(max_length=10, choices=DURATION_UNIT_CHOICES, default='months', verbose_name="Единица срока")
    description = models.TextField(blank=True, verbose_name="Условия гарантии")
    document = models.FileField(upload_to='warranty_docs/', blank=True, null=True, verbose_name="PDF-документ")
    is_active = models.BooleanField(default=True, verbose_name="Доступна")

    class Meta:
        verbose_name = "Гарантия"
        verbose_name_plural = "Гарантии"


class Certificate(models.Model):
    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, related_name='certificates', verbose_name="Товар"
    )
    title = models.CharField(max_length=255, verbose_name="Название документа")
    file = models.FileField(upload_to='certificates/', verbose_name="PDF-файл")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата загрузки")

    class Meta:
        verbose_name = "Сертификат / документ"
        verbose_name_plural = "Сертификаты / документы"


class Banner(models.Model):
    PLACEMENT_CHOICES = [
        ('home_top', 'Главная — верх'),
        ('home_middle', 'Главная — середина'),
        ('category_top', 'Категория — верх'),
        ('sidebar', 'Боковая панель'),
    ]
    title = models.CharField(max_length=255, verbose_name="Заголовок")
    subtitle = models.TextField(blank=True, verbose_name="Подзаголовок")
    image = models.ImageField(upload_to='banners/', verbose_name="Изображение")
    image_mobile = models.ImageField(upload_to='banners/mobile/', blank=True, null=True, verbose_name="Мобильное изображение")
    link = models.URLField(blank=True, verbose_name="Ссылка")
    placement = models.CharField(max_length=20, choices=PLACEMENT_CHOICES, default='home_top', verbose_name="Размещение")
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True, blank=True, verbose_name="Категория")
    is_active = models.BooleanField(default=True, verbose_name="Активен")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")
    start_date = models.DateTimeField(null=True, blank=True, verbose_name="Дата начала показа")
    end_date = models.DateTimeField(null=True, blank=True, verbose_name="Дата окончания показа")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")

    class Meta:
        verbose_name = "Баннер"
        verbose_name_plural = "Баннеры"
        ordering = ['placement', 'sort_order', '-created_at']


class PromotionBlock(models.Model):
    title = models.CharField(max_length=255, verbose_name="Заголовок блока")
    slug = models.SlugField(max_length=255, unique=True, verbose_name="URL-слаг")
    description = models.TextField(blank=True, verbose_name="Описание")
    products = models.ManyToManyField(Product, blank=True, verbose_name="Товары в блоке")
    categories = models.ManyToManyField(Category, blank=True, verbose_name="Категории в блоке")
    is_active = models.BooleanField(default=True, verbose_name="Активен")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")

    class Meta:
        verbose_name = "Промо-блок"
        verbose_name_plural = "Промо-блоки"
        ordering = ['sort_order', '-created_at']


class BlogPost(models.Model):
    STATUS_CHOICES = [
        ('draft', 'Черновик'),
        ('published', 'Опубликовано'),
        ('archived', 'В архиве'),
    ]

    title = models.CharField(max_length=255, verbose_name="Заголовок")
    slug = models.SlugField(max_length=255, unique=True, verbose_name="URL-слаг")
    excerpt = models.TextField(blank=True, verbose_name="Краткое описание")
    content = models.TextField(verbose_name="Содержание")
    image = models.ImageField(upload_to='blog/', blank=True, null=True, verbose_name="Обложка")
    author = models.ForeignKey('customers.Customer', on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Автор")
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='draft', verbose_name="Статус")
    tags = models.ManyToManyField(Tag, blank=True, verbose_name="Теги")
    related_products = models.ManyToManyField(Product, blank=True, verbose_name="Связанные товары")
    meta_title = models.CharField(max_length=255, blank=True, verbose_name="Meta Title")
    meta_description = models.TextField(blank=True, verbose_name="Meta Description")
    noindex = models.BooleanField(default=False, verbose_name="Запретить индексацию",
                                  help_text="Если включено, статья не будет индексироваться поисковиками.")
    published_at = models.DateTimeField(null=True, blank=True, verbose_name="Дата публикации")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Дата обновления")

    class Meta:
        verbose_name = "Статья блога"
        verbose_name_plural = "Статьи блога"
        ordering = ['-published_at', '-created_at']
        indexes = [
            models.Index(fields=['status', '-published_at']),
        ]


class AdminSection(models.Model):
    """Модель управления видимостью разделов на главной странице админки."""
    key = models.CharField(max_length=50, unique=True, verbose_name="Ключ")
    label = models.CharField(max_length=100, verbose_name="Название раздела")
    is_visible = models.BooleanField(default=True, verbose_name="Виден на главной")
    is_visible_by_default = models.BooleanField(default=False, verbose_name="Виден обычным админам")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок")

    class Meta:
        verbose_name = "Раздел админки"
        verbose_name_plural = "Видимость разделов админки"
        ordering = ['sort_order']

    def __str__(self):
        return self.label