'use client';

import React, { useState, useEffect, useRef } from 'react';
import { motion } from 'framer-motion';
import { searchProducts, Product } from '@/lib/api';
import Link from 'next/link';
import { API_CONFIG } from '@/lib/config';
import { dropdownPanelVariants, dropdownContentVariants } from '@/lib/animations';

const SearchDropdown: React.FC = () => {
  const [query, setQuery] = useState('');
  const [products, setProducts] = useState<Product[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);

  const buildImageUrl = API_CONFIG.MEDIA.buildImageUrl;

  useEffect(() => {
    if (inputRef.current) {
      inputRef.current.focus();
    }
  }, []);

  useEffect(() => {
    if (!query.trim()) {
      setProducts([]);
      return;
    }

    const timeoutId = setTimeout(async () => {
      setIsLoading(true);
      try {
        // Запрашиваем чуть больше товаров, так как теперь у нас список со скроллом
        const results = await searchProducts(query, 10); 
        setProducts(results);
      } catch (error) {
        console.error('Search error:', error);
        setProducts([]);
      } finally {
        setIsLoading(false);
      }
    }, 300);

    return () => clearTimeout(timeoutId);
  }, [query]);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (query.trim()) {
      window.location.href = `/search?q=${encodeURIComponent(query)}`;
    }
  };

  return (
    <motion.div
      variants={dropdownPanelVariants}
      initial="hidden"
      animate="visible"
      exit="hidden"
      className="absolute top-full left-0 w-full bg-white text-[#212121] border-t border-[#e5e7eb] overflow-hidden z-50"
    >
      <motion.div
        variants={dropdownContentVariants}
        className="container mx-auto px-6 py-6"
      >
        {/* Поле поиска */}
        <div className="max-w-2xl mx-auto mb-6">
          <form onSubmit={handleSubmit} className="relative">
            <input
              ref={inputRef}
              type="text"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Поиск товаров..."
              className="w-full pl-12 pr-4 py-3 border border-[#e5e7eb] rounded-[8px] focus:ring-2 focus:ring-primary focus:border-transparent outline-none text-lg"
            />
            <svg 
              className="absolute left-4 top-1/2 transform -translate-y-1/2 w-5 h-5 text-gray-400" 
              fill="none" 
              stroke="currentColor" 
              viewBox="0 0 24 24"
            >
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </form>
        </div>

        {/* Результаты поиска */}
        {isLoading ? (
          <div className="text-center py-8">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary mx-auto mb-2"></div>
            <p className="text-gray-600">Поиск...</p>
          </div>
        ) : products.length > 0 ? (
          <motion.div variants={dropdownContentVariants}>
            
            {/* ИЗМЕНЕНИЕ ЗДЕСЬ: Вместо Grid используем список как в CartDropdown */}
            <div className="space-y-4 mb-6 max-h-96 overflow-y-auto">
              {products.map((product) => {
                const mainImage = product.images?.find(img => img.is_main) || product.images?.[0];
                
                return (
                  <Link
                    key={product.id}
                    href={`/products/${product.slug}`}
                    // Добавил bg-gray-50 как в корзине для визуального единства
                    className="flex items-center space-x-3 p-3 bg-white border border-[#e5e7eb] rounded-[8px] hover:border-primary transition-colors group"
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
                      <h3 className="font-medium text-[#212121] group-hover:text-primary transition-colors truncate">
                        {product.name}
                      </h3>
                      <p className="text-sm font-bold text-[#212121] mt-1">
                        {product.price} сом
                      </p>
                    </div>
                  </Link>
                );
              })}
            </div>
            
            {/* Ссылка на все результаты */}
            <div className="text-center pt-4 border-t border-gray-200">
              <Link
                href={`/search?q=${encodeURIComponent(query)}`}
                className="inline-flex items-center text-primary hover:text-primary/80 font-medium"
              >
                Показать все результаты
                <svg className="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
              </Link>
            </div>
          </motion.div>
        ) : query.trim() && !isLoading ? (
          <motion.div variants={dropdownContentVariants} className="text-center py-8">
            <svg className="w-12 h-12 mx-auto mb-3 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <p className="text-[#212121] font-medium mb-1">Ничего не найдено</p>
            <p className="text-sm text-gray-500 mb-4">По запросу «{query}» товары не найдены</p>
            <Link
              href={`/search?q=${encodeURIComponent(query)}`}
              className="inline-flex items-center text-primary hover:text-primary/80 text-sm font-medium"
            >
              Расширенный поиск
              <svg className="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
              </svg>
            </Link>
          </motion.div>
        ) : (
          <motion.div variants={dropdownContentVariants} className="text-center py-8">
            <svg className="w-12 h-12 mx-auto mb-3 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
            <p className="text-[#212121] mb-1">Введите запрос для поиска</p>
            <p className="text-sm text-gray-500">Например: «видеокарта», «SSD», «монитор»</p>
          </motion.div>
        )}
      </motion.div>
    </motion.div>
  );
};

export default SearchDropdown;