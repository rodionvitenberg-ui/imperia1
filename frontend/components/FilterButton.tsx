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
  filtersActive 
}) => {
  const [isOpen, setIsOpen] = useState(false);

  const handleClose = () => {
    setIsOpen(false);
  };

  return (
    <>
      {/* Кнопка фильтров */}
      <button
        onClick={() => setIsOpen(true)}
        className={`
          fixed bottom-4 right-4 z-40
          flex items-center space-x-2 px-4 py-3 
          rounded-full shadow-lg hover:shadow-xl 
          transition-all duration-200 touch-manipulation
          ${filtersActive 
            ? 'bg-primary text-white' 
            : 'bg-white text-[#212121] border border-[#bfbfbf]'
          }
        `}
      >
        <svg 
          xmlns="http://www.w3.org/2000/svg" 
          fill="none" 
          viewBox="0 0 24 24" 
          strokeWidth={1.5} 
          stroke="currentColor" 
          className="w-5 h-5"
        >
          <path 
            strokeLinecap="round" 
            strokeLinejoin="round" 
            d="M10.5 6h9.75M10.5 6a1.5 1.5 0 11-3 0m3 0a1.5 1.5 0 10-3 0M3.75 6H7.5m0 12h9.75m-9.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-9.75 0H10.5" 
          />
        </svg>
        <span className="font-medium">Фильтры</span>
        {filtersActive && (
          <div className="w-2 h-2 bg-red-500 rounded-full animate-pulse" />
        )}
      </button>

      {/* Модальное окно с фильтрами */}
      <AnimatePresence>
        {isOpen && (
          <div className="fixed inset-0 z-50">
            {/* Затемняющий фон */}
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              transition={{ duration: 0.3 }}
              className="absolute inset-0 bg-black/50"
              onClick={handleClose}
            />
            
            {/* Панель фильтров */}
            <motion.div
              initial={{ x: '100%' }}
              animate={{ x: 0 }}
              exit={{ x: '100%' }}
              transition={{ type: 'tween', duration: 0.3, ease: 'easeInOut' }}
              className="absolute top-0 right-0 h-full w-full max-w-sm bg-white flex flex-col shadow-2xl"
            >
              {/* Шапка */}
              <div className="bg-primary text-white p-4 flex justify-between items-center">
                <h2 className="text-lg font-semibold">Фильтры товаров</h2>
                <button 
                  onClick={handleClose}
                  className="p-1 hover:bg-gray-700 rounded transition-colors"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>

              {/* Прокручиваемый контент с фильтрами */}
              <div className="flex-1 overflow-y-auto p-4">
                <FilterSidebar
                  categoryId={categoryId}
                  onFiltersChange={(filters) => {
                    onFiltersChange(filters);
                    // Автоматически закрываем панель после применения фильтров
                    // setTimeout(() => handleClose(), 500);
                  }}
                  hideTitle={true}
                />
              </div>

              {/* Нижняя панель с кнопками */}
              <div className="border-t border-gray-200 p-4 space-y-3">
                <button
                  onClick={handleClose}
                  className="w-full bg-primary text-white py-3 rounded-[20px] hover:bg-primary/90 transition-colors font-bold text-[14px] min-h-[40px]"
                >
                  Применить фильтры
                </button>
                <button
                  onClick={() => {
                    onFiltersChange({
                      brands: [],
                      attributes: {},
                      isNew: false,
                      isFavorite: false,
                    });
                  }}
                  className="w-full bg-white text-[#212121] border border-[#bfbfbf] py-2 rounded-[20px] hover:bg-gray-50 transition-colors font-bold text-[14px] min-h-[40px]"
                >
                  Сбросить всё
                </button>
              </div>
            </motion.div>
          </div>
        )}
      </AnimatePresence>
    </>
  );
};

export default FilterButton;