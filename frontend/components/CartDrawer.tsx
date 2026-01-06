// src/components/CartDrawer.tsx
'use client';

import React from 'react';
import { useCart } from '@/contexts/CartContext';
import CartItem from './CartItem';
import CartSummary from './CartSummary';

export default function CartDrawer() {
  const { items, totalItems, totalPrice, isOpen, closeCart, clearCart } = useCart();

  if (!isOpen) return null;

  return (
    <>
      {/* Оверлей */}
      <div 
        className="fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity"
        onClick={closeCart}
      />
      
      {/* Панель корзины */}
      <div className="fixed right-0 top-0 h-full w-full max-w-md bg-white shadow-xl z-50 transform transition-transform duration-300 ease-in-out">
        {/* Заголовок */}
        <div className="flex items-center justify-between p-4 border-b">
          <h2 className="text-lg font-semibold">
            Корзина {totalItems > 0 && `(${totalItems})`}
          </h2>
          <div className="flex items-center gap-2">
            {items.length > 0 && (
              <button
                onClick={clearCart}
                className="text-sm text-red-600 hover:text-red-800 px-2 py-1 rounded transition-colors"
              >
                Очистить
              </button>
            )}
            <button
              onClick={closeCart}
              className="p-2 hover:bg-gray-100 rounded-full transition-colors"
              aria-label="Закрыть корзину"
            >
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>

        {/* Содержимое корзины */}
        <div className="flex-1 overflow-hidden flex flex-col">
          {items.length === 0 ? (
            /* Пустая корзина */
            <div className="flex-1 flex items-center justify-center p-8">
              <div className="text-center">
                <svg 
                  className="w-16 h-16 mx-auto text-gray-300 mb-4" 
                  fill="none" 
                  stroke="currentColor" 
                  viewBox="0 0 24 24"
                >
                  <path 
                    strokeLinecap="round" 
                    strokeLinejoin="round" 
                    strokeWidth={1} 
                    d="M3 3h2l.4 2M7 13h10l4-8H5.4m0 0L7 13m0 0l-2.5 5M7 13l2.5 5m6-5v6a2 2 0 11-4 0v-6m4 0V9a2 2 0 10-4 0v4.01" 
                  />
                </svg>
                <p className="text-gray-500 text-sm">Ваша корзина пуста</p>
                <p className="text-gray-400 text-xs mt-1">Добавьте товары для оформления заказа</p>
              </div>
            </div>
          ) : (
            <>
              {/* Список товаров */}
              <div className="flex-1 overflow-y-auto p-4 space-y-4">
                {items.map((item) => (
                  <CartItem key={item.product.id} item={item} />
                ))}
              </div>

              {/* Итоги и кнопка оформления */}
              <CartSummary onContinueShopping={closeCart} />
            </>
          )}
        </div>
      </div>
    </>
  );
}