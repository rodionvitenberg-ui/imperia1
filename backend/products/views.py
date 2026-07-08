from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import filters
from rest_framework.permissions import IsAuthenticated
from django.db.models import Q, Case, When, IntegerField
import re
from .models import Product, Category, Attribute, Brand, ProductAttribute, Review
from .serializers import (
    ProductSerializer, ProductListSerializer, CategorySerializer,
    AttributeSerializer, BrandSerializer, ReviewSerializer,
)
from django_filters.rest_framework import DjangoFilterBackend
from .filters import ProductFilter


def normalize_search_text(text):
    """
    Нормализует текст для поиска: приводит к нижнему регистру и убирает лишние пробелы
    """
    if not text:
        return ""
    normalized = re.sub(r'\s+', ' ', text.lower().strip())
    return normalized


class CustomSearchFilter(filters.SearchFilter):
    """
    Кастомный фильтр поиска с приоритизацией результатов и поддержкой русского регистра
    """
    def filter_queryset(self, request, queryset, view):
        search_term = self.get_search_terms(request)
        if not search_term:
            return queryset

        search_query = normalize_search_text(search_term[0])
        if not search_query:
            return queryset

        q_objects = (
            Q(name__icontains=search_query) |
            Q(description__icontains=search_query) |
            Q(attributes__value_str__icontains=search_query) |
            Q(variants__name__icontains=search_query) |
            Q(brands__name__icontains=search_query) |
            Q(categories__name__icontains=search_query)
        )

        filtered_queryset = queryset.filter(q_objects).distinct()

        if filtered_queryset.count() == 0:
            original_query = search_term[0]
            q_objects_original = (
                Q(name__icontains=original_query) |
                Q(description__icontains=original_query) |
                Q(attributes__value_str__icontains=original_query) |
                Q(variants__name__icontains=original_query) |
                Q(brands__name__icontains=original_query) |
                Q(categories__name__icontains=original_query)
            )
            filtered_queryset = queryset.filter(q_objects_original).distinct()

        return filtered_queryset.annotate(
            search_priority=Case(
                When(name__icontains=search_query, then=1),
                When(brands__name__icontains=search_query, then=2),
                When(categories__name__icontains=search_query, then=3),
                When(attributes__value_str__icontains=search_query, then=4),
                When(description__icontains=search_query, then=5),
                When(name__icontains=search_term[0], then=1),
                When(brands__name__icontains=search_term[0], then=2),
                When(categories__name__icontains=search_term[0], then=3),
                When(attributes__value_str__icontains=search_term[0], then=4),
                When(description__icontains=search_term[0], then=5),
                default=6,
                output_field=IntegerField(),
            )
        ).order_by('search_priority', '-id')


class ProductViewSet(viewsets.ModelViewSet):
    """
    API эндпоинт для просмотра и редактирования товаров.
    """
    queryset = Product.objects.filter(is_active=True).prefetch_related(
        'attributes__attribute',
        'brands',
        'images',
        'categories',
        'variants__attributes__attribute',
        'variants__images',
        'variants__stock_records',
        'stock_records',
    )
    lookup_field = 'slug'
    filter_backends = (DjangoFilterBackend, CustomSearchFilter)
    filterset_class = ProductFilter

    def get_serializer_class(self):
        """Используем облегчённый сериализатор для списка."""
        if self.action == 'list':
            return ProductListSerializer
        return ProductSerializer

    def get_queryset(self):
        queryset = super().get_queryset()
        exclude_id = self.request.GET.get('exclude_id')
        if exclude_id:
            try:
                exclude_id = int(exclude_id)
                queryset = queryset.exclude(id=exclude_id)
            except (ValueError, TypeError):
                pass
        return queryset

    @action(detail=True, methods=['post'], permission_classes=[IsAuthenticated])
    def reviews(self, request, slug=None):
        try:
            product = self.get_object()
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

        existing_review = Review.objects.filter(product=product, customer=request.user).first()

        if existing_review:
            serializer = ReviewSerializer(
                existing_review,
                data=request.data,
                context={'request': request, 'product_id': product.id}
            )
            if serializer.is_valid():
                review = serializer.save()
                return Response(
                    {'message': 'Ваш отзыв успешно обновлен', 'review': ReviewSerializer(review).data},
                    status=status.HTTP_200_OK
                )
        else:
            serializer = ReviewSerializer(
                data=request.data,
                context={'request': request, 'product_id': product.id}
            )
            if serializer.is_valid():
                review = serializer.save(product=product, customer=request.user)
                return Response(
                    {'message': 'Ваш отзыв успешно добавлен', 'review': ReviewSerializer(review).data},
                    status=status.HTTP_201_CREATED
                )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CategoryViewSet(viewsets.ReadOnlyModelViewSet):
    """
    ViewSet для просмотра категорий.
    """
    queryset = Category.objects.all().prefetch_related('children')
    serializer_class = CategorySerializer

    @action(detail=True, methods=['get'])
    def brands(self, request, pk=None):
        """Возвращает список брендов, которые есть у товаров в данной категории и подкатегориях."""
        try:
            category = Category.objects.get(pk=pk)
        except Category.DoesNotExist:
            return Response({"error": "Category not found"}, status=404)

        def get_all_child_ids(category_obj):
            children = category_obj.children.all()
            ids = [category_obj.id]
            for child in children:
                ids.extend(get_all_child_ids(child))
            return ids

        category_ids = get_all_child_ids(category)

        brands = Brand.objects.filter(
            product__categories__id__in=category_ids
        ).distinct()

        serializer = BrandSerializer(brands, many=True)
        return Response(serializer.data)

    @action(detail=True, methods=['get'])
    def filters(self, request, pk=None):
        """Возвращает структуру для построения фильтров на фронтенде."""
        try:
            category = Category.objects.get(pk=pk)
        except Category.DoesNotExist:
            return Response({"error": "Category not found"}, status=404)

        def get_all_child_ids(category_obj):
            children = category_obj.children.all()
            ids = [category_obj.id]
            for child in children:
                ids.extend(get_all_child_ids(child))
            return ids

        category_ids = get_all_child_ids(category)

        product_attributes = ProductAttribute.objects.filter(
            product__categories__id__in=category_ids
        ).select_related('attribute')

        filters_data = {}
        for pa in product_attributes:
            attr = pa.attribute
            if attr.id not in filters_data:
                filters_data[attr.id] = {
                    "id": attr.id,
                    "name": attr.name,
                    "slug": attr.slug,
                    "unit": attr.unit,
                    "type": attr.type,
                    "values": set()
                }
            display_val = pa.get_display_value()
            if display_val:
                filters_data[attr.id]["values"].add(display_val)

        response_data = list(filters_data.values())
        for item in response_data:
            item["values"] = sorted(list(item["values"]))

        return Response(response_data)


class AttributeViewSet(viewsets.ModelViewSet):
    """
    API эндпоинт для просмотра и редактирования атрибутов.
    """
    queryset = Attribute.objects.all()
    serializer_class = AttributeSerializer