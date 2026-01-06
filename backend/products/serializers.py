from rest_framework import serializers
from .models import Product, Category, Attribute, ProductAttribute, ProductImage, Tag, Review

# Сериализаторы для "вложенных" частей

class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['name', 'slug']

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'slug', 'parent', 'header_order']

class AttributeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attribute
        fields = ['name', 'slug', 'unit']

class ProductAttributeSerializer(serializers.ModelSerializer):
    # Включаем информацию из связанной модели Attribute
    attribute = AttributeSerializer(read_only=True)

    class Meta:
        model = ProductAttribute
        fields = ['attribute', 'value']

class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ['image', 'is_main']

class ProductSerializer(serializers.ModelSerializer):
    categories = CategorySerializer(many=True, read_only=True)
    attributes = ProductAttributeSerializer(many=True, read_only=True)
    images = ProductImageSerializer(many=True, read_only=True)
    tags = TagSerializer(many=True, read_only=True)
    
    # Поля рейтинга
    average_rating = serializers.ReadOnlyField()
    reviews_count = serializers.ReadOnlyField()

    class Meta:
        model = Product
        fields = [
            'id',
            'name', 
            'slug',
            'description',
            'price',
            'categories',
            'attributes',
            'tags',
            'is_favorite',
            'is_new',
            'is_active',
            'images',
            'average_rating',
            'reviews_count',
        ]


class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = ['id', 'rating', 'created_at']
        read_only_fields = ['id', 'created_at']
    
    def create(self, validated_data):
        # Получаем текущего пользователя из контекста
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            validated_data['customer'] = request.user
        
        # Получаем product_id из URL
        product_id = self.context.get('product_id')
        if product_id:
            validated_data['product_id'] = product_id
            
        return super().create(validated_data)
