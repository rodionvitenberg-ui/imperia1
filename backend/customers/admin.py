from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.utils.html import format_html
from django.contrib import messages
from .models import Customer, Order, OrderItem


@admin.register(Customer)
class CustomerAdmin(UserAdmin):
    """Админ-панель для кастомной модели пользователя"""
    list_display = ('email', 'first_name', 'last_name', 'nickname', 'is_staff', 'date_joined')
    list_filter = ('is_staff', 'is_superuser', 'is_active', 'date_joined')
    search_fields = ('email', 'first_name', 'last_name', 'nickname')
    ordering = ('email',)
    
    # Настройка полей для отображения и редактирования
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Персональная информация', {'fields': ('first_name', 'last_name', 'nickname')}),
        ('Права доступа', {
            'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions'),
        }),
        ('Важные даты', {'fields': ('last_login', 'date_joined')}),
    )
    
    # Поля для создания нового пользователя (упрощенная версия)
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'first_name', 'last_name', 'password1', 'password2'),
        }),
    )


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    """Админ-панель для заказов"""
    list_display = (
        'order_number', 
        'customer_info', 
        'contact_info',
        'status_colored', 
        'total_amount', 
        'created_at',
        'items_count'
    )
    list_filter = ('status', 'created_at')
    search_fields = ('order_number', 'email', 'first_name', 'last_name', 'phone1')
    readonly_fields = ('order_number', 'created_at', 'updated_at', 'items_summary')
    
    # Добавляем действия для массового управления
    actions = [
        'mark_as_confirmed', 
        'mark_as_shipped', 
        'mark_as_delivered',
        'resend_notifications'
    ]
    
    fieldsets = (
        ('Информация о заказе', {
            'fields': ('order_number', 'status', 'customer', 'created_at', 'updated_at')
        }),
        ('Контактная информация', {
            'fields': (
                'first_name', 'last_name', 'email', 
                'phone1', 'phone2', 'address'
            )
        }),
        ('Дополнительно', {
            'fields': ('comments', 'total_amount'),
        }),
        ('Товары в заказе', {
            'fields': ('items_summary',),
            'classes': ('collapse',),
        }),
    )
    
    def customer_info(self, obj):
        if obj.customer:
            return f"{obj.customer.email}"
        return "Гость"
    customer_info.short_description = 'Клиент'
    
    def contact_info(self, obj):
        return f"{obj.first_name} {obj.last_name}\n{obj.phone1}"
    contact_info.short_description = 'Контакты'
    
    def status_colored(self, obj):
        colors = {
            'pending': '#ffa500',      # оранжевый
            'confirmed': '#008000',    # зелёный
            'shipped': '#0066cc',      # синий
            'delivered': '#006400',    # тёмно-зелёный
            'cancelled': '#cc0000',    # красный
        }
        color = colors.get(obj.status, '#333333')
        return format_html(
            '<span style="color: {}; font-weight: bold;">{}</span>',
            color,
            obj.get_status_display()
        )
    status_colored.short_description = 'Статус'
    
    def items_count(self, obj):
        count = obj.items.count()
        return f"{count} товар(ов)"
    items_count.short_description = 'Кол-во товаров'
    
    def items_summary(self, obj):
        if obj.pk:  # Проверяем, что объект сохранён
            items_html = ""
            for item in obj.items.all():
                items_html += f"""
                <div style="border-bottom: 1px solid #ddd; padding: 5px 0;">
                    <strong>{item.product.name}</strong><br>
                    Количество: {item.quantity} шт.<br>
                    Цена: {item.price} сом за шт.<br>
                    <strong>Итого: {item.total_price} сом</strong>
                </div>
                """
            if items_html:
                return format_html(items_html)
        return "Товары не добавлены"
    items_summary.short_description = 'Подробно о товарах'
    
    # Массовые действия
    def mark_as_confirmed(self, request, queryset):
        updated = queryset.update(status='confirmed')
        self.message_user(
            request,
            f'Отмечено как "Подтверждён": {updated} заказ(ов)',
            messages.SUCCESS
        )
    mark_as_confirmed.short_description = 'Отметить как подтверждённые'
    
    def mark_as_shipped(self, request, queryset):
        updated = queryset.update(status='shipped')
        self.message_user(
            request,
            f'Отмечено как "Отправлен": {updated} заказ(ов)',
            messages.SUCCESS
        )
    mark_as_shipped.short_description = 'Отметить как отправленные'
    
    def mark_as_delivered(self, request, queryset):
        updated = queryset.update(status='delivered')
        self.message_user(
            request,
            f'Отмечено как "Доставлен": {updated} заказ(ов)',
            messages.SUCCESS
        )
    mark_as_delivered.short_description = 'Отметить как доставленные'
    
    def resend_notifications(self, request, queryset):
        """Повторная отправка уведомлений"""
        try:
            from notifications.services import NotificationManager
            
            sent_count = 0
            failed_count = 0
            
            for order in queryset:
                try:
                    results = NotificationManager.send_order_notifications(order)
                    if any(result.get('success', False) for result in results.values()):
                        sent_count += 1
                    else:
                        failed_count += 1
                except Exception:
                    failed_count += 1
            
            if sent_count > 0:
                self.message_user(
                    request,
                    f'Уведомления отправлены для {sent_count} заказ(ов)',
                    messages.SUCCESS
                )
            
            if failed_count > 0:
                self.message_user(
                    request,
                    f'Ошибка отправки для {failed_count} заказ(ов)',
                    messages.WARNING
                )
                
        except ImportError:
            self.message_user(
                request,
                'Модуль уведомлений не настроен',
                messages.ERROR
            )
    resend_notifications.short_description = 'Повторно отправить уведомления'
    

@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
     """Админ-панель для товаров в заказах"""
     list_display = ('order', 'product', 'quantity', 'price', 'total_price')
     list_filter = ('order__created_at',)
     search_fields = ('order__order_number', 'product__name')
