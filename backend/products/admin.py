from django.contrib import admin
from django import forms
from django.utils.safestring import mark_safe
from django_ckeditor_5.widgets import CKEditor5Widget
from .models import (
    Category, Product, ProductVariant, Attribute, Brand, Tag,
    ProductAttribute, ProductImage, Stock, Review, ReviewImage,
    PriceHistory, PromoCampaign, Discount, ProductVideo,
    Supplier, Warranty, Certificate, Banner, PromotionBlock, BlogPost,
    AdminSection,
)


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'header_order', 'parent', 'slug', 'meta_title')
    list_editable = ('header_order',)
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name',)
    filter_horizontal = ('brands', 'attributes')
    autocomplete_fields = ['parent']
    fieldsets = (
        ('Основное', {
            'fields': ('name', 'slug', 'parent', 'header_order', 'brands', 'attributes')
        }),
        ('SEO', {
            'fields': ('meta_title', 'meta_description', 'h1'),
            'description': 'Мета-теги для поисковой оптимизации. Если не заполнены, используются значения по умолчанию.',
        }),
    )


@admin.register(Attribute)
class AttributeAdmin(admin.ModelAdmin):
    list_display = ('name', 'unit', 'type')
    list_filter = ('type',)
    search_fields = ('name',)
    fieldsets = (
        ('Основное', {
            'fields': ('name', 'slug', 'unit', 'type')
        }),
        ('Перечисление', {
            'fields': ('enum_options',),
            'description': 'Укажите варианты ТОЛЬКО для типа «Перечисление» (например: ["Красный", "Синий"]).',
        }),
    )


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug', 'country', 'website_link', 'categories_list')
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name', 'country')
    fieldsets = (
        ('Основное', {
            'fields': ('name', 'slug', 'logo', 'description')
        }),
        ('Информация о производителе', {
            'fields': ('country', 'website'),
        }),
    )

    def website_link(self, obj):
        if obj.website:
            return mark_safe(f'<a href="{obj.website}" target="_blank">{obj.website}</a>')
        return "—"
    website_link.short_description = "Официальный сайт"
    website_link.admin_order_field = 'website'

    def categories_list(self, obj):
        cats = obj.category_set.all()
        if cats:
            return ", ".join(c.name for c in cats)
        return "—"
    categories_list.short_description = "Категории"


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug')
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name',)


class ProductAdminForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = '__all__'


class ProductAttributeInline(admin.TabularInline):
    model = ProductAttribute
    extra = 1
    fields = ('attribute', 'value_str', 'value_int', 'value_bool', 'value_enum', 'variant')


class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1
    readonly_fields = ('image_preview',)
    fields = ('image', 'image_preview', 'alt_text', 'image_type', 'is_main', 'sort_order', 'variant')

    def image_preview(self, obj):
        if obj.image:
            return mark_safe(f'<img src="{obj.image.url}" width="100" />')
        return "Нет изображения"

    image_preview.short_description = "Превью"


class ProductVariantInline(admin.TabularInline):
    model = ProductVariant
    extra = 1
    fields = ('name', 'sku', 'price_override', 'is_active', 'sort_order')


class StockInline(admin.TabularInline):
    model = Stock
    extra = 1
    fields = ('warehouse', 'quantity', 'reserved', 'variant')


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    form = ProductAdminForm
    list_display = ('name', 'get_categories', 'price', 'is_active', 'has_variants')
    list_filter = ('categories', 'is_active')
    search_fields = ('name', 'description')
    filter_horizontal = ('categories', 'brands', 'feature_tags')
    inlines = [ProductVariantInline, ProductAttributeInline, ProductImageInline, StockInline]
    prepopulated_fields = {'slug': ('name',)}
    fieldsets = (
        ('Основное', {
            'fields': (
                'name', 'slug', 'description', 'price', 'categories',
                'brands', 'feature_tags', 'is_active', 'is_new', 'is_favorite',
            )
        }),
        ('SEO', {
            'fields': ('meta_title', 'meta_description', 'h1'),
            'description': 'Мета-теги для поисковой оптимизации.',
        }),
    )

    def get_categories(self, obj):
        return ", ".join([cat.name for cat in obj.categories.all()])

    get_categories.short_description = 'Категории'


@admin.register(ProductVariant)
class ProductVariantAdmin(admin.ModelAdmin):
    list_display = ('sku', 'name', 'product', 'price_override', 'get_price', 'is_active')
    list_filter = ('is_active', 'product')
    search_fields = ('sku', 'name', 'product__name')
    inlines = [ProductAttributeInline, ProductImageInline, StockInline]
    autocomplete_fields = ['product']

    def get_price(self, obj):
        return obj.get_price()

    get_price.short_description = 'Актуальная цена'
    get_price.admin_order_field = 'price_override'


@admin.register(Stock)
class StockAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'warehouse', 'quantity', 'reserved', 'available', 'in_stock')
    list_filter = ('warehouse',)
    search_fields = ('product__name', 'variant__sku', 'warehouse')
    autocomplete_fields = ['product', 'variant']
    readonly_fields = ('available', 'in_stock')

    def get_queryset(self, request):
        return super().get_queryset(request).select_related('product__product', 'variant', 'product', 'variant__product')


