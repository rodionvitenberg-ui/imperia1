"""
Django сигналы для автоматической отправки уведомлений
"""
import logging
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from django.utils import timezone

from customers.models import Order
from .services import NotificationManager

logger = logging.getLogger(__name__)


@receiver(post_save, sender=Order)
def send_order_notification_signal(sender, instance, created, **kwargs):
    """
    Сигнал для отправки уведомления при создании нового заказа
    """
    if created:  # Только для новых заказов
        try:
            logger.info(f"🔔 Отправка уведомления о новом заказе: {instance.order_number}")
            
            # Отправляем уведомления
            results = NotificationManager.send_order_notifications(instance)
            
            # Логируем результаты
            for service, result in results.items():
                if result.get('success'):
                    logger.info(f"✅ Уведомление через {service} отправлено успешно для заказа {instance.order_number}")
                else:
                    logger.error(f"❌ Ошибка отправки через {service} для заказа {instance.order_number}: {result.get('error')}")
                    
        except Exception as e:
            logger.error(f"❌ Критическая ошибка при отправке уведомлений для заказа {instance.order_number}: {e}")


@receiver(pre_save, sender=Order)
def order_status_change_notification(sender, instance, **kwargs):
    """
    Сигнал для уведомления об изменении статуса заказа
    """
    if instance.pk:  # Только для существующих заказов
        try:
            # Получаем старый статус из базы
            old_order = Order.objects.get(pk=instance.pk)
            old_status = old_order.status
            new_status = instance.status
            
            # Если статус изменился
            if old_status != new_status:
                logger.info(f"📊 Изменение статуса заказа {instance.order_number}: {old_status} → {new_status}")
                
                # Получаем настройки уведомлений
                settings_obj = NotificationManager.get_active_settings()
                
                if settings_obj and settings_obj.notify_status_changes:
                    # Отправляем уведомление об изменении статуса
                    send_status_change_notification(instance, old_status, new_status)
                    
        except Order.DoesNotExist:
            # Заказ не существует в базе, это нормально для новых заказов
            pass
        except Exception as e:
            logger.error(f"❌ Ошибка при обработке изменения статуса заказа {instance.order_number}: {e}")


def send_status_change_notification(order, old_status, new_status):
    """
    Отправка уведомления об изменении статуса заказа
    """
    try:
        settings_obj = NotificationManager.get_active_settings()
        if not settings_obj:
            return
        
        # Создаем сообщение об изменении статуса
        status_emoji = {
            'pending': '🕐',
            'confirmed': '✅', 
            'shipped': '🚚',
            'delivered': '📦',
            'cancelled': '❌'
        }
        
        old_status_display = dict(Order.STATUS_CHOICES).get(old_status, old_status)
        new_status_display = dict(Order.STATUS_CHOICES).get(new_status, new_status)
        
        message = f"""
📊 <b>ИЗМЕНЕНИЕ СТАТУСА ЗАКАЗА</b>

📋 <b>Заказ:</b> #{order.order_number}
💰 <b>Сумма:</b> {order.total_amount} сом

👤 <b>Клиент:</b>
{order.first_name} {order.last_name}
📧 {order.email}
📞 {order.phone1}

📈 <b>Статус изменен:</b>
{status_emoji.get(old_status, '📋')} {old_status_display} → {status_emoji.get(new_status, '📋')} {new_status_display}

🕐 <b>Время изменения:</b> {timezone.now().strftime('%d.%m.%Y %H:%M')}
        """.strip()
        
        # Отправляем через Telegram
        if settings_obj.telegram_enabled and settings_obj.telegram_chat_id:
            manager = NotificationManager()
            result = manager.telegram_service.send_message_sync(
                chat_id=settings_obj.telegram_chat_id,
                message=message
            )
            
            # Логируем результат
            from .models import NotificationLog
            log_entry = NotificationLog.objects.create(
                notification_type='telegram',
                recipient=settings_obj.telegram_chat_id,
                message=message,
                order=order,
                status='sent' if result['success'] else 'failed',
                error_message=result.get('error', '') if not result['success'] else '',
                sent_at=timezone.now() if result['success'] else None
            )
            
            if result['success']:
                logger.info(f"✅ Уведомление об изменении статуса отправлено для заказа {order.order_number}")
            else:
                logger.error(f"❌ Ошибка отправки уведомления об изменении статуса для заказа {order.order_number}: {result.get('error')}")
                
    except Exception as e:
        logger.error(f"❌ Критическая ошибка при отправке уведомления об изменении статуса: {e}")


# Дополнительные сигналы для других событий (можно расширить в будущем)

@receiver(post_save, sender=Order)
def log_order_creation(sender, instance, created, **kwargs):
    """
    Логирование создания заказов
    """
    if created:
        logger.info(f"🛒 Создан новый заказ: {instance.order_number} на сумму {instance.total_amount} сом ")


# Сигнал для тестирования (можно использовать в разработке)
def send_test_notification_signal():
    """
    Функция для ручного тестирования отправки уведомлений
    """
    try:
        settings_obj = NotificationManager.get_active_settings()
        if settings_obj and settings_obj.telegram_chat_id:
            manager = NotificationManager()
            result = manager.send_test_notification(settings_obj.telegram_chat_id)
            
            if result['success']:
                logger.info("✅ Тестовое уведомление отправлено успешно")
                return True
            else:
                logger.error(f"❌ Ошибка отправки тестового уведомления: {result.get('error')}")
                return False
        else:
            logger.error("❌ Настройки Telegram не найдены")
            return False
            
    except Exception as e:
        logger.error(f"❌ Критическая ошибка при отправке тестового уведомления: {e}")
        return False