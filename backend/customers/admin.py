from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.utils.html import format_html
from django.contrib import messages
from .models import (
    Customer, Order, OrderItem, Address, OrderStatusHistory, Payment, Delivery,
    Wishlist, ViewedProduct, Cart, Coupon, CouponUsage, LoyaltyProgram, CustomerLoyalty, ChangeLog,
)


@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    list_display = ('title', 'customer', 'city', 'street', 'house', 'is_default')
    list_filter = ('city', 'is_default')
    search_fields = ('customer__email', 'city', 'street', 'title')
    autocomplete_fields = ['customer']


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


class OrderStatusHistoryInline(admin.TabularInline):
    model = OrderStatusHistory
    extra = 0
    readonly_fields = ('created_at',)
    fields = ('old_status', 'new_status', 'changed_by', 'comment', 'created_at')


class PaymentInline(admin.TabularInline):
    model = Payment
    extra = 0
    readonly_fields = ('created_at',)
    fields = ('method', 'status', 'amount', 'external_id', 'paid_at', 'created_at')


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
    inlines = [OrderStatusHistoryInline, PaymentInline]

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
            'pending': '#ffa500',
            'confirmed': '#008000',
            'shipped': '#0066cc',
            'delivered': '#006400',
            'cancelled': '#cc0000',
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
        if obj.pk:
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

    def save_model(self, request, obj, form, change):
        """При изменении статуса создаём запись в истории."""
        if change and 'status' in form.changed_data:
            old_status = Order.objects.get(pk=obj.pk).status
            super().save_model(request, obj, form, change)
            OrderStatusHistory.objects.create(
                order=obj,
                old_status=old_status,
                new_status=obj.status,
                changed_by=request.user if request.user.is_authenticated else None,
                comment='Изменено через админ-панель'
            )
        else:
            super().save_model(request, obj, form, change)

    # Массовые действия
    @admin.action(description='Отметить как подтверждённые')
    def mark_as_confirmed(self, request, queryset):
        for order in queryset:
            old_status = order.status
            order.status = 'confirmed'
            order.save()
            OrderStatusHistory.objects.create(
                order=order,
                old_status=old_status,
                new_status='confirmed',
                changed_by=request.user if request.user.is_authenticated else None,
            )
        self.message_user(request, f'Отмечено как "Подтверждён": {queryset.count()} заказ(ов)', messages.SUCCESS)

    @admin.action(description='Отметить как отправленные')
    def mark_as_shipped(self, request, queryset):
        for order in queryset:
            old_status = order.status
            order.status = 'shipped'
            order.save()
            OrderStatusHistory.objects.create(
                order=order,
                old_status=old_status,
                new_status='shipped',
                changed_by=request.user if request.user.is_authenticated else None,
            )
        self.message_user(request, f'Отмечено как "Отправлен": {queryset.count()} заказ(ов)', messages.SUCCESS)

    @admin.action(description='Отметить как доставленные')
    def mark_as_delivered(self, request, queryset):
        for order in queryset:
            old_status = order.status
            order.status = 'delivered'
            order.save()
            OrderStatusHistory.objects.create(
                order=order,
                old_status=old_status,
                new_status='delivered',
                changed_by=request.user if request.user.is_authenticated else None,
            )
        self.message_user(request, f'Отмечено как "Доставлен": {queryset.count()} заказ(ов)', messages.SUCCESS)

    @admin.action(description='Повторно отправить уведомления')
    def resend_notifications(self, request, queryset):
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
                self.message_user(request, f'Уведомления отправлены для {sent_count} заказ(ов)', messages.SUCCESS)
            if failed_count > 0:
                self.message_user(request, f'Ошибка отправки для {failed_count} заказ(ов)', messages.WARNING)
        except ImportError:
            self.message_user(request, 'Модуль уведомлений не настроен', messages.ERROR)


