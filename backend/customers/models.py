from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models
from django.utils.translation import gettext_lazy as _


class CustomUserManager(BaseUserManager):
    """
    Кастомный менеджер моделей для нашей модели Customer,
    где email является уникальным идентификатором для аутентификации вместо username.
    """

    def create_user(self, email, password, **extra_fields):
        """Создает и сохраняет пользователя с указанным email и паролем."""
        if not email:
            raise ValueError(_('The Email must be set'))
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        """Создает и сохраняет суперпользователя с указанным email и паролем."""
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True.'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True.'))

        return self.create_user(email, password, **extra_fields)


class Customer(AbstractUser):
    # Убираем стандартное поле username, оно нам не нужно
    username = None
    # Делаем email уникальным и обязательным полем
    email = models.EmailField(_('email address'), unique=True)
    nickname = models.CharField(max_length=100, blank=True, verbose_name="Никнейм")

    # Говорим Django, что поле email теперь будет использоваться как USERNAME_FIELD
    USERNAME_FIELD = 'email'
    # Указываем, какие поля обязательны при создании суперпользователя
    REQUIRED_FIELDS = ['nickname']

    objects = CustomUserManager()

    def __str__(self):
        return self.email


class Order(models.Model):
    """Модель заказа"""
    STATUS_CHOICES = [
        ('pending', 'В обработке'),
        ('confirmed', 'Подтвержден'),
        ('shipped', 'Отправлен'),
        ('delivered', 'Доставлен'),
        ('cancelled', 'Отменен'),
    ]
    
    # Связь с пользователем (может быть None для гостевых заказов)
    customer = models.ForeignKey(
        Customer, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='orders',
        verbose_name='Клиент'
    )
    
    # Информация о заказе
    order_number = models.CharField(max_length=50, unique=True, verbose_name='Номер заказа')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name='Статус')
    
    # Контактная информация
    first_name = models.CharField(max_length=100, verbose_name='Имя')
    last_name = models.CharField(max_length=100, verbose_name='Фамилия')
    email = models.EmailField(verbose_name='Email')
    phone1 = models.CharField(max_length=20, verbose_name='Основной телефон')
    phone2 = models.CharField(max_length=20, blank=True, verbose_name='Дополнительный телефон')
    address = models.TextField(verbose_name='Адрес доставки')
    comments = models.TextField(blank=True, verbose_name='Комментарии к заказу')
    
    # Суммы
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Общая сумма')
    
    # Даты
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')
    updated_at = models.DateTimeField(auto_now=True, verbose_name='Дата обновления')
    
    class Meta:
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'
        ordering = ['-created_at']
    
    def __str__(self):
        return f'Заказ №{self.order_number} от {self.created_at.strftime("%d.%m.%Y")}'
    
    def save(self, *args, **kwargs):
        if not self.order_number:
            # Генерируем номер заказа
            import uuid
            self.order_number = f'ORD-{uuid.uuid4().hex[:8].upper()}'
        super().save(*args, **kwargs)


class OrderItem(models.Model):
     """Модель товара в заказе"""
     order = models.ForeignKey(
         Order, 
         on_delete=models.CASCADE, 
         related_name='items',
         verbose_name='Заказ'
     )
     product = models.ForeignKey(
        'products.Product',  # Используем строковую ссылку
         on_delete=models.CASCADE,
         verbose_name='Товар'
     )
     quantity = models.PositiveIntegerField(verbose_name='Количество')
     price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Цена за единицу')
    
     class Meta:
         verbose_name = 'Товар в заказе'
         verbose_name_plural = 'Товары в заказе'
    
     def __str__(self):
         return f'{self.product.name} x {self.quantity}'
    
     @property
     def total_price(self):
         return self.quantity * self.price
