/** sessionStorage handoff after successful checkout */

export const LAST_ORDER_KEY = 'imperia_last_order';

export interface LastOrderHandoff {
  orderNumber: string;
  phone: string;
  createdAt: string;
}

export function saveLastOrder(orderNumber: string, phone: string): void {
  if (typeof window === 'undefined') return;
  const payload: LastOrderHandoff = {
    orderNumber,
    phone,
    createdAt: new Date().toISOString(),
  };
  try {
    sessionStorage.setItem(LAST_ORDER_KEY, JSON.stringify(payload));
  } catch {
    // ignore quota / private mode
  }
}

export function readLastOrder(): LastOrderHandoff | null {
  if (typeof window === 'undefined') return null;
  try {
    const raw = sessionStorage.getItem(LAST_ORDER_KEY);
    if (!raw) return null;
    return JSON.parse(raw) as LastOrderHandoff;
  } catch {
    return null;
  }
}

export function clearLastOrder(): void {
  if (typeof window === 'undefined') return;
  try {
    sessionStorage.removeItem(LAST_ORDER_KEY);
  } catch {
    // ignore
  }
}

export interface PublicOrderItem {
  product_name: string;
  quantity: number;
  price: string;
  total_price: number | string;
}

export interface PublicOrder {
  order_number: string;
  status: string;
  status_display: string;
  total_amount: string;
  /** Только первое слово имени — без фамилии */
  display_name: string;
  /** Маска телефона: первые цифры + • (полный номер не отдаём) */
  phone_hint: string;
  created_at: string;
  items: PublicOrderItem[];
}

export async function lookupOrder(
  orderNumber: string,
  phone: string,
  lookupUrl: string
): Promise<{ ok: true; order: PublicOrder } | { ok: false; message: string }> {
  const params = new URLSearchParams({
    order_number: orderNumber.trim(),
    phone: phone.trim(),
  });
  try {
    const response = await fetch(`${lookupUrl}?${params.toString()}`, {
      method: 'GET',
      headers: { Accept: 'application/json' },
    });
    const data = await response.json().catch(() => ({}));
    if (!response.ok) {
      return {
        ok: false,
        message:
          data.message ||
          'Заказ не найден. Проверьте номер заказа и телефон.',
      };
    }
    if (!data.order) {
      return { ok: false, message: 'Некорректный ответ сервера' };
    }
    return { ok: true, order: data.order as PublicOrder };
  } catch {
    return {
      ok: false,
      message: 'Не удалось связаться с сервером. Попробуйте позже.',
    };
  }
}

export function shopWhatsAppUrl(orderNumber: string, shopNumber: string): string {
  const text = encodeURIComponent(
    `Здравствуйте! У меня заказ ${orderNumber}. Подскажите, пожалуйста, статус.`
  );
  return `https://wa.me/${shopNumber}?text=${text}`;
}

export function formatMoney(amount: string | number): string {
  const n = typeof amount === 'string' ? parseFloat(amount) : amount;
  if (Number.isNaN(n)) return String(amount);
  return n.toLocaleString('ru-RU') + ' сом';
}

export function statusBadgeClass(status: string): string {
  switch (status) {
    case 'confirmed':
      return 'bg-blue-50 text-blue-700 border-blue-200';
    case 'shipped':
      return 'bg-indigo-50 text-indigo-700 border-indigo-200';
    case 'delivered':
      return 'bg-green-50 text-green-700 border-green-200';
    case 'cancelled':
      return 'bg-red-50 text-red-700 border-red-200';
    default:
      return 'bg-amber-50 text-amber-800 border-amber-200';
  }
}

/** Дата и время заказа для публичных экранов */
export function formatOrderDateTime(iso: string): string {
  if (!iso) return '';
  try {
    const d = new Date(iso);
    return d.toLocaleString('ru-RU', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  } catch {
    return iso;
  }
}
