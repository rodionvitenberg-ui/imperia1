// src/components/CustomToast.tsx
'use client';

import React from 'react';
import toast from 'react-hot-toast';

function ToastContent({ message, type }: { message: string; type: 'success' | 'error' | 'info' }) {
  const getIcon = () => {
    switch (type) {
      case 'success':
        return (
          <svg className="w-5 h-5 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
          </svg>
        );
      case 'error':
        return (
          <svg className="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
          </svg>
        );
      default:
        return (
          <svg className="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        );
    }
  };

  const getBgColor = () => {
    switch (type) {
      case 'success': return 'bg-green-50 border-green-200';
      case 'error': return 'bg-red-50 border-red-200';
      default: return 'bg-gray-50 border-gray-200';
    }
  };

  return (
    <div className={`flex items-start gap-3 p-4 rounded-lg border ${getBgColor()} shadow-lg max-w-md`}>
      <div className="flex-shrink-0 mt-0.5">{getIcon()}</div>
      <div className="flex-1 min-w-0">
        <p className="text-sm text-gray-900 whitespace-pre-line">{message}</p>
      </div>
    </div>
  );
}

/**
 * showCustomToast — тосты, которые НЕ пропадают автоматически.
 * Пользователь закрывает их сам (если нужно — через глобальный `<Toaster />` или dismiss).
 * Если всё же нужно авто-закрытие, добавь `duration` в options.
 */
export const showCustomToast = {
  success: (message: string) => {
    toast.custom(
      (t) => (
        <div className="relative">
          <button
            type="button"
            onClick={() => toast.remove(t.id)}
            className="absolute -top-1.5 -right-1.5 z-10 w-5 h-5 bg-white rounded-full shadow-sm border border-gray-200 flex items-center justify-center hover:bg-gray-100 transition-colors"
            aria-label="Закрыть"
          >
            <svg className="w-3 h-3 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
          <ToastContent message={message} type="success" />
        </div>
      ),
      { duration: 5000 }
    );
  },

  error: (message: string) => {
    toast.custom(
      (t) => (
        <div className="relative">
          <button
            type="button"
            onClick={() => toast.remove(t.id)}
            className="absolute -top-1.5 -right-1.5 z-10 w-5 h-5 bg-white rounded-full shadow-sm border border-gray-200 flex items-center justify-center hover:bg-gray-100 transition-colors"
            aria-label="Закрыть"
          >
            <svg className="w-3 h-3 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
          <ToastContent message={message} type="error" />
        </div>
      ),
      { duration: 5000 }
    );
  },

  info: (message: string) => {
    toast.custom(
      (t) => (
        <div className="relative">
          <button
            type="button"
            onClick={() => toast.remove(t.id)}
            className="absolute -top-1.5 -right-1.5 z-10 w-5 h-5 bg-white rounded-full shadow-sm border border-gray-200 flex items-center justify-center hover:bg-gray-100 transition-colors"
            aria-label="Закрыть"
          >
            <svg className="w-3 h-3 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
          <ToastContent message={message} type="info" />
        </div>
      ),
      { duration: 5000 }
    );
  },
};