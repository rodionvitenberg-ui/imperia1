from django.core.management.base import BaseCommand
from products.models import AdminSection

SECTIONS = [
    # (key, label, is_visible, is_visible_by_default, sort_order)
    # Basic — всегда видны
    ("catalog_base", "Каталог (товары, категории, бренды)", True, True, 10),
    ("orders", "Заказы и клиенты", True, True, 20),
    ("services", "Сервис (услуги)", True, True, 30),
    ("blog", "Блог", True, True, 40),
    ("users", "Пользователи", True, True, 50),
    # Extended — скрыты по умолчанию для не-суперюзера
    ("attributes", "Атрибуты", True, False, 60),
    ("tags", "Теги", True, False, 70),
    ("variants", "Варианты товаров", True, False, 80),
    ("stock", "Остатки (склад)", True, False, 90),
    ("suppliers", "Поставщики", True, False, 100),
    ("promocampaigns", "Акции", True, False, 110),
    ("discounts", "Скидки", True, False, 120),
    ("pricehistory", "История цен", True, False, 130),
    ("videos", "Видео товаров", True, False, 140),
    ("warranties", "Гарантии", True, False, 150),
    ("certificates", "Сертификаты", True, False, 160),
    ("promoblocks", "Промо-блоки", True, False, 170),
    ("coupons", "Промокоды", True, False, 180),
    ("loyalty", "Программа лояльности", True, False, 190),
    ("banners", "Баннеры", True, False, 200),
    ("changelog", "Лог изменений", True, False, 210),
    ("groups", "Группы и права", True, False, 220),
]


class Command(BaseCommand):
    help = "Seed AdminSection records for admin dashboard visibility control"

    def handle(self, *args, **options):
        created = 0
        updated = 0
        for key, label, is_visible, is_visible_by_default, sort_order in SECTIONS:
            obj, was_created = AdminSection.objects.update_or_create(
                key=key,
                defaults={
                    "label": label,
                    "is_visible": is_visible,
                    "is_visible_by_default": is_visible_by_default,
                    "sort_order": sort_order,
                },
            )
            if was_created:
                created += 1
            else:
                updated += 1

        self.stdout.write(self.style.SUCCESS(
            f"AdminSection: {created} created, {updated} updated"
        ))