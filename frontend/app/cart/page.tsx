// src/app/cart/page.tsx
'use client';

import React from 'react';
import { useCart } from '@/contexts/CartContext';
import CartItem from '@/components/CartItem';
import CartSummary from '@/components/CartSummary';
import UniversalBreadcrumbs from '@/components/UniversalBreadcrumbs';
import Link from 'next/link';

export default function CartPage() {
  const { items } = useCart();

  return (
    <div className="min-h-screen">
      <div className="max-w-[1400px] mx-auto px-5 py-12">
        {/* Breadcrumbs */}
        <div className="mb-8">
          <UniversalBreadcrumbs />
        </div>

        {items.length === 0 ? (
          /* Пустая корзина */
          <div className="text-center py-16">
            <div className="max-w-md mx-auto">
              <svg 
                className="w-24 h-24 mx-auto text-[#bfbfbf] mb-6" 
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
              <h1 
                className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-4"
                style={{ fontFamily: 'var(--font-display)' }}
              >
                Ваша корзина пуста
              </h1>
              <p 
                className="text-[14px] leading-[20px] text-gray-500 mb-8"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Добавьте товары в корзину, чтобы оформить заказ
              </p>
              <div className="flex flex-col sm:flex-row items-center justify-center gap-3">
                <Link 
                  href="/"
                  className="inline-flex items-center justify-center rounded-full bg-[#1061cd] px-7 py-3.5 text-sm font-bold text-white hover:bg-[#0f54b3] transition-colors min-w-[220px]"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  <svg className="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 16l-4-4m0 0l4-4m-4 4h18" />
                  </svg>
                  Перейти к покупкам
                </Link>
                <Link
                  href="/order-status"
                  className="inline-flex items-center justify-center rounded-full border border-[#1061cd] px-7 py-3.5 text-sm font-bold text-[#1061cd] hover:bg-[#1061cd]/5 transition-colors min-w-[220px]"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Проверить статус заказа
                </Link>
              </div>
              <p
                className="text-[12px] leading-[16px] text-gray-400 mt-4"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Есть номер вроде Айбек-1? Узнайте, на каком этапе ваш заказ
              </p>
            </div>
          </div>
        ) : (
          /* Наполненная корзина */
          <>
            {/* Заголовок */}
            <div className="flex items-center justify-between mb-8">
              <h1 
                className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121]"
                style={{ fontFamily: 'var(--font-display)' }}
              >
                Корзина
              </h1>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
              {/* Левая колонка - товары */}
              <div className="lg:col-span-2 space-y-4">
                {items.map((item) => (
                  <CartItem key={item.product.id} item={item} />
                ))}

                {/* Информация о доставке */}
                <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-5">
                  <h3 
                    className="text-[14px] leading-[20px] font-bold text-[#212121] mb-4"
                    style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                  >
                    Информация о доставке
                  </h3>
                  <div className="space-y-4">
                    <div className="flex items-start gap-3">
                      <svg className="w-5 h-5 text-[#1061cd] flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>
                      <div>
                        <h4 
                          className="text-[14px] leading-[20px] font-bold text-[#212121]"
                          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                        >
                          Быстрая доставка
                        </h4>
                        <p 
                          className="text-[13px] leading-[18px] text-gray-500"
                          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                        >
                          Заказы принимаются до 17:00
                        </p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <svg className="w-5 h-5 text-[#1061cd] flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                      </svg>
                      <div>
                        <h4 
                          className="text-[14px] leading-[20px] font-bold text-[#212121]"
                          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                        >
                          +996 555 95 34 75
                        </h4>
                        <p 
                          className="text-[13px] leading-[18px] text-gray-500"
                          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                        >
                          Консультация с менеджером
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              {/* Правая колонка - итоги */}
              <div className="lg:col-span-1">
                <div className="sticky top-8">
                  <CartSummary 
                    showContinueShopping={false}
                  />
                </div>
              </div>
            </div>
          </>
        )}
      </div>
    </div>
  );
}