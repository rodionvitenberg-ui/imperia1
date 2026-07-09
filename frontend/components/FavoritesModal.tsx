'use client';

import React from 'react';
import { useFavorites } from '@/contexts/FavoritesContext';
import { useCart } from '@/contexts/CartContext';
import { API_CONFIG } from '@/lib/config';
import { useRouter } from 'next/navigation';
import Link from 'next/link';

interface FavoritesModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export default function FavoritesModal({ isOpen, onClose }: FavoritesModalProps) {
  const { favorites, removeFromFavorites, favoritesCount } = useFavorites();
  const { addToCart } = useCart();
  const router = useRouter();

  const handleRemoveFromFavorites = (productId: number) => {
    removeFromFavorites(productId);
  };

  const handleAddToCart = (product: any) => {
    addToCart(product, 1);
    onClose();
    router.push('/cart');
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 overflow-y-auto">
      <div 
        className="fixed inset-0 bg-opacity-30 backdrop-blur-sm transition-opacity"
        onClick={onClose}
      />
      
      <div className="flex min-h-full items-center justify-center p-4">
        <div className="relative bg-white rounded-lg shadow-xl w-full max-w-4xl max-h-[120vh] overflow-hidden">
          
          {/* Header */}
          <div className="flex items-center justify-between p-6 border-b border-gray-200">
            <h2 className="text-2xl font-bold text-gray-900">
              Избранное
            </h2>
            <button
              onClick={onClose}
              className="p-2 hover:bg-gray-100 rounded-full transition-colors"
              aria-label="Закрыть"
            >
              <svg className="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          {/* Body */}
          <div className="p-6 overflow-y-auto max-h-[calc(90vh-140px)]">
            {favorites.length === 0 ? (
              /* Пустое состояние */
              <div className="text-center py-12">
                <svg className="w-16 h-16 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                </svg>
                <h3 className="text-xl font-semibold text-gray-900 mb-2">Избранное пусто</h3>
                <p className="text-gray-600 mb-4">
                  Добавляйте товары в избранное, нажимая на сердечко
                </p>
                <button
                  onClick={onClose}
                  className="bg-black text-white px-6 py-2 rounded-full hover:bg-gray-800 transition-colors"
                >
                  Продолжить покупки
                </button>
              </div>
            ) : (
              /* Сетка избранных товаров */
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                {favorites.map((product) => {
                  // Найдем главное изображение или возьмем первое
                  const mainImage = product.images?.find(img => img.is_main) || product.images?.[0];
                  
                  return (
                  <div key={product.id} className="bg-white border border-gray-200 rounded-lg overflow-hidden hover:shadow-md transition-shadow">
                    {/* Изображение товара */}
                    <div className="relative aspect-[4/3] bg-gray-100">
                      <Link href={`/products/${product.slug}`} onClick={onClose}>
                        {mainImage ? (
                          <img
                            src={API_CONFIG.MEDIA.buildImageUrl(mainImage.image)}
                            alt={product.name}
                            className="w-full h-full object-cover cursor-pointer hover:scale-105 transition-transform duration-200"
                          />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center cursor-pointer hover:bg-gray-200 transition-colors">
                            <svg className="w-12 h-12 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                          </div>
                        )}
                      </Link>
                      
                      {/* Кнопка удаления из избранного */}
                      <button
                        onClick={() => handleRemoveFromFavorites(product.id)}
                        className="absolute top-2 right-2 p-2 bg-white bg-opacity-90 hover:bg-opacity-100 rounded-full shadow-sm transition-all duration-200 group"
                        title="Удалить из избранного"
                      >
                        <svg 
                          className="w-5 h-5 text-red-500 group-hover:scale-110 transition-transform" 
                          fill="currentColor" 
                          viewBox="0 0 24 24"
                        >
                          <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                        </svg>
                      </button>
                    </div>

                    {/* Информация о товаре */}
                    <div className="p-4">
                      <Link 
                        href={`/products/${product.slug}`}
                        className="block hover:text-black transition-colors"
                        onClick={onClose}
                      >
                        <h3 className="font-semibold text-gray-900 text-sm mb-2 line-clamp-2">
                          {product.name}
                        </h3>
                      </Link>
                      
                      <div className="flex items-center justify-between">
                        <div className="text-lg font-bold text-gray-900">
                          {parseFloat(product.price).toLocaleString('ru-RU')} сом
                        </div>
                        
                        {/* Кнопка добавления в корзину */}
                        <button
                          onClick={() => handleAddToCart(product)}
                          className="bg-black text-white px-3 py-1.5 rounded-md text-sm font-medium hover:bg-gray-800 transition-colors flex items-center gap-1"
                          title="Добавить в корзину"
                        >
                          <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 3h2l.4 2M7 13h10l4-8H5.4m0 0L7 13m0 0l-2.5 5M7 13l2.5 5M17 21a2 2 0 100-4 2 2 0 000 4zM9 21a2 2 0 100-4 2 2 0 000 4z" />
                          </svg>
                          В корзину
                        </button>
                      </div>
                    </div>
                  </div>
                  );
                })}
              </div>
            )}
          </div>

          {/* Footer с дополнительными действиями */}
          {favorites.length > 0 && (
            <div className="border-t border-gray-200 p-6 bg-gray-50">
              <div className="flex items-center justify-between">
                <p className="text-sm text-gray-600">
                  Товары в избранном сохраняются между сеансами
                </p>
                <button
                  onClick={onClose}
                  className="bg-black text-white px-6 py-2 rounded-full hover:bg-gray-800 transition-colors"
                >
                  Продолжить покупки
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}