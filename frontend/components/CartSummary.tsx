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
      // Redirect to checkout page instead of opening modal
      router.push('/checkout');
      closeCart(); // Close cart drawer if open
    }
  };

  if (totalItems === 0) {
    return null;
  }

  return (
    <div className="border-t border-gray-200 p-4 space-y-4 bg-white">
      {/* Order Summary */}
      <div className="space-y-3">
        <h3 className="text-lg font-semibold text-gray-900">Итоги заказа</h3>
        
        {/* Subtotal */}
        <div className="flex justify-between items-center text-sm">
          <span className="text-gray-600">
            Подытог ({totalItems} {totalItems === 1 ? 'товар' : totalItems < 5 ? 'товара' : 'товаров'}):
          </span>
          <span className="font-medium text-gray-900">
            {totalPrice.toLocaleString('ru-RU')} сом
          </span>
        </div>

        {/* Shipping */}
        <div className="flex justify-between items-center text-sm">
          <span className="text-gray-600">Доставка:</span>
          <div className="text-right">
            <span className="font-medium text-green-600">Бесплатно</span>
            <div className="text-xs text-gray-500">По всему городу</div>
          </div>
        </div>

        {/* Discount placeholder (for future) */}
        {/* 
        <div className="flex justify-between items-center text-sm">
          <span className="text-gray-600">Скидка:</span>
          <span className="font-medium text-red-600">-500 сом</span>
        </div>
        */}

        {/* Total */}
        <div className="flex justify-between items-center pt-3 border-t border-gray-200">
          <span className="text-lg font-semibold text-gray-900">Итого:</span>
          <span className="text-xl font-bold text-gray-900">
            {totalPrice.toLocaleString('ru-RU')} сом
          </span>
        </div>

        {/* Savings note */}
        <div className="bg-green-50 border border-green-200 rounded-lg p-3">
          <div className="flex items-center gap-2">
            <svg className="w-5 h-5 text-green-600 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
            </svg>
            <div>
              <div className="text-sm font-medium text-green-800">
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
            className="w-full bg-black text-white py-3 px-4 rounded-full font-semibold text-lg hover:bg-gray-800 transition-colors duration-200 flex items-center justify-center gap-2"
          >
            Оформить заказ
          </button>
        )}
        
        {showContinueShopping && (
          <button 
            onClick={handleContinueShopping}
            className="w-full border-2 border-gray-300 text-gray-700 py-2.5 px-4 rounded-full font-medium hover:bg-gray-50 hover:border-gray-400 transition-colors duration-200"
          >
            Продолжить покупки
          </button>
        )}
      </div>

      {/* Additional Info */}
      <div className="text-xs text-gray-500 space-y-1">
        <div className="flex items-center gap-2">
          <svg className="w-4 h-4 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <span>Доставка в день заказа или на следующий день</span>
        </div>
        <div className="flex items-center gap-2">
          <svg className="w-4 h-4 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
          </svg>
          <span>Менеджер свяжется с вами для подтверждения</span>
        </div>
      </div>
    </div>
  );
}