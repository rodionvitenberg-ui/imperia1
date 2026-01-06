// src/components/CustomToast.tsx
'use client';

import React from 'react';
import toast from 'react-hot-toast';

interface CustomToastProps {
  message: string;
  type?: 'success' | 'error' | 'info';
  toast: any; // Объект toast вместо просто ID
}

export default function CustomToast({ message, type = 'info', toast: t }: CustomToastProps) {
  const handleClose = () => {
    toast.dismiss(t.id);
  };

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
      case 'success':
        return 'bg-green-50 border-green-200';
      case 'error':
        return 'bg-red-50 border-red-200';
      default:
        return 'bg-gray-50 border-gray-200';
    }
  };

  return (
    <div className={`flex items-start gap-3 p-4 rounded-lg border ${getBgColor()} shadow-lg max-w-md`}>
      <div className="flex-shrink-0 mt-0.5">
        {getIcon()}
      </div>
      
      <div className="flex-1 min-w-0">
        <p className="text-sm text-gray-900 whitespace-pre-line">
          {message}
        </p>
      </div>
      
      <button
        onClick={handleClose}
        className="flex-shrink-0 ml-2 p-1 rounded-full hover:bg-gray-200 transition-colors"
        aria-label="Закрыть уведомление"
      >
        <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>
  );
}

// Utility functions for easier usage
export const showCustomToast = {
  success: (message: string, duration = 3000) => {
    toast.custom(
      (t) => <CustomToast message={message} type="success" toast={t} />,
      { duration }
    );
  },
  
  error: (message: string, duration = 4000) => {
    toast.custom(
      (t) => <CustomToast message={message} type="error" toast={t} />,
      { duration }
    );
  },
  
  info: (message: string, duration = 3000) => {
    toast.custom(
      (t) => <CustomToast message={message} type="info" toast={t} />,
      { duration }
    );
  },
};