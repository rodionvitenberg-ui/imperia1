from rest_framework import serializers
from .models import Customer, Order, OrderItem
from products.models import Product

class CustomerRegistrationSerializer(serializers.ModelSerializer):
    # Поле password делаем write_only, чтобы оно не возвращалось в ответе API
    password = serializers.CharField(write_only=True, required=True, style={'input_type': 'password'})

    class Meta:
        model = Customer
        # Указываем поля, которые будут использоваться при регистрации
        fields = ('email', 'nickname', 'password')

    def create(self, validated_data):
        # Используем наш кастомный метод create_user для правильного хэширования пароля
        user = Customer.objects.create_user(
            email=validated_data['email'],
            nickname=validated_data['nickname'],
            password=validated_data['password']
        )
        return user


class OrderItemSerializer(serializers.ModelSerializer):
    """Сериализатор для товаров в заказе"""
    product_name = serializers.CharField(source='product.name', read_only=True)
    product_slug = serializers.CharField(source='product.slug', read_only=True)
    
    class Meta:
        model = OrderItem
        fields = ['product', 'product_name', 'product_slug', 'quantity', 'price', 'total_price']
        read_only_fields = ['total_price']


class OrderCreateSerializer(serializers.ModelSerializer):
    """Сериализатор для создания заказа"""
    items = serializers.ListField(write_only=True)
    
    class Meta:
        model = Order
        fields = [
            'first_name', 'last_name', 'email', 'phone1', 'phone2', 
            'address', 'comments', 'items'
        ]
    
    def create(self, validated_data):
        items_data = validated_data.pop('items')
        
        # Создаем заказ с начальной суммой 0
        order = Order.objects.create(total_amount=0, **validated_data)
        
        # Создаем товары в заказе
        total_amount = 0
        for item_data in items_data:
            try:
                product = Product.objects.get(id=item_data['product_id'])
                price = float(product.price)
                quantity = int(item_data['quantity'])
                
                OrderItem.objects.create(
                    order=order,
                    product=product,
                    quantity=quantity,
                    price=price
                )
                
                total_amount += price * quantity
            except (Product.DoesNotExist, KeyError, ValueError):
                continue
        
        # Обновляем общую сумму заказа
        order.total_amount = total_amount
        order.save()
        
        return order


class OrderSerializer(serializers.ModelSerializer):
    """Сериализатор для отображения заказа"""
    items = OrderItemSerializer(many=True, read_only=True)
    customer_email = serializers.CharField(source='customer.email', read_only=True)
    
    class Meta:
        model = Order
        fields = [
            'id', 'order_number', 'status', 'first_name', 'last_name', 
            'email', 'phone1', 'phone2', 'address', 'comments', 
            'total_amount', 'created_at', 'updated_at', 'customer_email', 'items'
        ]
        read_only_fields = ['id', 'order_number', 'created_at', 'updated_at']