'use client';

import React, { useState, useEffect, useRef, Suspense } from 'react';
import { searchProducts, Product } from '@/lib/api';
import { useFavorites } from '@/contexts/FavoritesContext';
import { useCart } from '@/contexts/CartContext';
import { API_CONFIG } from '@/lib/config';
import { useSearchParams } from 'next/navigation';
import Link from 'next/link';

function SearchPageContent() {
  const searchParams = useSearchParams();
  const initialQuery = searchParams.get('q') || '';
  
  const [query, setQuery] = useState(initialQuery);
  const [products, setProducts] = useState<Product[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const [hasSearched, setHasSearched] = useState(!!initialQuery);
  const inputRef = useRef<HTMLInputElement>(null);
  
  const { addToFavorites, isFavorite } = useFavorites();
  const { addToCart } = useCart();

  // Фокус на поле ввода при загрузке страницы
  useEffect(() => {
    if (inputRef.current) {
      inputRef.current.focus();
    }
  }, []);

  // Автоматический поиск при наличии query параметра
  useEffect(() => {
    if (initialQuery) {
      performSearch(initialQuery);
    }
  }, [initialQuery]);

  // Дебаунс для поиска
  useEffect(() => {
    if (!query.trim()) {
      setProducts([]);
      setHasSearched(false);
      return;
    }

    const timeoutId = setTimeout(async () => {
      performSearch(query);
    }, 300);

    return () => clearTimeout(timeoutId);
  }, [query]);

  const performSearch = async (searchQuery: string) => {
    if (!searchQuery.trim()) return;
    
    setIsLoading(true);
    try {
      const results = await searchProducts(searchQuery, 24); // Больше результатов для страницы
      setProducts(results);
      setHasSearched(true);
    } catch (error) {
      console.error('Search error:', error);
      setProducts([]);
    } finally {
      setIsLoading(false);
    }
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (query.trim()) {
      performSearch(query);
      // Обновляем URL без перезагрузки страницы
      const newUrl = `/search?q=${encodeURIComponent(query)}`;
      window.history.pushState({}, '', newUrl);
    }
  };

  const handleAddToCart = (product: Product) => {
    addToCart(product, 1);
  };

  const handleAddToFavorites = (product: Product) => {
    addToFavorites(product);
  };

  return (
    <div className="min-h-screen bg-gray-50">
      
      {/* Header поиска */}
      <div className="bg-white border-b border-gray-200 sticky top-0 z-40">
        <div className="container mx-auto px-4 py-6">
          <div className="max-w-3xl mx-auto">
            <form onSubmit={handleSubmit} className="relative">
              <input
                ref={inputRef}
                type="text"
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Поиск товаров..."
                className="w-full pl-12 pr-4 py-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-transparent outline-none text-lg"
              />
              <svg 
                className="absolute left-4 top-1/2 transform -translate-y-1/2 w-6 h-6 text-gray-400" 
                fill="none" 
                stroke="currentColor" 
                viewBox="0 0 24 24"
              >
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </form>
          </div>
        </div>
      </div>

      {/* Контент */}
      <div className="container mx-auto px-4 py-8">
        <div className="max-w-7xl mx-auto">
          
          {isLoading ? (
            /* Состояние загрузки */
            <div className="text-center py-16">
              <div className="animate-spin rounded-full h-16 w-16 border-b-2 border-black mx-auto mb-4"></div>
              <p className="text-gray-600 text-lg">Поиск товаров...</p>
            </div>
          ) : !hasSearched ? (
            /* Начальное состояние */
            <div className="text-center py-16">
              <svg className="w-24 h-24 mx-auto mb-6 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
              <h1 className="text-3xl font-bold text-gray-900 mb-4">Поиск товаров</h1>
              <p className="text-gray-600 text-lg max-w-md mx-auto">
                Введите название товара, характеристики или бренд для поиска
              </p>
            </div>
          ) : products.length === 0 ? (
            /* Нет результатов */
            <div className="text-center py-16">
              <svg className="w-24 h-24 mx-auto mb-6 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9.172 16.172a4 4 0 015.656 0M9 12h6m-6-4h6m2 5.291A7.962 7.962 0 0112 15c-2.34 0-4.29-1.009-5.824-2.563" />
              </svg>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Ничего не найдено</h2>
              <p className="text-gray-600 text-lg mb-6">
                По запросу <span className="font-medium">"{query}"</span> товары не найдены
              </p>
              <button
                onClick={() => setQuery('')}
                className="bg-black text-white px-6 py-3 rounded-full hover:bg-gray-800 transition-colors font-medium"
              >
                Очистить поиск
              </button>
            </div>
          ) : (
            /* Результаты поиска */
            <div>
              <div className="mb-8">
                <h1 className="text-2xl font-bold text-gray-900 mb-2">
                  Результаты поиска
                </h1>
                <p className="text-gray-600">
                  Найдено товаров: <span className="font-medium text-gray-900">{products.length}</span>
                  {query && (
                    <span> по запросу <span className="font-medium text-gray-900">"{query}"</span></span>
                  )}
                </p>
              </div>
              
              <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
                {products.map((product) => {
                  const mainImage = product.images?.find(img => img.is_main) || product.images?.[0];
                  const isInFavorites = isFavorite(product.id);
                  
                  return (
                    <div key={product.id} className="bg-white border border-gray-200 rounded-lg overflow-hidden hover:shadow-lg transition-shadow duration-200">
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
                        
                        {/* Кнопка избранного */}
                        <button
                          onClick={() => handleAddToFavorites(product)}
                          className={`absolute top-2 right-2 p-2 bg-white bg-opacity-90 hover:bg-opacity-100 rounded-full shadow-sm transition-all duration-200 ${
                            isInFavorites ? 'text-red-500' : 'text-gray-400 hover:text-red-500'
                          }`}
                          title={isInFavorites ? "Уже в избранном" : "Добавить в избранное"}
                          disabled={isInFavorites}
                        >
                          <svg 
                            className="w-5 h-5" 
                            fill={isInFavorites ? "currentColor" : "none"} 
                            stroke="currentColor" 
                            viewBox="0 0 24 24"
                          >
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                          </svg>
                        </button>
                      </div>

                      {/* Информация о товаре */}
                      <div className="p-4">
                        <Link 
                          href={`/products/${product.slug}`}
                          className="block hover:text-black transition-colors"
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
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

// Основной компонент с Suspense
export default function SearchPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-b-2 border-black mx-auto mb-4"></div>
          <p className="text-gray-600 text-lg">Загрузка...</p>
        </div>
      </div>
    }>
      <SearchPageContent />
    </Suspense>
  );
}