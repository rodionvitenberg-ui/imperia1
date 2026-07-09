from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from .models import ServiceItem
from .serializers import ServiceItemSerializer


class ServiceItemViewSet(viewsets.ReadOnlyModelViewSet):
    """Только чтение: список услуг и одна услуга."""
    queryset = ServiceItem.objects.filter(is_active=True)
    serializer_class = ServiceItemSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]