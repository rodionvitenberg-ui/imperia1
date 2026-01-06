// src/components/CheckoutModal.tsx
'use client';

import React, { useState, useEffect } from 'react';
import toast from 'react-hot-toast';
import { useCart } from '@/contexts/CartContext';
import { useAuth } from '@/contexts/AuthContext';
import OrderForm from './OrderForm';
import { API_CONFIG } from '@/lib/config';

interface CheckoutModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export default function CheckoutModal({ isOpen, onClose }: CheckoutModalProps) {
  const { items, totalPrice } = useCart();
  const { user } = useAuth(); // Добавляем пользователя
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Блокируем скролл body когда модал открыт
  useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = 'hidden';
    } else {
      setIsSubmitting(false);
    }

    return () => {
      document.body.style.overflow = 'unset';
    };
  }, [isOpen]);

  const { clearCart } = useCart();

  // Обработка успешного заказа
  const handleOrderSuccess = () => {
    
    // Очищаем корзину
    clearCart();
    
    // Показываем toast-уведомление
    toast.success('🎉 Заказ успешно оформлен!\n\nНаш менеджер свяжется с вами в течение часа.', {
      duration: 6000,
    });
    
    // Закрываем модал
    onClose();
  };

  // Обработка отправки формы
  const handleSubmitOrder = async (orderData: any) => {
    setIsSubmitting(true);
    try {
      // Подготавливаем данные для отправки (приводим к формату backend)
      const orderPayload = {
        first_name: orderData.firstName,
        last_name: orderData.lastName,
        email: orderData.email,
        phone1: orderData.phone1,
        phone2: orderData.phone2 || '',
        address: orderData.address,
        comments: orderData.comments || '',
        items: items.map(item => ({
          product_id: item.product.id,
          quantity: item.quantity
        }))
      };
      
      // Отправка заказа на сервер
      const response = await fetch(`${API_CONFIG.BASE_URL}/customers/orders/create/`, {
        method: 'POST',
        credentials: 'include', // Важно для сессий
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(orderPayload),
      });
      
      const data = await response.json();
      
      if (response.ok && data.success) {
        handleOrderSuccess();
      } else {
        throw new Error(data.message || 'Ошибка при создании заказа');
      }
    } catch (error) {
      console.error('❌ Ошибка при оформлении заказа:', error);
      setIsSubmitting(false);
      toast.error('Произошла ошибка при оформлении заказа. Попробуйте еще раз.');
    }
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-[50] overflow-y-auto">
      {/* Overlay */}
      <div className="fixed inset-0 bg-opacity-30 backdrop-blur-sm transition-opacity" onClick={onClose} />
      
      {/* Modal Content */}
      <div className="flex min-h-full items-center justify-center p-4">
        <div className="relative bg-white rounded-lg shadow-xl w-full max-w-2xl max-h-[90vh] overflow-hidden">
          
          {/* Header */}
          <div className="flex items-center justify-between p-6 border-b border-gray-200">
            <h2 className="text-2xl font-bold text-gray-900">
              Оформление заказа
            </h2>
            <button
              onClick={onClose}
              className="text-gray-400 hover:text-gray-600 transition-colors"
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          {/* Body */}
          <div className="overflow-y-auto max-h-[calc(90vh-140px)]">
            <div className="p-6">
              {/* Order Summary */}
              <div className="bg-gray-50 rounded-lg p-4 mb-6">
                <h3 className="font-semibold text-gray-900 mb-3">Ваш заказ</h3>
                <div className="space-y-2">
                  {items.slice(0, 3).map((item) => (
                    <div key={item.product.id} className="flex justify-between text-sm">
                      <span className="truncate pr-2">
                        {item.product.name} × {item.quantity}
                      </span>
                      <span className="font-medium">
                        {(parseFloat(item.product.price) * item.quantity).toLocaleString('ru-RU')} сом
                      </span>
                    </div>
                  ))}
                  {items.length > 3 && (
                    <div className="text-sm text-gray-500">
                      ... и ещё {items.length - 3} товар(ов)
                    </div>
                  )}
                  <div className="border-t pt-2 mt-3">
                    <div className="flex justify-between text-sm">
                      <span>Доставка:</span>
                      <span className="text-green-600 font-medium">Бесплатно</span>
                    </div>
                    <div className="flex justify-between font-semibold">
                      <span>Итого:</span>
                      <span>{totalPrice.toLocaleString('ru-RU')} сом</span>
                    </div>
                  </div>
                </div>
              </div>

              {/* Order Form */}
              <OrderForm 
                onSubmit={handleSubmitOrder}
                isSubmitting={isSubmitting}
                user={user}
              />
            </div>
          </div>

          {/* Footer */}
          <div className="border-t border-gray-200 p-6 bg-gray-50">
            <div className="text-xs text-gray-500 space-y-1">
              <p>
                <strong>Обратите внимание:</strong> После оформления заказа с вами свяжется менеджер 
                для подтверждения деталей заказа и согласования времени доставки.
              </p>
              <p>
                Оплата производится при получении товара. Принимаем наличные и банковские карты.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}