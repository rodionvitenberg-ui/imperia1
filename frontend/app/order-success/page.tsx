'use client';

import React, { Suspense, useEffect, useState } from 'react';
import Link from 'next/link';
import { useSearchParams } from 'next/navigation';
import { useCart } from '@/contexts/CartContext';
import { API_CONFIG } from '@/lib/config';
import {
  readLastOrder,
  clearLastOrder,
  lookupOrder,
  shopWhatsAppUrl,
  formatMoney,
  statusBadgeClass,
  formatOrderDateTime,
  type PublicOrder,
} from '@/lib/orderStorage';

function OrderSuccessContent() {
  const searchParams = useSearchParams();
  const orderIdFromQuery = searchParams.get('orderId') || '';
  const { clearCart } = useCart();

  const [order, setOrder] = useState<PublicOrder | null>(null);
  const [loading, setLoading] = useState(true);
  const [lookupFailed, setLookupFailed] = useState(false);

  const handoff = typeof window !== 'undefined' ? readLastOrder() : null;
  const orderNumber = orderIdFromQuery || handoff?.orderNumber || '';
  const phone = handoff?.phone || '';

  useEffect(() => {
    let cancelled = false;

    async function load() {
      // Корзину чистим здесь — не на checkout (избегаем race → /cart)
      clearCart();

      if (!orderNumber || !phone) {
        if (!cancelled) {
          setLoading(false);
          setLookupFailed(!orderNumber);
        }
        return;
      }

      const result = await lookupOrder(orderNumber, phone, API_CONFIG.ORDERS.LOOKUP);
      if (cancelled) return;

      if (result.ok) {
        setOrder(result.order);
      } else {
        setLookupFailed(true);
      }
      setLoading(false);
    }

    load();
    return () => {
      cancelled = true;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps -- clearCart once on mount
  }, [orderNumber, phone]);

  const displayNumber = order?.order_number || orderNumber;
  const whatsappHref = displayNumber
    ? shopWhatsAppUrl(displayNumber, API_CONFIG.SHOP.WHATSAPP_NUMBER)
    : `https://wa.me/${API_CONFIG.SHOP.WHATSAPP_NUMBER}`;

  const statusHref = displayNumber
    ? `/order-status?orderId=${encodeURIComponent(displayNumber)}`
    : '/order-status';

  return (
    <div className="min-h-screen flex items-center justify-center py-12 px-5">
      <div className="max-w-md w-full mx-auto text-center">
        <div className="w-20 h-20 mx-auto mb-6 rounded-full bg-green-100 flex items-center justify-center">
          <svg className="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
          </svg>
        </div>

        <h1
          className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-3"
          style={{ fontFamily: 'var(--font-display)' }}
        >
          Спасибо! Заказ принят
        </h1>

        {displayNumber && (
          <p
            className="text-[16px] leading-[24px] font-semibold text-[#212121] mb-2"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Номер заказа:{' '}
            <span className="text-[#1061cd] tracking-wide">{displayNumber}</span>
          </p>
        )}

        {loading && (
          <p className="text-[14px] text-gray-500 mb-6">Загружаем детали заказа…</p>
        )}

        {!loading && order && (
          <div className="mb-6 text-left space-y-3">
            <div className="flex flex-col items-center gap-2">
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

            <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-4">
              <div className="flex justify-between items-center mb-3">
                <span className="text-[13px] text-gray-500">Сумма</span>
                <span className="text-[16px] font-bold text-[#212121]">
                  {formatMoney(order.total_amount)}
                </span>
              </div>
              {order.items?.length > 0 && (
                <ul className="space-y-2 border-t border-[#e5e7eb] pt-3">
                  {order.items.map((item, i) => (
                    <li key={i} className="flex justify-between gap-3 text-[13px]">
                      <span className="text-[#212121] line-clamp-2">
                        {item.product_name}
                        <span className="text-gray-500"> × {item.quantity}</span>
                      </span>
                      <span className="font-semibold text-[#212121] whitespace-nowrap">
                        {formatMoney(item.total_price)}
                      </span>
                    </li>
                  ))}
                </ul>
              )}
            </div>
          </div>
        )}

        {!loading && !order && displayNumber && (
          <p
            className="text-[13px] text-gray-500 mb-4"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Сохраните номер заказа (например, Айбек-1) — по нему и телефону можно проверить статус в любой момент.
            {lookupFailed ? ' Детали временно недоступны, но заявка уже у нас.' : ''}
          </p>
        )}

        <p
          className="text-[14px] leading-[20px] text-gray-500 mb-2"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Наш менеджер свяжется с вами в ближайшее время для подтверждения и уточнения доставки.
        </p>
        <p
          className="text-[14px] leading-[20px] text-gray-500 mb-8"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Ожидайте звонка в течение 15–30 минут. Если не дозвонились — напишите нам в WhatsApp.
        </p>

        <div className="space-y-3 mb-8 text-left">
          <a
            href={whatsappHref}
            target="_blank"
            rel="noopener noreferrer"
            className="bg-white border border-[#e5e7eb] rounded-[8px] p-4 flex items-start gap-3 hover:border-[#25D366]/50 transition-colors"
          >
            <svg className="w-5 h-5 text-[#25D366] flex-shrink-0 mt-0.5" viewBox="0 0 24 24" fill="currentColor">
              <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.435 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" />
            </svg>
            <div>
              <h4
                className="text-[13px] leading-[18px] font-bold text-[#212121]"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Написать в WhatsApp
              </h4>
              <p
                className="text-[12px] leading-[16px] text-gray-500"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Откроется чат с номером заказа — мы ответим быстрее
              </p>
            </div>
          </a>

          <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-4 flex items-start gap-3">
            <svg className="w-5 h-5 text-[#1061cd] flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
            </svg>
            <div>
              <h4
                className="text-[13px] leading-[18px] font-bold text-[#212121]"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                {API_CONFIG.SHOP.PHONE_DISPLAY}
              </h4>
              <p
                className="text-[12px] leading-[16px] text-gray-500"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Если есть вопросы — звоните
              </p>
            </div>
          </div>
        </div>

        <div className="flex flex-col gap-3 items-center">
          <Link
            href={statusHref}
            className="inline-flex items-center justify-center rounded-full border border-[#1061cd] px-7 py-3.5 text-sm font-bold text-[#1061cd] hover:bg-[#1061cd]/5 transition-colors min-w-[300px]"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            onClick={() => {
              /* phone остаётся в sessionStorage для prefill на status */
            }}
          >
            Проверить статус позже
          </Link>
          <Link
            href="/"
            className="inline-flex items-center justify-center rounded-full bg-[#1061cd] px-7 py-3.5 text-sm font-bold text-white hover:bg-[#0f54b3] transition-colors min-w-[300px]"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            onClick={() => clearLastOrder()}
          >
            На главную
          </Link>
        </div>
      </div>
    </div>
  );
}

export default function OrderSuccessPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen flex items-center justify-center text-gray-500">
          Загрузка…
        </div>
      }
    >
      <OrderSuccessContent />
    </Suspense>
  );
}
