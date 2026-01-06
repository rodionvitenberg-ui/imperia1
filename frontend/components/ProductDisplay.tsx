// src/components/ProductDisplay.tsx
'use client';

import React, { useEffect, useState } from 'react';
import { Product, NestedCategory, buildProductCategoryPath } from '@/lib/api';
import UniversalBreadcrumbs from './UniversalBreadcrumbs';
import ProductImageGallery from './ProductImageGallery';
import RelatedProducts from './RelatedProducts';
import PageLayout from './PageLayout';
import { useCart } from '@/contexts/CartContext';
import { useFavorites } from '@/contexts/FavoritesContext';
import { useRecentlyViewed } from '@/contexts/RecentlyViewedContext';
import { useRouter } from 'next/navigation';

interface ProductDisplayProps {
  product: Product;
}

export default function ProductDisplay({ product }: ProductDisplayProps) {
  const { addToCart } = useCart();
  const { addToFavorites, removeFromFavorites, isFavorite } = useFavorites();
  const { addToRecentlyViewed, isInitialized } = useRecentlyViewed();
  const router = useRouter();
  const [categoryPath, setCategoryPath] = useState<NestedCategory[]>([]);
  
  const isInFavorites = isFavorite(product.id);

  // Получаем правильный путь категорий
  useEffect(() => {
    const loadCategoryPath = async () => {
      const path = await buildProductCategoryPath(product);
      setCategoryPath(path);
    };
    loadCategoryPath();
  }, [product]);

  // Добавляем товар в недавно просмотренные только после инициализации контекста
  React.useEffect(() => {
    if (isInitialized) {
      console.log('📦 ProductDisplay useEffect срабатывает для товара после инициализации:', product.name, product.id);
      addToRecentlyViewed(product);
    }
  }, [product.id, addToRecentlyViewed, isInitialized]);

  const handleAddToCart = () => {
    addToCart(product, 1);
    // Перенаправляем на страницу корзины
    router.push('/cart');
  };

  const handleFavoriteToggle = () => {
    if (isInFavorites) {
      removeFromFavorites(product.id);
    } else {
      addToFavorites(product);
    }
  };
  return (
    <PageLayout
      breadcrumbs={<UniversalBreadcrumbs product={product} categoryPath={categoryPath} />}
      actions={<div />} // Пустые actions для одинаковой структуры с каталогом
      centered={true}
      maxWidth="7xl"
    >
      {/* Основная секция товара */}
      <div className="max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 md:gap-12">
          {/* ЛЕВАЯ КОЛОНКА: ГАЛЕРЕЯ */}
          <ProductImageGallery product={product} />

          {/* ПРАВАЯ КОЛОНКА: ИНФОРМАЦИЯ */}
          <div className="flex flex-col py-4">
            <div className="mb-2">
              <h1 className="text-3xl md:text-4xl font-bold">{product.name}</h1>
            </div>
            

            
            {/* Бренд из тегов */}
            {product.tags && product.tags.length > 0 && (
              <div className="mt-2">
                <span className="text-sm text-gray-500">Бренд: </span>
                {product.tags.map((tag, index) => (
                  <span key={tag.slug}>
                    <span className="text-sm font-medium text-gray-900">{tag.name}</span>
                    {index < product.tags.length - 1 && <span className="text-gray-400">, </span>}
                  </span>
                ))}
              </div>
            )}
            
            <p className="text-4xl md:text-5xl font-light my-6">{product.price} сом</p>

            <div className="prose max-w-none text-gray-700">
              <p>{product.description}</p>
            </div>
            
            {/* Характеристики товара */}
            {product.attributes && product.attributes.length > 0 && (
              <div className="mt-6">
                <h3 className="text-lg font-semibold mb-3">Характеристики</h3>
                <div className="bg-gray-50 rounded-lg p-4">
                  <dl className="grid grid-cols-1 gap-3">
                    {product.attributes.map((attr, index) => (
                      <div key={index} className="flex justify-between py-2 border-b border-gray-200 last:border-b-0">
                        <dt className="text-sm font-medium text-gray-600">
                          {attr.attribute.name}
                        </dt>
                        <dd className="text-sm text-gray-900 font-medium">
                          {attr.value}
                          {attr.attribute.unit && (
                            <span className="text-gray-500 ml-1">{attr.attribute.unit}</span>
                          )}
                        </dd>
                      </div>
                    ))}
                  </dl>
                </div>
              </div>
            )}

            <div className="mt-8 space-y-3">
              <button 
                onClick={handleAddToCart}
                className="w-full bg-black text-white py-3 px-6 text-base font-medium hover:bg-gray-800 transition-colors rounded-full flex items-center justify-center gap-2"
              >
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                </svg>
                Добавить в корзину
              </button>
            </div>
          </div>
        </div>
      </div>
      
      {/* Связанные товары - центрированная секция */}
      <div className="max-w-7xl mx-auto mt-12">
        <RelatedProducts 
          currentProduct={product} 
          matchAttributes={['brend']} 
          title="Похожие товары"
          limit={12}
        />
      </div>
    </PageLayout>
  );
}