// src/components/FilterSidebar.tsx
'use client';

import React, { useState, useEffect } from 'react';
import { Tag, fetchCategoryFilters } from '@/lib/api';
import AccordionFilterGroup from './AccordionFilterGroup'; // <-- ШАГ 1: Импортируем наш новый компонент

// Интерфейсы FilterAttribute, FilterState, FilterSidebarProps остаются без изменений
export interface FilterAttribute {
  id: number;
  name: string;
  slug: string;
  unit: string;
  values: string[];
}

export interface FilterState {
  brands: string[];
  attributes: Record<string, string[]>;
  isNew: boolean;
  isFavorite: boolean;
}

interface FilterSidebarProps {
  categoryId?: number;
  onFiltersChange: (filters: FilterState) => void;
  hideTitle?: boolean;
  hideFeaturesTitle?: boolean;
}


const FilterSidebar: React.FC<FilterSidebarProps> = ({
  categoryId,
  onFiltersChange,
  hideTitle = false,
  // hideFeaturesTitle больше не нужен, но оставим для совместимости
  hideFeaturesTitle = false, 
}) => {
  // Вся эта логика остается БЕЗ ИЗМЕНЕНИЙ. Она работает, и мы ее не трогаем.
  const [brands, setBrands] = useState<Tag[]>([]);
  const [attributes, setAttributes] = useState<FilterAttribute[]>([]);
  const [loading, setLoading] = useState(false);
  const [filters, setFilters] = useState<FilterState>({
    brands: [],
    attributes: {},
    isNew: false,
    isFavorite: false,
  });

  useEffect(() => {
    if (!categoryId) return;
    const loadFilters = async () => {
      setLoading(true);
      try {
        const attributesData = await fetchCategoryFilters(categoryId);
        setBrands([]);
        setAttributes(attributesData);
      } catch (e) {
        console.error('Failed to load filters:', e);
      } finally {
        setLoading(false);
      }
    };
    loadFilters();
  }, [categoryId]);

  const updateFilters = (newFilters: Partial<FilterState>) => {
    const updated = { ...filters, ...newFilters };
    setFilters(updated);
    onFiltersChange(updated as FilterState);
  };

  const handleBrandChange = (brandSlug: string, checked: boolean) => {
    const next = checked
      ? [...filters.brands, brandSlug]
      : filters.brands.filter((b) => b !== brandSlug);
    updateFilters({ brands: next });
  };

  const handleAttributeChange = (attrSlug: string, value: string, checked: boolean) => {
    const current = filters.attributes[attrSlug] || [];
    const nextValues = checked ? [...current, value] : current.filter((v) => v !== value);
    const nextAttrs = { ...filters.attributes };
    if (nextValues.length) nextAttrs[attrSlug] = nextValues; else delete nextAttrs[attrSlug];
    updateFilters({ attributes: nextAttrs });
  };
  
  const clearFilters = () => {
    const cleared: FilterState = { brands: [], attributes: {}, isNew: false, isFavorite: false };
    setFilters(cleared);
    onFiltersChange(cleared);
  };

  // Логика загрузки тоже остается прежней
  if (loading) {
    return (
      <aside>
        {!hideTitle && <h3 className="mb-4 text-lg font-bold">Фильтры</h3>}
        <div className="text-gray-500">Загрузка фильтров...</div>
      </aside>
    );
  }

  // 👇 --- НАЧАЛО ИЗМЕНЕНИЙ В JSX --- 👇
  return (
    <aside>
      {<h3 className="mb-4 text-lg font-bold">Фильтры</h3>}

      {/* ШАГ 2: Оборачиваем "Особенности" в наш аккордеон */}
      <AccordionFilterGroup title="Особенности" startOpen={true}>
        <ul className="space-y-1">
          <li>
            <label className="flex items-center cursor-pointer group">
              <div className="relative mr-2">
                <input
                  type="checkbox"
                  className="sr-only"
                  checked={filters.isNew}
                  onChange={(e) => updateFilters({ isNew: e.target.checked })}
                />
                <div className={`w-4 h-4 rounded border-2 flex items-center justify-center transition-all duration-200 ${
                  filters.isNew 
                    ? 'bg-black border-black' 
                    : 'border-gray-300 group-hover:border-gray-400'
                }`}>
                  {filters.isNew && (
                    <svg className="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                    </svg>
                  )}
                </div>
              </div>
              Новинка
            </label>
          </li>
          <li>
            <label className="flex items-center cursor-pointer group">
              <div className="relative mr-2">
                <input
                  type="checkbox"
                  className="sr-only"
                  checked={filters.isFavorite}
                  onChange={(e) => updateFilters({ isFavorite: e.target.checked })}
                />
                <div className={`w-4 h-4 rounded border-2 flex items-center justify-center transition-all duration-200 ${
                  filters.isFavorite 
                    ? 'bg-black border-black' 
                    : 'border-gray-300 group-hover:border-gray-400'
                }`}>
                  {filters.isFavorite && (
                    <svg className="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                    </svg>
                  )}
                </div>
              </div>
              Популярный
            </label>
          </li>
        </ul>
      </AccordionFilterGroup>

      {/* ШАГ 3: Оборачиваем "Бренды" (если они есть) в аккордеон */}
      {brands.length > 0 && (
        <AccordionFilterGroup title="Бренд">
          <ul className="max-h-48 space-y-1 overflow-y-auto">
            {brands.map((brand) => (
              <li key={brand.slug}>
                <label className="flex items-center cursor-pointer group">
                  <div className="relative mr-2">
                    <input
                      type="checkbox"
                      className="sr-only"
                      checked={filters.brands.includes(brand.slug)}
                      onChange={(e) => handleBrandChange(brand.slug, e.target.checked)}
                    />
                    <div className={`w-4 h-4 rounded border-2 flex items-center justify-center transition-all duration-200 ${
                      filters.brands.includes(brand.slug) 
                        ? 'bg-black border-black' 
                        : 'border-gray-300 group-hover:border-gray-400'
                    }`}>
                      {filters.brands.includes(brand.slug) && (
                        <svg className="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">
                          <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                        </svg>
                      )}
                    </div>
                  </div>
                  {brand.name}
                </label>
              </li>
            ))}
          </ul>
        </AccordionFilterGroup>
      )}

      {/* ШАГ 4: Оборачиваем КАЖДЫЙ атрибут в свой аккордеон */}
      {attributes.map((attr) => (
        <AccordionFilterGroup 
          key={attr.id} 
          title={`${attr.name}`}
        >
          <ul className="max-h-48 space-y-1 overflow-y-auto">
            {attr.values.map((value) => (
              <li key={value}>
                <label className="flex items-center cursor-pointer group">
                  <div className="relative mr-2">
                    <input
                      type="checkbox"
                      className="sr-only"
                      checked={filters.attributes[attr.slug]?.includes(value) || false}
                      onChange={(e) => handleAttributeChange(attr.slug, value, e.target.checked)}
                    />
                    <div className={`w-4 h-4 rounded border-2 flex items-center justify-center transition-all duration-200 ${
                      filters.attributes[attr.slug]?.includes(value) 
                        ? 'bg-black border-black' 
                        : 'border-gray-300 group-hover:border-gray-400'
                    }`}>
                      {filters.attributes[attr.slug]?.includes(value) && (
                        <svg className="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">
                          <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                        </svg>
                      )}
                    </div>
                  </div>
                  {value}
                </label>
              </li>
            ))}
          </ul>
        </AccordionFilterGroup>
      ))}
      
      {/* Остальная часть компонента без изменений */}
      {!categoryId && (
        <div className="text-sm text-gray-500">
          Выберите категорию для отображения фильтров
        </div>
      )}
    </aside>
  );
  // 👆 --- КОНЕЦ ИЗМЕНЕНИЙ В JSX --- 👆
};

export default FilterSidebar;