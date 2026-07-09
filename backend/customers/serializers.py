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
    """Сериализатор для создания заказа"""
    items = serializers.ListField(write_only=True)
    email = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    address = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    phone1 = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    first_name = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    last_name = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    
    class Meta:
        model = Order
        fields = [
            'first_name', 'last_name', 'email', 'phone1', 'phone2', 
            'address', 'comments', 'items'
        ]
    
    def create(self, validated_data):
        items_data = validated_data.pop('items')
        
        order = Order.objects.create(total_amount=0, **validated_data)
        
        total_amount = 0
        for item_data in items_data:
            try:
                product = Product.objects.get(id=item_data['product_id'])
                variant = None
                if item_data.get('variant_id'):
                    variant = ProductVariant.objects.filter(
                        id=item_data['variant_id'], product=product
                    ).first()
                
                price = float(variant.get_price()) if variant else float(product.price)
                quantity = int(item_data['quantity'])
                
                OrderItem.objects.create(
                    order=order,
                    product=product,
                    variant=variant,
                    quantity=quantity,
                    price=price
                )
                
                total_amount += price * quantity
            except (Product.DoesNotExist, KeyError, ValueError):
                continue
        
        order.total_amount = total_amount
        order.save()
        
        # Создаём первую запись в истории статусов
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
