from django.contrib import admin
from django.utils.html import format_html
from django.urls import reverse
from django.utils.safestring import mark_safe
from .models import NotificationSettings, NotificationLog


@admin.register(NotificationSettings)
class NotificationSettingsAdmin(admin.ModelAdmin):
    """Админка для настроек уведомлений"""
    
    list_display = (
        'name', 
        'telegram_status', 
        'email_status', 
        'notify_new_orders', 
        'notify_status_changes',
        'updated_at'
    )
    list_filter = ('telegram_enabled', 'email_enabled', 'notify_new_orders')
    search_fields = ('name', 'telegram_chat_id', 'email_address')
    
    fieldsets = (
        ('Основные настройки', {
            'fields': ('name',)
        }),
        ('Telegram настройки', {
            'fields': ('telegram_enabled', 'telegram_chat_id'),
            'classes': ('collapse',),
        }),
        ('Email настройки', {
            'fields': ('email_enabled', 'email_address'),
            'classes': ('collapse',),
        }),
        ('Настройки уведомлений', {
            'fields': ('notify_new_orders', 'notify_status_changes'),
        }),
    )
    
    def telegram_status(self, obj):
        if obj.telegram_enabled:
            return format_html(
                '<span style="color: green;">✓ Включен</span>'
            )
        return format_html(
            '<span style="color: red;">✗ Отключен</span>'
        )
    telegram_status.short_description = 'Telegram'
    
    def email_status(self, obj):
        if obj.email_enabled:
            return format_html(
                '<span style="color: green;">✓ Включен</span>'
            )
        return format_html(
            '<span style="color: red;">✗ Отключен</span>'
        )
    email_status.short_description = 'Email'


@admin.register(NotificationLog)
class NotificationLogAdmin(admin.ModelAdmin):
    """Админка для логов уведомлений"""
    
    list_display = (
        'created_at',
        'notification_type', 
        'status_colored',
        'recipient',
        'order_link',
        'sent_at'
    )
    list_filter = ('notification_type', 'status', 'created_at')
    search_fields = ('recipient', 'order__order_number', 'message')
    readonly_fields = ('created_at', 'sent_at', 'message_preview')
    
    fieldsets = (
        ('Информация об уведомлении', {
            'fields': (
                'notification_type', 
                'status', 
                'recipient',
                'order',
                'created_at',
                'sent_at'
            )
        }),
        ('Сообщение', {
            'fields': ('message_preview',),
            'classes': ('collapse',),
        }),
        ('Ошибки', {
            'fields': ('error_message',),
            'classes': ('collapse',),
        }),
    )
    
    def status_colored(self, obj):
        colors = {
            'sent': 'green',
            'failed': 'red', 
            'pending': 'orange'
        }
        color = colors.get(obj.status, 'gray')
        return format_html(
            '<span style="color: {}; font-weight: bold;">{}</span>',
            color,
            obj.get_status_display()
        )
    status_colored.short_description = 'Статус'
    
    def order_link(self, obj):
        if obj.order:
            url = reverse('admin:customers_order_change', args=[obj.order.id])
            return format_html(
                '<a href="{}" target="_blank">{}</a>',
                url,
                obj.order.order_number
            )
        return '-'
    order_link.short_description = 'Заказ'
    
    def message_preview(self, obj):
        if obj.message:
            # Показываем первые 500 символов
            preview = obj.message[:500]
            if len(obj.message) > 500:
                preview += '...'
            return format_html('<pre>{}</pre>', preview)
        return 'Нет сообщения'
    message_preview.short_description = 'Превью сообщения'
    
    def has_add_permission(self, request):
        # Логи создаются автоматически
        return False
