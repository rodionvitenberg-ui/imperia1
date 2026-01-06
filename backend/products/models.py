from django.db import models


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

    tags = models.ManyToManyField('Tag', blank=True, verbose_name="Теги категорий")
    attributes = models.ManyToManyField('Attribute', blank=True, verbose_name="Атрибуты категории")

    class Meta:
        # Для корректного отображения в админке
        verbose_name = "Категория"
        verbose_name_plural = "Категории"
        ordering = ['header_order', 'name']

    def __str__(self):
        return self.name

class Tag(models.Model):
    """Модель для тегов-характеристик (Изогнутый, HDR, Встроенные колонки и т.д.)"""
    name = models.CharField(max_length=100, unique=True, verbose_name="Название бренда")
    slug = models.SlugField(max_length=100, unique=True)

    class Meta:
        verbose_name = "Бренд"
        verbose_name_plural = "Бренды"

    def __str__(self):
        return self.name

class Attribute(models.Model):
    """Модель для названий атрибутов/характеристик. Наш "справочник". """
    name = models.CharField(max_length=100, unique=True, verbose_name="Название атрибута")
    slug = models.SlugField(max_length=100, unique=True)
    unit = models.CharField(max_length=100, blank=True, verbose_name="Единица измерения")

    class Meta:
        verbose_name = "Атрибут"
        verbose_name_plural = "Атрибуты"

    def __str__(self):
        return self.name

class Product(models.Model):
    """Основная модель товара."""
    name = models.CharField(max_length=255, verbose_name="Название товара")
    description = models.TextField(verbose_name="Описание")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")
    categories = models.ManyToManyField(Category, related_name='products', verbose_name="Категории")
    is_active = models.BooleanField(default=True, verbose_name="Активен")
    is_new = models.BooleanField(default=False, verbose_name="Новинка")
    is_favorite = models.BooleanField(default=False, verbose_name="Популярный")
    tags = models.ManyToManyField(Tag, blank=True, verbose_name="Теги")
    slug = models.SlugField(max_length=255, unique=True, verbose_name="URL-слаг")

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

class ProductImage(models.Model):
    """ Модель для хранения изображений. Теперь привязывается напрямую к ТОВАРУ. """
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images', verbose_name="Товар")
    image = models.ImageField(upload_to='product_images/', verbose_name="Изображение")
    is_main = models.BooleanField(default=False, verbose_name="Основное изображение")

    class Meta:
        verbose_name = "Изображение товара"
        verbose_name_plural = "Изображения товаров"

    def __str__(self):
        return f"Изображение для {self.product.name}"



class ProductAttribute(models.Model):
    """Модель для хранения конкретных значений атрибутов для конкретных товаров."""
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='attributes', verbose_name="Товар")
    attribute = models.ForeignKey(Attribute, on_delete=models.CASCADE, verbose_name="Атрибут")
    value = models.CharField(max_length=255, verbose_name="Значение")

    class Meta:
        verbose_name = "Атрибут товара"
        verbose_name_plural = "Атрибуты товаров"
        # Гарантируем, что у одного товара не будет двух одинаковых атрибутов
        unique_together = ('product', 'attribute')

    def __str__(self):
        return f"{self.product.name} - {self.attribute.name}: {self.value}"


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
        'customers.Customer',  # Используем строковую ссылку
        on_delete=models.CASCADE, 
        verbose_name="Клиент"
    )
    rating = models.IntegerField(
        choices=RATING_CHOICES, 
        verbose_name="Оценка"
    )
    created_at = models.DateTimeField(
        auto_now_add=True, 
        verbose_name="Дата создания"
    )
    
    class Meta:
        verbose_name = "Отзыв"
        verbose_name_plural = "Отзывы"
        # Один отзыв на товар от одного пользователя
        unique_together = ('product', 'customer')
        ordering = ['-created_at']
    
    def __str__(self):
        return f"Оценка {self.rating}/5 для {self.product.name} от {self.customer}"




