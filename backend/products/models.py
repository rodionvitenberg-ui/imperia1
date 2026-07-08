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

    # SEO-поля
    meta_title = models.CharField(max_length=255, blank=True, verbose_name="Meta Title",
                                  help_text="Если не указан, используется название категории.")
    meta_description = models.TextField(blank=True, verbose_name="Meta Description")
    h1 = models.CharField(max_length=255, blank=True, verbose_name="Заголовок H1",
                          help_text="Если не указан, используется название категории.")

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

    class Meta:
        verbose_name = "Товар"
        verbose_name_plural = "Товары"

    def __str__(self):
        return self.name

    @property
    def average_rating(self):
        """Возвращает средний рейтинг товара"""
        from django.db.models import Avg
        avg = self.reviews.aggregate(Avg('rating'))['rating__avg']
        return round(avg, 1) if avg else 0

    @property
    def reviews_count(self):
        """Возвращает количество отзывов"""
        return self.reviews.count()

    @property
    def min_variant_price(self):
        """Минимальная цена среди активных вариантов товара."""
        min_price = self.variants.filter(is_active=True).aggregate(
            models.Min('price_override')
        )['price_override__min']
        if min_price is not None:
            return min_price
        return self.price

    @property
    def has_variants(self):
        """Имеет ли товар активные варианты."""
        return self.variants.filter(is_active=True).exists()


class ProductVariant(models.Model):
    """
    Вариант товара (конфигурация).
    Например, ноутбук ASUS ROG может иметь варианты: 16GB/512GB и 32GB/1TB.
    """
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
        """Возвращает актуальную цену варианта (его собственную или цену товара)."""
        return self.price_override if self.price_override is not None else self.product.price


class ProductImage(models.Model):
    """Модель для хранения изображений товара или варианта."""
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


class ProductAttribute(models.Model):
    """
    Модель для хранения конкретных значений атрибутов.
    Может привязываться к товару ИЛИ к варианту товара.
    Поддерживает типизированные значения в зависимости от attribute.type.
    """
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
    # Типизированные колонки значений
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
        """Возвращает значение в читаемом виде для отображения."""
        if self.attribute.type == 'int' and self.value_int is not None:
            unit = f" {self.attribute.unit}" if self.attribute.unit else ""
            return f"{self.value_int}{unit}"
        elif self.attribute.type == 'bool':
            return "Да" if self.value_bool else "Нет"
        elif self.attribute.type == 'enum':
            return self.value_enum
        return self.value_str

    def set_typed_value(self, value):
        """Устанавливает значение в правильную типизированную колонку на основе attribute.type."""
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
        # Валидация enum-значений
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
    """
    Модель складских остатков.
    Привязывается к товару или конкретному варианту товара.
    """
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
        """Доступное количество (на складе минус зарезервировано)."""
        return max(0, self.quantity - self.reserved)

    @property
    def in_stock(self):
        """Есть ли товар в наличии."""
        return self.available > 0

    def clean(self):
        super().clean()
        if not self.product and not self.variant:
            raise ValidationError(_('Остаток должен быть привязан либо к товару, либо к варианту.'))
        if self.product and self.variant:
            raise ValidationError(_('Остаток не может быть привязан одновременно к товару и варианту.'))


class Review(models.Model):
    """Модель для отзывов и рейтинга товаров"""
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
    created_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name="Дата создания"
    )
    updated_at = models.DateTimeField(
        auto_now=True,
        verbose_name="Дата обновления"
    )

    class Meta:
        verbose_name = "Отзыв"
        verbose_name_plural = "Отзывы"
        unique_together = ('product', 'customer')
        ordering = ['-created_at']

    def __str__(self):
        return f"Оценка {self.rating}/5 для {self.product.name} от {self.customer}"


class ReviewImage(models.Model):
    """Фотография, прикреплённая к отзыву."""
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
    """История изменения цены товара или варианта."""
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

    def clean(self):
        super().clean()
        if not self.product and not self.variant:
            raise ValidationError(_('Запись истории цены должна быть привязана либо к товару, либо к варианту.'))
        if self.product and self.variant:
            raise ValidationError(_('Запись истории цены не может быть привязана одновременно к товару и варианту.'))