@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
     """Админ-панель для товаров в заказах"""
     list_display = ('order', 'product', 'variant', 'quantity', 'price', 'total_price')
     list_filter = ('order__created_at',)
     search_fields = ('order__order_number', 'product__name', 'variant__sku')


@admin.register(OrderStatusHistory)
class OrderStatusHistoryAdmin(admin.ModelAdmin):
    list_display = ('order', 'old_status', 'new_status', 'created_at')
    list_filter = ('new_status', 'created_at')
    search_fields = ('order__order_number', 'comment')
    readonly_fields = ('created_at',)


@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    list_display = ('order', 'method', 'status', 'amount', 'external_id', 'paid_at')
    list_filter = ('method', 'status', 'created_at')
    search_fields = ('order__order_number', 'external_id')
    readonly_fields = ('created_at',)


@admin.register(Delivery)
class DeliveryAdmin(admin.ModelAdmin):
    list_display = ('order', 'status', 'tracking_number', 'courier', 'estimated_date')
    list_filter = ('status', 'courier')
    search_fields = ('order__order_number', 'tracking_number')
    readonly_fields = ('created_at',)


@admin.register(Wishlist)
class WishlistAdmin(admin.ModelAdmin):
    list_display = ('customer', 'product', 'created_at')
    search_fields = ('customer__email', 'product__name')
    autocomplete_fields = ['customer', 'product']


@admin.register(ViewedProduct)
class ViewedProductAdmin(admin.ModelAdmin):
    list_display = ('customer', 'product', 'viewed_at', 'view_count')
    search_fields = ('customer__email', 'product__name')
    autocomplete_fields = ['customer', 'product']


@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ('owner_display', 'product', 'variant', 'quantity', 'unit_price', 'total_price', 'added_at')
    search_fields = ('customer__email', 'session_key', 'product__name')
    autocomplete_fields = ['customer', 'product', 'variant']
    readonly_fields = ('added_at', 'updated_at', 'unit_price', 'total_price')

    def owner_display(self, obj):
        if obj.customer:
            return obj.customer.email
        return f'Аноним ({obj.session_key[:12]})'
    owner_display.short_description = 'Владелец'


@admin.register(Coupon)
class CouponAdmin(admin.ModelAdmin):
    list_display = ('code', 'discount_type', 'value', 'used_count', 'max_uses', 'is_active', 'start_date', 'end_date')
    list_filter = ('discount_type', 'is_active')
    search_fields = ('code',)
    readonly_fields = ('used_count', 'created_at')


@admin.register(CouponUsage)
class CouponUsageAdmin(admin.ModelAdmin):
    list_display = ('coupon', 'customer', 'order', 'discount_amount', 'used_at')
    list_filter = ('used_at',)
    search_fields = ('coupon__code', 'customer__email')
    readonly_fields = ('used_at',)
    autocomplete_fields = ['coupon', 'customer', 'order']


@admin.register(LoyaltyProgram)
class LoyaltyProgramAdmin(admin.ModelAdmin):
    list_display = ('name', 'discount_percent', 'free_shipping', 'is_active', 'sort_order')
    list_filter = ('is_active',)
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name',)


@admin.register(CustomerLoyalty)
class CustomerLoyaltyAdmin(admin.ModelAdmin):
    list_display = ('customer', 'level', 'total_orders', 'total_spent', 'updated_at')
    search_fields = ('customer__email',)
    autocomplete_fields = ['customer', 'level']


@admin.register(ChangeLog)
class ChangeLogAdmin(admin.ModelAdmin):
    list_display = ('action', 'model_name', 'object_repr', 'user', 'created_at')
    list_filter = ('action', 'model_name', 'created_at')
    search_fields = ('object_repr', 'user__email')
    readonly_fields = ('user', 'action', 'model_name', 'object_id', 'object_repr', 'changes', 'ip_address', 'created_at')

    def has_add_permission(self, request):
        return False

    def has_change_permission(self, request, obj=None):
        return False
