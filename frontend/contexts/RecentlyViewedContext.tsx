'use client';

import React, { createContext, useContext, useState, useEffect, useCallback, ReactNode } from 'react';
import { Product } from '@/lib/api';

interface RecentlyViewedContextType {
  recentlyViewed: Product[];
  addToRecentlyViewed: (product: Product) => void;
  clearRecentlyViewed: () => void;
  isInitialized: boolean;
}

const RecentlyViewedContext = createContext<RecentlyViewedContextType | undefined>(undefined);

interface RecentlyViewedProviderProps {
  children: ReactNode;
}

const RECENTLY_VIEWED_STORAGE_KEY = 'recently-viewed-products';
const MAX_RECENTLY_VIEWED = 8;

export const RecentlyViewedProvider: React.FC<RecentlyViewedProviderProps> = ({ children }) => {
  // Начинаем с пустого массива для SSR совместимости
  const [recentlyViewed, setRecentlyViewed] = useState<Product[]>([]);
  const [isInitialized, setIsInitialized] = useState(false);

  // Загружаем из localStorage после гидратации
  useEffect(() => {
    try {
      if (typeof window !== 'undefined') {
        const saved = localStorage.getItem(RECENTLY_VIEWED_STORAGE_KEY);
        if (saved) {
          const parsed = JSON.parse(saved);
          console.log('🚀 Загружаем из localStorage после гидратации:', parsed.length, 'товаров');
          setRecentlyViewed(parsed);
        }
      }
    } catch (error) {
      console.error('Ошибка при загрузке из localStorage:', error);
    } finally {
      setIsInitialized(true);
    }
  }, []);


  const addToRecentlyViewed = useCallback((product: Product) => {
    console.log('🔄 Добавляем в недавно просмотренные:', product.name, product.id);
    
    setRecentlyViewed(prev => {
      console.log('📋 Текущий список до добавления:', prev.length, prev.map(p => p.name));
      // Убираем товар из списка, если он уже есть
      const filtered = prev.filter(item => item.id !== product.id);
      
      // Добавляем товар в начало списка
      const updated = [product, ...filtered];
      
      // Ограничиваем количество товаров
      const result = updated.slice(0, MAX_RECENTLY_VIEWED);
      console.log('✅ Новый список после добавления:', result.length, result.map(p => p.name));
      
      // Сохраняем в localStorage только на клиенте
      if (typeof window !== 'undefined') {
        try {
          console.log('💾 Синхронно сохраняем в localStorage:', result.length, 'товаров');
          localStorage.setItem(RECENTLY_VIEWED_STORAGE_KEY, JSON.stringify(result));
        } catch (error) {
          console.error('Ошибка сохранения в localStorage:', error);
        }
      }
      
      return result;
    });
  }, []);

  const clearRecentlyViewed = useCallback(() => {
    setRecentlyViewed([]);
  }, []);

  const value: RecentlyViewedContextType = {
    recentlyViewed,
    addToRecentlyViewed,
    clearRecentlyViewed,
    isInitialized,
  };

  return (
    <RecentlyViewedContext.Provider value={value}>
      {children}
    </RecentlyViewedContext.Provider>
  );
};

export const useRecentlyViewed = (): RecentlyViewedContextType => {
  const context = useContext(RecentlyViewedContext);
  if (!context) {
    throw new Error('useRecentlyViewed должен использоваться внутри RecentlyViewedProvider');
  }
  return context;
};