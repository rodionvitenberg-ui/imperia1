from django.urls import path
from django.views.decorators.csrf import csrf_exempt
from . import views

app_name = 'customers'

urlpatterns = [
    # Order endpoints
    path('orders/create/', csrf_exempt(views.create_order), name='create_order'),
    path('orders/', views.user_orders, name='user_orders'),
    path('orders/<int:order_id>/', views.order_detail, name='order_detail'),
    
    # Registration endpoint (legacy - auth now handled by auth_app)
    path('register/', views.RegistrationView.as_view(), name='register'),
]