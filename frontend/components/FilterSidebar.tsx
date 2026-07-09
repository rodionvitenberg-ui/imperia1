// src/components/FilterSidebar.tsx
'use client';

import React, { useState, useEffect } from 'react';
import { Tag, fetchCategoryFilters, fetchCategoryBrands } from '@/lib/api';
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

function FilterPill({ label, checked, onChange, compact }: { label: string; checked: boolean; onChange: () => void; compact?: boolean }) {
  return (
    <button
      onClick={onChange}
      className={`shrink-0 inline-flex items-center rounded-full font-medium transition-all duration-200 border ${
        compact ? 'px-2 py-0.5 text-[11px] leading-[18px]' : 'px-2.5 py-1 text-xs'
      } ${
        checked
          ? 'bg-[#1061cd] text-white border-[#1061cd]'
          : 'bg-white text-[#212121] border-gray-200 hover:border-[#1061cd] hover:text-[#1061cd]'
      }`}
    >
      {label}
    </button>
  );
}

interface FilterSidebarProps {
  categoryId?: number;
  onFiltersChange: (filters: FilterState) => void;
  hideTitle?: boolean;
  hideFeaturesTitle?: boolean;
  variant?: 'desktop' | 'mobile';
}


const FilterSidebar: React.FC<FilterSidebarProps> = ({
  categoryId,
  onFiltersChange,
  hideTitle = false,
  // hideFeaturesTitle больше не нужен, но оставим для совместимости
  hideFeaturesTitle = false,
  variant = 'desktop',
}) => {
  const isMobile = variant === 'mobile';
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
        const [attributesData, brandsData] = await Promise.all([
          fetchCategoryFilters(categoryId),
          fetchCategoryBrands(categoryId),
        ]);
        setAttributes(attributesData);
        setBrands(brandsData);
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
      <aside className="filter-scrollbar">
        {!hideTitle && <h3 className="mb-4 text-lg font-bold">Фильтры</h3>}
        <div className="text-gray-500">Загрузка фильтров...</div>
      </aside>
    );
  }

  // 👇 --- НАЧАЛО ИЗМЕНЕНИЙ В JSX --- 👇
  return (
    <aside className={`filter-scrollbar pb-8 ${isMobile ? '' : ''}`}>
      {/* ШАГ 2: Оборачиваем "Особенности" в наш аккордеон */}
      <AccordionFilterGroup title="Особенности" startOpen={true} variant={isMobile ? 'mobile' : 'default'}>
        <div className="flex flex-wrap gap-2">
          <FilterPill compact={isMobile} label="Новинка" checked={filters.isNew} onChange={() => updateFilters({ isNew: !filters.isNew })} />
          <FilterPill compact={isMobile} label="Популярный" checked={filters.isFavorite} onChange={() => updateFilters({ isFavorite: !filters.isFavorite })} />
        </div>
      </AccordionFilterGroup>

      {/* ШАГ 3: Оборачиваем "Бренды" (если они есть) в аккордеон */}
      {brands.length > 0 && (
        <AccordionFilterGroup title="Бренд" variant={isMobile ? 'mobile' : 'default'}>
          <div className="flex flex-wrap gap-2">
            {brands.map((brand) => (
              <FilterPill compact={isMobile} key={brand.slug} label={brand.name} checked={filters.brands.includes(brand.slug)} onChange={() => handleBrandChange(brand.slug, !filters.brands.includes(brand.slug))} />
            ))}
          </div>
        </AccordionFilterGroup>
      )}

      {/* ШАГ 4: Оборачиваем КАЖДЫЙ атрибут в свой аккордеон */}
      {attributes.map((attr) => (
        <AccordionFilterGroup 
          key={attr.id} 
          title={`${attr.name}`}
          variant={isMobile ? 'mobile' : 'default'}
        >
          <div className="flex flex-wrap gap-2">
            {attr.values.map((value) => (
              <FilterPill compact={isMobile} key={value} label={value} checked={filters.attributes[attr.slug]?.includes(value) || false} onChange={() => handleAttributeChange(attr.slug, value, !filters.attributes[attr.slug]?.includes(value))} />
            ))}
          </div>
        </AccordionFilterGroup>
      ))}
      
      {/* Остальная часть компонента без изменений */}
      {!categoryId && (
        <div className="text-sm text-gray-500">
          Выберите категорию для отображения фильтров
        </div>
      )}

      {/* Невидимый spacer для дополнительного скролла на десктопе */}
      <div className="hidden md:block h-[1000px]" aria-hidden="true" />
    </aside>
  );
  // 👆 --- КОНЕЦ ИЗМЕНЕНИЙ В JSX --- 👆
};

export default FilterSidebar;