class PromoCampaign(models.Model):
    """Маркетинговая акция (например, «Чёрная пятница», «Новогодняя распродажа»)."""
    name = models.CharField(max_length=255, verbose_name="Название акции")
    slug = models.SlugField(max_length=255, unique=True, verbose_name="URL-слаг")
    description = models.TextField(blank=True, verbose_name="Описание акции")
    is_active = models.BooleanField(default=True, verbose_name="Активна")
    start_date = models.DateTimeField(verbose_name="Дата начала")
    end_date = models.DateTimeField(verbose_name="Дата окончания")
    banner_image = models.ImageField(
        upload_to='promo_banners/',
        blank=True,
        null=True,
        verbose_name="Баннер"
    )
    priority = models.IntegerField(default=0, verbose_name="Приоритет",
                                   help_text="Чем выше число, тем приоритетнее акция при наложении.")

    class Meta:
        verbose_name = "Акция"
        verbose_name_plural = "Акции"
        ordering = ['-priority', '-start_date']

    def __str__(self):
        return self.name


class Discount(models.Model):
    """
    Скидка, привязанная к товару, варианту или категории в рамках акции.
    Поддерживает фиксированную скидку (в валюте) и процентную.
    """
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
    discount_type = models.CharField(
        max_length=10,
        choices=DISCOUNT_TYPE_CHOICES,
        verbose_name="Тип скидки"
    )
    value = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        verbose_name="Значение",
        help_text="Для fixed — сумма в валюте, для percent — процент (0–100), для new_price — новая цена."
    )
    is_active = models.BooleanField(default=True, verbose_name="Активна")
    start_date = models.DateTimeField(verbose_name="Дата начала")
    end_date = models.DateTimeField(verbose_name="Дата окончания")
    min_quantity = models.PositiveIntegerField(
        default=1,
        verbose_name="Минимальное количество",
        help_text="Скидка применяется при покупке от указанного количества."
    )

    class Meta:
        verbose_name = "Скидка"
        verbose_name_plural = "Скидки"
        ordering = ['-start_date']
        indexes = [
            models.Index(fields=['product', 'is_active']),
            models.Index(fields=['variant', 'is_active']),
            models.Index(fields=['category', 'is_active']),
        ]

    def __str__(self):
        scope = self.product or self.variant or self.category or "общая"
        if self.discount_type == 'percent':
            return f"Скидка {self.value}% на {scope}"
        return f"Скидка {self.value}₽ на {scope}"

    def get_effective_price(self, base_price):
        """
        Вычисляет эффективную цену после скидки.
        base_price — цена товара или варианта.
        """
        if not self.is_active:
            return base_price

        if self.discount_type == 'fixed':
            return max(0, base_price - self.value)
        elif self.discount_type == 'percent':
            return base_price * (1 - min(self.value, 100) / 100)
        elif self.discount_type == 'new_price':
            return min(self.value, base_price)

        return base_price

    def clean(self):
        super().clean()
        targets = [self.product, self.variant, self.category]
        if sum(1 for t in targets if t is not None) > 1:
            raise ValidationError(_('Скидка может быть привязана только к одной сущности.'))
        if self.discount_type == 'percent' and (self.value < 0 or self.value > 100):
            raise ValidationError({'value': _('Процент скидки должен быть от 0 до 100.')})
        if self.discount_type in ('fixed', 'new_price') and self.value < 0:
            raise ValidationError({'value': _('Значение скидки не может быть отрицательным.')})


class ProductVideo(models.Model):
    """Видеообзор или видео-контент для товара."""
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='videos',
        verbose_name="Товар"
    )
    title = models.CharField(max_length=255, blank=True, verbose_name="Название видео")
    url = models.URLField(verbose_name="Ссылка на видео",
                          help_text="YouTube, Vimeo или прямая ссылка на MP4.")
    platform = models.CharField(max_length=50, blank=True, verbose_name="Платформа",
                                help_text="youtube, vimeo, mp4...")
    thumbnail = models.ImageField(upload_to='video_thumbnails/', blank=True, null=True,
                                  verbose_name="Превью-изображение")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата добавления")

    class Meta:
        verbose_name = "Видео товара"
        verbose_name_plural = "Видео товаров"
        ordering = ['sort_order', '-created_at']

    def __str__(self):
        return f"Видео «{self.title or self.url}» для {self.product.name}"


class Supplier(models.Model):
    """Поставщик / вендор."""
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

    def __str__(self):
        return self.name


