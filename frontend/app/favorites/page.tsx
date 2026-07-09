'use client';

import React from 'react';
import { useFavorites } from '@/contexts/FavoritesContext';
import { useCart } from '@/contexts/CartContext';
import { API_CONFIG } from '@/lib/config';
import Link from 'next/link';

export default function FavoritesPage() {
  const { favorites, removeFromFavorites, clearFavorites } = useFavorites();
  const { addToCart } = useCart();

  const handleAddToCart = (product: any) => {
    addToCart(product, 1);
  };

  const handleRemoveFromFavorites = (productId: number) => {
    removeFromFavorites(productId);
  };

  return (
    <div className="min-h-screen bg-gray-50">
      
      {/* Header страницы */}
      <div className="bg-gray-50 border-b border-gray-200">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">Избранные товары</h1>
              <p className="text-gray-600 mt-2">
                {favorites.length > 0 
                  ? `Товаров в избранном: ${favorites.length}`
                  : 'В избранном пока нет товаров'
                }
              </p>
            </div>
            
            {favorites.length > 0 && (
              <button
                onClick={clearFavorites}
                className="px-4 py-2 border border-red-300 text-red-600 rounded-full hover:bg-red-50 transition-colors font-medium"
              >
                Очистить избранное
              </button>
            )}
          </div>
        </div>
      </div>

      {/* Контент */}
      <div className="container mx-auto px-4 py-8">
        <div className="max-w-7xl mx-auto">
          
          {favorites.length === 0 ? (
            /* Пустое состояние */
            <div className="text-center py-16">
              <svg className="w-24 h-24 mx-auto mb-6 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
              </svg>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">В избранном пока нет товаров</h2>
              <p className="text-gray-600 text-lg mb-8 max-w-md mx-auto">
                Добавляйте товары в избранное, чтобы не потерять их и быстро найти потом
              </p>
              <Link
                href="/"
                className="bg-black text-white px-8 py-3 rounded-full hover:bg-gray-800 transition-colors font-medium inline-flex items-center"
              >
                <svg className="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 11H5m14 0l-4 4m4-4l-4-4" />
                </svg>
                Перейти к покупкам
              </Link>
            </div>
          ) : (
            /* Список избранных товаров */
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
              {favorites.map((product) => {
                const mainImage = product.images?.find(img => img.is_main) || product.images?.[0];
                
                return (
                  <div key={product.id} className="bg-gray-50 border border-gray-200 rounded-lg overflow-hidden hover:shadow-lg transition-shadow duration-200 relative group">
                    
                    {/* Кнопка удаления */}
                    <button
                      onClick={() => handleRemoveFromFavorites(product.id)}
                      className="absolute top-3 right-3 z-10 w-8 h-8 bg-white rounded-full shadow-md hover:shadow-lg hover:bg-red-50 flex items-center justify-center transition-all opacity-0 group-hover:opacity-100"
                      title="Удалить из избранного"
                    >
                      <svg className="w-4 h-4 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>

                    {/* Изображение товара */}
                    <div className="relative aspect-[4/3] bg-gray-100">
                      <Link href={`/products/${product.slug}`}>
                        {mainImage ? (
                          <img
                            src={API_CONFIG.MEDIA.buildImageUrl(mainImage.image)}
                            alt={product.name}
                            className="w-full h-full object-cover hover:scale-105 transition-transform duration-200"
                          />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center hover:bg-gray-200 transition-colors">
                            <svg className="w-16 h-16 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                          </div>
                        )}
                      </Link>
                    </div>

                    {/* Информация о товаре */}
                    <div className="p-4">
                      <Link href={`/products/${product.slug}`}>
                        <h3 className="font-medium text-gray-900 hover:text-black transition-colors line-clamp-2 mb-2">
                          {product.name}
                        </h3>
                      </Link>

                      {/* Цена */}
                      <div className="flex items-center justify-between mb-3">
                        <span className="text-xl font-bold text-gray-900">
                          {product.price} сом
                        </span>
                      </div>

                      {/* Кнопка добавления в корзину */}
                      <button
                        onClick={() => handleAddToCart(product)}
                        className="w-full bg-black text-white py-2 px-4 rounded-full hover:bg-gray-800 transition-colors font-medium flex items-center justify-center"
                      >
                        <svg className="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                        </svg>
                        В корзину
                      </button>
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}