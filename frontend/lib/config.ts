// src/lib/config.ts

/**
 * Конфигурация API для приложения
 * Все URL централизованы здесь для удобства управления
 */

// Базовый URL API из переменных окружения
const getApiBaseUrl = (): string => {
  // Проверяем на стороне клиента
  if (typeof window !== 'undefined') {
    return process.env.NEXT_PUBLIC_API_BASE_URL || 'http://92.113.146.158:8000';
  }
  // На стороне сервера (сборка)
  return process.env.NEXT_PUBLIC_API_BASE_URL || 'http://92.113.146.158:8000';
};

const API_BASE_URL = getApiBaseUrl();

// Экспортируем конфигурацию API
export const API_CONFIG = {
  // Базовые URL
  BASE_URL: API_BASE_URL,
  
  // Эндпоинты для продуктов
  PRODUCTS: {
    BASE: `${API_BASE_URL}/api/products`,
    CATEGORIES: `${API_BASE_URL}/api/products/categories/`,
    PRODUCTS: `${API_BASE_URL}/api/products/products/`,
    CATEGORY_BRANDS: (categoryId: number) => `${API_BASE_URL}/api/products/categories/${categoryId}/brands/`,
    CATEGORY_FILTERS: (categoryId: number) => `${API_BASE_URL}/api/products/categories/${categoryId}/filters/`,
  },
  
  // Эндпоинты для аутентификации
  AUTH: {
    BASE: `${API_BASE_URL}/api/auth`,
    STATUS: `${API_BASE_URL}/api/auth/status/`,
    LOGIN: `${API_BASE_URL}/api/auth/login/`,
    LOGOUT: `${API_BASE_URL}/api/auth/logout/`,
    REGISTER: `${API_BASE_URL}/api/auth/register/`,
    CSRF: `${API_BASE_URL}/api/auth/csrf/`,
  },
  
  // Эндпоинты для заказов
  ORDERS: {
    BASE: `${API_BASE_URL}/api/customers`,
    CREATE: `${API_BASE_URL}/api/customers/orders/create/`,
    LIST: `${API_BASE_URL}/api/customers/orders/`,
    DETAIL: (orderId: number) => `${API_BASE_URL}/api/customers/orders/${orderId}/`,
  },
  
  // Медиа файлы
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

// Проверка доступности API (для отладки)
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

