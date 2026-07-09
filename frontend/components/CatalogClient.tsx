// src/components/CatalogClient.tsx
'use client';

import React, { useState, useEffect } from 'react';
import {
  Product,
  NestedCategory,
  fetchProductsWithFilters,
  fetchProductsByCategorySlugs,
} from '@/lib/api';
import { FilterState } from '@/components/FilterSidebar';
import ProductGrid from '@/components/ProductGrid';
import FilterDrawer from '@/components/FilterDrawer';
import FilterButton from '@/components/FilterButton';
import UniversalBreadcrumbs from '@/components/UniversalBreadcrumbs';
import PageLayout from '@/components/PageLayout';

// Хук для определения мобильного устройства
function useIsMobile() {
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768); // md breakpoint
    };
    
    checkMobile();
    window.addEventListener('resize', checkMobile);
    
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  return isMobile;
}

interface CatalogClientProps {
  initialProducts: Product[];
  categoryPath: NestedCategory[];
  categorySlugs: string[];
}

const CatalogClient: React.FC<CatalogClientProps> = ({
  initialProducts,
  categoryPath,
  categorySlugs,
}) => {
  const [products, setProducts] = useState<Product[]>(initialProducts);
  const [loading, setLoading] = useState(false);
  const [showFilters, setShowFilters] = useState(true);
  const [sortOrder, setSortOrder] = useState<'price-asc' | 'price-desc' | null>(null);
  const [filters, setFilters] = useState<FilterState>({
    brands: [], attributes: {}, isNew: false, isFavorite: false,
  });
  const [showSortMenu, setShowSortMenu] = useState(false);
  const isMobile = useIsMobile();

  const handleToggleFilters = () => {
    setShowFilters(!showFilters);
  };

  const handleSortChange = (newSortOrder: 'price-asc' | 'price-desc' | null) => {
    setSortOrder(newSortOrder);
    setShowSortMenu(false);
    const sortedProducts = [...products];
    
    if (newSortOrder === 'price-asc') {
      sortedProducts.sort((a, b) => Number(a.price) - Number(b.price));
    } else if (newSortOrder === 'price-desc') {
      sortedProducts.sort((a, b) => Number(b.price) - Number(a.price));
    }
    
    setProducts(sortedProducts);
  };

  const currentCategoryId =
    categoryPath.length > 0 ? categoryPath[categoryPath.length - 1].id : undefined;

  const handleFiltersChange = async (newFilters: FilterState) => {
    setFilters(newFilters);
    setLoading(true);
    try {
      const hasActiveFilters =
        newFilters.brands.length > 0 ||
        Object.keys(newFilters.attributes).length > 0 ||
        newFilters.isNew ||
        newFilters.isFavorite;

      let next: Product[];

      if (hasActiveFilters) {
        next = await fetchProductsWithFilters({
          categorySlugs,
          brands: newFilters.brands.length > 0 ? newFilters.brands : undefined,
          attributes: Object.keys(newFilters.attributes).length > 0 ? newFilters.attributes : undefined,
          isNew: newFilters.isNew || undefined,
          isFavorite: newFilters.isFavorite || undefined,
        });
      } else {
        next = await fetchProductsByCategorySlugs(categorySlugs);
      }
      
      if (sortOrder === 'price-asc') {
        next.sort((a, b) => Number(a.price) - Number(b.price));
      } else if (sortOrder === 'price-desc') {
        next.sort((a, b) => Number(b.price) - Number(a.price));
      }
      
      setProducts(next);
    } catch (error) {
      console.error('Failed to apply filters:', error);
      setProducts(initialProducts);
    } finally {
      setLoading(false);
    }
  };

  const filtersActive =
    filters.brands.length > 0 ||
    Object.keys(filters.attributes).length > 0 ||
    filters.isNew ||
    filters.isFavorite;

  const getSortLabel = () => {
    if (sortOrder === 'price-asc') return 'Дешевле';
    if (sortOrder === 'price-desc') return 'Дороже';
    return 'Сортировка';
  };

  return (
    <PageLayout
      breadcrumbs={<UniversalBreadcrumbs categoryPath={categoryPath} />}
      actions={
        <>
          {/* ДЕСКТОПНЫЕ КНОПКИ */}
          <div className="hidden md:block relative">
            <button 
              onClick={() => setShowSortMenu(!showSortMenu)}
              className="flex items-center gap-2 px-4 py-2 text-sm border border-[#bfbfbf] rounded-[20px] hover:bg-gray-50 transition-colors font-bold text-[#212121]"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 4h13M3 8h9m-9 4h9m5-4v12m0 0l-4-4m4 4l4-4" />
              </svg>
              {sortOrder === 'price-asc' ? 'Дешевле-дороже' : 
               sortOrder === 'price-desc' ? 'Дороже-дешевле' : 'Сортировка'}
            </button>
            
            {showSortMenu && (
              <div className="absolute right-0 mt-2 w-56 bg-white rounded-[8px] border border-[#e5e7eb] z-10">
                <div className="py-1">
                  <button onClick={() => handleSortChange(null)} className={`w-full text-left px-4 py-2 text-sm hover:bg-gray-100 ${sortOrder === null ? 'bg-gray-100' : ''}`}>По умолчанию</button>
                  <button onClick={() => handleSortChange('price-asc')} className={`w-full text-left px-4 py-2 text-sm hover:bg-gray-100 ${sortOrder === 'price-asc' ? 'bg-gray-100' : ''}`}>Цена: дешевле-дороже</button>
                  <button onClick={() => handleSortChange('price-desc')} className={`w-full text-left px-4 py-2 text-sm hover:bg-gray-100 ${sortOrder === 'price-desc' ? 'bg-gray-100' : ''}`}>Цена: дороже-дешевле</button>
                </div>
              </div>
            )}
          </div>
          
          <button
            onClick={handleToggleFilters}
            className={`hidden md:flex items-center gap-2 px-4 py-2 text-sm border rounded-[20px] transition-colors font-bold ${
              showFilters 
                ? 'border-primary bg-primary/5 text-primary' 
                : 'border-[#bfbfbf] hover:bg-gray-50 text-[#212121]'
            }`}
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4" />
            </svg>
            {showFilters ? 'Скрыть фильтры' : 'Показать фильтры'}
          </button>

          {/* МОБИЛЬНЫЕ КНОПКИ — перенесены в actions */}
          <div className="md:hidden grid grid-cols-2 gap-2 w-full">
            <div className="relative h-9">
              <button
                onClick={() => setShowSortMenu(!showSortMenu)}
                className="w-full h-full flex items-center justify-center gap-2 px-3 text-sm font-bold border border-[#bfbfbf] rounded-[8px] bg-white hover:bg-gray-50 active:bg-gray-100 transition-colors"
              >
                <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 4h13M3 8h9m-9 4h9m5-4v12m0 0l-4-4m4 4l4-4" />
                </svg>
                <span className="truncate">{getSortLabel()}</span>
              </button>

              {showSortMenu && (
                <div className="absolute top-full left-0 mt-2 w-full bg-white rounded-[8px] border border-[#e5e7eb] z-30 overflow-hidden">
                  <button onClick={() => handleSortChange(null)} className={`w-full text-left px-4 py-3 text-sm border-b border-gray-100 ${sortOrder === null ? 'bg-gray-50 font-medium' : ''}`}>По умолчанию</button>
                  <button onClick={() => handleSortChange('price-asc')} className={`w-full text-left px-4 py-3 text-sm border-b border-gray-100 ${sortOrder === 'price-asc' ? 'bg-gray-50 font-medium' : ''}`}>Сначала дешевле</button>
                  <button onClick={() => handleSortChange('price-desc')} className={`w-full text-left px-4 py-3 text-sm ${sortOrder === 'price-desc' ? 'bg-gray-50 font-medium' : ''}`}>Сначала дороже</button>
                </div>
              )}
            </div>

            <div className="h-9">
              <div className="w-full h-full [&>button]:!w-full [&>button]:!h-full [&>button]:!rounded-lg [&>button]:!shadow-sm [&>button]:!border-gray-200 [&>button]:!border [&>button]:!bg-white [&>button]:!static [&>button]:!flex [&>button]:!items-center [&>button]:!justify-center [&>button]:!py-0 [&>button]:!m-0 [&>button]:!text-sm [&>button]:!font-medium [&>button]:!text-gray-900">
                <FilterButton
                  categoryId={currentCategoryId}
                  onFiltersChange={handleFiltersChange}
                  filtersActive={filtersActive}
                />
              </div>
            </div>
          </div>
        </>
      }
      sidebar={
        <FilterDrawer
          categoryId={currentCategoryId}
          onFiltersChange={handleFiltersChange}
          filtersActive={filtersActive}
        />
      }
      showSidebar={!isMobile && showFilters}
      maxWidth="full"
    >
      {loading && <div className="text-center py-8">Загрузка...</div>}
      {!loading && products.length > 0 && <ProductGrid products={products} />}
      {!loading && products.length === 0 && (
        <div className="text-center py-12">
          <p>Товары не найдены.</p>
        </div>
      )}
    </PageLayout>
  );
};

export default CatalogClient;