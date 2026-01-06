'use client';

import React from 'react';
import { motion } from 'framer-motion';
import { useFavorites } from '@/contexts/FavoritesContext';
import Link from 'next/link';
import { dropdownPanelVariants, dropdownContentVariants } from '@/lib/animations';
import { API_CONFIG } from '@/lib/config';

const FavoritesDropdown: React.FC = () => {
  const { favorites, removeFromFavorites } = useFavorites();

  // Функция для создания полного URL изображения
  const buildImageUrl = API_CONFIG.MEDIA.buildImageUrl;

  // Определяем размер панели в зависимости от количества товаров
  const getGridCols = () => {
    if (favorites.length <= 2) return 'grid-cols-1 md:grid-cols-2';
    if (favorites.length <= 4) return 'grid-cols-1 md:grid-cols-2 lg:grid-cols-4';
    return 'grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4';
  };

  return (
    <motion.div
      variants={dropdownPanelVariants}
      initial="hidden"
      animate="visible"
      exit="hidden"
      className="absolute top-full left-0 w-full bg-white text-gray-700 shadow-lg border-t border-gray-200 overflow-hidden z-50"
    >
      <motion.div
        variants={dropdownContentVariants}
        className="container mx-auto px-6 py-6"
      >
        {/* Заголовок */}

        {/* Контент */}
        {favorites.length === 0 ? (
          <motion.div variants={dropdownContentVariants} className="text-center py-8">
            <svg className="w-16 h-16 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
            </svg>
            <p className="text-gray-600 mb-4">В избранном пока нет товаров</p>
            <p className="text-gray-500 text-sm">Добавляйте товары в избранное для быстрого доступа</p>
          </motion.div>
        ) : (
          <motion.div variants={dropdownContentVariants}>
            {/* Сетка товаров */}
            <div className={`grid ${getGridCols()} gap-4 mb-6`}>
              {favorites.slice(0, 8).map((product) => {
                const mainImage = product.images?.find(img => img.is_main) || product.images?.[0];
                
                return (
                  <div key={product.id} className="relative group">
                    <Link
                      href={`/products/${product.slug}`}
                      className="flex items-center space-x-3 p-3 rounded-lg hover:bg-gray-50 transition-colors"
                    >
                      <div className="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden flex-shrink-0">
                        {mainImage ? (
                          <img
                            src={buildImageUrl(mainImage.image)}
                            alt={product.name}
                            className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-200"
                          />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center">
                            <svg className="w-8 h-8 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                          </div>
                        )}
                      </div>
                      <div className="flex-1 min-w-0">
                        <h4 className="font-medium text-gray-900 group-hover:text-black transition-colors truncate">
                          {product.name}
                        </h4>
                        <p className="text-lg font-bold text-gray-900 mt-1">
                          {product.price} сом
                        </p>
                      </div>
                    </Link>
                    
                    {/* Кнопка удаления */}
                    <button
                      onClick={(e) => {
                        e.preventDefault();
                        removeFromFavorites(product.id);
                      }}
                      className="absolute top-2 right-2 w-8 h-8 bg-white rounded-full shadow-md hover:shadow-lg hover:bg-red-50 flex items-center justify-center transition-all opacity-0 group-hover:opacity-100"
                      title="Удалить из избранного"
                    >
                      <svg className="w-4 h-4 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>
                  </div>
                );
              })}
            </div>
            
            {/* Ссылка на полную страницу избранного */}
            {favorites.length > 0 && (
              <div className="text-center pt-4 border-t border-gray-200">
                <Link
                  href="/favorites"
                  className="inline-flex items-center text-black hover:text-gray-700 font-medium"
                >
                  {favorites.length > 8 ? `Показать все ${favorites.length} товаров` : 'Перейти в избранное'}
                  <svg className="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </Link>
              </div>
            )}
          </motion.div>
        )}
      </motion.div>
    </motion.div>
  );
};

export default FavoritesDropdown;