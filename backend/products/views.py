from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import filters
from rest_framework.permissions import IsAuthenticated
from django.db.models import Q, Case, When, IntegerField
from django.db.models.functions import Lower
import re
from .models import Product, Category, Attribute, Tag, ProductAttribute, Review
from .serializers import ProductSerializer, CategorySerializer, AttributeSerializer, TagSerializer, ReviewSerializer
from django_filters.rest_framework import DjangoFilterBackend
from .filters import ProductFilter


def normalize_search_text(text):
    """
    Нормализует текст для поиска: приводит к нижнему регистру и убирает лишние пробелы
    """
    if not text:
        return ""
    # Приводим к нижнему регистру и убираем лишние пробелы
    normalized = re.sub(r'\s+', ' ', text.lower().strip())
    return normalized


def python_text_search(text, search_query):
    """
    Поиск на Python уровне для лучшей поддержки кириллицы
    """
    if not text or not search_query:
        return False
    
    text_normalized = normalize_search_text(text)
    query_normalized = normalize_search_text(search_query)
    
    return query_normalized in text_normalized


class CustomSearchFilter(filters.SearchFilter):
    """
    Кастомный фильтр поиска с приоритизацией результатов и поддержкой русского регистра
    """
    def filter_queryset(self, request, queryset, view):
        search_term = self.get_search_terms(request)
        if not search_term:
            return queryset
            
        # Нормализуем поисковый запрос
        search_query = normalize_search_text(search_term[0])
        
        if not search_query:
            return queryset
        
        # Для SQLite используем комбинацию icontains и постобработку на Python
        
        # Сначала пробуем стандартный поиск
        q_objects = (
            Q(name__icontains=search_query) |
            Q(description__icontains=search_query) |
            Q(attributes__value__icontains=search_query) |
            Q(tags__name__icontains=search_query) |
            Q(categories__name__icontains=search_query)
        )
        
        filtered_queryset = queryset.filter(q_objects).distinct()
        
        # Если результатов мало, добавляем поиск по оригинальному регистру
        if filtered_queryset.count() == 0:
            original_query = search_term[0]  # Оригинальный запрос
            q_objects_original = (
                Q(name__icontains=original_query) |
                Q(description__icontains=original_query) |
                Q(attributes__value__icontains=original_query) |
                Q(tags__name__icontains=original_query) |
                Q(categories__name__icontains=original_query)
            )
            filtered_queryset = queryset.filter(q_objects_original).distinct()
        
        # Добавляем приоритизацию
        return filtered_queryset.annotate(
            search_priority=Case(
                When(name__icontains=search_query, then=1),
                When(tags__name__icontains=search_query, then=2), 
                When(categories__name__icontains=search_query, then=3),
                When(attributes__value__icontains=search_query, then=4),
                When(description__icontains=search_query, then=5),
                # Проверяем также по оригинальному запросу
                When(name__icontains=search_term[0], then=1),
                When(tags__name__icontains=search_term[0], then=2),
                When(categories__name__icontains=search_term[0], then=3),
                When(attributes__value__icontains=search_term[0], then=4),
                When(description__icontains=search_term[0], then=5),
                default=6,
                output_field=IntegerField(),
            )
        ).order_by('search_priority', '-id')


