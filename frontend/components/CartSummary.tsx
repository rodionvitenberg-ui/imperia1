// src/components/CartSummary.tsx
'use client';

import React, { useState } from 'react';
import toast from 'react-hot-toast';
import { useRouter } from 'next/navigation';
import { useCart } from '@/contexts/CartContext';
import { useAuth } from '@/contexts/AuthContext';

interface CartSummaryProps {
  onCheckout?: () => void;
  showCheckoutButton?: boolean;
  showContinueShopping?: boolean;
  onContinueShopping?: () => void;
}

export default function CartSummary({ 
  onCheckout, 
  showCheckoutButton = true,
  showContinueShopping = true,
  onContinueShopping
}: CartSummaryProps) {
  const { items, totalItems, totalPrice, clearCart, closeCart } = useCart();
  const { user } = useAuth();
  const router = useRouter();
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleContinueShopping = () => {
    if (onContinueShopping) {
      onContinueShopping();
    } else {
      closeCart();
    }
  };

  const handleCheckout = () => {
    if (onCheckout) {
      onCheckout();
    } else {
      router.push('/checkout');
      closeCart();
    }
  };

  if (totalItems === 0) {
    return null;
  }

  return (
    <div className="border border-[#e5e7eb] rounded-[8px] p-5 space-y-5 bg-white">
      {/* Order Summary */}
      <div className="space-y-3">
        <h3 
          className="text-[16px] leading-[24px] font-bold text-[#212121]"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Итоги заказа
        </h3>
        
        {/* Subtotal */}
        <div className="flex justify-between items-center">
          <span 
            className="text-[14px] leading-[20px] text-gray-500"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Подытог ({totalItems} {totalItems === 1 ? 'товар' : totalItems < 5 ? 'товара' : 'товаров'}):
          </span>
          <span 
            className="text-[14px] leading-[20px] font-bold text-[#212121]"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            {totalPrice.toLocaleString('ru-RU')} сом
          </span>
        </div>

        {/* Shipping */}
        <div className="flex justify-between items-center">
          <span 
            className="text-[14px] leading-[20px] text-gray-500"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Доставка:
          </span>
          <div className="text-right">
            <span 
              className="text-[14px] leading-[20px] font-bold text-green-600"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Бесплатно
            </span>
            <div 
              className="text-[12px] leading-[16px] text-gray-500"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              По всему городу
            </div>
          </div>
        </div>

        {/* Total */}
        <div className="flex justify-between items-center pt-3 border-t border-[#e5e7eb]">
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

        {/* Savings note */}
        <div className="bg-green-50 border border-green-200 rounded-[8px] p-3">
          <div className="flex items-center gap-2">
            <svg className="w-5 h-5 text-green-600 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
            </svg>
            <div>
              <div 
                className="text-[13px] leading-[18px] font-bold text-green-800"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Доставка и установка бесплатно!
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Action Buttons */}
      <div className="space-y-3">
        {showCheckoutButton && (
          <button 
            onClick={handleCheckout}
            className="w-full bg-[#1061cd] text-white py-3 px-4 rounded-full text-[14px] leading-[20px] font-bold hover:bg-[#0f54b3] transition-colors duration-200 flex items-center justify-center gap-2"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Оформить заказ
          </button>
        )}
        
        {showContinueShopping && (
          <button 
            onClick={handleContinueShopping}
            className="w-full border border-[#bfbfbf] text-[#212121] py-2.5 px-4 rounded-full text-[14px] leading-[20px] font-bold hover:bg-gray-50 transition-colors duration-200"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Продолжить покупки
          </button>
        )}
      </div>

      {/* Additional Info */}
      <div className="space-y-1.5">
        <div className="flex items-center gap-2 text-[12px] leading-[16px] text-gray-500">
          <svg className="w-4 h-4 text-green-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <span style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
            Доставка в день заказа или на следующий день
          </span>
        </div>
        <div className="flex items-center gap-2 text-[12px] leading-[16px] text-gray-500">
          <svg className="w-4 h-4 text-[#1061cd] flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
          </svg>
          <span style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
            Менеджер свяжется с вами для подтверждения
          </span>
        </div>
      </div>
    </div>
  );
}