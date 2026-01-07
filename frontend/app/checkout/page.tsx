'use client';

import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { showCustomToast } from '@/components/CustomToast';
import { useCart } from '@/contexts/CartContext';
import { useAuth } from '@/contexts/AuthContext';
import OrderForm, { OrderFormData } from '@/components/OrderForm';
import { API_CONFIG } from '@/lib/config';

export default function CheckoutPage() {
  const { items, totalPrice, clearCart } = useCart();
  const { user } = useAuth();
  const router = useRouter();
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Функция для создания полного URL изображения
  const buildImageUrl = (imagePath: string) => {
    if (!imagePath) return '/placeholder.jpg';
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }
    const baseUrl = API_CONFIG.BASE_URL; 
    return `${baseUrl}${imagePath.startsWith('/') ? imagePath : '/' + imagePath}`;
  };

  // Redirect to cart if no items
  useEffect(() => {
    if (items.length === 0) {
      showCustomToast.error('Ваша корзина пуста');
      router.push('/cart');
    }
  }, [items.length, router]);

  // Handle successful order
  const handleOrderSubmit = async (formData: OrderFormData) => {
    setIsSubmitting(true);
    try {
      // Подготовка данных заказа
      // В OrderForm поля называются firstName, lastName (camelCase),
      // а бэкенд ждет first_name, last_name (snake_case).
      // Преобразуем данные:
      const orderData = {
        first_name: formData.firstName,
        last_name: formData.lastName,
        email: formData.email,
        phone1: formData.phone1,
        phone2: formData.phone2,
        address: formData.address,
        comments: formData.comments,
        
        // Данные о товарах
        items: items.map(item => ({
          product_id: item.product.id,
          quantity: item.quantity,
          price: item.product.price
        })),
        total_amount: totalPrice,
        customer: user?.id || null 
      };

      console.log('Sending order data:', orderData);

      const response = await fetch(API_CONFIG.ORDERS.CREATE, {
        method: 'POST',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(orderData),
      });

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        console.error('Order creation error:', errorData);
        throw new Error(errorData.detail || errorData.message || 'Ошибка при создании заказа');
      }

      const result = await response.json();
      console.log('Order created:', result);

      clearCart();
      showCustomToast.success('Заказ успешно оформлен!');
      
      router.push('/');
      
    } catch (error) {
      console.error('Checkout error:', error);
      const errorMessage = error instanceof Error ? error.message : 'Произошла ошибка при оформлении заказа';
      showCustomToast.error(errorMessage);
    } finally {
      setIsSubmitting(false);
    }
  };

  if (items.length === 0) {
    return null;
  }

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="container mx-auto px-4">
        <h1 className="text-3xl font-bold mb-8 text-center">Оформление заказа</h1>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 max-w-6xl mx-auto">
          {/* Order Form */}
          <div className="bg-white p-6 rounded-lg shadow-md">
            <h2 className="text-xl font-semibold mb-6">Контактные данные</h2>
            
            {/* ИСПРАВЛЕНИЕ: Передаем просто user, компонент сам разберется с полями */}
            <OrderForm 
              onSubmit={handleOrderSubmit} 
              isSubmitting={isSubmitting} 
              user={user}
            />
          </div>

          {/* Order Summary */}
          <div className="bg-white p-6 rounded-lg shadow-md h-fit">
            <h2 className="text-xl font-semibold mb-6">Ваш заказ</h2>
            
            <div className="space-y-4 mb-6 max-h-96 overflow-y-auto pr-2">
              {items.map((item) => {
                const imageUrl = buildImageUrl(item.product.images?.[0]?.image);
                
                return (
                <div key={item.product.id} className="flex gap-4 py-2 border-b last:border-0">
                  <div className="relative w-16 h-16 flex-shrink-0 bg-gray-100 rounded-md overflow-hidden">
                    {/* eslint-disable-next-line @next/next/no-img-element */}
                    <img 
                      src={imageUrl} 
                      alt={item.product.name}
                      className="object-cover w-full h-full"
                    />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-sm font-medium line-clamp-2">{item.product.name}</h3>
                    <div className="flex justify-between mt-1 text-sm text-gray-500">
                      <span>{item.quantity} шт.</span>
                      <span className="font-medium text-gray-900">
                        {(parseFloat(item.product.price) * item.quantity).toLocaleString('ru-RU')} сом
                      </span>
                    </div>
                  </div>
                </div>
                );
              })}
            </div>

            {/* Summary */}
            <div className="border-t pt-4 space-y-2">
              <div className="flex justify-between text-sm">
                <span className="text-gray-600">Товары:</span>
                <span className="font-medium">{totalPrice.toLocaleString('ru-RU')} сом</span>
              </div>
              <div className="flex justify-between text-sm">
                <span className="text-gray-600">Доставка:</span>
                <span className="font-medium text-green-600">Бесплатно</span>
              </div>
              <div className="flex justify-between text-lg font-bold border-t pt-2">
                <span>Итого:</span>
                <span>{totalPrice.toLocaleString('ru-RU')} сом</span>
              </div>
            </div>

            {/* Info */}
            <div className="mt-6 text-xs text-gray-500 space-y-1">
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