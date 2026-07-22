from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import IntegrityError, models, transaction
from django.utils.translation import gettext_lazy as _

from .order_numbers import generate_order_number


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
    email = models.EmailField(blank=True, verbose_name='Email')
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
        """
        Номер заказа: «Айбек-1», «Айбек-2»… (первое слово first_name + счётчик).
        При гонке unique — пересчёт и retry.
        """
        if self.order_number:
            super().save(*args, **kwargs)
            return

        max_attempts = 5
        for attempt in range(max_attempts):
            self.order_number = generate_order_number(self.first_name)
            try:
                with transaction.atomic():
                    super().save(*args, **kwargs)
                return
            except IntegrityError:
                self.order_number = ''
                if attempt == max_attempts - 1:
                    raise


class Address(models.Model):
    """Модель адреса доставки клиента."""
    customer = models.ForeignKey(
        Customer,
        on_delete=models.CASCADE,
        related_name='addresses',
        verbose_name='Клиент'
    )
    title = models.CharField(max_length=100, verbose_name='Название',
                             help_text='Например: «Дом», «Офис», «Дача».')
    first_name = models.CharField(max_length=100, verbose_name='Имя получателя')
    last_name = models.CharField(max_length=100, verbose_name='Фамилия получателя')
    phone = models.CharField(max_length=20, verbose_name='Телефон')
    country = models.CharField(max_length=100, default='Россия', verbose_name='Страна')
    city = models.CharField(max_length=100, verbose_name='Город')
    street = models.CharField(max_length=255, verbose_name='Улица')
    house = models.CharField(max_length=50, verbose_name='Дом')
    apartment = models.CharField(max_length=50, blank=True, verbose_name='Квартира / офис')
    postal_code = models.CharField(max_length=20, blank=True, verbose_name='Почтовый индекс')
    is_default = models.BooleanField(default=False, verbose_name='По умолчанию')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')

    class Meta:
        verbose_name = 'Адрес доставки'
        verbose_name_plural = 'Адреса доставки'
        ordering = ['-is_default', '-created_at']

    def __str__(self):
        return f'{self.title}: г. {self.city}, ул. {self.street}, д. {self.house}'

    def save(self, *args, **kwargs):
        if self.is_default:
            Address.objects.filter(customer=self.customer, is_default=True).exclude(pk=self.pk).update(is_default=False)
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
        'products.Product',
        on_delete=models.CASCADE,
        verbose_name='Товар'
    )
    variant = models.ForeignKey(
        'products.ProductVariant',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Вариант товара',
        help_text='Если заказан конкретный вариант.'
    )
    quantity = models.PositiveIntegerField(verbose_name='Количество')
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Цена за единицу')

    class Meta:
        verbose_name = 'Товар в заказе'
        verbose_name_plural = 'Товары в заказе'

    def __str__(self):
        variant_str = f' ({self.variant.name})' if self.variant else ''
        return f'{self.product.name}{variant_str} x {self.quantity}'

    @property
    def total_price(self):
        return self.quantity * self.price


class OrderStatusHistory(models.Model):
    """История изменения статусов заказа."""
    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name='status_history',
        verbose_name='Заказ'
    )
    old_status = models.CharField(max_length=20, blank=True, verbose_name='Предыдущий статус')
    new_status = models.CharField(max_length=20, verbose_name='Новый статус')
    changed_by = models.ForeignKey(
        Customer,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Кто изменил',
        help_text='Пользователь, изменивший статус (если применимо).'
    )
    comment = models.TextField(blank=True, verbose_name='Комментарий',
                               help_text='Причина изменения статуса.')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата изменения')

    class Meta:
        verbose_name = 'История статуса заказа'
        verbose_name_plural = 'История статусов заказов'
        ordering = ['-created_at']

    def __str__(self):
        return f'Заказ {self.order.order_number}: {self.old_status} → {self.new_status}'


