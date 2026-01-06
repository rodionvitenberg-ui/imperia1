// src/components/ProductCard.tsx
'use client';

import React, { useState } from 'react';
import { Product } from '@/lib/api';
import { useCart } from '@/contexts/CartContext';
import { useCompare } from '@/contexts/CompareContext'; // Импорт контекста

const API = (process.env.NEXT_PUBLIC_API_URL ?? 'http://92.113.146.158').replace(/\/$/, '');
const buildImgUrl = (src?: string) => {
  if (!src) return '/placeholder.jpg';
  if (/^(https?:|data:|blob:)/i.test(src)) return src;
  return `${API}${src.startsWith('/') ? src : `/${src}`}`;
};

interface Props {
  product: Product;
}

export default function ProductCard({ product }: Props) {
  const { addToCart } = useCart();
  const { addToCompare, removeFromCompare, isInCompare } = useCompare(); // Хук сравнения
  
  const [isCartClicked, setIsCartClicked] = useState(false);
  
  const main = product.images?.find(i => i.is_main) || product.images?.[0];
  const attrs: any[] = (product as any).attributes ?? [];
  const inCompare = isInCompare(product.id);

  const handleAddToCart = (e: React.MouseEvent) => {
    e.preventDefault();
    addToCart(product, 1);
    setIsCartClicked(true);
    setTimeout(() => setIsCartClicked(false), 600); 
  };

  const handleCompare = (e: React.MouseEvent) => {
    e.preventDefault(); // Чтобы не переходить на страницу товара
    if (inCompare) {
      removeFromCompare(product.id);
    } else {
      addToCompare(product);
    }
  };

  return (
    <div className="group relative bg-white rounded-lg">
      {/* Изображение */}
      <div className="relative">
        <a href={`/products/${product.slug}`} className="block">
          <div className="aspect-square w-full overflow-hidden bg-gray-100 rounded-lg relative">
             {/* Бейдж "В сравнении" (опционально) */}
             {inCompare && (
                <div className="absolute top-2 right-2 bg-black/70 text-white text-[10px] px-2 py-1 rounded-md z-10 backdrop-blur-sm">
                  В сравнении
                </div>
             )}
            <img
              src={buildImgUrl(main?.image)}
              alt={product.name}
              className="h-full w-full object-cover object-center group-hover:scale-105 transition-transform duration-300"
            />
          </div>
        </a>
        
        {/* Кнопки действий (Корзина + Сравнение) */}
        <div className="absolute bottom-2 left-2 flex gap-2 opacity-100 md:opacity-0 md:group-hover:opacity-100 transition-opacity duration-200">
          
          {/* Кнопка КОРЗИНА */}
          <button
            onClick={handleAddToCart}
            className={`w-9 h-9 rounded-full flex items-center justify-center shadow-md hover:shadow-lg transition-all duration-200 touch-manipulation ${
              isCartClicked 
                ? 'bg-black text-white' 
                : 'bg-white/90 text-gray-700 hover:bg-white hover:text-black'
            }`}
            title="Добавить в корзину"
          >
            {isCartClicked ? (
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" /></svg>
            ) : (
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" /></svg>
            )}
          </button>

          {/* Кнопка СРАВНЕНИЕ (Весы) */}
          <button
            onClick={handleCompare}
            className={`w-9 h-9 rounded-full flex items-center justify-center shadow-md hover:shadow-lg transition-all duration-200 touch-manipulation ${
              inCompare 
                ? 'bg-black text-white' 
                : 'bg-white/90 text-gray-700 hover:bg-white hover:text-black'
            }`}
            title={inCompare ? "Убрать из сравнения" : "Добавить к сравнению"}
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
            </svg>
          </button>

        </div>
      </div>

      {/* Контент */}
      <div className="mt-3 flex flex-col space-y-1">
        <h3 className="text-sm text-gray-900 font-medium line-clamp-2 min-h-[40px]">
          <a href={`/products/${product.slug}`} className="hover:text-gray-600 transition-colors">
            {product.name}
          </a>
        </h3>
        
        {/* Атрибуты */}
        <div className="flex flex-wrap gap-1 min-h-[24px]">
            {attrs && attrs.slice(0, 2).map((attr, index) => (
              <span key={index} className="inline-block px-1.5 py-0.5 text-[10px] uppercase tracking-wide bg-gray-100 text-gray-500 rounded-sm">
                {attr.value}
              </span>
            ))}
        </div>
        
        <p className="text-base font-bold text-gray-900 pt-1">
          {Number(product.price).toLocaleString()} сом
        </p>
      </div>
    </div>
  );
}