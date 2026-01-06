from django.db import models


class NotificationSettings(models.Model):
    """Модель для настроек уведомлений"""
    name = models.CharField(
        max_length=100, 
        unique=True, 
        verbose_name="Название настройки",
        help_text="Например: 'Основные уведомления'"
    )
    
    # Telegram settings
    telegram_enabled = models.BooleanField(
        default=True,
        verbose_name="Включить Telegram уведомления"
    )
    telegram_chat_id = models.CharField(
        max_length=100, 
        blank=True,
        verbose_name="Telegram Chat ID",
        help_text="ID чата для отправки уведомлений"
    )
    
    # Email settings  
    email_enabled = models.BooleanField(
        default=False,
        verbose_name="Включить Email уведомления"
    )
    email_address = models.EmailField(
        blank=True,
        verbose_name="Email адрес",
        help_text="Адрес для отправки уведомлений"
    )
    
    # Order notification settings
    notify_new_orders = models.BooleanField(
        default=True,
        verbose_name="Уведомлять о новых заказах"
    )
    notify_status_changes = models.BooleanField(
        default=False,
        verbose_name="Уведомлять об изменении статуса"
    )
    
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Дата обновления")
    
    class Meta:
        verbose_name = "Настройки уведомлений"
        verbose_name_plural = "Настройки уведомлений"
        
    def __str__(self):
        return self.name


class NotificationLog(models.Model):
    """Модель для логирования отправленных уведомлений"""
    
    NOTIFICATION_TYPES = [
        ('telegram', 'Telegram'),
        ('email', 'Email'),
    ]
    
    STATUS_CHOICES = [
        ('sent', 'Отправлено'),
        ('failed', 'Ошибка'),
        ('pending', 'Ожидание'),
    ]
    
    notification_type = models.CharField(
        max_length=20,
        choices=NOTIFICATION_TYPES,
        verbose_name="Тип уведомления"
    )
    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='pending',
        verbose_name="Статус"
    )
    message = models.TextField(verbose_name="Сообщение")
    recipient = models.CharField(
        max_length=255,
        verbose_name="Получатель",
        help_text="Chat ID для Telegram или email адрес"
    )
    error_message = models.TextField(
        blank=True,
        verbose_name="Ошибка",
        help_text="Описание ошибки, если отправка не удалась"
    )
    
    # Связь с заказом (опционально)
    order = models.ForeignKey(
        'customers.Order',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name="Связанный заказ",
        related_name='notification_logs'
    )
    
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")
    sent_at = models.DateTimeField(
        null=True, 
        blank=True, 
        verbose_name="Дата отправки"
    )
    
    class Meta:
        verbose_name = "Лог уведомлений"
        verbose_name_plural = "Логи уведомлений"
        ordering = ['-created_at']
        
    def __str__(self):
        return f"{self.get_notification_type_display()} - {self.get_status_display()} ({self.created_at.strftime('%d.%m.%Y %H:%M')})"

