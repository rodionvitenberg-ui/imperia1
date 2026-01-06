from django.urls import path
from . import views

app_name = 'auth_app'

urlpatterns = [
    path('register/', views.register_view, name='register'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('change-password/', views.change_password_view, name='change_password'),
    path('me/', views.user_info_view, name='user_info'),
    path('status/', views.auth_status_view, name='auth_status'),
    path('csrf/', views.csrf_token_view, name='csrf_token'),
]