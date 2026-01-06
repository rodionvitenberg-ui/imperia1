"""
Сервис для отправки уведомлений через Telegram и Email
"""
import asyncio
import aiohttp
import requests
import logging
from typing import Dict, List, Optional, Any
from django.conf import settings
from django.utils import timezone
from django.template.loader import render_to_string
from django.core.mail import send_mail

from .models import NotificationSettings, NotificationLog


logger = logging.getLogger(__name__)


class TelegramService:
    """Сервис для работы с Telegram Bot API"""
    
    def __init__(self):
        self.bot_token = getattr(settings, 'TELEGRAM_BOT_TOKEN', '')
        self.base_url = f"https://api.telegram.org/bot{self.bot_token}"
    
    async def send_message_async(self, chat_id: str, message: str, parse_mode: str = 'HTML') -> Dict[str, Any]:
        """Асинхронная отправка сообщения в Telegram"""
        if not self.bot_token:
            return {'success': False, 'error': 'Telegram bot token не настроен'}
        
        url = f"{self.base_url}/sendMessage"
        data = {
            'chat_id': chat_id,
            'text': message,
            'parse_mode': parse_mode
        }
        
        try:
            async with aiohttp.ClientSession() as session:
                async with session.post(url, json=data) as response:
                    result = await response.json()
                    
                    if response.status == 200 and result.get('ok'):
                        return {'success': True, 'data': result}
                    else:
                        error_msg = result.get('description', 'Неизвестная ошибка')
                        return {'success': False, 'error': error_msg}
                        
        except Exception as e:
            logger.error(f"Ошибка отправки Telegram сообщения: {e}")
            return {'success': False, 'error': str(e)}
    
    def send_message_sync(self, chat_id: str, message: str, parse_mode: str = 'HTML') -> Dict[str, Any]:
        """Синхронная отправка сообщения в Telegram"""
        if not self.bot_token:
            return {'success': False, 'error': 'Telegram bot token не настроен'}
        
        url = f"{self.base_url}/sendMessage"
        data = {
            'chat_id': chat_id,
            'text': message,
            'parse_mode': parse_mode
        }
        
        try:
            response = requests.post(url, json=data, timeout=10)
            result = response.json()
            
            if response.status_code == 200 and result.get('ok'):
                return {'success': True, 'data': result}
            else:
                error_msg = result.get('description', 'Неизвестная ошибка')
                return {'success': False, 'error': error_msg}
                
        except Exception as e:
            logger.error(f"Ошибка отправки Telegram сообщения: {e}")
            return {'success': False, 'error': str(e)}


class EmailService:
    """Сервис для отправки email уведомлений"""
    
    @staticmethod
    def send_email(to_email: str, subject: str, message: str) -> Dict[str, Any]:
        """Отправка email уведомления"""
        try:
            send_mail(
                subject=subject,
                message=message,
                from_email=getattr(settings, 'DEFAULT_FROM_EMAIL', 'noreply@shop.com'),
                recipient_list=[to_email],
                fail_silently=False,
            )
            return {'success': True}
            
        except Exception as e:
            logger.error(f"Ошибка отправки email: {e}")
            return {'success': False, 'error': str(e)}


