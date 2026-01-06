'use client';

import React, { useState, useEffect } from 'react';
import { useAuth } from '@/contexts/AuthContext';
import { useRouter } from 'next/navigation';
import { API_CONFIG } from '@/lib/config';
import Link from 'next/link';

interface Order {
  id: number;
  order_number: string;
  status: string;
  first_name: string;
  last_name: string;
  email: string;
  phone1: string;
  address: string;
  total_amount: string;
  created_at: string;
  items: OrderItem[];
}

interface OrderItem {
  product: number;
  product_name: string;
  product_slug: string;
  quantity: number;
  price: string;
  total_price: number;
}

type TabType = 'info' | 'password' | 'orders';

export default function ProfilePage() {
  const { user, changePassword, logout, isAuthenticated, isLoading } = useAuth();
  const router = useRouter();
  const [activeTab, setActiveTab] = useState<TabType>('info');
  const [orders, setOrders] = useState<Order[]>([]);
  const [isLoadingOrders, setIsLoadingOrders] = useState(false);
  const [formData, setFormData] = useState({
    old_password: '',
    new_password: '',
    new_password_confirm: '',
  });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Редирект для неавторизованных пользователей
  useEffect(() => {
    if (!isLoading && !isAuthenticated) {
      router.push('/');
    }
  }, [isAuthenticated, isLoading, router]);

  // Загрузка заказов пользователя
  const fetchOrders = async () => {
    if (!user) return;
    
    setIsLoadingOrders(true);
    try {
      const response = await fetch(API_CONFIG.ORDERS.LIST, {
        method: 'GET',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
      });
      
      if (response.ok) {
        const data = await response.json();
        setOrders(data.orders || []);
      } else {
        console.error('Ошибка загрузки заказов:', response.status);
      }
    } catch (error) {
      console.error('Ошибка загрузки заказов:', error);
    } finally {
      setIsLoadingOrders(false);
    }
  };

  // Загружаем заказы при переключении на таб "История заказов"
  useEffect(() => {
    if (activeTab === 'orders' && user) {
      fetchOrders();
    }
  }, [activeTab, user]);

  // Получаем красивое название статуса
  const getStatusLabel = (status: string) => {
    const statusMap: Record<string, string> = {
      'pending': 'В обработке',
      'confirmed': 'Подтвержден',
      'shipped': 'Отправлен',
      'delivered': 'Доставлен',
      'cancelled': 'Отменен',
    };
    return statusMap[status] || status;
  };

  // Получаем цвет для статуса
  const getStatusColor = (status: string) => {
    const colorMap: Record<string, string> = {
      'pending': 'bg-yellow-100 text-yellow-800',
      'confirmed': 'bg-gray-100 text-gray-800',
      'shipped': 'bg-purple-100 text-purple-800',
      'delivered': 'bg-green-100 text-green-800',
      'cancelled': 'bg-red-100 text-red-800',
    };
    return colorMap[status] || 'bg-gray-100 text-gray-800';
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
    if (error) setError('');
    if (success) setSuccess('');
  };

  const handleChangePassword = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    setError('');
    setSuccess('');

    if (formData.new_password !== formData.new_password_confirm) {
      setError('Новые пароли не совпадают');
      setIsSubmitting(false);
      return;
    }

    const result = await changePassword(
      formData.old_password,
      formData.new_password,
      formData.new_password_confirm
    );
    
    if (result.success) {
      setSuccess('Пароль успешно изменен');
      setFormData({
        old_password: '',
        new_password: '',
        new_password_confirm: '',
      });
    } else {
      setError(result.message || 'Ошибка смены пароля');
    }
    
    setIsSubmitting(false);
  };

  const handleLogout = async () => {
    await logout();
    router.push('/');
  };

  // Показываем загрузку пока идет проверка авторизации
  if (isLoading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <svg className="animate-spin w-8 h-8 text-gray-600 mx-auto mb-4" fill="none" viewBox="0 0 24 24">
            <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
            <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
          </svg>
          <p className="text-gray-600">Проверка авторизации...</p>
        </div>
      </div>
    );
  }

  // Если пользователь не авторизован, не показываем контент
  if (!isAuthenticated || !user) {
    return null;
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header страницы */}
      <div className="bg-gray-50 border-b border-gray-200">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">Личный кабинет</h1>
              <p className="text-gray-600 mt-2">
                Добро пожаловать, {user.first_name} {user.last_name}
              </p>
            </div>
            
            <Link
              href="/"
              className="flex items-center gap-2 text-gray-600 hover:text-black transition-colors"
            >
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 16l-4-4m0 0l4-4m-4 4h18" />
              </svg>
              Вернуться к покупкам
            </Link>
          </div>
        </div>
      </div>

      {/* Контент */}
      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto">
          
          {/* Навигация по табам */}
          <div className="bg-gray-50 rounded-lg shadow-sm mb-6">
            <div className="border-b border-gray-200">
              <nav className="flex">
                <button
                  onClick={() => setActiveTab('info')}
                  className={`flex-1 py-4 px-6 text-sm font-medium border-b-2 transition-colors ${
                    activeTab === 'info'
                      ? 'border-gray-800 text-gray-800 bg-gray-100'
                      : 'border-transparent text-gray-500 hover:text-gray-700 hover:bg-gray-50'
                  }`}
                >
                  <div className="flex items-center justify-center gap-2">
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
                    Личная информация
                  </div>
                </button>
                <button
                  onClick={() => setActiveTab('password')}
                  className={`flex-1 py-4 px-6 text-sm font-medium border-b-2 transition-colors ${
                    activeTab === 'password'
                      ? 'border-gray-800 text-gray-800 bg-gray-100'
                      : 'border-transparent text-gray-500 hover:text-gray-700 hover:bg-gray-50'
                  }`}
                >
                  <div className="flex items-center justify-center gap-2">
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                    </svg>
                    Смена пароля
                  </div>
                </button>
                <button
                  onClick={() => setActiveTab('orders')}
                  className={`flex-1 py-4 px-6 text-sm font-medium border-b-2 transition-colors ${
                    activeTab === 'orders'
                      ? 'border-gray-800 text-gray-800 bg-gray-100'
                      : 'border-transparent text-gray-500 hover:text-gray-700 hover:bg-gray-50'
                  }`}
                >
                  <div className="flex items-center justify-center gap-2">
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                    История заказов
                  </div>
                </button>
              </nav>
            </div>
          </div>

          {/* Контент табов */}
          <div className="bg-gray-50 rounded-lg shadow-sm">
            
            {/* Таб информации о пользователе */}
            {activeTab === 'info' && (
              <div className="p-6">
                <h2 className="text-xl font-semibold text-gray-900 mb-6">Личная информация</h2>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="space-y-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Имя
                      </label>
                      <div className="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-50 text-gray-900">
                        {user.first_name}
                      </div>
                    </div>
                    
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Фамилия
                      </label>
                      <div className="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-50 text-gray-900">
                        {user.last_name}
                      </div>
                    </div>
                  </div>
                  
                  <div className="space-y-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Email
                      </label>
                      <div className="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-50 text-gray-900">
                        {user.email}
                      </div>
                    </div>
                    
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Дата регистрации
                      </label>
                      <div className="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-50 text-gray-900">
                        {new Date(user.date_joined).toLocaleDateString('ru-RU')}
                      </div>
                    </div>
                  </div>
                </div>

                {/* Кнопка выхода */}
                <div className="mt-8 pt-6 border-t border-gray-200">
                  <button
                    onClick={handleLogout}
                    className="bg-red-600 text-white py-3 px-6 rounded-full font-medium hover:bg-red-700 transition-colors duration-200 flex items-center gap-2"
                  >
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                    </svg>
                    Выйти из аккаунта
                  </button>
                </div>
              </div>
            )}

            {/* Таб смены пароля */}
            {activeTab === 'password' && (
              <div className="p-6">
                <h2 className="text-xl font-semibold text-gray-900 mb-6">Смена пароля</h2>
                
                <form onSubmit={handleChangePassword} className="max-w-md space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Текущий пароль <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="password"
                      name="old_password"
                      value={formData.old_password}
                      onChange={handleInputChange}
                      placeholder="Введите текущий пароль"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-black transition-colors text-gray-900"
                      required
                      disabled={isSubmitting}
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Новый пароль <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="password"
                      name="new_password"
                      value={formData.new_password}
                      onChange={handleInputChange}
                      placeholder="Минимум 6 символов"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-black transition-colors text-gray-900"
                      required
                      minLength={6}
                      disabled={isSubmitting}
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Подтверждение нового пароля <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="password"
                      name="new_password_confirm"
                      value={formData.new_password_confirm}
                      onChange={handleInputChange}
                      placeholder="Повторите новый пароль"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-black transition-colors text-gray-900"
                      required
                      disabled={isSubmitting}
                    />
                  </div>

                  {error && (
                    <div className="bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-700">
                      {error}
                    </div>
                  )}

                  {success && (
                    <div className="bg-green-50 border border-green-200 rounded-lg p-3 text-sm text-green-700">
                      {success}
                    </div>
                  )}

                  <button
                    type="submit"
                    disabled={isSubmitting}
                    className="w-full bg-black text-white py-3 px-4 rounded-full font-medium hover:bg-gray-800 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200 flex items-center justify-center gap-2"
                  >
                    {isSubmitting ? (
                      <>
                        <svg className="animate-spin w-4 h-4" fill="none" viewBox="0 0 24 24">
                          <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                          <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                        </svg>
                        Изменение...
                      </>
                    ) : (
                      'Изменить пароль'
                    )}
                  </button>
                </form>
              </div>
            )}

            {/* Таб истории заказов */}
            {activeTab === 'orders' && (
              <div className="p-6">
                <h2 className="text-xl font-semibold text-gray-900 mb-6">История заказов</h2>
                
                {isLoadingOrders ? (
                  <div className="flex items-center justify-center py-12">
                    <svg className="animate-spin w-6 h-6 text-gray-600" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                    </svg>
                    <span className="ml-2 text-gray-600">Загрузка заказов...</span>
                  </div>
                ) : orders.length === 0 ? (
                  <div className="text-center py-12">
                    <svg className="w-16 h-16 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                    <h3 className="text-lg font-medium text-gray-900 mb-2">У вас пока нет заказов</h3>
                    <p className="text-gray-600 mb-6">Начните покупки, чтобы увидеть свои заказы здесь</p>
                    <Link
                      href="/"
                      className="bg-black text-white px-6 py-3 rounded-full hover:bg-gray-800 transition-colors font-medium inline-flex items-center gap-2"
                    >
                      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 11H5m14 0l-4 4m4-4l-4-4" />
                      </svg>
                      Перейти к покупкам
                    </Link>
                  </div>
                ) : (
                  <div className="space-y-4">
                    {orders.map((order) => (
                      <div key={order.id} className="border border-gray-200 rounded-lg p-6 hover:shadow-md transition-shadow">
                        <div className="flex items-center justify-between mb-4">
                          <div>
                            <h3 className="text-lg font-semibold text-gray-900">
                              Заказ №{order.order_number}
                            </h3>
                            <p className="text-sm text-gray-500">
                              {new Date(order.created_at).toLocaleDateString('ru-RU')}
                            </p>
                          </div>
                          <span className={`px-3 py-1 rounded-full text-sm font-medium ${getStatusColor(order.status)}`}>
                            {getStatusLabel(order.status)}
                          </span>
                        </div>
                        
                        <div className="space-y-3 mb-4">
                          {order.items.map((item, index) => (
                            <div key={index} className="flex justify-between items-center py-2 border-b border-gray-100 last:border-b-0">
                              <div className="flex-1">
                                <Link 
                                  href={`/products/${item.product_slug}`}
                                  className="text-gray-900 hover:text-black font-medium transition-colors"
                                >
                                  {item.product_name}
                                </Link>
                                <p className="text-sm text-gray-500">Количество: {item.quantity}</p>
                              </div>
                              <div className="text-right">
                                <p className="font-medium">{parseFloat(item.price).toLocaleString('ru-RU')} ₽</p>
                                <p className="text-sm text-gray-500">за единицу</p>
                              </div>
                            </div>
                          ))}
                        </div>
                        
                        <div className="border-t pt-4 flex justify-between items-center">
                          <div>
                            <p className="text-sm text-gray-600">
                              <span className="font-medium">Адрес:</span> {order.address}
                            </p>
                            <p className="text-sm text-gray-600">
                              <span className="font-medium">Телефон:</span> {order.phone1}
                            </p>
                          </div>
                          <div className="text-right">
                            <p className="text-sm text-gray-600">Общая сумма:</p>
                            <p className="text-xl font-bold text-gray-900">
                              {parseFloat(order.total_amount).toLocaleString('ru-RU')} ₽
                            </p>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}