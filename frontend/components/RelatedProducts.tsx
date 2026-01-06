// src/components/RelatedProducts.tsx
'use client';

import React, { useState, useEffect } from 'react';
import { Product } from '@/lib/api';
import ProductCarousel from './ProductCarousel';
import { API_CONFIG } from '@/lib/config';

interface RelatedProductsProps {
  currentProduct: Product;
  matchAttributes?: string[]; // Список slug'ов атрибутов для поиска похожих товаров
  title?: string;
  limit?: number;
}

// Функция для поиска рекомендуемых товаров по определенным атрибутам
const fetchRecommendedProducts = async (
  currentProduct: Product, 
  matchAttributes: string[] = [], 
  limit: number = 8
): Promise<Product[]> => {
  try {
    console.log('🔍 Fetching recommended products for:', currentProduct.name);
    console.log('📋 Match attributes:', matchAttributes);
    
    const queryParams = new URLSearchParams();
    
    // Исключаем текущий товар
    queryParams.append('exclude_id', currentProduct.id.toString());
    
    // Если указаны конкретные атрибуты для сопоставления
    if (matchAttributes.length > 0 && currentProduct.attributes) {
      const attributeFilters: Record<string, string[]> = {};
      
      // Находим значения указанных атрибутов у текущего товара
      currentProduct.attributes.forEach(attr => {
        if (matchAttributes.includes(attr.attribute.slug)) {
          if (!attributeFilters[attr.attribute.slug]) {
            attributeFilters[attr.attribute.slug] = [];
          }
          attributeFilters[attr.attribute.slug].push(attr.value);
        }
      });
      
      // Добавляем фильтры по найденным атрибутам
      Object.entries(attributeFilters).forEach(([attrSlug, values]) => {
        if (values.length > 0) {
          const paramName = `attributes[${attrSlug}]`;
          const paramValue = values.join(',');
          queryParams.append(paramName, paramValue);
          console.log(`🔗 Filtering by ${attrSlug}:`, values);
        }
      });
    }
    
    // Если атрибуты не указаны, используем категории (как было раньше)
    if (matchAttributes.length === 0 && currentProduct.categories && currentProduct.categories.length > 0) {
      currentProduct.categories.forEach(category => {
        queryParams.append('categories__slug', category.slug);
      });
      console.log('🏷️ Filtering by categories:', currentProduct.categories.map(c => c.slug));
    }
    
    const url = `${API_CONFIG.PRODUCTS.PRODUCTS}?${queryParams.toString()}`;
    console.log('🌐 Request URL:', url);
    
    const res = await fetch(url);
    if (!res.ok) {
      console.error(`Failed to fetch recommended products, status: ${res.status}`);
      // Fallback: берем случайные товары из той же категории
      return await fetchFallbackProducts(currentProduct, limit);
    }
    
    const products: Product[] = await res.json();
    console.log(`✅ Found ${products.length} recommended products`);
    
    return products.slice(0, limit);
  } catch (error) {
    console.error('❌ Error fetching recommended products:', error);
    return await fetchFallbackProducts(currentProduct, limit);
  }
};

// Fallback функция для получения товаров из той же категории
const fetchFallbackProducts = async (product: Product, limit: number = 8): Promise<Product[]> => {
  try {
    console.log('🔄 Falling back to category-based products');
    const queryParams = new URLSearchParams();
    queryParams.append('exclude_id', product.id.toString());
    
    if (product.categories && product.categories.length > 0) {
      product.categories.forEach(category => {
        queryParams.append('categories__slug', category.slug);
      });
    }
    
    const res = await fetch(`${API_CONFIG.PRODUCTS.PRODUCTS}?${queryParams.toString()}`);
    if (!res.ok) {
      console.error('Fallback also failed, returning empty array');
      return [];
    }
    
    const products: Product[] = await res.json();
    return products.slice(0, limit);
  } catch (error) {
    console.error('Fallback error:', error);
    return [];
  }
};

export default function RelatedProducts({ 
  currentProduct, 
  matchAttributes = [], 
  title = "Рекомендуем также",
  limit = 12 
}: RelatedProductsProps) {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadRecommendedProducts = async () => {
      setLoading(true);
      try {
        const recommendedProducts = await fetchRecommendedProducts(
          currentProduct, 
          matchAttributes, 
          limit
        );
        setProducts(recommendedProducts);
      } catch (error) {
        console.error('Failed to load recommended products:', error);
        setProducts([]);
      } finally {
        setLoading(false);
      }
    };

    loadRecommendedProducts();
  }, [currentProduct, matchAttributes, limit]);

  if (loading) {
    return (
      <div className="my-12">
        <h2 className="text-3xl font-bold text-center mb-8">{title}</h2>
        <div className="text-center py-8">
          <div className="text-gray-500">Загрузка...</div>
        </div>
      </div>
    );
  }

  if (products.length === 0) {
    return null;
  }

  return (
    <div className="my-12">
      <h2 className="text-3xl font-bold text-center mb-8">{title}</h2>
      <ProductCarousel products={products} />
    </div>
  );
}