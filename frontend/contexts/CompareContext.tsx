'use client';

import React, { createContext, useContext, useState, useEffect } from 'react';
import { Product } from '@/lib/api';

interface CompareContextType {
  compareItems: Product[];
  addToCompare: (product: Product) => void;
  removeFromCompare: (productId: number) => void;
  isInCompare: (productId: number) => boolean;
  clearCompare: () => void;
}

const CompareContext = createContext<CompareContextType | undefined>(undefined);

export function CompareProvider({ children }: { children: React.ReactNode }) {
  const [compareItems, setCompareItems] = useState<Product[]>([]);
  const [isLoaded, setIsLoaded] = useState(false);

  // Загрузка из localStorage только на клиенте
  useEffect(() => {
    const saved = localStorage.getItem('compareItems');
    if (saved) {
      try {
        setCompareItems(JSON.parse(saved));
      } catch (e) {
        console.error("Ошибка парсинга compareItems", e);
      }
    }
    setIsLoaded(true);
  }, []);

  // Сохранение при изменении
  useEffect(() => {
    if (isLoaded) {
      localStorage.setItem('compareItems', JSON.stringify(compareItems));
    }
  }, [compareItems, isLoaded]);

  const addToCompare = (product: Product) => {
    if (compareItems.length >= 4) {
      alert('Можно сравнивать максимум 4 товара');
      return;
    }
    if (!compareItems.find(i => i.id === product.id)) {
      setCompareItems(prev => [...prev, product]);
    }
  };

  const removeFromCompare = (productId: number) => {
    setCompareItems(prev => prev.filter(i => i.id !== productId));
  };

  const isInCompare = (productId: number) => {
    return compareItems.some(i => i.id === productId);
  };

  const clearCompare = () => {
    setCompareItems([]);
  };

  return (
    <CompareContext.Provider value={{ compareItems, addToCompare, removeFromCompare, isInCompare, clearCompare }}>
      {children}
    </CompareContext.Provider>
  );
}

export const useCompare = () => {
  const context = useContext(CompareContext);
  if (!context) throw new Error('useCompare must be used within CompareProvider');
  return context;
};