class Payment(models.Model):
    """Модель оплаты заказа."""
    PAYMENT_METHOD_CHOICES = [
        ('card', 'Банковская карта'),
        ('cash', 'Наличные'),
        ('online', 'Онлайн-платёж'),
    ]
    PAYMENT_STATUS_CHOICES = [
        ('pending', 'Ожидает оплаты'),
        ('paid', 'Оплачен'),
        ('failed', 'Ошибка оплаты'),
        ('refunded', 'Возврат'),
    ]

    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name='payments',
        verbose_name='Заказ'
    )
    method = models.CharField(max_length=20, choices=PAYMENT_METHOD_CHOICES, verbose_name='Способ оплаты')
    status = models.CharField(max_length=20, choices=PAYMENT_STATUS_CHOICES, default='pending', verbose_name='Статус')
    amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Сумма')
    external_id = models.CharField(max_length=255, blank=True, verbose_name='Внешний ID транзакции',
                                   help_text='ID платежа в платёжной системе.')
    paid_at = models.DateTimeField(null=True, blank=True, verbose_name='Дата оплаты')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')

    class Meta:
        verbose_name = 'Платёж'
        verbose_name_plural = 'Платежи'
        ordering = ['-created_at']

    def __str__(self):
        return f'Платёж {self.external_id or self.id} — {self.status}'


class Delivery(models.Model):
    """Модель доставки заказа."""
    DELIVERY_STATUS_CHOICES = [
        ('pending', 'Ожидает отправки'),
        ('in_transit', 'В пути'),
        ('delivered', 'Доставлен'),
        ('cancelled', 'Отменена'),
    ]

    order = models.OneToOneField(
        Order,
        on_delete=models.CASCADE,
        related_name='delivery',
        verbose_name='Заказ'
    )
    address = models.ForeignKey(
        Address,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Адрес доставки'
    )
    # Дублируем адрес на случай удаления Address
    address_snapshot = models.TextField(verbose_name='Адрес доставки (снимок)',
                                        help_text='Копия адреса на момент оформления заказа.')
    tracking_number = models.CharField(max_length=100, blank=True, verbose_name='Трек-номер')
    courier = models.CharField(max_length=100, blank=True, verbose_name='Служба доставки')
    status = models.CharField(max_length=20, choices=DELIVERY_STATUS_CHOICES, default='pending',
                              verbose_name='Статус доставки')
    estimated_date = models.DateField(null=True, blank=True, verbose_name='Ожидаемая дата доставки')
    delivered_at = models.DateTimeField(null=True, blank=True, verbose_name='Дата вручения')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')

    class Meta:
        verbose_name = 'Доставка'
        verbose_name_plural = 'Доставки'
        ordering = ['-created_at']

    def __str__(self):
        return f'Доставка заказа {self.order.order_number} — {self.status}'


