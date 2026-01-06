// src/components/ProductCarousel.tsx
'use client';

import React, { useState, useEffect, useRef, useCallback } from 'react';
import { Product } from '@/lib/api';
import ProductCard from './ProductCard';

interface ProductCarouselProps {
  products: Product[];
}

export default function ProductCarousel({ products }: ProductCarouselProps) {
  const [canScrollLeft, setCanScrollLeft] = useState(false);
  const [canScrollRight, setCanScrollRight] = useState(false);
  const [isScrolling, setIsScrolling] = useState(false);
  const scrollContainerRef = useRef<HTMLDivElement>(null);

  // Проверяем возможность прокрутки
  const checkScrollButtons = () => {
    if (!scrollContainerRef.current) return;
    
    const { scrollLeft, scrollWidth, clientWidth } = scrollContainerRef.current;
    setCanScrollLeft(scrollLeft > 0);
    setCanScrollRight(scrollLeft < scrollWidth - clientWidth - 1);
  };

  // Прокрутка на точное количество товаров с анимацией и защитой от спама
  const scroll = useCallback((direction: 'left' | 'right') => {
    if (!scrollContainerRef.current || isScrolling) return;
    
    setIsScrolling(true);
    const container = scrollContainerRef.current;
    // Ширина одной карточки (200px) + gap (16px) = 216px
    // Прокручиваем на 4 товара
    const scrollAmount = 216 * 4;
    
    container.scrollBy({
      left: direction === 'left' ? -scrollAmount : scrollAmount,
      behavior: 'smooth'
    });
    
    // Снимаем блокировку после завершения анимации
    setTimeout(() => {
      setIsScrolling(false);
    }, 500); // 500ms достаточно для завершения smooth scroll
  }, [isScrolling]);

  // Следим за изменениями прокрутки
  useEffect(() => {
    const container = scrollContainerRef.current;
    if (!container) return;

    checkScrollButtons();
    
    const handleScroll = () => checkScrollButtons();
    const handleResize = () => {
      checkScrollButtons();
    };

    container.addEventListener('scroll', handleScroll);
    window.addEventListener('resize', handleResize);

    return () => {
      container.removeEventListener('scroll', handleScroll);
      window.removeEventListener('resize', handleResize);
    };
  }, [products]);

  if (products.length === 0) {
    return null;
  }

  return (
    <div className="relative flex items-center">
      {/* Левая кнопка навигации - центрированная по вертикали */}
      <button
        onClick={() => scroll('left')}
        disabled={!canScrollLeft || isScrolling}
        className={`
          hidden md:flex items-center justify-center w-10 h-10 rounded-full border transition-all duration-300 mr-4 z-10 self-center
          ${canScrollLeft && !isScrolling
            ? 'border-gray-300 hover:border-gray-400 text-gray-600 hover:text-gray-800 bg-white hover:bg-gray-50 shadow-sm hover:shadow-md transform hover:scale-105' 
            : 'border-gray-200 text-gray-300 bg-gray-50 opacity-50'
          }
        `}
        style={{ cursor: 'pointer', marginTop: '-120px' }} // Смещение вверх для центрирования
        aria-label="Прокрутить влево"
      >
        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
        </svg>
      </button>

      {/* Контейнер с товарами - фиксированная ширина для показа 5 товаров */}
      <div 
        ref={scrollContainerRef}
        className="flex space-x-4 overflow-x-auto scrollbar-hide pb-4 w-full md:w-auto carousel-container"
        style={{
          scrollbarWidth: 'none',
          msOverflowStyle: 'none',
          scrollBehavior: 'smooth'
        }}
      >
        {products.map((product) => (
          <div key={product.id} className="w-[200px] flex-shrink-0">
            <ProductCard product={product} />
          </div>
        ))}
      </div>

      {/* Правая кнопка навигации - центрированная по вертикали */}
      <button
        onClick={() => scroll('right')}
        disabled={!canScrollRight || isScrolling}
        className={`
          hidden md:flex items-center justify-center w-10 h-10 rounded-full border transition-all duration-300 ml-4 z-10 self-center
          ${canScrollRight && !isScrolling
            ? 'border-gray-300 hover:border-gray-400 text-gray-600 hover:text-gray-800 bg-white hover:bg-gray-50 shadow-sm hover:shadow-md transform hover:scale-105' 
            : 'border-gray-200 text-gray-300 bg-gray-50 opacity-50'
          }
        `}
        style={{ cursor: 'pointer', marginTop: '-120px' }} // Смещение вверх для центрирования
        aria-label="Прокрутить вправо"
      >
        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
        </svg>
      </button>

      {/* Индикатор для мобильных устройств */}
      <div className="flex justify-center mt-4 md:hidden w-full absolute -bottom-2">
        <div className="text-xs text-gray-500">
          Прокрутите горизонтально для просмотра всех товаров
        </div>
      </div>
      
      <style jsx>{`
        .scrollbar-hide {
          -ms-overflow-style: none;
          scrollbar-width: none;
        }
        .scrollbar-hide::-webkit-scrollbar {
          display: none;
        }
        @media (min-width: 768px) {
          .carousel-container {
            width: calc(200px * 6 + 16px * 5) !important;
          }
        }
      `}</style>
    </div>
  );
}