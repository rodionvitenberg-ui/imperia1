from rest_framework import serializers
from .models import Order, OrderItem, Address, OrderStatusHistory, Payment, Delivery
from products.models import Product, ProductVariant


class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Address
        fields = [
            'id', 'title', 'first_name', 'last_name', 'phone',
            'country', 'city', 'street', 'house', 'apartment',
            'postal_code', 'is_default', 'created_at',
        ]
        read_only_fields = ['id', 'created_at']

    def create(self, validated_data):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            validated_data['customer'] = request.user
        return super().create(validated_data)


class OrderItemSerializer(serializers.ModelSerializer):
    """Сериализатор для товаров в заказе"""
    product_name = serializers.CharField(source='product.name', read_only=True)
    product_slug = serializers.CharField(source='product.slug', read_only=True)
    variant_name = serializers.CharField(source='variant.name', read_only=True, default=None)
    
    class Meta:
        model = OrderItem
        fields = [
            'product', 'product_name', 'product_slug',
            'variant', 'variant_name',
            'quantity', 'price', 'total_price',
        ]
        read_only_fields = ['total_price']


class OrderCreateSerializer(serializers.ModelSerializer):
    """Сериализатор для создания гостевого/пользовательского заказа-заявки."""
    items = serializers.ListField(
        child=serializers.DictField(),
        write_only=True,
        allow_empty=False,
        error_messages={
            'required': 'Список товаров обязателен',
            'empty': 'Корзина пуста — добавьте хотя бы один товар',
        },
    )
    first_name = serializers.CharField(required=True, allow_blank=False, max_length=100)
    last_name = serializers.CharField(required=False, allow_blank=True, default='', max_length=100)
    phone1 = serializers.CharField(required=True, allow_blank=False, max_length=20)
    phone2 = serializers.CharField(required=False, allow_blank=True, default='', max_length=20)
    email = serializers.EmailField(required=False, allow_blank=True, default='')
    address = serializers.CharField(required=False, allow_blank=True, default='')
    comments = serializers.CharField(required=False, allow_blank=True, default='')

    class Meta:
        model = Order
        fields = [
            'first_name', 'last_name', 'email', 'phone1', 'phone2',
            'address', 'comments', 'items',
        ]

    def validate_items(self, items):
        if not items:
            raise serializers.ValidationError('Корзина пуста — добавьте хотя бы один товар')

        resolved = []
        errors = []

        for index, item_data in enumerate(items):
            product_id = item_data.get('product_id')
            if product_id is None:
                errors.append(f'Позиция {index + 1}: не указан product_id')
                continue

            try:
                product = Product.objects.get(id=product_id, is_active=True)
            except (Product.DoesNotExist, TypeError, ValueError):
                errors.append(f'Позиция {index + 1}: товар id={product_id} не найден')
                continue

            try:
                quantity = int(item_data.get('quantity', 0))
            except (TypeError, ValueError):
                errors.append(f'Позиция {index + 1}: некорректное количество')
                continue

            if quantity < 1:
                errors.append(f'Позиция {index + 1}: количество должно быть ≥ 1')
                continue

            variant = None
            variant_id = item_data.get('variant_id')
            if variant_id:
                variant = ProductVariant.objects.filter(
                    id=variant_id, product=product, is_active=True
                ).first()
                if variant is None:
                    errors.append(
                        f'Позиция {index + 1}: вариант id={variant_id} не найден '
                        f'для товара «{product.name}»'
                    )
                    continue

            resolved.append({
                'product': product,
                'variant': variant,
                'quantity': quantity,
            })

        if errors:
            raise serializers.ValidationError(errors)
        if not resolved:
            raise serializers.ValidationError('Не удалось обработать ни одну позицию заказа')

        return resolved

    def create(self, validated_data):
        items_data = validated_data.pop('items')

        # Нормализуем опциональные строковые поля (None → '')
        for field in ('last_name', 'email', 'phone2', 'address', 'comments'):
            if validated_data.get(field) is None:
                validated_data[field] = ''

        order = Order.objects.create(total_amount=0, **validated_data)

        total_amount = 0
        for item_data in items_data:
            product = item_data['product']
            variant = item_data['variant']
            quantity = item_data['quantity']
            price = float(variant.get_price()) if variant else float(product.price)

            OrderItem.objects.create(
                order=order,
                product=product,
                variant=variant,
                quantity=quantity,
                price=price,
            )
            total_amount += price * quantity

        order.total_amount = total_amount
        order.save(update_fields=['total_amount'])

        OrderStatusHistory.objects.create(
            order=order,
            new_status='pending',
        )

        return order


class OrderStatusHistorySerializer(serializers.ModelSerializer):
    changed_by_email = serializers.CharField(source='changed_by.email', read_only=True, default=None)

    class Meta:
        model = OrderStatusHistory
        fields = [
            'id', 'old_status', 'new_status', 'changed_by_email',
            'comment', 'created_at',
        ]
        read_only_fields = ['id', 'created_at']


class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = [
            'id', 'method', 'status', 'amount', 'external_id',
            'paid_at', 'created_at',
        ]
        read_only_fields = ['id', 'created_at']


class DeliverySerializer(serializers.ModelSerializer):
    class Meta:
        model = Delivery
        fields = [
            'id', 'address', 'address_snapshot', 'tracking_number',
            'courier', 'status', 'estimated_date', 'delivered_at', 'created_at',
        ]
        read_only_fields = ['id', 'created_at']


class OrderSerializer(serializers.ModelSerializer):
    """Сериализатор для отображения заказа"""
    items = OrderItemSerializer(many=True, read_only=True)
    customer_email = serializers.CharField(source='customer.email', read_only=True)
    status_history = OrderStatusHistorySerializer(many=True, read_only=True)
    payments = PaymentSerializer(many=True, read_only=True)
    delivery = DeliverySerializer(read_only=True)
    
    class Meta:
        model = Order
        fields = [
            'id', 'order_number', 'status', 'first_name', 'last_name', 
            'email', 'phone1', 'phone2', 'address', 'comments', 
            'total_amount', 'created_at', 'updated_at', 'customer_email',
            'items', 'status_history', 'payments', 'delivery',
        ]
        read_only_fields = ['id', 'order_number', 'created_at', 'updated_at']


class OrderPublicItemSerializer(serializers.ModelSerializer):
    """Публичная позиция заказа (без внутренних id)."""
    product_name = serializers.CharField(source='product.name', read_only=True)

    class Meta:
        model = OrderItem
        fields = ['product_name', 'quantity', 'price', 'total_price']


class OrderPublicSerializer(serializers.ModelSerializer):
    """
    Публичные данные заказа для success / status lookup.

    Конфиденциальность:
    - без фамилии, email, адреса, полного телефона
    - только первое слово имени
    - телефон: первые цифры + маска
    - дата/время оформления
    """
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    items = OrderPublicItemSerializer(many=True, read_only=True)
    display_name = serializers.SerializerMethodField()
    phone_hint = serializers.SerializerMethodField()

    class Meta:
        model = Order
        fields = [
            'order_number',
            'status',
            'status_display',
            'total_amount',
            'display_name',
            'phone_hint',
            'created_at',
            'items',
        ]

    def get_display_name(self, obj) -> str:
        from .order_numbers import extract_name_token
        return extract_name_token(obj.first_name)

    def get_phone_hint(self, obj) -> str:
        from .order_numbers import mask_phone
        return mask_phone(obj.phone1, visible_digits=5)
