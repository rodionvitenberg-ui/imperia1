'use client';

import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { showCustomToast } from '@/components/CustomToast';
import { Product } from '@/lib/api';

interface FavoritesContextType {
  favorites: Product[];
  addToFavorites: (product: Product) => void;
  removeFromFavorites: (productId: number) => void;
  isFavorite: (productId: number) => boolean;
  favoritesCount: number;
  clearFavorites: () => void;
}

const FavoritesContext = createContext<FavoritesContextType | undefined>(undefined);

interface FavoritesProviderProps {
  children: ReactNode;
}

export const FavoritesProvider: React.FC<FavoritesProviderProps> = ({ children }) => {
  const [favorites, setFavorites] = useState<Product[]>([]);

  // Загружаем избранные товары из localStorage при инициализации
  useEffect(() => {
    try {
      const savedFavorites = localStorage.getItem('favorites');
      if (savedFavorites) {
        setFavorites(JSON.parse(savedFavorites));
      }
    } catch (error) {
      console.error('Ошибка загрузки избранного из localStorage:', error);
    }
  }, []);

  // Сохраняем избранные товары в localStorage при изменении
  useEffect(() => {
    try {
      localStorage.setItem('favorites', JSON.stringify(favorites));
    } catch (error) {
      console.error('Ошибка сохранения избранного в localStorage:', error);
    }
  }, [favorites]);

  const addToFavorites = (product: Product) => {
    // Проверяем, нет ли уже этого товара в избранном
    const exists = favorites.some(item => item.id === product.id);
    
    if (exists) {
      showCustomToast.info('Товар уже в избранном! 🤍');
      return;
    }
    
    setFavorites(prev => [...prev, product]);
    showCustomToast.success(`Товар "«${product.name}»" добавлен в избранное ❤️`);
  };

  const removeFromFavorites = (productId: number) => {
    setFavorites(prev => {
      const filtered = prev.filter(item => item.id !== productId);
      const removedProduct = prev.find(item => item.id === productId);
      if (removedProduct) {
        showCustomToast.success(`Товар «${removedProduct.name}» удалён из избранного`);
      }
      return filtered;
    });
  };

  const isFavorite = (productId: number): boolean => {
    return favorites.some(item => item.id === productId);
  };

  const clearFavorites = () => {
    console.log('🧹 Очищаем избранное');
    setFavorites([]);
  };

  const value: FavoritesContextType = {
    favorites,
    addToFavorites,
    removeFromFavorites,
    isFavorite,
    favoritesCount: favorites.length,
    clearFavorites,
  };

  return (
    <FavoritesContext.Provider value={value}>
      {children}
    </FavoritesContext.Provider>
  );
};

export const useFavorites = (): FavoritesContextType => {
  const context = useContext(FavoritesContext);
  if (!context) {
    throw new Error('useFavorites должен использоваться внутри FavoritesProvider');
  }
  return context;
};