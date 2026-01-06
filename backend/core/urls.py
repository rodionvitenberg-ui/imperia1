from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    
    # Мы пока создали только customers, поэтому раскомментируем по мере наполнения файлов urls.py в приложениях
    
    # path('api/auth/', include('auth_app.urls')),
    # path('api/products/', include('products.urls')),
    
    # Если в customers уже есть urls.py - раскомментируй, иначе пока держи так:
    # path('api/customers/', include('customers.urls')),
]

# Раздача медиа-файлов в режиме отладки (для картинок товаров)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)