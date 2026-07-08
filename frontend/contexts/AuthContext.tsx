'use client';

import React, { createContext, useContext, useState, useEffect } from 'react';
import { showCustomToast } from '@/components/CustomToast';
import { API_CONFIG } from '@/lib/config';

// Типы для пользователя и контекста
export interface User {
  id: number;
  email: string;
  first_name: string;
  last_name: string;
  nickname?: string;
  date_joined: string;
}

interface AuthContextType {
  user: User | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  login: (email: string, password: string) => Promise<{ success: boolean; message?: string }>;
  register: (userData: RegisterData) => Promise<{ success: boolean; message?: string }>;
  logout: () => Promise<void>;
  changePassword: (oldPassword: string, newPassword: string, confirmPassword: string) => Promise<{ success: boolean; message?: string }>;
  checkAuthStatus: () => Promise<void>;
}

export interface RegisterData {
  email: string;
  first_name: string;
  last_name: string;
  password: string;
  password_confirm: string;
}

// Функция для получения CSRF токена
const getCSRFToken = (): string | null => {
  if (typeof document !== 'undefined') {
    const cookieValue = document.cookie
      .split('; ')
      .find(row => row.startsWith('csrftoken='))
      ?.split('=')[1];
    return cookieValue || null;
  }
  return null;
};

// Функция для проверки наличия sessionid
const hasSessionId = (): boolean => {
  if (typeof document !== 'undefined') {
    return document.cookie.includes('sessionid=');
  }
  return false;
};

// Создаем контекст
const AuthContext = createContext<AuthContextType | undefined>(undefined);

// Провайдер контекста
export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  const isAuthenticated = !!user;

  // Проверка статуса авторизации при загрузке
  const checkAuthStatus = async () => {
    try {
      // Получаем CSRF токен сначала
      try {
        await fetch(`${API_CONFIG.BASE_URL}/api/auth/csrf/`, {
          method: 'GET',
          credentials: 'include',
        });
      } catch (csrfError) {
        // Ignore CSRF fetch errors
      }
      
      const response = await fetch(API_CONFIG.AUTH.STATUS, {
        method: 'GET',
        credentials: 'include', // Важно для сессий
        headers: {
          'Content-Type': 'application/json',
        },
      });
      
      if (response.ok) {
        const data = await response.json();
        
        if (data.is_authenticated && data.user) {
          setUser(data.user);
        } else {
          setUser(null);
        }
      } else {
        setUser(null);
      }
    } catch (error) {
      console.error('❌ Ошибка проверки статуса авторизации:', error);
      setUser(null);
    } finally {
      setIsLoading(false);
    }
  };

  // Функция входа
  const login = async (email: string, password: string) => {
    try {
      // Получаем CSRF токен перед входом
      const csrfResponse = await fetch(API_CONFIG.AUTH.CSRF, {
        method: 'GET',
        credentials: 'include',
      });
      
      const csrfToken = getCSRFToken();
      
      const headers: Record<string, string> = {
        'Content-Type': 'application/json',
      };
      
      if (csrfToken) {
        headers['X-CSRFToken'] = csrfToken;
      }
      
      const response = await fetch(API_CONFIG.AUTH.LOGIN, {
        method: 'POST',
        credentials: 'include',
        headers,
        body: JSON.stringify({ email, password }),
      });

      const data = await response.json();

      if (response.ok) {
        setUser(data.user);
        
        showCustomToast.success(`Добро пожаловать, ${data.user.first_name}!`);
        return { success: true, message: data.message };
      } else {
        const errorMessage = typeof data === 'object' && data ? 
          Object.values(data)[0] as string || 'Ошибка авторизации' : 
          'Ошибка авторизации';
        showCustomToast.error(errorMessage);
        return { success: false, message: errorMessage };
      }
    } catch (error) {
      console.error('Ошибка входа:', error);
      const errorMessage = 'Ошибка соединения с сервером';
      showCustomToast.error(errorMessage);
      return { success: false, message: errorMessage };
    }
  };

  // Функция регистрации
  const register = async (userData: RegisterData) => {
    try {
      const response = await fetch(API_CONFIG.AUTH.REGISTER, {
        method: 'POST',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(userData),
      });
      
      const data = await response.json();

      if (response.ok) {
        setUser(data.user);
        showCustomToast.success(`Добро пожаловать в наш магазин, ${data.user.first_name}!`);
        return { success: true, message: data.message };
      } else {
        // Обрабатываем ошибки валидации
        let errorMessage = 'Ошибка регистрации';
        if (typeof data === 'object' && data) {
          if (data.email && Array.isArray(data.email)) {
            errorMessage = data.email[0];
          } else if (data.password && Array.isArray(data.password)) {
            errorMessage = data.password[0];
          } else {
            const firstError = Object.values(data)[0];
            if (Array.isArray(firstError)) {
              errorMessage = firstError[0] as string;
            } else {
              errorMessage = firstError as string || 'Ошибка регистрации';
            }
          }
        }
        
        showCustomToast.error(errorMessage);
        return { success: false, message: errorMessage };
      }
    } catch (error) {
      console.error('❌ Ошибка регистрации:', error);
      const errorMessage = 'Ошибка соединения с сервером';
      showCustomToast.error(errorMessage);
      return { success: false, message: errorMessage };
    }
  };

  // Функция выхода
  const logout = async () => {
    try {
      await fetch(API_CONFIG.AUTH.LOGOUT, {
        method: 'POST',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
      });
    } catch (error) {
      console.error('Ошибка выхода:', error);
    } finally {
      setUser(null);
      showCustomToast.success('Вы успешно вышли из системы');
    }
  };

  // Функция смены пароля
  const changePassword = async (oldPassword: string, newPassword: string, confirmPassword: string) => {
    try {
      const response = await fetch(API_CONFIG.AUTH.CHANGE_PASSWORD, {
        method: 'POST',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          old_password: oldPassword,
          new_password: newPassword,
          new_password_confirm: confirmPassword,
        }),
      });

      const data = await response.json();

      if (response.ok) {
        showCustomToast.success('Пароль успешно изменён!');
        return { success: true, message: data.message };
      } else {
        const errorMessage = typeof data === 'object' && data ? 
          Object.values(data)[0] as string || 'Ошибка смены пароля' : 
          'Ошибка смены пароля';
        showCustomToast.error(errorMessage);
        return { success: false, message: errorMessage };
      }
    } catch (error) {
      console.error('Ошибка смены пароля:', error);
      const errorMessage = 'Ошибка соединения с сервером';
      showCustomToast.error(errorMessage);
      return { success: false, message: errorMessage };
    }
  };

  // Проверяем статус при монтировании
  useEffect(() => {
    checkAuthStatus();
  }, []);

  const value: AuthContextType = {
    user,
    isAuthenticated,
    isLoading,
    login,
    register,
    logout,
    changePassword,
    checkAuthStatus,
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
}

// Хук для использования контекста
export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}