'use client';

import React, { useState, useEffect, useRef } from 'react';
import { AnimatePresence } from 'framer-motion';
import MegaMenu from './MegaMenu';
import { NestedCategory } from '@/lib/api';
import MobileMenu from './MobileMenu';
import { useCart } from '@/contexts/CartContext';
// import { useFavorites } from '@/contexts/FavoritesContext'; // УДАЛЕНО
// import { useAuth } from '@/contexts/AuthContext'; // УДАЛЕНО
import { useCompare } from '@/contexts/CompareContext'; // <-- НОВЫЙ ИМПОРТ (Создадим ниже)
import Link from 'next/link';
import Image from 'next/image';
import SearchDropdown from './SearchDropdown';
import SearchModal from './SearchModal';
import CartDropdown from './CartDropdown';

function useIsMobile() {
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768);
    };
    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  return isMobile;
}

interface TopBarLink { name: string; href: string; }
interface HeaderProps {
  allCategories: NestedCategory[];
  topBarLinks: TopBarLink[];
}

type DropdownType = 'search' | 'cart' | null;

const Header: React.FC<HeaderProps> = ({ allCategories, topBarLinks }) => {
  const isMobile = useIsMobile();
  
  const [isMobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [isSearchModalOpen, setSearchModalOpen] = useState(false);
  
  const [hoveredLink, setHoveredLink] = useState<{ name: string; href: string; slug: string } | null>(null);
  const timeoutRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  const [activeDropdown, setActiveDropdown] = useState<DropdownType>(null);

  const { totalItems } = useCart();
  
  // Подключаем контекст сравнения (пока закомментируй, если файла нет)
  const { compareItems } = useCompare(); 
  const compareCount = compareItems.length;

  // Динамическое меню
  const mainNavLinks = allCategories
    .filter((cat) => (cat.header_order || 0) > 0)
    .sort((a, b) => (a.header_order || 0) - (b.header_order || 0))
    .map((cat) => ({
      name: cat.name,
      href: `/catalog/${cat.slug}`,
      slug: cat.slug,
      original: cat 
    }));

  const currentMenuContent = hoveredLink 
    ? allCategories.find((c) => c.slug === hoveredLink.slug)?.children || [] 
    : [];

  // --- ЛОГИКА ---
  const handleHeaderEnter = () => {
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
      timeoutRef.current = null;
    }
  };

  const handleHeaderLeave = () => {
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
    }
    timeoutRef.current = setTimeout(() => {
      setHoveredLink(null);
      setActiveDropdown(null);
    }, 200);
  };

  const handleLinkMouseEnter = (link: { name: string; href: string; slug: string }) => {
    handleHeaderEnter();
    setHoveredLink(link);
    setActiveDropdown(null);
  };

  const toggleDropdown = (type: DropdownType) => {
    setActiveDropdown(prev => prev === type ? null : type);
  };

  return (
    <header 
      className="relative w-full z-50 bg-white border-b border-gray-200 shadow-sm"
      onMouseEnter={handleHeaderEnter}
      onMouseLeave={handleHeaderLeave}
    >
      <div className="container mx-auto px-4 h-20 flex items-center justify-between">
        
        {/* ЛОГОТИП */}
        <div className="flex-shrink-0 mr-4">
          <Link href="/" className="block">
            <Image
              src="/logo.png"
              alt="Electronics Store"
              width={160}
              height={40}
              className="h-22 w-auto object-contain object-left"
              priority
            />
          </Link>
        </div>

        {/* НАВИГАЦИЯ (Только Десктоп) */}
        <nav className="hidden md:flex items-center gap-8 h-full">
          {mainNavLinks.map((link) => (
            <div
              key={link.slug}
              className="h-full flex items-center relative group cursor-pointer"
              onMouseEnter={() => handleLinkMouseEnter(link)}
            >
              <Link 
                href={link.href}
                className="text-gray-700 font-medium hover:text-soft-black transition-colors py-2"
              >
                {link.name}
              </Link>
              <span className="absolute bottom-0 left-0 w-full h-0.5 bg-soft-black scale-x-0 group-hover:scale-x-100 transition-transform origin-left duration-200" />
            </div>
          ))}
        </nav>

        {/* ИКОНКИ СПРАВА */}
        <div className="flex items-center gap-4">
          
          {/* ПОИСК */}
          <button 
            onClick={() => isMobile ? setSearchModalOpen(true) : toggleDropdown('search')}
            className={`p-2 transition-colors relative ${activeDropdown === 'search' ? 'text-soft-black' : 'text-gray-600 hover:text-soft-black'}`}
            aria-label="Поиск"
          >
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </button>

          {/* --- НОВАЯ КНОПКА: СРАВНЕНИЕ --- */}
          <Link 
            href="/compare"
            className="hidden md:block p-2 text-gray-600 hover:text-soft-black transition-colors relative"
            aria-label="Сравнение"
          >
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
            </svg>
            {compareCount > 0 && (
              <span className="absolute top-0 right-0 bg-soft-black text-white text-xs font-bold rounded-full h-5 w-5 flex items-center justify-center transform translate-x-1/4 -translate-y-1/4">
                {compareCount}
              </span>
            )}
          </Link>

          {/* КОРЗИНА */}
          <button 
            onClick={() => toggleDropdown('cart')}
            className={`hidden md:block p-2 transition-colors relative ${activeDropdown === 'cart' ? 'text-soft-black' : 'text-gray-600 hover:text-soft-black'}`}
            aria-label="Корзина"
          >
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
            </svg>
            {totalItems > 0 && (
              <span className="absolute top-0 right-0 bg-soft-black text-white text-xs font-bold rounded-full h-5 w-5 flex items-center justify-center transform translate-x-1/4 -translate-y-1/4">
                {totalItems}
              </span>
            )}
          </button>

          {/* БУРГЕР МЕНЮ */}
          <button 
            className="md:hidden p-2 text-gray-600 hover:text-soft-black transition-colors"
            onClick={() => setMobileMenuOpen(true)}
            aria-label="Меню"
          >
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
        </div>
      </div>

      <AnimatePresence>
        {!isMobile && hoveredLink && currentMenuContent.length > 0 && (
          <div onMouseEnter={handleHeaderEnter}>
            <MegaMenu content={currentMenuContent} />
          </div>
        )}
      </AnimatePresence>

      <AnimatePresence>
        {!isMobile && activeDropdown === 'search' && <SearchDropdown key="search-dropdown" />}
      </AnimatePresence>

      <AnimatePresence>
        {!isMobile && activeDropdown === 'cart' && <CartDropdown key="cart-dropdown" />}
      </AnimatePresence>

      <AnimatePresence>
        {isMobileMenuOpen && (
          <MobileMenu
            navLinks={allCategories}
            closeMenu={() => setMobileMenuOpen(false)}
          />
        )}
      </AnimatePresence>

      <SearchModal isOpen={isSearchModalOpen} onClose={() => setSearchModalOpen(false)} />
    </header>
  );
};

export default Header;