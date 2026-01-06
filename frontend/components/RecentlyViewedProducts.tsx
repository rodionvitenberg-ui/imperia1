// src/components/RecentlyViewedProducts.tsx
'use client';

import React from 'react';
import { useRecentlyViewed } from '@/contexts/RecentlyViewedContext';
import ProductGrid from './ProductGrid';

const RecentlyViewedProducts: React.FC = () => {
  const { recentlyViewed } = useRecentlyViewed();
  const [isHydrated, setIsHydrated] = React.useState(false);

  // Помечаем как гидратированный после монтирования на клиенте
  React.useEffect(() => {
    setIsHydrated(true);
  }, []);

  // Отслеживаем изменения в recentlyViewed
  React.useEffect(() => {
    console.log('📋 RecentlyViewedProducts: список обновился, количество:', recentlyViewed.length);
    if (recentlyViewed.length > 0) {
      console.log('📋 Товары:', recentlyViewed.map(p => `${p.name} (ID: ${p.id})`));
    }
  }, [recentlyViewed]);

  // На сервере и до гидратации показываем пустое состояние
  if (!isHydrated) {
    return (
      <div className="container mx-auto my-12 px-4">
        <h2 className="text-3xl font-bold text-center mb-8">
          Недавно просмотренные
        </h2>
        <div className="text-center py-8 text-gray-500">
          Пока нет просмотренных товаров
        </div>
      </div>
    );
  }

  // Показываем секцию всегда для теста
  return (
    <div className="container mx-auto my-12 px-4">
      <h2 className="text-3xl font-bold text-center mb-8">
        Недавно просмотренные
      </h2>
      {recentlyViewed.length === 0 ? (
        <div className="text-center py-8 text-gray-500">
          Пока нет просмотренных товаров
        </div>
      ) : (
        <ProductGrid products={recentlyViewed} />
      )}
    </div>
  );
};

export default RecentlyViewedProducts;