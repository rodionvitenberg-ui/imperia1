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

  // Функция для получения CSRF токена из куки
  const getCSRFToken = (): string | null => {
    if (typeof document !== 'undefined') {
      const match = document.cookie.match(/csrftoken=([^;]+)/);
      return match ? match[1] : null;
    }
    return null;
  };

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
      const orderData = {
        first_name: formData.firstName,
        last_name: formData.lastName,
        email: formData.email,
        phone1: formData.phone1,
        phone2: formData.phone2,
        address: formData.address,
        comments: formData.comments,
        items: items.map(item => ({
          product_id: item.product.id,
          quantity: item.quantity,
          price: item.product.price
        })),
        total_amount: totalPrice,
        customer: user?.id || null 
      };

      console.log('Sending order data:', orderData);

      // ИЩЕМ ТОКЕН И ГОТОВИМ ЗАГОЛОВКИ
      const csrfToken = getCSRFToken();
      const headers: Record<string, string> = {
        'Content-Type': 'application/json',
      };
      
      // Если токен есть - добавляем его (это решит ошибку 403)
      if (csrfToken) {
        headers['X-CSRFToken'] = csrfToken;
      }

      const response = await fetch(API_CONFIG.ORDERS.CREATE, {
        method: 'POST',
        credentials: 'include', // Передаем куки (сессию)
        headers: headers,       // Передаем заголовки с токеном
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
      const orderId = result?.id || '';
      router.push(`/order-success${orderId ? '?orderId=' + orderId : ''}`);
      
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
    <div className="min-h-screen">
      <div className="max-w-[1400px] mx-auto px-5 py-12">
        {/* Заголовок */}
        <div className="mb-8">
          <h1 
            className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121]"
            style={{ fontFamily: 'var(--font-display)' }}
          >
            Оформление заказа
          </h1>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-5 gap-8">
          {/* Левая колонка - форма */}
          <div className="lg:col-span-3">
            <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-6">
              <h2 
                className="text-[16px] leading-[24px] font-bold text-[#212121] mb-6"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Контактные данные
              </h2>
              <OrderForm 
                onSubmit={handleOrderSubmit} 
                isSubmitting={isSubmitting} 
                user={user}
              />
            </div>
          </div>

          {/* Правая колонка - заказ */}
          <div className="lg:col-span-2">
            <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-6 sticky top-8">
              <h2 
                className="text-[16px] leading-[24px] font-bold text-[#212121] mb-6"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Ваш заказ
              </h2>
              
              {/* Список товаров */}
              <div className="space-y-4 mb-6 max-h-96 overflow-y-auto pr-2">
                {items.map((item) => {
                  const imageUrl = buildImageUrl(item.product.images?.[0]?.image);
                  return (
                    <div key={item.product.id} className="flex gap-3 pb-4 border-b border-[#e5e7eb] last:border-0 last:pb-0">
                      <div className="relative w-14 h-14 flex-shrink-0 bg-gray-100 rounded-[8px] overflow-hidden border border-[#e5e7eb]">
                        {/* eslint-disable-next-line @next/next/no-img-element */}
                        <img src={imageUrl} alt={item.product.name} className="object-cover w-full h-full"/>
                      </div>
                      <div className="flex-1 min-w-0">
                        <h3 
                          className="text-[13px] leading-[18px] font-bold text-[#212121] line-clamp-2"
                          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                        >
                          {item.product.name}
                        </h3>
                        <div className="flex justify-between mt-1">
                          <span 
                            className="text-[12px] leading-[16px] text-gray-500"
                            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                          >
                            {item.quantity} шт.
                          </span>
                          <span 
                            className="text-[13px] leading-[18px] font-bold text-[#212121]"
                            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                          >
                            {(parseFloat(item.product.price) * item.quantity).toLocaleString('ru-RU')} сом
                          </span>
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>

              {/* Итого */}
              <div className="border-t border-[#e5e7eb] pt-4">
                <div className="flex justify-between items-center">
                  <span 
                    className="text-[16px] leading-[24px] font-bold text-[#212121]"
                    style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                  >
                    Итого:
                  </span>
                  <span 
                    className="text-[20px] leading-[24px] font-bold text-[#212121]"
                    style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                  >
                    {totalPrice.toLocaleString('ru-RU')} сом
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}