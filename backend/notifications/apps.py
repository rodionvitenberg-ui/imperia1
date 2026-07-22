from django.apps import AppConfig


class NotificationsConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'notifications'
    verbose_name = 'Уведомления'
    
    def ready(self):
        """Регистрируем сигналы при запуске приложения"""
        import notifications.signals
        import notifications.revalidation_signals
