// src/components/PopularProducts.tsx
'use client';

import React, { useState, useEffect } from 'react';
import { Product, fetchPopularProducts } from '@/lib/api';
import ProductGrid from './ProductGrid';

const PopularProducts: React.FC = () => {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadPopularProducts = async () => {
      try {
        setLoading(true);
        const popularProducts = await fetchPopularProducts(8);
        setProducts(popularProducts);
      } catch (error) {
        console.error('Failed to load popular products:', error);
      } finally {
        setLoading(false);
      }
    };

    loadPopularProducts();
  }, []);

  if (loading) {
    return (
      <div className="container mx-auto my-12 px-4">
        <h2 className="text-[24px] leading-[34px] font-bold text-center mb-8 text-[#212121]" style={{ fontFamily: 'var(--font-display)' }}>Популярные товары</h2>
        <div className="text-center py-8">
          <div className="text-gray-500">Загрузка...</div>
        </div>
      </div>
    );
  }

  if (products.length === 0) {
    return (
      <div className="container mx-auto my-12 px-4">
        <h2 className="text-[24px] leading-[34px] font-bold text-center mb-8 text-[#212121]" style={{ fontFamily: 'var(--font-display)' }}>Популярные товары</h2>
        <div className="text-center py-8">
          <div className="text-gray-500">Популярные товары не найдены</div>
        </div>
      </div>
    );
  }

  return (
    <div className="container mx-auto my-12 px-4">
      <h2 className="text-[24px] leading-[34px] font-bold text-center mb-8 text-[#212121]" style={{ fontFamily: 'var(--font-display)' }}>Популярные товары</h2>
      <ProductGrid products={products} />
    </div>
  );
};

export default PopularProducts;