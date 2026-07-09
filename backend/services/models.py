from django.db import models


class ServiceItem(models.Model):
    """Примитивная сущность услуги: только название, цена и категория."""

    CATEGORY_CHOICES = [
        ('repair', 'Ремонт ПК и оргтехники'),
        ('maintenance', 'Обслуживание'),
    ]

    name = models.CharField(max_length=255, verbose_name="Название услуги")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")
    category = models.CharField(
        max_length=20,
        choices=CATEGORY_CHOICES,
        verbose_name="Категория",
    )
    is_active = models.BooleanField(default=True, verbose_name="Активна")
    sort_order = models.IntegerField(default=0, verbose_name="Порядок сортировки")

    class Meta:
        verbose_name = "Услуга"
        verbose_name_plural = "Услуги"
        ordering = ['category', 'sort_order', 'name']

    def __str__(self):
        return self.name