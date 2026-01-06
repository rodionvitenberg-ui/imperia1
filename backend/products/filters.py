import django_filters
from django.db.models import Q
from .models import Product, Attribute

class ProductFilter(django_filters.FilterSet):
    """Исправленный фильтр для товаров с поддержкой атрибутов"""
    
    categories__slug = django_filters.CharFilter(method='filter_by_categories')
    tags__slug = django_filters.CharFilter(method='filter_by_brands')
    is_new = django_filters.BooleanFilter(field_name='is_new')
    is_favorite = django_filters.BooleanFilter(field_name='is_favorite')

    def filter_by_categories(self, queryset, name, value):
        """Фильтрация по множественным категориям"""
        category_slugs = self.request.GET.getlist('categories__slug')
        if category_slugs:
            return queryset.filter(categories__slug__in=category_slugs).distinct()
        return queryset

    def filter_by_brands(self, queryset, name, value):
        """Фильтрация по множественным брендам"""
        brand_slugs = self.request.GET.getlist('tags__slug')
        if brand_slugs:
            return queryset.filter(tags__slug__in=brand_slugs).distinct()
        return queryset

    def filter_queryset(self, queryset):
        """Основной метод фильтрации с поддержкой атрибутов"""
        queryset = super().filter_queryset(queryset)
        
        # Обработка атрибутов из параметров запроса
        # Проверяем параметры вида attributes[attr_slug]=value1,value2
        for key, values in self.request.GET.items():
            if key.startswith('attributes[') and key.endswith(']'):
                attr_slug = key[key.find('[')+1:key.find(']')]
                if values:
                    values_list = values.split(',')
                    queryset = queryset.filter(
                        attributes__attribute__slug=attr_slug,
                        attributes__value__in=values_list
                    ).distinct()
        
        # Также поддерживаем JSON формат
        attributes_param = self.request.GET.get('attributes')
        if attributes_param:
            try:
                import json
                attributes = json.loads(attributes_param)
                
                for attr_slug, values in attributes.items():
                    if values and isinstance(values, list):
                        queryset = queryset.filter(
                            attributes__attribute__slug=attr_slug,
                            attributes__value__in=values
                        ).distinct()
                        
            except (json.JSONDecodeError, ValueError):
                pass
        
        return queryset

    class Meta:
        model = Product
        fields = ['categories__slug', 'tags__slug', 'is_new', 'is_favorite']