// src/components/ProductImageGallery.tsx
'use client';

import React, { useState, useEffect, useRef } from 'react';
import { ProductImage, Product } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';

interface ProductImageGalleryProps {
  product: Product;
}

export default function ProductImageGallery({ product }: ProductImageGalleryProps) {
  const validImages = product.images.filter(img => img.image && img.image.length > 0);
  const mainImage = validImages.find(img => img.is_main) || validImages[0];
  
  const [activeImageIndex, setActiveImageIndex] = useState(0);
  const [isZoomed, setIsZoomed] = useState(false);
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });
  const [isFullscreen, setIsFullscreen] = useState(false);
  const imageRef = useRef<HTMLImageElement>(null);

  // Сброс индекса при смене товара
  useEffect(() => {
    const mainIndex = validImages.findIndex(img => img.is_main);
    setActiveImageIndex(mainIndex >= 0 ? mainIndex : 0);
  }, [product]);

  // Функция для создания полного URL изображения
  const buildImageUrl = API_CONFIG.MEDIA.buildImageUrl;

  // Обработка движения мыши для зума
  const handleMouseMove = (e: React.MouseEvent<HTMLImageElement>) => {
    if (!imageRef.current || !isZoomed) return;
    
    const rect = imageRef.current.getBoundingClientRect();
    const x = ((e.clientX - rect.left) / rect.width) * 100;
    const y = ((e.clientY - rect.top) / rect.height) * 100;
    
    setMousePosition({ x, y });
  };

  // Навигация по изображениям
  const goToPrevious = () => {
    setActiveImageIndex((prev) => 
      prev === 0 ? validImages.length - 1 : prev - 1
    );
  };

  const goToNext = () => {
    setActiveImageIndex((prev) => 
      prev === validImages.length - 1 ? 0 : prev + 1
    );
  };

  // Навигация с клавиатуры
  useEffect(() => {
    const handleKeyPress = (e: KeyboardEvent) => {
      if (isFullscreen) {
        if (e.key === 'ArrowLeft') goToPrevious();
        if (e.key === 'ArrowRight') goToNext();
        if (e.key === 'Escape') setIsFullscreen(false);
      }
    };

    window.addEventListener('keydown', handleKeyPress);
    return () => window.removeEventListener('keydown', handleKeyPress);
  }, [isFullscreen, validImages.length]);

  if (!validImages.length) {
    return (
      <div className="flex items-center justify-center w-full h-96 bg-gray-200 rounded-lg">
        <span className="text-gray-500">Изображения не найдены</span>
      </div>
    );
  }

  const activeImage = validImages[activeImageIndex];

  return (
    <>
      {/* Основная галерея */}
      <div className="flex flex-col-reverse md:flex-row gap-4">
        {/* Миниатюры */}
        <div className="flex md:flex-col gap-3 overflow-x-auto md:overflow-visible">
          {validImages.map((img, index) => (
            <div
              key={index}
              className={`
                w-16 h-16 flex-shrink-0 cursor-pointer border-2 rounded-md overflow-hidden
                transition-all duration-200
                ${activeImageIndex === index ? 'border-black shadow-md' : 'border-transparent hover:border-gray-300'}
              `}
              onClick={() => setActiveImageIndex(index)}
            >
              <img 
                src={buildImageUrl(img.image)} 
                alt={`${product.name} миниатюра ${index + 1}`}
                className="w-full h-full object-cover"
              />
            </div>
          ))}
        </div>

        {/* Основное изображение */}
        <div className="flex-grow relative group">
          <div 
            className="relative overflow-hidden rounded-lg bg-gray-100 cursor-crosshair aspect-square"
            onMouseEnter={() => setIsZoomed(true)}
            onMouseLeave={() => setIsZoomed(false)}
            onMouseMove={handleMouseMove}
            onClick={() => setIsFullscreen(true)}
          >
            <img 
              ref={imageRef}
              src={buildImageUrl(activeImage.image)} 
              alt={product.name}
              className={`
                w-full h-full object-cover transition-transform duration-200
                ${isZoomed ? 'scale-150' : 'scale-100'}
              `}
              style={isZoomed ? {
                transformOrigin: `${mousePosition.x}% ${mousePosition.y}%`
              } : {}}
            />
            
            {/* Индикатор зума - УБРАН */}
          </div>
          
          {/* Индикаторы изображений */}
          {validImages.length > 1 && (
            <div className="flex justify-center mt-4 space-x-2">
              {validImages.map((_, index) => (
                <button
                  key={index}
                  onClick={() => setActiveImageIndex(index)}
                  className={`
                    w-2 h-2 rounded-full transition-all duration-200
                    ${activeImageIndex === index ? 'bg-black w-6' : 'bg-gray-300 hover:bg-gray-400'}
                  `}
                  aria-label={`Перейти к изображению ${index + 1}`}
                />
              ))}
            </div>
          )}
        </div>
      </div>
      
      {/* Модальное окно галереи */}
      {isFullscreen && (
        <div className="fixed inset-0 bg-black bg-opacity-90 z-50 flex items-center justify-center p-4">
          <div className="relative max-w-5xl max-h-[90vh] w-full bg-white rounded-lg overflow-hidden shadow-2xl">
            {/* Кнопка закрытия */}
            <button
              onClick={() => setIsFullscreen(false)}
              className="absolute top-4 right-4 z-10 bg-black bg-opacity-70 hover:bg-opacity-90 text-white w-10 h-10 rounded-full flex items-center justify-center transition-colors"
              aria-label="Закрыть галерею"
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
            
            {/* Основное изображение */}
            <div className="relative h-[70vh] bg-gray-100 flex items-center justify-center">
              <img 
                src={buildImageUrl(activeImage.image)}
                alt={product.name}
                className="max-w-full max-h-full object-contain"
              />
            </div>
            
            {/* Нижняя панель с навигацией */}
            <div className="bg-white p-6">
              {/* Название товара */}
              <h3 className="text-lg font-semibold text-gray-900 mb-4 text-center">{product.name}</h3>
              
              {/* Кнопки навигации - всегда видны */}
              <div className="flex justify-center items-center space-x-6 mb-4">
                <button
                  onClick={goToPrevious}
                  disabled={validImages.length <= 1}
                  className={`bg-gray-200 hover:bg-gray-300 text-gray-700 p-3 rounded-full transition-colors ${
                    validImages.length <= 1 ? 'opacity-50' : 'opacity-100'
                  }`}
                  aria-label="Предыдущее изображение"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
                  </svg>
                </button>
                
                <span className="text-gray-600 font-medium">
                  {activeImageIndex + 1} из {validImages.length}
                </span>
                
                <button
                  onClick={goToNext}
                  disabled={validImages.length <= 1}
                  className={`bg-gray-200 hover:bg-gray-300 text-gray-700 p-3 rounded-full transition-colors ${
                    validImages.length <= 1 ? 'opacity-50' : 'opacity-100'
                  }`}
                  aria-label="Следующее изображение"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </button>
              </div>
              
              {/* Индикаторы точек */}
              {validImages.length > 1 && (
                <div className="flex justify-center space-x-2">
                  {validImages.map((_, index) => (
                    <button
                      key={index}
                      onClick={() => setActiveImageIndex(index)}
                      className={`
                        w-3 h-3 rounded-full transition-all duration-200
                        ${activeImageIndex === index ? 'bg-black' : 'bg-gray-300 hover:bg-gray-400'}
                      `}
                      aria-label={`Перейти к изображению ${index + 1}`}
                    />
                  ))}
                </div>
              )}
            </div>
          </div>
        </div>
      )}
    </>
  );
}