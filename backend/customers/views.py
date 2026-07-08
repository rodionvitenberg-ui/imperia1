import logging
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.views.decorators.csrf import csrf_exempt
from .models import Order
from .serializers import OrderCreateSerializer, OrderSerializer

logger = logging.getLogger(__name__)


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



