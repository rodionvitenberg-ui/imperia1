// src/components/ProductCard.tsx
'use client';

import React, { useState } from 'react';
import { Product } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';
import { useCart } from '@/contexts/CartContext';
import { useCompare } from '@/contexts/CompareContext';

interface Props {
  product: Product;
}

export default function ProductCard({ product }: Props) {
  const { addToCart } = useCart();
  const { addToCompare, removeFromCompare, isInCompare } = useCompare();
  
  const [isCartClicked, setIsCartClicked] = useState(false);
  
  const main = product.images?.find(i => i.is_main) || product.images?.[0];
  const attrs = product.attributes ?? [];
  const tags = product.feature_tags ?? [];
  const brand = product.brands?.[0];
  const inCompare = isInCompare(product.id);

  const handleAddToCart = (e: React.MouseEvent) => {
    e.preventDefault();
    addToCart(product, 1);
    setIsCartClicked(true);
    setTimeout(() => setIsCartClicked(false), 600); 
  };

  const handleCompare = (e: React.MouseEvent) => {
    e.preventDefault();
    if (inCompare) {
      removeFromCompare(product.id);
    } else {
      addToCompare(product);
    }
  };

  return (
    <div className="group relative bg-white border border-[#e5e7eb] rounded-[8px] p-4 hover:border-primary/30 transition-colors duration-200">
      {/* Изображение */}
      <div className="relative">
        <a href={`/products/${product.slug}`} className="block">
          <div className="aspect-square w-full overflow-hidden bg-gray-100 rounded-[8px] relative">
            {/* Бейдж "В сравнении" */}
            {inCompare && (
              <div className="absolute top-2 right-2 bg-primary text-white text-[10px] px-2 py-1 rounded-[8px] z-10">
                В сравнении
              </div>
            )}
            <img
              src={API_CONFIG.MEDIA.buildImageUrl(main?.image ?? '')}
              alt={product.name}
              className="h-full w-full object-cover object-center group-hover:scale-105 transition-transform duration-300"
            />
          </div>
        </a>
        
        {/* Кнопки действий */}
        <div className="absolute bottom-2 left-2 flex gap-2 opacity-100 md:opacity-0 md:group-hover:opacity-100 transition-opacity duration-200">
          {/* Корзина */}
          <button
            onClick={handleAddToCart}
            className={`w-9 h-9 rounded-full flex items-center justify-center transition-all duration-200 touch-manipulation ${
              isCartClicked 
                ? 'bg-primary text-white' 
                : 'bg-white/90 text-[#212121] border border-[#bfbfbf] hover:bg-white hover:text-primary hover:border-primary'
            }`}
            title="Добавить в корзину"
          >
            {isCartClicked ? (
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" /></svg>
            ) : (
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" /></svg>
            )}
          </button>

          {/* Сравнение */}
          <button
            onClick={handleCompare}
            className={`w-9 h-9 rounded-full flex items-center justify-center transition-all duration-200 touch-manipulation ${
              inCompare 
                ? 'bg-primary text-white' 
                : 'bg-white/90 text-[#212121] border border-[#bfbfbf] hover:bg-white hover:text-primary hover:border-primary'
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
        {/* Бренд */}
        {brand && (
          <span className="text-[11px] text-primary font-bold uppercase tracking-wide">
            {brand.name}
          </span>
        )}
        
        {/* Название */}
        <h3 className="text-[14px] text-[#212121] font-bold line-clamp-2 min-h-[40px] leading-[20px]">
          <a href={`/products/${product.slug}`} className="hover:text-primary transition-colors">
            {product.name}
          </a>
        </h3>
        
        {/* Теги */}
        {tags.length > 0 && (
          <div className="flex flex-wrap gap-1 min-h-[20px]">
            {tags.map((tag, idx) => (
              <span key={idx} className="inline-block px-1.5 py-0.5 text-[10px] bg-primary/10 text-primary rounded-sm">
                {tag.name}
              </span>
            ))}
          </div>
        )}
        
        {/* Атрибуты */}
        {attrs.length > 0 && (
          <div className="flex flex-wrap gap-1 min-h-[24px]">
            {attrs.slice(0, 3).map((attr, index) => (
              <span key={index} className="inline-block px-1.5 py-0.5 text-[10px] uppercase tracking-wide bg-gray-100 text-[#212121] rounded-sm">
                {typeof attr.value === 'object' ? attr.value.display : String(attr.value)}
              </span>
            ))}
          </div>
        )}
        
        {/* Цена */}
        <p className="text-base font-semibold text-[#212121] pt-1">
          {Number(product.price).toLocaleString()} сом
        </p>
      </div>
    </div>
  );
}