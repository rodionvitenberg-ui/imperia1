from django.contrib import admin
from django import forms
from django.utils.safestring import mark_safe
from .models import Category, Product, Attribute, ProductAttribute, Tag, ProductImage, Review


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'header_order', 'parent', 'slug')
    list_editable = ('header_order',)
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name',)
    exclude = ('tags',)


@admin.register(Attribute)
class AttributeAdmin(admin.ModelAdmin):
    list_display = ('name', 'unit')
    search_fields = ('name',)



# @admin.register(Tag)
# class TagAdmin(admin.ModelAdmin):
#     verbose_name = "Бренд"
#     verbose_name_plural = "Бренды"
#     list_display = ('name', 'slug')
#     prepopulated_fields = {'slug': ('name',)}



# ФОРМА ТОВАРА БЕЗ ТЕГОВ (брендов)
class ProductAdminForm(forms.ModelForm):
    """
    Кастомная форма товара без поля тегов
    Теги отключены по решению разработчика
    """
    class Meta:
        model = Product
        fields = '__all__'
        # Отключаем поле tags из формы
        exclude = ('tags',)




# --- Встроенные редакторы (без изменений) ---
class ProductAttributeInline(admin.TabularInline):
    model = ProductAttribute
    extra = 1


class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1
    readonly_fields = ('image_preview',)

    def image_preview(self, obj):
        if obj.image:
            return mark_safe(f'<img src="{obj.image.url}" width="100" />')
        return "Нет изображения"

    image_preview.short_description = "Превью"


# --- Основная админка Товара ---
@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    # Подключаем нашу кастомную форму
    form = ProductAdminForm

    # --- 2. ВКЛЮЧАЕМ ПОЛЕ АВТОДОПОЛНЕНИЯ ---
    autocomplete_fields = ['categories'] # Эта строка заменяет выпадающий список на поиск

    list_display = ('name', 'get_categories', 'price', 'is_active')  # Убрали get_brand
    list_filter = ('categories', 'is_active')  # Убрали 'tags' из фильтров
    search_fields = ('name', 'description')
    inlines = [ProductAttributeInline, ProductImageInline]
    prepopulated_fields = {'slug': ('name',)}

    # Функция для отображения категорий в списке товаров
    def get_categories(self, obj):
        return ", ".join([cat.name for cat in obj.categories.all()])
    
    get_categories.short_description = 'Категории'

    # Функция get_brand удалена - теги отключены


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('product', 'customer', 'rating', 'created_at')
    list_filter = ('rating', 'created_at')
    search_fields = ('product__name', 'customer__email')
    readonly_fields = ('created_at',)
    
    def get_queryset(self, request):
        return super().get_queryset(request).select_related('product', 'customer')
