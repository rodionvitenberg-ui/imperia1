import re
import django_filters
from django.db.models import Q
from .models import Product, Attribute


class ProductFilter(django_filters.FilterSet):
    """Фильтр для товаров с поддержкой брендов, атрибутов и вариантов."""

    categories__slug = django_filters.CharFilter(method='filter_by_categories')
    brands__slug = django_filters.CharFilter(method='filter_by_brands')
    is_new = django_filters.BooleanFilter(field_name='is_new')
    is_favorite = django_filters.BooleanFilter(field_name='is_favorite')
    min_price = django_filters.NumberFilter(method='filter_by_min_price')
    max_price = django_filters.NumberFilter(method='filter_by_max_price')
    in_stock = django_filters.BooleanFilter(method='filter_in_stock')

    def filter_by_categories(self, queryset, name, value):
        """Фильтрация по множественным категориям."""
        category_slugs = self.request.GET.getlist('categories__slug')
        if category_slugs:
            return queryset.filter(categories__slug__in=category_slugs).distinct()
        return queryset

    def filter_by_brands(self, queryset, name, value):
        """Фильтрация по множественным брендам."""
        brand_slugs = self.request.GET.getlist('brands__slug')
        if brand_slugs:
            return queryset.filter(brands__slug__in=brand_slugs).distinct()
        return queryset

    def filter_by_min_price(self, queryset, name, value):
        """Фильтрация по минимальной цене (учитывает варианты)."""
        from django.db.models import Min, Coalesce
        annotated = queryset.annotate(
            _effective_price=Coalesce(
                Min('variants__price_override', filter=Q(variants__is_active=True)),
                'price'
            )
        )
        return annotated.filter(_effective_price__gte=value)

    def filter_by_max_price(self, queryset, name, value):
        """Фильтрация по максимальной цене (учитывает варианты)."""
        from django.db.models import Min, Coalesce
        annotated = queryset.annotate(
            _effective_price=Coalesce(
                Min('variants__price_override', filter=Q(variants__is_active=True)),
                'price'
            )
        )
        return annotated.filter(_effective_price__lte=value)

    def filter_in_stock(self, queryset, name, value):
        """Фильтрация: только товары в наличии."""
        if value:
            return queryset.filter(
                Q(stock_records__quantity__gt=0) |
                Q(variants__stock_records__quantity__gt=0)
            ).distinct()
        return queryset

    def filter_queryset(self, queryset):
        """Основной метод фильтрации с поддержкой типизированных атрибутов."""
        queryset = super().filter_queryset(queryset)

        # Обработка формата attributes[slug]=val1,val2
        for key, values in self.request.GET.items():
            if key.startswith('attributes[') and key.endswith(']'):
                attr_slug = key[key.find('[') + 1:key.find(']')]
                if values:
                    queryset = self._apply_attribute_filter(queryset, attr_slug, values.split(','))
                    queryset = queryset.distinct()

        # Обработка JSON-формата: attributes={"slug": ["val1","val2"]}
        attributes_param = self.request.GET.get('attributes')
        if attributes_param:
            try:
                import json
                attributes = json.loads(attributes_param)
                for attr_slug, vals in attributes.items():
                    if vals and isinstance(vals, list):
                        queryset = self._apply_attribute_filter(queryset, attr_slug, vals)
                        queryset = queryset.distinct()
            except (json.JSONDecodeError, ValueError):
                pass

        return queryset

    def _apply_attribute_filter(self, queryset, attr_slug, values):
        """
        Применяет фильтр по атрибуту с учётом его типа.
        - str/enum: фильтр по value_str или value_enum
        - int: диапазонный фильтр, если values вида ["min,max"]
        - bool: фильтр по value_bool
        """
        try:
            attr = Attribute.objects.only('type').get(slug=attr_slug)
        except Attribute.DoesNotExist:
            return queryset

        if attr.type == 'int':
            # Извлекаем числовые значения из строк (отбрасываем единицы измерения)
            # Например "8 ГБ" → 8, "1000 ГБ" → 1000
            numeric_values = []
            for v in values:
                match = re.search(r'-?\d+', str(v))
                if match:
                    numeric_values.append(int(match.group()))
            
            if not numeric_values:
                return queryset
            
            # Поддержка диапазона: attributes[frequency]=100,500
            if len(numeric_values) == 2:
                min_val, max_val = numeric_values[0], numeric_values[1]
                return queryset.filter(
                    Q(attributes__attribute__slug=attr_slug) &
                    Q(attributes__value_int__gte=min_val) &
                    Q(attributes__value_int__lte=max_val)
                )
            # Одиночное значение — точное совпадение
            val = numeric_values[0]
            return queryset.filter(
                attributes__attribute__slug=attr_slug,
                attributes__value_int=val
            )

        elif attr.type == 'bool':
            bool_val = values[0].lower() in ('true', '1', 'yes', 'да')
            return queryset.filter(
                attributes__attribute__slug=attr_slug,
                attributes__value_bool=bool_val
            )

        elif attr.type == 'enum':
            return queryset.filter(
                attributes__attribute__slug=attr_slug,
                attributes__value_enum__in=values
            )

        else:
            # str — значение по умолчанию
            return queryset.filter(
                attributes__attribute__slug=attr_slug,
                attributes__value_str__in=values
            )

    class Meta:
        model = Product
        fields = [
            'categories__slug',
            'brands__slug',
            'is_new',
            'is_favorite',
            'min_price',
            'max_price',
            'in_stock',
        ]
