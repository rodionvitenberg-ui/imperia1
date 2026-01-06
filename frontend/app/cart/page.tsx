// src/app/cart/page.tsx
'use client';

import React, { useState } from 'react';
import { useCart } from '@/contexts/CartContext';
import CartItem from '@/components/CartItem';
import CartSummary from '@/components/CartSummary';
import UniversalBreadcrumbs from '@/components/UniversalBreadcrumbs';
import Link from 'next/link';

export default function CartPage() {
  const { items, totalItems } = useCart();

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="container mx-auto max-w-7xl px-4 py-8">

        <div className="flex items-center justify-between mb-8">
          <h1 className="text-3xl font-bold text-gray-900">
          </h1>
        </div>

        {items.length === 0 ? (
          /* Пустая корзина */
          <div className="text-center py-16">
            <div className="max-w-md mx-auto">
              <svg 
                className="w-24 h-24 mx-auto text-gray-300 mb-6" 
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
              <h2 className="text-2xl font-semibold text-gray-900 mb-4">
                Ваша корзина пуста
              </h2>
              <p className="text-gray-600 mb-8">
                Добавьте товары в корзину, чтобы оформить заказ
              </p>
              <Link 
                href="/"
                className="inline-flex items-center gap-2 bg-black text-white px-6 py-3 rounded-full font-medium hover:bg-gray-800 transition-colors"
              >
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 16l-4-4m0 0l4-4m-4 4h18" />
                </svg>
                Перейти к покупкам
              </Link>
            </div>
          </div>
        ) : (
          /* Наполненная корзина */
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* Левая колонка - товары */}
            <div className="lg:col-span-2">
              <div className="bg-gray-50 rounded-lg shadow-sm">
                <div className="p-6 border-b border-gray-200">
                  <h2 className="text-xl font-semibold text-gray-900">
                    Корзина
                  </h2>
                </div>
                <div className="p-6 space-y-6">
                  {items.map((item) => (
                    <CartItem key={item.product.id} item={item} />
                  ))}
                </div>
              </div>

              {/* Дополнительная информация */}
              <div className="mt-6 bg-gray-50 rounded-lg shadow-sm p-6">
                <h3 className="text-lg font-semibold text-gray-900 mb-4">
                  Информация о доставке
                </h3>
                <div className="space-y-4">
                  <div className="flex items-start gap-3">
                    <svg className="w-6 h-6 text-green-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    <div>
                      <h4 className="font-medium text-gray-900">Быстрая доставка</h4>
                      <p className="text-sm text-gray-600">Заказы принимаются до 17:00</p>
                    </div>
                  </div>
                  <div className="flex items-start gap-3">
                    <svg className="w-6 h-6 text-purple-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                    </svg>
                    <div>
                      <h4 className="font-medium text-gray-900">+996 555 95 34 75</h4>
                      <p className="text-sm text-gray-600">Консультация с менеджером</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Правая колонка - итоги */}
            <div className="lg:col-span-1">
              <div className="bg-gray-50 rounded-lg shadow-sm sticky top-8">
                <CartSummary 
                  showContinueShopping={false}
                />
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}