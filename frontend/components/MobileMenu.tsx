// src/components/MobileMenu.tsx
'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import Link from 'next/link';
import Image from 'next/image';
import { NestedCategory } from '@/lib/api';
import { useCart } from '@/contexts/CartContext';
// import { useFavorites } from '@/contexts/FavoritesContext'; // УДАЛЕНО
// import { useAuth } from '@/contexts/AuthContext'; // УДАЛЕНО

interface MobileMenuProps {
  navLinks: NestedCategory[];
  closeMenu: () => void;
  // onOpenLoginModal удален из пропсов
}

const MobileMenu: React.FC<MobileMenuProps> = ({ navLinks, closeMenu }) => {
  const { totalItems } = useCart();
  
  // Состояние для раскрытия категорий (аккордеон)
  const [expandedCategory, setExpandedCategory] = useState<string | null>(null);

  const toggleCategory = (slug: string) => {
    setExpandedCategory(prev => prev === slug ? null : slug);
  };

  // Фильтруем и сортируем категории для отображения
  const sortedLinks = navLinks
    .filter(cat => (cat.header_order || 0) > 0)
    .sort((a, b) => (a.header_order || 0) - (b.header_order || 0));

  return (
    <div className="fixed inset-0 z-[60] flex justify-end">
      {/* Затемненный фон (Backdrop) */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 0.5 }}
        exit={{ opacity: 0 }}
        onClick={closeMenu}
        className="absolute inset-0 bg-black"
      />

      {/* Панель меню (выезжает справа) */}
      <motion.div
        initial={{ x: '100%' }}
        animate={{ x: 0 }}
        exit={{ x: '100%' }}
        transition={{ type: 'spring', damping: 25, stiffness: 200 }}
        className="relative w-[85%] max-w-sm h-full bg-white shadow-2xl flex flex-col overflow-hidden"
      >
        
        {/* Шапка меню */}
        <div className="flex items-center justify-between p-5 border-b border-gray-100">
           <Image
              src="/logo.png"
              alt="Logo"
              width={120}
              height={30}
              className="h-15 w-auto object-contain"
            />
          <button 
            onClick={closeMenu}
            className="p-2 text-[#212121] hover:text-primary transition-colors"
          >
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        {/* ОСНОВНОЙ СКРОЛЛ: Категории */}
        <div className="flex-1 overflow-y-auto py-4 px-5">
          <div className="space-y-4">
            {sortedLinks.map((category) => (
              <div key={category.id} className="border-b border-gray-100 last:border-0 pb-2">
                <div className="flex items-center justify-between">
                   <Link 
                      href={`/catalog/${category.slug}`}
                      onClick={closeMenu}
                       className="text-lg font-medium text-[#212121] hover:text-primary"
                   >
                     {category.name}
                   </Link>
                   
                   {/* Кнопка раскрытия подкатегорий, если они есть */}
                   {category.children && category.children.length > 0 && (
                     <button 
                        onClick={() => toggleCategory(category.slug)}
                        className="p-2 text-gray-400"
                     >
                        <svg 
                          xmlns="http://www.w3.org/2000/svg" 
                          className={`h-5 w-5 transition-transform duration-200 ${expandedCategory === category.slug ? 'rotate-180' : ''}`} 
                          fill="none" 
                          viewBox="0 0 24 24" 
                          stroke="currentColor"
                        >
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                        </svg>
                     </button>
                   )}
                </div>

                {/* Выпадающий список подкатегорий */}
                <AnimatePresence>
                  {expandedCategory === category.slug && category.children && (
                    <motion.ul
                      initial={{ height: 0, opacity: 0 }}
                      animate={{ height: 'auto', opacity: 1 }}
                      exit={{ height: 0, opacity: 0 }}
                      className="overflow-hidden pl-4 pt-2 space-y-3"
                    >
                      {category.children.map((child) => (
                        <li key={child.id}>
                          <Link 
                            href={`/catalog/${child.slug}`}
                            onClick={closeMenu}
                             className="block text-[#212121] text-sm py-1 hover:text-primary"
                          >
                            {child.name}
                          </Link>
                        </li>
                      ))}
                    </motion.ul>
                  )}
                </AnimatePresence>
              </div>
            ))}
          </div>
        </div>

        {/* НИЖНИЙ БЛОК: Только Корзина */}
        <div className="border-t border-gray-100 bg-gray-50 p-5">
            <Link 
              href="/cart" 
              onClick={closeMenu}
              className="flex items-center justify-center gap-3 w-full py-4 bg-primary text-white rounded-[20px] hover:opacity-90 transition-opacity"
            >
              <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                 <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
              </svg>
              <span className="text-base font-medium">Корзина</span>
              {totalItems > 0 && (
                <span className="ml-2 bg-white text-primary text-xs font-bold h-6 min-w-[24px] px-1.5 flex items-center justify-center rounded-full">
                  {totalItems}
                </span>
              )}
            </Link>
        </div>

      </motion.div>
    </div>
  );
};

export default MobileMenu;