class NotificationManager:
    """Основной менеджер для отправки уведомлений"""
    
    def __init__(self):
        self.telegram_service = TelegramService()
        self.email_service = EmailService()
    
    @classmethod
    def get_active_settings(cls) -> Optional[NotificationSettings]:
        """Получение активных настроек уведомлений"""
        try:
            # Берем первые активные настройки или создаем дефолтные
            settings_obj = NotificationSettings.objects.first()
            if not settings_obj:
                settings_obj = NotificationSettings.objects.create(
                    name="Основные уведомления",
                    telegram_enabled=True,
                    notify_new_orders=True
                )
            return settings_obj
        except Exception as e:
            logger.error(f"Ошибка получения настроек: {e}")
            return None
    
    def format_order_message(self, order) -> str:
        """Форматирование сообщения о заказе для Telegram"""
        # Получаем товары в заказе
        items_text = ""
        total_items = 0
        
        for item in order.items.all():
            items_text += f"• {item.product.name}\n"
            items_text += f"  Количество: {item.quantity} шт.\n"
            items_text += f"  Цена: {item.price} сом\n"
            items_text += f"  Сумма: {item.total_price} сом\n\n"
            total_items += item.quantity
        
        # Определяем статус клиента
        customer_info = "👤 Гостевой заказ"
        if order.customer:
            customer_info = f"👤 Клиент: {order.customer.email}"
        
        message = f"""
🛒 <b>НОВЫЙ ЗАКАЗ!</b>

📋 <b>Заказ:</b> #{order.order_number}
💰 <b>Сумма:</b> {order.total_amount} сом
📦 <b>Товаров:</b> {total_items} шт.

{customer_info}

👤 <b>Контакты:</b>
• Имя: {order.first_name} {order.last_name}
• Email: {order.email}
• Телефон: {order.phone1}
{f'• Доп. телефон: {order.phone2}' if order.phone2 else ''}

📍 <b>Адрес доставки:</b>
{order.address}

{f'💬 <b>Комментарий:</b>\n{order.comments}\n' if order.comments else ''}

🛍️ <b>Товары в заказе:</b>
{items_text}

🕐 <b>Время заказа:</b> {order.created_at.strftime('%d.%m.%Y %H:%M')}
📊 <b>Статус:</b> {order.get_status_display()}
        """.strip()
        
        return message
    
    def send_order_notification(self, order, notification_type: str = 'new_order') -> Dict[str, Any]:
        """Отправка уведомления о заказе"""
        settings_obj = self.get_active_settings()
        if not settings_obj:
            return {'success': False, 'error': 'Настройки уведомлений не найдены'}
        
        results = {}
        
        # Отправка через Telegram
        if settings_obj.telegram_enabled and settings_obj.notify_new_orders and settings_obj.telegram_chat_id:
            message = self.format_order_message(order)
            
            # Создаем лог записи
            log_entry = NotificationLog.objects.create(
                notification_type='telegram',
                recipient=settings_obj.telegram_chat_id,
                message=message,
                order=order,
                status='pending'
            )
            
            # Отправляем сообщение
            result = self.telegram_service.send_message_sync(
                chat_id=settings_obj.telegram_chat_id,
                message=message
            )
            
            # Обновляем лог
            if result['success']:
                log_entry.status = 'sent'
                log_entry.sent_at = timezone.now()
            else:
                log_entry.status = 'failed'
                log_entry.error_message = result.get('error', 'Неизвестная ошибка')
            
            log_entry.save()
            results['telegram'] = result
        
        # Отправка через Email (если настроено)
        if settings_obj.email_enabled and settings_obj.notify_new_orders and settings_obj.email_address:
            subject = f"Новый заказ #{order.order_number}"
            message = f"""
Получен новый заказ #{order.order_number}

Клиент: {order.first_name} {order.last_name}
Email: {order.email}
Телефон: {order.phone1}
Сумма: {order.total_amount} сом

Время заказа: {order.created_at.strftime('%d.%m.%Y %H:%M')}
            """.strip()
            
            # Создаем лог записи
            log_entry = NotificationLog.objects.create(
                notification_type='email',
                recipient=settings_obj.email_address,
                message=message,
                order=order,
                status='pending'
            )
            
            # Отправляем email
            result = self.email_service.send_email(
                to_email=settings_obj.email_address,
                subject=subject,
                message=message
            )
            
            # Обновляем лог
            if result['success']:
                log_entry.status = 'sent'
                log_entry.sent_at = timezone.now()
            else:
                log_entry.status = 'failed'
                log_entry.error_message = result.get('error', 'Неизвестная ошибка')
            
            log_entry.save()
            results['email'] = result
        
        return results
    
    @classmethod
    def send_order_notifications(cls, order) -> Dict[str, Any]:
        """Статический метод для отправки уведомлений о заказе"""
        manager = cls()
        return manager.send_order_notification(order)
    
    def send_test_notification(self, chat_id: str) -> Dict[str, Any]:
        """Отправка тестового уведомления"""
        message = """
🔔 <b>ТЕСТ УВЕДОМЛЕНИЙ</b>

✅ Telegram бот настроен правильно!
🛒 Теперь вы будете получать уведомления о новых заказах.

Настройки можно изменить в админ-панели Django.
        """.strip()
        
        return self.telegram_service.send_message_sync(
            chat_id=chat_id,
            message=message
        )


# Удобные функции для быстрого использования
def send_order_notification(order):
    """Быстрая отправка уведомления о заказе"""
    return NotificationManager.send_order_notifications(order)


def send_test_telegram_notification(chat_id: str):
    """Быстрая отправка тестового уведомления"""
    manager = NotificationManager()
    return manager.send_test_notification(chat_id)