// src/lib/config.ts

const getApiBaseUrl = (): string => {
  // 1. Если задано через .env (высший приоритет)
  if (process.env.NEXT_PUBLIC_API_BASE_URL) {
    return process.env.NEXT_PUBLIC_API_BASE_URL;
  }

  // 2. Если код выполняется в браузере (у клиента)
  if (typeof window !== 'undefined') {
    // Используем относительный путь, чтобы запросы шли через Next.js rewrites
    return '';
  }

  // 3. Если код выполняется на сервере (SSR/SSG)
  // Стучимся прямо в Gunicorn, Next.js rewrites перехватит /api/
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
    LIST: `${API_BASE_URL}/api/customers/orders/`,
    DETAIL: (orderId: number) => `${API_BASE_URL}/api/customers/orders/${orderId}/`,
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