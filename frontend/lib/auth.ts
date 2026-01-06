// src/lib/auth.ts
import { API_CONFIG } from './config';

export interface User {
  id: number;
  email: string;
  first_name: string;
  last_name: string;
  date_joined: string;
}

export interface LoginData {
  email: string;
  password: string;
}

export interface RegisterData {
  email: string;
  first_name: string;
  last_name: string;
  password: string;
  password_confirm: string;
}

export interface ChangePasswordData {
  old_password: string;
  new_password: string;
  new_password_confirm: string;
}

export interface ApiResponse<T> {
  success: boolean;
  data?: T;
  message?: string;
  errors?: Record<string, string[]>;
}

// Базовая функция для API запросов
async function apiRequest<T>(
  endpoint: string,
  method: 'GET' | 'POST' = 'GET',
  data?: any
): Promise<ApiResponse<T>> {
  try {
    const config: RequestInit = {
      method,
      credentials: 'include', // Важно для работы с сессиями Django
      headers: {
        'Content-Type': 'application/json',
      },
    };

    if (data && method === 'POST') {
      config.body = JSON.stringify(data);
    }

    const response = await fetch(`${API_CONFIG.AUTH.BASE}${endpoint}`, config);
    const responseData = await response.json();

    if (response.ok) {
      return {
        success: true,
        data: responseData,
        message: responseData.message,
      };
    } else {
      return {
        success: false,
        errors: responseData,
        message: (Object.values(responseData as Record<string, any>)[0] as any)?.[0] || 'Произошла ошибка',
      };
    }
  } catch (error) {
    console.error('API Error:', error);
    return {
      success: false,
      message: 'Ошибка соединения с сервером',
    };
  }
}

// API функции для авторизации
export const authApi = {
  // Проверка статуса авторизации
  checkStatus: (): Promise<ApiResponse<{ is_authenticated: boolean; user: User | null }>> =>
    apiRequest('/status/'),

  // Вход в систему
  login: (data: LoginData): Promise<ApiResponse<{ user: User; message: string }>> =>
    apiRequest('/login/', 'POST', data),

  // Регистрация
  register: (data: RegisterData): Promise<ApiResponse<{ user: User; message: string }>> =>
    apiRequest('/register/', 'POST', data),

  // Выход из системы
  logout: (): Promise<ApiResponse<{ message: string }>> =>
    apiRequest('/logout/', 'POST'),

  // Смена пароля
  changePassword: (data: ChangePasswordData): Promise<ApiResponse<{ message: string }>> =>
    apiRequest('/change-password/', 'POST', data),

  // Получение информации о пользователе
  getUserInfo: (): Promise<ApiResponse<{ user: User }>> =>
    apiRequest('/me/'),
};