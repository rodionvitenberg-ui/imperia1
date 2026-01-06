// src/components/ProductBadges.tsx
'use client';

import React from 'react';
import { Product } from '@/lib/api';

interface ProductBadgesProps {
  product: Product;
  size?: 'small' | 'medium' | 'large';
  position?: 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right';
}

export default function ProductBadges({ 
  product, 
  size = 'medium',
  position = 'top-left' 
}: ProductBadgesProps) {
  const badges = [];

  // Определяем размеры в зависимости от size
  const sizeClasses = {
    small: 'text-[9px] px-1.5 py-0.5',
    medium: 'text-[10px] px-2 py-1',
    large: 'text-xs px-2.5 py-1'
  };

  const currentSizeClass = sizeClasses[size];

  // Позиционирование
  const positionClasses = {
    'top-left': 'top-2 left-2',
    'top-right': 'top-2 right-2',
    'bottom-left': 'bottom-2 left-2',
    'bottom-right': 'bottom-2 right-2'
  };

  const currentPositionClass = positionClasses[position];

  // Бейдж "НОВИНКА"
  if (product.is_new) {
    badges.push(
      <span
        key="new"
        className={`
          inline-block rounded-full bg-gradient-to-r from-green-500 to-green-600 
          text-white font-bold uppercase tracking-wider shadow-lg
          transform hover:scale-105 transition-transform duration-200
          ${currentSizeClass}
        `}
      >
        NEW
      </span>
    );
  }

  // Бейдж "ПОПУЛЯРНЫЙ"
  if (product.is_favorite) {
    badges.push(
      <span
        key="popular"
        className={`
          inline-block rounded-full bg-gradient-to-r from-red-500 to-pink-600 
          text-white font-bold uppercase tracking-wider shadow-lg
          transform hover:scale-105 transition-transform duration-200
          ${currentSizeClass}
        `}
      >
        ХИТ
      </span>
    );
  }

  // Бейдж "СКИДКА" (если есть старая цена в будущем)
  // Пример для будущего использования:
  // if (product.old_price && product.old_price > product.price) {
  //   const discount = Math.round(((product.old_price - product.price) / product.old_price) * 100);
  //   badges.push(
  //     <span
  //       key="discount"
  //       className={`
  //         inline-block rounded-full bg-gradient-to-r from-orange-500 to-red-600 
  //         text-white font-bold tracking-wider shadow-lg
  //         ${currentSizeClass}
  //       `}
  //     >
  //       -{discount}%
  //     </span>
  //   );
  // }

  if (badges.length === 0) {
    return null;
  }

  return (
    <div className={`absolute z-10 ${currentPositionClass}`}>
      <div className="flex flex-col gap-1">
        {badges}
      </div>
    </div>
  );
}