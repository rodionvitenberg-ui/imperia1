'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import FilterSidebar, { FilterState } from './FilterSidebar';

interface FilterButtonProps {
  categoryId?: number;
  onFiltersChange: (filters: FilterState) => void;
  filtersActive: boolean;
}

const FilterButton: React.FC<FilterButtonProps> = ({
  categoryId,
  onFiltersChange,
  filtersActive,
}) => {
  const [isOpen, setIsOpen] = useState(false);
  const [localFilters, setLocalFilters] = useState<FilterState>({
    brands: [],
    attributes: {},
    isNew: false,
    isFavorite: false,
  });

  const handleClose = () => setIsOpen(false);

  const handleOpen = () => {
    setLocalFilters({ brands: [], attributes: {}, isNew: false, isFavorite: false });
    setIsOpen(true);
  };

  const handleLocalFiltersChange = (newFilters: FilterState) => {
    setLocalFilters(newFilters);
    onFiltersChange(newFilters);
  };

  const activeCount =
    localFilters.brands.length +
    Object.values(localFilters.attributes).flat().length +
    (localFilters.isNew ? 1 : 0) +
    (localFilters.isFavorite ? 1 : 0);

  return (
    <>
      <button
        onClick={handleOpen}
        className={`flex items-center justify-center gap-2 px-4 py-3 rounded-[20px] transition-all duration-200 touch-manipulation
          ${filtersActive
            ? 'bg-primary text-white shadow-md'
            : 'bg-white text-[#212121] border border-[#bfbfbf] hover:bg-gray-50'
          }`}
      >
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
          <path strokeLinecap="round" strokeLinejoin="round" d="M10.5 6h9.75M10.5 6a1.5 1.5 0 11-3 0m3 0a1.5 1.5 0 10-3 0M3.75 6H7.5m0 12h9.75m-9.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-9.75 0H10.5" />
        </svg>
        <span className="font-medium text-sm">Фильтры</span>
        {filtersActive && <span className="w-2 h-2 rounded-full bg-red-500 animate-pulse" />}
      </button>

      <AnimatePresence>
        {isOpen && (
          <div className="fixed inset-0 z-50 flex items-end">
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              transition={{ duration: 0.25 }}
              className="absolute inset-0 bg-black/40"
              onClick={handleClose}
            />
            <motion.div
              initial={{ y: '100%' }}
              animate={{ y: 0 }}
              exit={{ y: '100%' }}
              transition={{ duration: 0.22, ease: 'easeOut' }}
              className="relative w-full max-h-[86vh] bg-white overflow-hidden"
              style={{ boxShadow: '0 -8px 40px rgba(0,0,0,0.08)' }}
            >
              <div className="px-5 pt-4 pb-2 flex items-center justify-between">
                <span className="text-xs text-gray-500">{activeCount > 0 ? `${activeCount} активно` : ''}</span>
                <button onClick={handleClose} className="text-gray-400 hover:text-gray-600 transition-colors">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>

              <div className="overflow-y-auto max-h-[calc(60vh+10px)] px-5 pb-4 filter-scrollbar">
                <FilterSidebar
                  categoryId={categoryId}
                  onFiltersChange={handleLocalFiltersChange}
                  hideTitle={true}
                  variant="mobile"
                />
              </div>
            </motion.div>
          </div>
        )}
      </AnimatePresence>
    </>
  );
};

export default FilterButton;