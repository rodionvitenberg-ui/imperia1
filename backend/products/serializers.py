from rest_framework import serializers
from .models import (
    Product, ProductVariant, Category, Attribute, Brand, Tag,
    ProductAttribute, ProductImage, Stock, Review, ReviewImage,
    PriceHistory, PromoCampaign, Discount, ProductVideo,
)


class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ['id', 'name', 'slug', 'logo', 'description', 'country', 'website']


class BrandListSerializer(serializers.ModelSerializer):
    """Облегчённый сериализатор бренда для списков."""
    class Meta:
        model = Brand
        fields = ['id', 'name', 'slug', 'logo']


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['name', 'slug']


class CategorySerializer(serializers.ModelSerializer):
    children = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = [
            'id', 'name', 'slug', 'parent', 'header_order', 'children',
            'meta_title', 'meta_description', 'h1',
        ]

    def get_children(self, obj):
        """Возвращает дочерние категории первого уровня."""
        children = obj.children.all()
        if children.exists():
            return CategorySerializer(children, many=True).data
        return []


class AttributeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attribute
        fields = ['id', 'name', 'slug', 'unit', 'type', 'enum_options']


class ProductAttributeValueField(serializers.Field):
    """
    Кастомное поле, которое сериализует типизированное значение атрибута
    в единый компактный объект. Скрывает внутренние колонки value_str/int/bool/enum.
    """

    def to_representation(self, obj):
        attr_type = obj.attribute.type
        result = {
            'type': attr_type,
            'display': obj.get_display_value(),
        }

        if attr_type == 'int':
            result['value'] = obj.value_int
        elif attr_type == 'bool':
            result['value'] = obj.value_bool
        elif attr_type == 'enum':
            result['value'] = obj.value_enum
        else:
            result['value'] = obj.value_str

        if obj.attribute.unit:
            result['unit'] = obj.attribute.unit

        return result

    def to_internal_value(self, data):
        """
        При десериализации принимает {'value': ...} и сохраняет
        через set_typed_value() модели.
        """
        return data


class ProductAttributeSerializer(serializers.ModelSerializer):
    attribute = AttributeSerializer(read_only=True)
    value = ProductAttributeValueField(source='*', read_only=True)

    class Meta:
        model = ProductAttribute
        fields = [
            'id',
            'attribute',
            'value',
        ]


class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ['id', 'image', 'alt_text', 'image_type', 'is_main', 'sort_order']


class StockSerializer(serializers.ModelSerializer):
    available = serializers.ReadOnlyField()
    in_stock = serializers.ReadOnlyField()

    class Meta:
        model = Stock
        fields = ['id', 'warehouse', 'quantity', 'reserved', 'available', 'in_stock']


class ProductVariantSerializer(serializers.ModelSerializer):
    attributes = ProductAttributeSerializer(many=True, read_only=True)
    images = ProductImageSerializer(many=True, read_only=True)
    stock = serializers.SerializerMethodField()
    price = serializers.SerializerMethodField()

    class Meta:
        model = ProductVariant
        fields = [
            'id',
            'sku',
            'name',
            'price',
            'price_override',
            'is_active',
            'sort_order',
            'attributes',
            'images',
            'stock',
        ]

    def get_price(self, obj):
        return obj.get_price()

    def get_stock(self, obj):
        """Возвращает агрегированную информацию об остатках по всем складам."""
        stocks = obj.stock_records.all()
        total_available = sum(s.available for s in stocks)
        return {
            'total_available': total_available,
            'in_stock': total_available > 0,
            'warehouses': StockSerializer(stocks, many=True).data,
        }


class ProductListSerializer(serializers.ModelSerializer):
    """Облегчённый сериализатор для списка товаров (с атрибутами и изображениями)."""
    categories = CategorySerializer(many=True, read_only=True)
    brands = BrandSerializer(many=True, read_only=True)
    feature_tags = TagSerializer(many=True, read_only=True)
    attributes = ProductAttributeSerializer(many=True, read_only=True)
    images = ProductImageSerializer(many=True, read_only=True)
    main_image = serializers.SerializerMethodField()
    average_rating = serializers.ReadOnlyField()
    reviews_count = serializers.ReadOnlyField()
    min_variant_price = serializers.ReadOnlyField()
    has_variants = serializers.ReadOnlyField()

    class Meta:
        model = Product
        fields = [
            'id',
            'name',
            'slug',
            'price',
            'min_variant_price',
            'has_variants',
            'categories',
            'brands',
            'feature_tags',
            'attributes',
            'images',
            'is_favorite',
            'is_new',
            'is_active',
            'main_image',
            'average_rating',
            'reviews_count',
        ]

    def get_main_image(self, obj):
        main = obj.images.filter(is_main=True).first()
        if main:
            return ProductImageSerializer(main).data
        first_image = obj.images.first()
        if first_image:
            return ProductImageSerializer(first_image).data
        return None


class ProductSerializer(serializers.ModelSerializer):
    """Полный сериализатор для детальной страницы товара."""
    categories = CategorySerializer(many=True, read_only=True)
    attributes = ProductAttributeSerializer(many=True, read_only=True)
    images = ProductImageSerializer(many=True, read_only=True)
    brands = BrandSerializer(many=True, read_only=True)
    feature_tags = TagSerializer(many=True, read_only=True)
    variants = ProductVariantSerializer(many=True, read_only=True)
    stock = serializers.SerializerMethodField()

    average_rating = serializers.ReadOnlyField()
    reviews_count = serializers.ReadOnlyField()
    min_variant_price = serializers.ReadOnlyField()
    has_variants = serializers.ReadOnlyField()

    class Meta:
        model = Product
        fields = [
            'id',
            'name',
            'slug',
            'description',
            'price',
            'min_variant_price',
            'has_variants',
            'categories',
            'attributes',
            'brands',
            'feature_tags',
            'variants',
            'stock',
            'is_favorite',
            'is_new',
            'is_active',
            'images',
            'average_rating',
            'reviews_count',
            'meta_title',
            'meta_description',
            'h1',
        ]

    def get_stock(self, obj):
        """Агрегированные остатки по товару (для товаров без вариантов)."""
        stocks = obj.stock_records.filter(variant__isnull=True)
        total_available = sum(s.available for s in stocks)
        return {
            'total_available': total_available,
            'in_stock': total_available > 0,
            'warehouses': StockSerializer(stocks, many=True).data,
        }


class ReviewSerializer(serializers.ModelSerializer):
    customer_name = serializers.SerializerMethodField()

    class Meta:
        model = Review
        fields = [
            'id',
            'product',
            'rating',
            'text',
            'verified_purchase',
            'customer_name',
            'created_at',
            'updated_at',
        ]
        read_only_fields = [
            'id',
            'customer',
            'verified_purchase',
            'created_at',
            'updated_at',
        ]

    def get_customer_name(self, obj):
        return obj.customer.nickname or obj.customer.email

    def create(self, validated_data):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            validated_data['customer'] = request.user

        product_id = self.context.get('product_id')
        if product_id:
            validated_data['product_id'] = product_id

        return super().create(validated_data)


class ReviewImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReviewImage
        fields = ['id', 'image', 'sort_order']


class ReviewDetailSerializer(ReviewSerializer):
    """Расширенный сериализатор отзыва с фотографиями."""
    images = ReviewImageSerializer(many=True, read_only=True)

    class Meta(ReviewSerializer.Meta):
        fields = ReviewSerializer.Meta.fields + ['images']


class ProductVideoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductVideo
        fields = ['id', 'title', 'url', 'platform', 'thumbnail', 'sort_order']
