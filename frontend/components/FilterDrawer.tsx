// src/components/FilterDrawer.tsx
'use client';

import React from 'react';
import FilterSidebar, { FilterState } from '@/components/FilterSidebar';

interface Props {
  categoryId?: number;
  onFiltersChange: (filters: FilterState) => void;
  filtersActive: boolean;
}

export default function FilterDrawer({ categoryId, onFiltersChange, filtersActive }: Props) {
  // Убираем всё лишнее: fixed, z-index, width, height, transform...
  // Теперь это просто обертка для сайдбара.
  return (
    <div className="w-full">
      <FilterSidebar
        categoryId={categoryId}
        onFiltersChange={onFiltersChange}
        hideTitle
      />
    </div>
  );
}