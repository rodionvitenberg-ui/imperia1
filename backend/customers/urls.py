from django.urls import path
from . import views

app_name = 'customers'

urlpatterns = [
    # Order endpoints
    path('orders/create/', views.create_order, name='create_order'),
    path('orders/', views.user_orders, name='user_orders'),
    path('orders/<int:order_id>/', views.order_detail, name='order_detail'),
]