# Представление для Товаров
class ProductViewSet(viewsets.ModelViewSet):
    """
    API эндпоинт для просмотра и редактирования товаров.
    """
    queryset = Product.objects.filter(is_active=True).prefetch_related('attributes__attribute', 'tags', 'images', 'categories')
    serializer_class = ProductSerializer
    lookup_field = 'slug'
    filter_backends = (DjangoFilterBackend, CustomSearchFilter)
    
    # --- ПОДКЛЮЧАЕМ НАШ КАСТОМНЫЙ КЛАСС ФИЛЬТРАЦИИ ---
    filterset_class = ProductFilter
    
    def get_queryset(self):
        """Добавляем поддержку exclude_id параметра"""
        queryset = super().get_queryset()
        
        # Поддержка exclude_id для связанных товаров
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
        """
        Эндпоинт для создания или обновления отзыва к товару
        """
        try:
            product = self.get_object()
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)
        
        # Проверяем, есть ли уже отзыв от этого пользователя
        existing_review = Review.objects.filter(product=product, customer=request.user).first()
        
        if existing_review:
            # Обновляем существующий отзыв
            serializer = ReviewSerializer(
                existing_review,
                data=request.data, 
                context={'request': request, 'product_id': product.id}
            )
            
            if serializer.is_valid():
                review = serializer.save()
                return Response(
                    {
                        'message': 'Ваш отзыв успешно обновлен',
                        'review': ReviewSerializer(review).data
                    }, 
                    status=status.HTTP_200_OK
                )
        else:
            # Создаем новый отзыв
            serializer = ReviewSerializer(
                data=request.data, 
                context={'request': request, 'product_id': product.id}
            )
            
            if serializer.is_valid():
                review = serializer.save(product=product, customer=request.user)
                return Response(
                    {
                        'message': 'Ваш отзыв успешно добавлен',
                        'review': ReviewSerializer(review).data
                    }, 
                    status=status.HTTP_201_CREATED
                )
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Представление для Категорий
class CategoryViewSet(viewsets.ReadOnlyModelViewSet):
    """
    ViewSet для просмотра категорий.
    """
    # <--- ВОТ ИСПРАВЛЕНИЕ
    # Мы возвращаем queryset в исходное состояние.
    # Он снова будет отдавать ВСЕ категории, чтобы мегаменю могло их обработать.
    # prefetch_related - это оптимизация, чтобы уменьшить кол-во запросов к базе.
    queryset = Category.objects.all().prefetch_related('children')
    serializer_class = CategorySerializer

    # Наш новый эндпоинт для брендов остается без изменений и будет работать корректно.
    @action(detail=True, methods=['get'])
    def brands(self, request, pk=None):
        """
        Возвращает список брендов (тегов), которые есть у товаров
        в данной категории и всех ее дочерних категориях.
        """
        try:
            category = Category.objects.get(pk=pk)
        except Category.DoesNotExist:
            return Response({"error": "Category not found"}, status=404)

        # Рекурсивная функция для сбора ID всех дочерних категорий
        def get_all_child_ids(category_obj):
            children = category_obj.children.all()
            ids = [category_obj.id]
            for child in children:
                ids.extend(get_all_child_ids(child))
            return ids

        category_ids = get_all_child_ids(category)

        # Находим все уникальные теги (бренды) у товаров в этих категориях
        tags = Tag.objects.filter(
            product__categories__id__in=category_ids
        ).distinct()

        serializer = TagSerializer(tags, many=True)
        return Response(serializer.data)

    @action(detail=True, methods=['get'])
    def filters(self, request, pk=None):
        """
        Возвращает структуру для построения фильтров на фронтенде.
        Анализирует все товары в категории (и подкатегориях) и возвращает
        список атрибутов и всех возможных значений для них.
        """
        try:
            category = Category.objects.get(pk=pk)
        except Category.DoesNotExist:
            return Response({"error": "Category not found"}, status=404)

        # Рекурсивная функция для сбора ID всех дочерних категорий
        def get_all_child_ids(category_obj):
            children = category_obj.children.all()
            ids = [category_obj.id]
            for child in children:
                ids.extend(get_all_child_ids(child))
            return ids

        category_ids = get_all_child_ids(category)

        # Находим все атрибуты товаров в этих категориях
        product_attributes = ProductAttribute.objects.filter(
            product__categories__id__in=category_ids
        ).select_related('attribute')

        # Группируем значения по атрибутам
        filters_data = {}
        for pa in product_attributes:
            attr = pa.attribute
            if attr.id not in filters_data:
                filters_data[attr.id] = {
                    "id": attr.id,
                    "name": attr.name,
                    "slug": attr.slug,
                    "unit": attr.unit,
                    "values": set()  # Используем set для автоматического исключения дубликатов
                }
            filters_data[attr.id]["values"].add(pa.value)

        # Преобразуем set в list для JSON-сериализации
        response_data = list(filters_data.values())
        for item in response_data:
            item["values"] = sorted(list(item["values"]))

        return Response(response_data)


# Представление для Атрибутов
class AttributeViewSet(viewsets.ModelViewSet):
    """
    API эндпоинт для просмотра и редактирования атрибутов (нашего справочника).
    """
    queryset = Attribute.objects.all()
    serializer_class = AttributeSerializer


