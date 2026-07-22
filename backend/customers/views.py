import logging
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.views.decorators.csrf import csrf_exempt
from .models import Order
from .serializers import OrderCreateSerializer, OrderSerializer, OrderPublicSerializer

logger = logging.getLogger(__name__)


def normalize_phone(phone: str) -> str:
    """Оставляет только цифры телефона."""
    return ''.join(c for c in (phone or '') if c.isdigit())


def phones_match(stored: str, provided: str) -> bool:
    """
    Сравнивает телефоны с допуском разных форматов
    (+996… / 0… / пробелы). Совпадение по полным цифрам
    или по последним 9 цифрам (локальный номер).
    """
    a = normalize_phone(stored)
    b = normalize_phone(provided)
    if not a or not b:
        return False
    if a == b:
        return True
    # Сравниваем «хвост» — обычно 9 цифр без кода страны
    return a[-9:] == b[-9:] and len(a) >= 9 and len(b) >= 9


@csrf_exempt
@api_view(['POST'])
@permission_classes([AllowAny])
def create_order(request):
    """Создание нового заказа"""
    try:
        logger.debug(f"Received order data: {request.data}")
        logger.debug(f"User: {request.user} (authenticated: {request.user.is_authenticated})")
        
        serializer = OrderCreateSerializer(data=request.data)
        
        if serializer.is_valid():
            logger.info("Serializer is valid, creating order...")
            order = serializer.save()
            
            # Привязываем заказ к пользователю, если он авторизован
            if request.user.is_authenticated:
                logger.info(f"Linking order to user: {request.user.email}")
                order.customer = request.user
                order.save()
            
            # Возвращаем данные созданного заказа
            response_serializer = OrderSerializer(order)
            logger.info(f"Order created successfully: {order.order_number}")
            
            return Response({
                'success': True,
                'message': 'Заказ успешно создан',
                'order': response_serializer.data
            }, status=status.HTTP_201_CREATED)
        else:
            logger.warning(f"Serializer validation errors: {serializer.errors}")
            return Response({
                'success': False,
                'errors': serializer.errors,
                'message': 'Ошибка валидации данных'
            }, status=status.HTTP_400_BAD_REQUEST)
            
    except Exception as e:
        logger.exception(f"Exception in create_order: {str(e)}")
        return Response({
            'success': False,
            'message': 'Внутренняя ошибка сервера',
            'error': str(e)
        }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_orders(request):
    """Получение списка заказов текущего пользователя"""
    orders = Order.objects.filter(customer=request.user).order_by('-created_at')
    serializer = OrderSerializer(orders, many=True)
    
    return Response({
        'orders': serializer.data
    }, status=status.HTTP_200_OK)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def order_detail(request, order_id):
    """Получение деталей конкретного заказа"""
    try:
        order = Order.objects.get(id=order_id, customer=request.user)
        serializer = OrderSerializer(order)
        
        return Response({
            'order': serializer.data
        }, status=status.HTTP_200_OK)
    
    except Order.DoesNotExist:
        return Response({
            'error': 'Заказ не найден'
        }, status=status.HTTP_404_NOT_FOUND)


@api_view(['GET'])
@permission_classes([AllowAny])
def order_lookup(request):
    """
    Публичный поиск заказа по номеру + телефону (без регистрации).
    Оба параметра обязательны; при несовпадении — 404 без утечки данных.
    """
    order_number = (request.query_params.get('order_number') or '').strip()
    phone = (request.query_params.get('phone') or '').strip()

    if not order_number or not phone:
        return Response(
            {
                'success': False,
                'message': 'Укажите номер заказа и телефон',
            },
            status=status.HTTP_400_BAD_REQUEST,
        )

    try:
        order = Order.objects.prefetch_related('items__product').get(
            order_number__iexact=order_number
        )
    except Order.DoesNotExist:
        return Response(
            {
                'success': False,
                'message': 'Заказ не найден. Проверьте номер и телефон.',
            },
            status=status.HTTP_404_NOT_FOUND,
        )

    if not phones_match(order.phone1, phone) and not phones_match(order.phone2, phone):
        # Тот же ответ, что и при отсутствии заказа — без enumeration
        return Response(
            {
                'success': False,
                'message': 'Заказ не найден. Проверьте номер и телефон.',
            },
            status=status.HTTP_404_NOT_FOUND,
        )

    return Response(
        {
            'success': True,
            'order': OrderPublicSerializer(order).data,
        },
        status=status.HTTP_200_OK,
    )

