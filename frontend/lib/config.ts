// src/lib/config.ts

const getApiBaseUrl = (): string => {
  // 1. Если код выполняется в браузере (у клиента)
  // В Turbopack (Next.js 16) rewrites не работают для клиентских fetch,
  // поэтому браузер стучится напрямую в Django (CORS разрешён)
  if (typeof window !== 'undefined') {
    if (process.env.NEXT_PUBLIC_API_BASE_URL) {
      return process.env.NEXT_PUBLIC_API_BASE_URL;
    }
    return 'http://127.0.0.1:8000';
  }

  // 2. На сервере (SSR/SSG) — из .env или фоллбэк
  if (process.env.NEXT_PUBLIC_API_BASE_URL) {
    return process.env.NEXT_PUBLIC_API_BASE_URL;
  }

  return 'http://127.0.0.1:8000';
};

const API_BASE_URL = getApiBaseUrl();

export const API_CONFIG = {
  BASE_URL: API_BASE_URL,

  PRODUCTS: {
    BASE: `${API_BASE_URL}/api/products`,
    CATEGORIES: `${API_BASE_URL}/api/products/categories/`,
    PRODUCTS: `${API_BASE_URL}/api/products/products/`,
    BRANDS: `${API_BASE_URL}/api/products/brands/`,
    BLOG: `${API_BASE_URL}/api/products/blog/`,
    ATTRIBUTES: `${API_BASE_URL}/api/products/attributes/`,
    CATEGORY_BRANDS: (categoryId: number) => `${API_BASE_URL}/api/products/categories/${categoryId}/brands/`,
    CATEGORY_FILTERS: (categoryId: number) => `${API_BASE_URL}/api/products/categories/${categoryId}/filters/`,
  },

  AUTH: {
    BASE: `${API_BASE_URL}/api/auth`,
    STATUS: `${API_BASE_URL}/api/auth/status/`,
    LOGIN: `${API_BASE_URL}/api/auth/login/`,
    LOGOUT: `${API_BASE_URL}/api/auth/logout/`,
    REGISTER: `${API_BASE_URL}/api/auth/register/`,
    CHANGE_PASSWORD: `${API_BASE_URL}/api/auth/change-password/`,
    CSRF: `${API_BASE_URL}/api/auth/csrf/`,
  },

  ORDERS: {
    BASE: `${API_BASE_URL}/api/customers`,
    CREATE: `${API_BASE_URL}/api/customers/orders/create/`,
    LOOKUP: `${API_BASE_URL}/api/customers/orders/lookup/`,
    LIST: `${API_BASE_URL}/api/customers/orders/`,
    DETAIL: (orderId: number) => `${API_BASE_URL}/api/customers/orders/${orderId}/`,
  },

  /** Контакты магазина для CTA на success / status */
  SHOP: {
    PHONE_DISPLAY: '+996 555 95 34 75',
    WHATSAPP_NUMBER: '996555953475',
  },

  SERVICES: {
    BASE: `${API_BASE_URL}/api/services`,
    ITEMS: `${API_BASE_URL}/api/services/items/`,
  },

  CUSTOMERS: {
    ADDRESSES: `${API_BASE_URL}/api/customers/addresses/`,
    WISHLIST: `${API_BASE_URL}/api/customers/wishlist/`,
    CART: `${API_BASE_URL}/api/customers/cart/`,
    PROFILE: `${API_BASE_URL}/api/customers/profile/`,
  },

  MEDIA: {
    BASE: API_BASE_URL,
    buildImageUrl: (imagePath: string) => {
      if (!imagePath) return '/placeholder.jpg';
      if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
        return imagePath;
      }
      return `${API_BASE_URL}${imagePath.startsWith('/') ? imagePath : '/' + imagePath}`;
    }
  }
} as const;

export const checkApiHealth = async (): Promise<boolean> => {
  try {
    const response = await fetch(`${API_BASE_URL}/api/products/categories/`, {
      method: 'HEAD',
      mode: 'cors'
    });
    return response.ok;
  } catch (error) {
    return false;
  }
};