class ReviewImageInline(admin.TabularInline):
    model = ReviewImage
    extra = 1
    fields = ('image', 'sort_order')


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('product', 'customer', 'rating', 'verified_purchase', 'created_at')
    list_filter = ('rating', 'verified_purchase', 'created_at')
    search_fields = ('product__name', 'customer__email', 'text')
    readonly_fields = ('created_at', 'updated_at')
    inlines = [ReviewImageInline]

    def get_queryset(self, request):
        return super().get_queryset(request).select_related('product', 'customer')


@admin.register(PriceHistory)
class PriceHistoryAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'old_price', 'new_price', 'changed_at')
    list_filter = ('changed_at',)
    search_fields = ('product__name', 'variant__sku', 'reason')
    readonly_fields = ('changed_at',)


@admin.register(PromoCampaign)
class PromoCampaignAdmin(admin.ModelAdmin):
    list_display = ('name', 'is_active', 'start_date', 'end_date', 'priority')
    list_filter = ('is_active',)
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name', 'description')


@admin.register(Discount)
class DiscountAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'discount_type', 'value', 'is_active', 'start_date', 'end_date')
    list_filter = ('discount_type', 'is_active')
    search_fields = ('product__name', 'variant__sku', 'category__name', 'promo_campaign__name')
    autocomplete_fields = ['product', 'variant', 'category', 'promo_campaign']


class ProductVideoInline(admin.TabularInline):
    model = ProductVideo
    extra = 1
    fields = ('title', 'url', 'platform', 'thumbnail', 'sort_order')


@admin.register(ProductVideo)
class ProductVideoAdmin(admin.ModelAdmin):
    list_display = ('title', 'product', 'platform', 'sort_order', 'created_at')
    list_filter = ('platform',)
    search_fields = ('title', 'product__name', 'url')
    autocomplete_fields = ['product']


@admin.register(Supplier)
class SupplierAdmin(admin.ModelAdmin):
    list_display = ('name', 'contact_person', 'email', 'phone', 'is_active')
    list_filter = ('is_active',)
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name', 'contact_person', 'email')


class WarrantyInline(admin.TabularInline):
    model = Warranty
    extra = 1
    fields = ('title', 'duration_value', 'duration_unit', 'is_active', 'document')


class CertificateInline(admin.TabularInline):
    model = Certificate
    extra = 1
    fields = ('title', 'file', 'sort_order')


@admin.register(Warranty)
class WarrantyAdmin(admin.ModelAdmin):
    list_display = ('title', 'product', 'duration', 'is_active')
    search_fields = ('title', 'product__name')
    autocomplete_fields = ['product']

    def duration(self, obj):
        return f'{obj.duration_value} {obj.get_duration_unit_display()}'
    duration.short_description = 'Срок'


@admin.register(Certificate)
class CertificateAdmin(admin.ModelAdmin):
    list_display = ('title', 'product', 'sort_order', 'created_at')
    search_fields = ('title', 'product__name')
    autocomplete_fields = ['product']


@admin.register(Banner)
class BannerAdmin(admin.ModelAdmin):
    list_display = ('title', 'placement', 'is_active', 'sort_order', 'start_date', 'end_date')
    list_filter = ('placement', 'is_active')
    search_fields = ('title', 'subtitle')
    fieldsets = (
        ('Основное', {
            'fields': ('title', 'subtitle', 'image', 'image_mobile', 'link')
        }),
        ('Размещение', {
            'fields': ('placement', 'category', 'is_active', 'sort_order', 'start_date', 'end_date'),
        }),
    )


@admin.register(PromotionBlock)
class PromotionBlockAdmin(admin.ModelAdmin):
    list_display = ('title', 'is_active', 'sort_order', 'created_at')
    list_filter = ('is_active',)
    prepopulated_fields = {'slug': ('title',)}
    search_fields = ('title',)
    filter_horizontal = ('products', 'categories')


class BlogPostAdminForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditor5Widget(config_name='default'))

    class Meta:
        model = BlogPost
        fields = '__all__'


@admin.register(AdminSection)
class AdminSectionAdmin(admin.ModelAdmin):
    list_display = ('label', 'key', 'is_visible', 'is_visible_by_default', 'sort_order')
    list_editable = ('is_visible', 'is_visible_by_default', 'sort_order')
    list_filter = ('is_visible', 'is_visible_by_default')

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False


@admin.register(BlogPost)
class BlogPostAdmin(admin.ModelAdmin):
    form = BlogPostAdminForm
    list_display = ('title', 'status', 'published_at', 'created_at')
    list_filter = ('status',)
    prepopulated_fields = {'slug': ('title',)}
    search_fields = ('title', 'excerpt', 'content')
    autocomplete_fields = ['author']
    filter_horizontal = ('tags', 'related_products')
    fieldsets = (
        ('Основное', {
            'fields': ('title', 'slug', 'excerpt', 'content', 'image', 'author', 'status')
        }),
        ('Связи', {
            'fields': ('tags', 'related_products'),
        }),
        ('SEO', {
            'fields': ('meta_title', 'meta_description'),
        }),
        ('Даты', {
            'fields': ('published_at',),
        }),
    )