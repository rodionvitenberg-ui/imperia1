'use client';

import React from 'react';
import Link from 'next/link';

export default function OrderSuccessPage() {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="max-w-md mx-auto px-5 text-center">
        {/* Иконка успеха */}
        <div className="w-20 h-20 mx-auto mb-6 rounded-full bg-green-100 flex items-center justify-center">
          <svg className="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
          </svg>
        </div>

        <h1 
          className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-4"
          style={{ fontFamily: 'var(--font-display)' }}
        >
          Заказ успешно оформлен!
        </h1>

        <p 
          className="text-[14px] leading-[20px] text-gray-500 mb-2"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Спасибо за ваш заказ. Наш менеджер свяжется с вами в ближайшее время для подтверждения и уточнения деталей доставки.
        </p>

        <p 
          className="text-[14px] leading-[20px] text-gray-500 mb-8"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Пожалуйста, ожидайте звонка в течение 15–30 минут.
        </p>

        {/* Информационные блоки */}
        <div className="space-y-3 mb-8 text-left">
          <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-4 flex items-start gap-3">
            <svg className="w-5 h-5 text-[#1061cd] flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
            </svg>
            <div>
              <h4 
                className="text-[13px] leading-[18px] font-bold text-[#212121]"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                +996 555 95 34 75
              </h4>
              <p 
                className="text-[12px] leading-[16px] text-gray-500"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Если у вас есть вопросы, звоните нам
              </p>
            </div>
          </div>

          <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-4 flex items-start gap-3">
            <svg className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <div>
              <h4 
                className="text-[13px] leading-[18px] font-bold text-[#212121]"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Доставка в день заказа
              </h4>
              <p 
                className="text-[12px] leading-[16px] text-gray-500"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                При заказе до 17:00 — доставим сегодня
              </p>
            </div>
          </div>
        </div>

        <Link
          href="/"
          className="inline-flex items-center justify-center rounded-full bg-[#1061cd] px-7 py-3.5 text-sm font-bold text-white hover:bg-[#0f54b3] transition-colors min-w-[300px]"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Продолжить покупки
        </Link>
      </div>
    </div>
  );
}