'use client';

import React, { Suspense, useEffect, useState } from 'react';
import Link from 'next/link';
import { useSearchParams } from 'next/navigation';
import { API_CONFIG } from '@/lib/config';
import {
  readLastOrder,
  lookupOrder,
  shopWhatsAppUrl,
  formatMoney,
  statusBadgeClass,
  formatOrderDateTime,
  type PublicOrder,
} from '@/lib/orderStorage';

function OrderStatusForm() {
  const searchParams = useSearchParams();
  const handoff = typeof window !== 'undefined' ? readLastOrder() : null;

  const [orderNumber, setOrderNumber] = useState(
    searchParams.get('orderId') || handoff?.orderNumber || ''
  );
  const [phone, setPhone] = useState(handoff?.phone || '');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [order, setOrder] = useState<PublicOrder | null>(null);
  const [autoTried, setAutoTried] = useState(false);

  const handleLookup = async (e?: React.FormEvent) => {
    e?.preventDefault();
    setError('');
    setOrder(null);

    if (!orderNumber.trim() || !phone.trim()) {
      setError('Укажите номер заказа и телефон, с которым оформляли заказ');
      return;
    }

    setLoading(true);
    const result = await lookupOrder(
      orderNumber.trim(),
      phone.trim(),
      API_CONFIG.ORDERS.LOOKUP
    );
    setLoading(false);

    if (result.ok) {
      setOrder(result.order);
    } else {
      setError(result.message);
    }
  };

  // Авто-поиск, если оба поля уже есть (с success)
  useEffect(() => {
    if (autoTried) return;
    if (orderNumber.trim() && phone.trim()) {
      setAutoTried(true);
      handleLookup();
    } else {
      setAutoTried(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [autoTried]);

  return (
    <div className="min-h-screen py-12 px-5">
      <div className="max-w-md mx-auto">
        <h1
          className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-2 text-center"
          style={{ fontFamily: 'var(--font-display)' }}
        >
          Статус заказа
        </h1>
        <p
          className="text-[14px] leading-[20px] text-gray-500 mb-8 text-center"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Введите номер заказа и телефон — покажем актуальный статус
        </p>

        <form
          onSubmit={handleLookup}
          className="bg-white border border-[#e5e7eb] rounded-[8px] p-6 space-y-4 mb-6"
        >
          <div>
            <label
              className="block text-[13px] font-bold text-[#212121] mb-1.5"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Номер заказа <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              value={orderNumber}
              onChange={(e) => setOrderNumber(e.target.value)}
              placeholder="Айбек-1"
              className="w-full px-3 py-2.5 border border-[#bfbfbf] rounded-[8px] text-[14px] focus:border-[#1061cd] outline-none"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              disabled={loading}
            />
          </div>
          <div>
            <label
              className="block text-[13px] font-bold text-[#212121] mb-1.5"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Телефон <span className="text-red-500">*</span>
            </label>
            <input
              type="tel"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder="+996 …"
              className="w-full px-3 py-2.5 border border-[#bfbfbf] rounded-[8px] text-[14px] focus:border-[#1061cd] outline-none"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              disabled={loading}
            />
          </div>

          {error && (
            <p className="text-[13px] text-red-600 bg-red-50 border border-red-100 rounded-[8px] px-3 py-2">
              {error}
            </p>
          )}

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-[#1061cd] text-white py-3 px-4 rounded-full text-[14px] font-bold hover:bg-[#0f54b3] disabled:opacity-50 transition-colors"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            {loading ? 'Ищем…' : 'Проверить статус'}
          </button>
        </form>

        {order && (
          <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-6 mb-6">
            <div className="flex flex-col items-center gap-2 mb-4">
              <p
                className="text-[15px] font-semibold text-[#212121]"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                {order.order_number}
              </p>
              <span
                className={`inline-flex items-center px-3 py-1 rounded-full text-[12px] font-bold border ${statusBadgeClass(order.status)}`}
              >
                {order.status_display}
              </span>
              {order.display_name && (
                <p className="text-[13px] text-gray-500">
                  {order.display_name}, спасибо за заказ
                </p>
              )}
              {order.created_at && (
                <p className="text-[12px] text-gray-400">
                  {formatOrderDateTime(order.created_at)}
                </p>
              )}
              {order.phone_hint && (
                <p className="text-[12px] text-gray-400">
                  Телефон: {order.phone_hint}
                </p>
              )}
            </div>

            <div className="flex justify-between items-center mb-3">
              <span className="text-[13px] text-gray-500">Сумма</span>
              <span className="text-[16px] font-bold text-[#212121]">
                {formatMoney(order.total_amount)}
              </span>
            </div>

            {order.items?.length > 0 && (
              <ul className="space-y-2 border-t border-[#e5e7eb] pt-3 mb-4">
                {order.items.map((item, i) => (
                  <li key={i} className="flex justify-between gap-3 text-[13px]">
                    <span className="text-[#212121] line-clamp-2">
                      {item.product_name}
                      <span className="text-gray-500"> × {item.quantity}</span>
                    </span>
                    <span className="font-semibold whitespace-nowrap">
                      {formatMoney(item.total_price)}
                    </span>
                  </li>
                ))}
              </ul>
            )}

            <p className="text-[12px] text-gray-500 mb-4 text-center">
              Статус обновляет менеджер. При вопросах — WhatsApp или звонок.
            </p>

            <a
              href={shopWhatsAppUrl(order.order_number, API_CONFIG.SHOP.WHATSAPP_NUMBER)}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center justify-center gap-2 w-full border border-[#25D366] text-[#128C7E] py-2.5 rounded-full text-[13px] font-bold hover:bg-[#25D366]/10 transition-colors"
            >
              Написать в WhatsApp
            </a>
          </div>
        )}

        <div className="text-center">
          <Link
            href="/"
            className="text-[14px] font-bold text-[#1061cd] hover:underline"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            На главную
          </Link>
        </div>
      </div>
    </div>
  );
}

export default function OrderStatusPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen flex items-center justify-center text-gray-500">
          Загрузка…
        </div>
      }
    >
      <OrderStatusForm />
    </Suspense>
  );
}
