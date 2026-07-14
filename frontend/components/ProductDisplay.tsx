// src/components/ProductDisplay.tsx
'use client';

import React, { useEffect, useState } from 'react';
import { Product, NestedCategory, buildProductCategoryPath } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';
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

  // Structured data для товара (Product + Review + AggregateRating)
  const mainImage = product.images?.find(i => i.is_main) || product.images?.[0];
  const structuredData = {
    "@context": "https://schema.org",
    "@type": "Product",
    "name": product.name,
    "description": product.description,
    "sku": String(product.id),
    "brand": product.brands?.[0] ? {
      "@type": "Brand",
      "name": product.brands[0].name
    } : undefined,
    "image": mainImage ? `${API_CONFIG.BASE_URL}${mainImage.image}` : undefined,
    "offers": {
      "@type": "Offer",
      "url": `${process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg'}/products/${product.slug}`,
      "priceCurrency": "KGS",
      "price": Number(product.price).toFixed(2),
      "availability": product.stock?.in_stock ? "https://schema.org/InStock" : "https://schema.org/OutOfStock",
    },
    ...((product.average_rating ?? 0) > 0 && {
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": product.average_rating ?? 0,
        "reviewCount": product.reviews_count ?? 0,
        "bestRating": "5",
      }
    }),
  };

  return (
    <PageLayout
      breadcrumbs={<UniversalBreadcrumbs product={product} categoryPath={categoryPath} />}
      actions={<div />} // Пустые actions для одинаковой структуры с каталогом
      centered={true}
      maxWidth="7xl"
    >
      {/* Структурированные данные для поисковых систем */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(structuredData),
        }}
      />
      
      {/* Основная секция товара */}
      <div className="max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 md:gap-12">
          {/* ЛЕВАЯ КОЛОНКА: ГАЛЕРЕЯ */}
          <ProductImageGallery product={product} />

          {/* ПРАВАЯ КОЛОНКА: ИНФОРМАЦИЯ */}
          <div className="flex flex-col py-4">
            <div className="mb-2">
              <h1 className="text-[32px] leading-[38px] font-bold text-[#212121]">{product.name}</h1>
            </div>
            
            {/* Рейтинг и отзывы */}
            {(product.average_rating ?? 0) > 0 && (
              <div className="flex items-center gap-2 mt-1 mb-2">
                <div className="flex items-center gap-0.5">
                  {[1, 2, 3, 4, 5].map((star) => (
                    <svg
                      key={star}
                      className={`w-4 h-4 ${star <= Math.round(product.average_rating ?? 0) ? 'text-yellow-400' : 'text-gray-200'}`}
                      fill="currentColor"
                      viewBox="0 0 20 20"
                    >
                      <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                  ))}
                </div>
                <span className="text-sm text-gray-500">
                  {product.average_rating ?? 0} ({(product.reviews_count ?? 0)} {(product.reviews_count ?? 0) === 1 ? 'отзыв' : (product.reviews_count ?? 0) < 5 && (product.reviews_count ?? 0) > 1 ? 'отзыва' : 'отзывов'})
                </span>
              </div>
            )}

            {/* Бренд из тегов */}
            {product.tags && product.tags.length > 0 && (
              <div className="mt-2">
                <span className="text-sm text-gray-500">Бренд: </span>
                {product.tags.map((tag, index) => (
                  <span key={tag.slug}>
                    <span className="text-sm font-medium text-gray-900">{tag.name}</span>
                    {product.tags && index < product.tags.length - 1 && <span className="text-gray-400">, </span>}
                  </span>
                ))}
              </div>
            )}
            
            <p className="text-4xl md:text-5xl font-semibold my-6 text-[#212121]">{product.price} сом</p>

            <div className="prose max-w-none text-gray-700">
              <p>{product.description}</p>
            </div>
            
            {/* Характеристики товара — таблица для лучшей парсимости LLM */}
            {product.attributes && product.attributes.length > 0 && (
              <div className="mt-6">
                <h3 className="text-[20px] leading-[24px] font-semibold mb-3 text-[#212121]">Характеристики</h3>
                <div className="bg-white border border-[#e5e7eb] rounded-[8px] overflow-hidden">
                  <table className="w-full">
                    <thead className="sr-only">
                      <tr>
                        <th>Характеристика</th>
                        <th>Значение</th>
                      </tr>
                    </thead>
                    <tbody>
                      {product.attributes.map((attr, index) => (
                        <tr key={index} className={`${index % 2 === 0 ? 'bg-white' : 'bg-gray-50'} ${index < product.attributes.length - 1 ? 'border-b border-gray-200' : ''}`}>
                          <td className="px-4 py-3 text-sm font-medium text-[#212121] w-1/2">
                            {attr.attribute.name}
                          </td>
                          <td className="px-4 py-3 text-sm text-[#212121] font-semibold">
                            {typeof attr.value === 'object' ? attr.value.display : String(attr.value)}
                            {attr.attribute.unit && (
                              <span className="text-gray-500 ml-1">{attr.attribute.unit}</span>
                            )}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            )}

            <div className="mt-8 space-y-3">
              <button 
                onClick={handleAddToCart}
                className="w-full bg-primary text-white py-3 px-6 text-[14px] font-bold hover:bg-primary/90 transition-colors rounded-[20px] min-h-[40px] flex items-center justify-center gap-2"
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