class Wishlist(models.Model):
    """Избранное — список желаемых товаров клиента."""
    customer = models.ForeignKey(
        Customer,
        on_delete=models.CASCADE,
        related_name='wishlist',
        verbose_name='Клиент'
    )
    product = models.ForeignKey(
        'products.Product',
        on_delete=models.CASCADE,
        verbose_name='Товар'
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата добавления')

    class Meta:
        verbose_name = 'Избранное'
        verbose_name_plural = 'Избранное'
        unique_together = ('customer', 'product')
        ordering = ['-created_at']

    def __str__(self):
        return f'{self.customer.email} → {self.product.name}'


class ViewedProduct(models.Model):
    """История просмотренных товаров клиента."""
    customer = models.ForeignKey(
        Customer,
        on_delete=models.CASCADE,
        related_name='viewed_products',
        verbose_name='Клиент'
    )
    product = models.ForeignKey(
        'products.Product',
        on_delete=models.CASCADE,
        verbose_name='Товар'
    )
    viewed_at = models.DateTimeField(auto_now=True, verbose_name='Дата последнего просмотра')
    view_count = models.PositiveIntegerField(default=1, verbose_name='Количество просмотров')

    class Meta:
        verbose_name = 'Просмотренный товар'
        verbose_name_plural = 'Просмотренные товары'
        unique_together = ('customer', 'product')
        ordering = ['-viewed_at']

    def __str__(self):
        return f'{self.customer.email} просмотрел {self.product.name} ({self.view_count} раз(а))'


class Cart(models.Model):
    """
    Корзина. Гибрид: для авторизованных — customer, для анонимов — session_key.
    """
    customer = models.ForeignKey(
        Customer,
        on_delete=models.CASCADE,
        related_name='cart_items',
        null=True,
        blank=True,
        verbose_name='Клиент'
    )
    session_key = models.CharField(
        max_length=100,
        blank=True,
        db_index=True,
        verbose_name='Ключ сессии',
        help_text='Для неавторизованных пользователей.'
    )
    product = models.ForeignKey(
        'products.Product',
        on_delete=models.CASCADE,
        verbose_name='Товар'
    )
    variant = models.ForeignKey(
        'products.ProductVariant',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Вариант товара'
    )
    quantity = models.PositiveIntegerField(default=1, verbose_name='Количество')
    added_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата добавления')
    updated_at = models.DateTimeField(auto_now=True, verbose_name='Дата обновления')

    class Meta:
        verbose_name = 'Корзина'
        verbose_name_plural = 'Корзина'
        ordering = ['-added_at']
        constraints = [
            models.UniqueConstraint(
                fields=['customer', 'product', 'variant'],
                name='unique_customer_cart_item',
                condition=models.Q(session_key=''),
            ),
        ]

    def __str__(self):
        owner = self.customer.email if self.customer else f'session:{self.session_key[:8]}'
        variant_str = f' ({self.variant.name})' if self.variant else ''
        return f'{owner}: {self.product.name}{variant_str} x{self.quantity}'

    def clean(self):
        super().clean()
        if not self.customer and not self.session_key:
            raise ValidationError(
                _('Корзина должна быть привязана либо к клиенту, либо к сессии.')
            )
        if self.customer and self.session_key:
            raise ValidationError(
                _('Корзина не может быть привязана одновременно к клиенту и сессии.')
            )

    @property
    def unit_price(self):
        """Цена за единицу с учётом варианта."""
        if self.variant:
            return self.variant.get_price()
        return self.product.price

    @property
    def total_price(self):
        return self.unit_price * self.quantity


class Coupon(models.Model):
    """Промокод / купон на скидку."""
    DISCOUNT_TYPE_CHOICES = [
        ('fixed', 'Фиксированная сумма'),
        ('percent', 'Процент'),
    ]

    code = models.CharField(max_length=50, unique=True, verbose_name='Код купона')
    discount_type = models.CharField(max_length=10, choices=DISCOUNT_TYPE_CHOICES, verbose_name='Тип скидки')
    value = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Значение',
                                help_text='Сумма в валюте или процент (0–100).')
    min_order_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0,
                                           verbose_name='Минимальная сумма заказа')
    max_uses = models.PositiveIntegerField(default=0, verbose_name='Максимум использований',
                                           help_text='0 — без ограничений.')
    used_count = models.PositiveIntegerField(default=0, verbose_name='Использовано раз')
    max_uses_per_user = models.PositiveIntegerField(default=1, verbose_name='Максимум на пользователя')
    is_active = models.BooleanField(default=True, verbose_name='Активен')
    start_date = models.DateTimeField(verbose_name='Дата начала действия')
    end_date = models.DateTimeField(verbose_name='Дата окончания действия')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')

    class Meta:
        verbose_name = 'Промокод'
        verbose_name_plural = 'Промокоды'
        ordering = ['-created_at']

    def __str__(self):
        return f'Купон {self.code} ({self.get_discount_type_display()}: {self.value})'

    def is_valid(self, order_amount=0, user=None):
        """Проверяет валидность купона."""
        from django.utils import timezone
        now = timezone.now()
        if not self.is_active:
            return False
        if self.start_date and now < self.start_date:
            return False
        if self.end_date and now > self.end_date:
            return False
        if self.max_uses > 0 and self.used_count >= self.max_uses:
            return False
        if order_amount < self.min_order_amount:
            return False
        return True

    def get_discount_amount(self, order_amount):
        """Вычисляет сумму скидки."""
        if not self.is_valid(order_amount):
            return 0
        if self.discount_type == 'fixed':
            return min(self.value, order_amount)
        elif self.discount_type == 'percent':
            return order_amount * (min(self.value, 100) / 100)
        return 0


