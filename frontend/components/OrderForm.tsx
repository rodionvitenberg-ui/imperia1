// src/components/OrderForm.tsx
'use client';

import React, { useState, useEffect } from 'react';
import { User } from '@/contexts/AuthContext';

export interface OrderFormData {
  firstName: string;
  lastName: string;
  email: string;
  phone1: string;
  phone2?: string;
  address: string;
  comments?: string;
}

interface OrderFormProps {
  onSubmit: (data: OrderFormData) => void;
  isSubmitting: boolean;
  user?: User | null; // Добавляем пользователя для автозаполнения
}

// Компонент поля ввода (вынесен наружу, чтобы не пересоздавался)
const InputField = ({ 
  label, 
  field, 
  required = false, 
  placeholder,
  formData,
  onChange,
  isSubmitting
}: {
  label: string;
  field: keyof OrderFormData;
  required?: boolean;
  placeholder?: string;
  formData: OrderFormData;
  onChange: (field: keyof OrderFormData, value: string) => void;
  isSubmitting: boolean;
}) => (
  <div>
    <label className="block text-sm font-medium text-gray-700 mb-1">
      {label} {required && <span className="text-red-500">*</span>}
    </label>
    <input
      type="text"
      value={formData[field] || ''}
      onChange={(e) => onChange(field, e.target.value)}
      placeholder={placeholder}
      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-black transition-colors"
      disabled={isSubmitting}
    />
  </div>
);

export default function OrderForm({ onSubmit, isSubmitting, user }: OrderFormProps) {
  const [formData, setFormData] = useState<OrderFormData>({
    firstName: '',
    lastName: '',
    email: '',
    phone1: '',
    phone2: '',
    address: '',
    comments: ''
  });

  // Автозаполнение формы для авторизованных пользователей
  useEffect(() => {
    if (user) {
      console.log('👤 Auto-filling form for authenticated user:', user);
      setFormData(prev => ({
        ...prev,
        firstName: user.first_name || '',
        lastName: user.last_name || '',
        email: user.email || '',
        // Оставляем телефоны и адрес пустыми, так как их нет в модели пользователя
      }));
    }
  }, [user]);

  // Обработка изменения полей
  const handleInputChange = (field: keyof OrderFormData, value: string) => {
    setFormData(prev => ({ ...prev, [field]: value }));
  };

  // Отправка формы
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSubmit(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      {/* Имя и Фамилия */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <InputField
          label="Имя"
          field="firstName"
          required
          placeholder="Введите ваше имя"
          formData={formData}
          onChange={handleInputChange}
          isSubmitting={isSubmitting}
        />
        <InputField
          label="Фамилия"
          field="lastName"
          required
          placeholder="Введите вашу фамилию"
          formData={formData}
          onChange={handleInputChange}
          isSubmitting={isSubmitting}
        />
      </div>

      {/* Email */}
      <InputField
        label="Email"
        field="email"
        required
        placeholder="example@mail.com"
        formData={formData}
        onChange={handleInputChange}
        isSubmitting={isSubmitting}
      />

      {/* Телефоны */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <InputField
          label="Основной телефон"
          field="phone1"
          required
          placeholder="+996 123 456 789"
          formData={formData}
          onChange={handleInputChange}
          isSubmitting={isSubmitting}
        />
        <InputField
          label="Дополнительный телефон"
          field="phone2"
          placeholder="+996 123 456 789"
          formData={formData}
          onChange={handleInputChange}
          isSubmitting={isSubmitting}
        />
      </div>

      {/* Адрес */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Адрес доставки <span className="text-red-500">*</span>
        </label>
        <textarea
          value={formData.address}
          onChange={(e) => handleInputChange('address', e.target.value)}
          placeholder="Укажите полный адрес доставки (город, улица, дом, квартира)"
          rows={3}
          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-black transition-colors resize-none"
          disabled={isSubmitting}
        />
      </div>

      {/* Комментарии */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Комментарии к заказу
        </label>
        <textarea
          value={formData.comments}
          onChange={(e) => handleInputChange('comments', e.target.value)}
          placeholder="Дополнительные пожелания или комментарии (не обязательно)"
          rows={2}
          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-black transition-colors resize-none"
          disabled={isSubmitting}
        />
      </div>

      {/* Информационный блок */}
      <div className="bg-opacity-30 backdrop-blur-sm border border-gray-200 rounded-lg p-4 text-sm">
        <div className="flex items-start gap-2">
          <svg className="w-5 h-5 text-gray-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <div className="text-gray-800">
            <p className="font-medium mb-1">Важная информация:</p>
            <ul className="space-y-0.5 text-xs">
              <li>• Доставка осуществляется бесплатно по всему городу</li>
              <li>• Менеджер свяжется с вами для подтверждения заказа</li>
              <li>• Оплата при получении (наличные или карта)</li>
              <li>• Время доставки: в день заказа или на следующий день</li>
            </ul>
          </div>
        </div>
      </div>

      {/* Кнопка отправки */}
      <button
        type="submit"
        disabled={isSubmitting}
        className="w-full bg-black text-white py-3 px-4 rounded-full font-semibold text-lg hover:bg-gray-800 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200 flex items-center justify-center gap-2"
      >
        {isSubmitting ? (
          <>
            <svg className="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24">
              <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
              <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
            </svg>
            Оформляем заказ...
          </>
        ) : (
          <>
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
            </svg>
            Отправить заказ
          </>
        )}
      </button>
    </form>
  );
}