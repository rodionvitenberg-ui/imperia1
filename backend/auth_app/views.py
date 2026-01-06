from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, AllowAny
from django.contrib.auth import login, logout
from django.views.decorators.csrf import csrf_exempt, ensure_csrf_cookie
from django.utils.decorators import method_decorator
from django.middleware.csrf import get_token
from .serializers import (
    RegisterSerializer, 
    LoginSerializer, 
    ChangePasswordSerializer, 
    UserSerializer
)


@ensure_csrf_cookie
@api_view(['POST'])
@permission_classes([AllowAny])
def register_view(request):
    """Регистрация нового пользователя"""
    try:
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            
            # Автоматически авторизуем пользователя после регистрации
            try:
                login(request, user)
                user_data = UserSerializer(user).data
                return Response({
                    'message': 'Регистрация прошла успешно',
                    'user': user_data
                }, status=status.HTTP_201_CREATED)
            except Exception as login_error:
                # Возвращаем успешную регистрацию даже если логин не удался
                user_data = UserSerializer(user).data
                return Response({
                    'message': 'Регистрация прошла успешно. Пожалуйста, войдите в систему.',
                    'user': user_data
                }, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        import traceback
        traceback.print_exc()
        return Response({
            'error': 'Внутренняя ошибка сервера',
            'details': str(e)
        }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@ensure_csrf_cookie
@api_view(['POST'])
@permission_classes([AllowAny])
def login_view(request):
    """Авторизация пользователя"""
    # Принудительно создаем сессию, если ее нет
    if not request.session.session_key:
        request.session.create()
    
    serializer = LoginSerializer(data=request.data)
    
    if serializer.is_valid():
        user = serializer.validated_data['user']
        
        try:
            login(request, user)
            
            # Принудительно сохраняем сессию
            request.session.save()
            
            user_data = UserSerializer(user).data
            response = Response({
                'message': 'Авторизация прошла успешно',
                'user': user_data
            }, status=status.HTTP_200_OK)
            
            # Принудительно устанавливаем sessionid cookie
            session_key = request.session.session_key
            if session_key:
                response.set_cookie(
                    'sessionid',
                    session_key,
                    max_age=86400,  # 24 hours
                    httponly=True,
                    samesite='Lax',  # Lax для same-origin localhost
                    secure=False,  # False for development
                    domain=None  # None для текущего домена
                )
            
            return response
        except Exception as login_error:
            import traceback
            traceback.print_exc()
            return Response({
                'error': 'Ошибка при входе в систему'
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    else:
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def logout_view(request):
    """Выход пользователя"""
    logout(request)
    return Response({
        'message': 'Вы успешно вышли из системы'
    }, status=status.HTTP_200_OK)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def change_password_view(request):
    """Смена пароля"""
    serializer = ChangePasswordSerializer(data=request.data, context={'request': request})
    if serializer.is_valid():
        user = request.user
        user.set_password(serializer.validated_data['new_password'])
        user.save()
        return Response({
            'message': 'Пароль успешно изменен'
        }, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_info_view(request):
    """Получение информации о текущем пользователе"""
    user_data = UserSerializer(request.user).data
    return Response({
        'user': user_data
    }, status=status.HTTP_200_OK)


@api_view(['GET'])
@permission_classes([AllowAny])
def auth_status_view(request):
    """Проверка статуса авторизации"""
    if request.user.is_authenticated:
        user_data = UserSerializer(request.user).data
        return Response({
            'is_authenticated': True,
            'user': user_data,
            'session_key': request.session.session_key,
        }, status=status.HTTP_200_OK)
    else:
        return Response({
            'is_authenticated': False,
            'user': None,
            'session_key': request.session.session_key,
        }, status=status.HTTP_200_OK)


@ensure_csrf_cookie
@api_view(['GET'])
@permission_classes([AllowAny])
def csrf_token_view(request):
    """Получение CSRF токена"""
    token = get_token(request)
    return Response({
        'csrfToken': token
    }, status=status.HTTP_200_OK)