class CouponUsage(models.Model):
    """Журнал использований промокодов."""
    coupon = models.ForeignKey(Coupon, on_delete=models.CASCADE, related_name='usages', verbose_name='Купон')
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, verbose_name='Клиент')
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Заказ')
    discount_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Сумма скидки')
    used_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата использования')

    class Meta:
        verbose_name = 'Использование купона'
        verbose_name_plural = 'Использования купонов'
        ordering = ['-used_at']

    def __str__(self):
        return f'{self.customer.email} использовал {self.coupon.code}'


class LoyaltyProgram(models.Model):
    """Программа лояльности — уровни и привилегии."""
    name = models.CharField(max_length=100, verbose_name='Название уровня')
    slug = models.SlugField(max_length=100, unique=True)
    description = models.TextField(blank=True, verbose_name='Описание')
    min_orders = models.PositiveIntegerField(default=0, verbose_name='Минимум заказов',
                                             help_text='Количество заказов для достижения уровня.')
    min_spent = models.DecimalField(max_digits=10, decimal_places=2, default=0,
                                    verbose_name='Минимальная сумма покупок')
    discount_percent = models.DecimalField(max_digits=4, decimal_places=1, default=0,
                                           verbose_name='Персональная скидка (%)')
    free_shipping = models.BooleanField(default=False, verbose_name='Бесплатная доставка')
    priority_support = models.BooleanField(default=False, verbose_name='Приоритетная поддержка')
    is_active = models.BooleanField(default=True, verbose_name='Активен')
    sort_order = models.IntegerField(default=0, verbose_name='Порядок (от низшего к высшему)')

    class Meta:
        verbose_name = 'Уровень лояльности'
        verbose_name_plural = 'Уровни лояльности'
        ordering = ['sort_order']

    def __str__(self):
        return f'Уровень «{self.name}» (скидка {self.discount_percent}%)'


class CustomerLoyalty(models.Model):
    """Привязка клиента к уровню лояльности."""
    customer = models.OneToOneField(
        Customer,
        on_delete=models.CASCADE,
        related_name='loyalty',
        verbose_name='Клиент'
    )
    level = models.ForeignKey(
        LoyaltyProgram,
        on_delete=models.SET_NULL,
        null=True,
        verbose_name='Текущий уровень'
    )
    total_orders = models.PositiveIntegerField(default=0, verbose_name='Всего заказов')
    total_spent = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='Всего потрачено')
    updated_at = models.DateTimeField(auto_now=True, verbose_name='Дата обновления')

    class Meta:
        verbose_name = 'Лояльность клиента'
        verbose_name_plural = 'Лояльность клиентов'

    def __str__(self):
        return f'{self.customer.email} — {self.level.name if self.level else "нет уровня"}'


class ChangeLog(models.Model):
    """Журнал изменений объектов администратором."""
    ACTION_CHOICES = [
        ('create', 'Создание'),
        ('update', 'Изменение'),
        ('delete', 'Удаление'),
    ]

    user = models.ForeignKey(
        Customer,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Пользователь'
    )
    action = models.CharField(max_length=10, choices=ACTION_CHOICES, verbose_name='Действие')
    model_name = models.CharField(max_length=100, verbose_name='Модель')
    object_id = models.PositiveIntegerField(verbose_name='ID объекта')
    object_repr = models.CharField(max_length=255, verbose_name='Представление объекта')
    changes = models.JSONField(default=dict, verbose_name='Изменения',
                               help_text='Словарь изменённых полей: {поле: {"old": ..., "new": ...}}.')
    ip_address = models.GenericIPAddressField(null=True, blank=True, verbose_name='IP-адрес')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата изменения')

    class Meta:
        verbose_name = 'Лог изменений'
        verbose_name_plural = 'Логи изменений'
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['model_name', 'object_id']),
            models.Index(fields=['-created_at']),
        ]

    def __str__(self):
        return f'{self.get_action_display()} {self.model_name}#{self.object_id} ({self.created_at:%d.%m.%Y %H:%M})'
