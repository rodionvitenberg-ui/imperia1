// src/app/checkout/page.tsx
'use client';

import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { showCustomToast } from '@/components/CustomToast';
import { useCart } from '@/contexts/CartContext';
import { useAuth } from '@/contexts/AuthContext';
import OrderForm from '@/components/OrderForm';

const API_BASE_URL = 'http://92.113.146.158';

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
    return `${API_BASE_URL}${imagePath.startsWith('/') ? imagePath : '/' + imagePath}`;
  };

  // Redirect to cart if no items
  useEffect(() => {
    if (items.length === 0) {
      showCustomToast.error('Ваша корзина пуста');
      router.push('/cart');
    }
  }, [items.length, router]);

  // Handle successful order
  const handleOrderSuccess = () => {
    
    // Clear cart
    clearCart();
    
    // Show success toast
    showCustomToast.success('🎉 Заказ успешно оформлен!\n\nНаш менеджер свяжется с вами в течение часа.', 4000);
    
    // Redirect to home page
    router.push('/');
  };

  // Handle form submission
  const handleSubmitOrder = async (orderData: any) => {
    setIsSubmitting(true);
    
    try {
      // Prepare data for backend
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
      
      // Submit order to backend
      const response = await fetch('http://localhost:8000/api/customers/orders/create/', {
        method: 'POST',
        credentials: 'include',
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
      showCustomToast.error('Произошла ошибка при оформлении заказа. Попробуйте еще раз.');
    }
  };

  // Don't render if no items (will redirect)
  if (items.length === 0) {
    return null;
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Оформление заказа</h1>
          <p className="text-gray-600">Заполните данные для доставки заказа</p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Order Form */}
          <div className="bg-white rounded-lg shadow-sm p-6">
            <h2 className="text-xl font-semibold text-gray-900 mb-6">Данные для доставки</h2>
            <OrderForm 
              onSubmit={handleSubmitOrder}
              isSubmitting={isSubmitting}
              user={user}
            />
          </div>

          {/* Order Summary */}
          <div className="bg-white rounded-lg shadow-sm p-6">
            <h2 className="text-xl font-semibold text-gray-900 mb-6">Ваш заказ</h2>
            
            {/* Items list */}
            <div className="space-y-4 mb-6">
              {items.map((item) => {
                // Найдем главное изображение или возьмем первое
                const mainImage = item.product.images?.find(img => img.is_main) || item.product.images?.[0];
                
                return (
                <div key={item.product.id} className="flex gap-4">
                  <div className="w-16 h-16 bg-gray-100 rounded-lg flex-shrink-0">
                    {mainImage ? (
                      <img 
                        src={buildImageUrl(mainImage.image)}
                        alt={item.product.name}
                        className="w-full h-full object-cover rounded-lg"
                      />
                    ) : (
                      <div className="w-full h-full flex items-center justify-center">
                        <svg className="w-8 h-8 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                        </svg>
                      </div>
                    )}
                  </div>
                  <div className="flex-1">
                    <h3 className="font-medium text-gray-900 text-sm line-clamp-2">
                      {item.product.name}
                    </h3>
                    <div className="flex justify-between items-center mt-2">
                      <span className="text-sm text-gray-600">Количество: {item.quantity}</span>
                      <span className="font-semibold text-gray-900">
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