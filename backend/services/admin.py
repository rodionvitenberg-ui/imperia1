from django.contrib import admin
from .models import ServiceItem


@admin.register(ServiceItem)
class ServiceItemAdmin(admin.ModelAdmin):
    list_display = ['name', 'price', 'category', 'is_active', 'sort_order']
    list_filter = ['category', 'is_active']
    search_fields = ['name']
    list_editable = ['price', 'category', 'is_active', 'sort_order']