class Warranty(models.Model):
    """Гарантийный документ или сертификат, привязанный к товару."""
    DURATION_UNIT_CHOICES = [
        ('days', 'Дней'),
        ('months', 'Месяцев'),
        ('years', 'Лет'),
    ]

    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='warranties',
        verbose_name="Товар"
    )
    title = models.CharField(max_length=255, verbose_name="Название",
                             help_text="Например: «Гарантия производителя», «Расширенная гарантия».")
    duration_value = models.PositiveIntegerField(default=12, verbose_name="Срок")
    duration_unit = models.CharField(max_length=10, choices=DURATION_UNIT_CHOICES, default='months',
                                     verbose_name="Единица срока")
    description = models.TextField(blank=True, verbose_name="Условия гарантии")
    document = models.FileField(upload_to='warranty_docs/', blank=True, null=True,
                                verbose_name="PDF-документ")
    is_active = models.BooleanField(default=True, verbose_name="Доступна")

    class Meta:
        verbose_name = "Гарантия"
        verbose_name_plural = "Гарантии"
        ordering = ['title']

    def __str__(self):
        return f"Гарантия «{self.title}» — {self.duration_value} {self.get_duration_unit_display()}"


class Certificate(models.Model):
    """Сертификат соответствия или инструкция (PDF) для товара."""
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='certificates',
        verbose_name="Товар"
    )
    title = models.CharField(max_length=255, verbose_name="Название документа",
                             help_text="Например: «Сертификат Ростест», «Инструкция по эксплуатации».")
    file = models.FileField(upload_to='certificates/', verbose_name="PDF-файл")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата загрузки")

    class Meta:
        verbose_name = "Сертификат / документ"
        verbose_name_plural = "Сертификаты / документы"
        ordering = ['sort_order', '-created_at']

    def __str__(self):
        return f"{self.title} для {self.product.name}"


class Banner(models.Model):
    """Баннер для главной страницы или категорий."""
    PLACEMENT_CHOICES = [
        ('home_top', 'Главная — верх'),
        ('home_middle', 'Главная — середина'),
        ('category_top', 'Категория — верх'),
        ('sidebar', 'Боковая панель'),
    ]

    title = models.CharField(max_length=255, verbose_name="Заголовок")
    subtitle = models.TextField(blank=True, verbose_name="Подзаголовок")
    image = models.ImageField(upload_to='banners/', verbose_name="Изображение")
    image_mobile = models.ImageField(upload_to='banners/mobile/', blank=True, null=True,
                                     verbose_name="Мобильное изображение")
    link = models.URLField(blank=True, verbose_name="Ссылка",
                           help_text="Куда ведёт баннер при клике.")
    placement = models.CharField(max_length=20, choices=PLACEMENT_CHOICES, default='home_top',
                                 verbose_name="Размещение")
    category = models.ForeignKey(
        Category,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        verbose_name="Категория",
        help_text="Для баннеров категорий."
    )
    is_active = models.BooleanField(default=True, verbose_name="Активен")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")
    start_date = models.DateTimeField(null=True, blank=True, verbose_name="Дата начала показа")
    end_date = models.DateTimeField(null=True, blank=True, verbose_name="Дата окончания показа")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")

    class Meta:
        verbose_name = "Баннер"
        verbose_name_plural = "Баннеры"
        ordering = ['placement', 'sort_order', '-created_at']

    def __str__(self):
        return f"Баннер «{self.title}» ({self.get_placement_display()})"


class PromotionBlock(models.Model):
    """Промо-блок для главной страницы (сетка акционных предложений)."""
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

    def __str__(self):
        return self.title


class BlogPost(models.Model):
    """Статья блога / новость."""
    STATUS_CHOICES = [
        ('draft', 'Черновик'),
        ('published', 'Опубликовано'),
        ('archived', 'В архиве'),
    ]

    title = models.CharField(max_length=255, verbose_name="Заголовок")
    slug = models.SlugField(max_length=255, unique=True, verbose_name="URL-слаг")
    excerpt = models.TextField(blank=True, verbose_name="Краткое описание",
                               help_text="Отображается в списке статей.")
    content = models.TextField(verbose_name="Содержание")
    image = models.ImageField(upload_to='blog/', blank=True, null=True, verbose_name="Обложка")
    author = models.ForeignKey(
        'customers.Customer',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name="Автор"
    )
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='draft', verbose_name="Статус")
    tags = models.ManyToManyField(Tag, blank=True, verbose_name="Теги")
    related_products = models.ManyToManyField(Product, blank=True, verbose_name="Связанные товары")
    # SEO
    meta_title = models.CharField(max_length=255, blank=True, verbose_name="Meta Title")
    meta_description = models.TextField(blank=True, verbose_name="Meta Description")
    # Даты
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

    def __str__(self):
        return self.title
