// src/components/MobileMenu.tsx
'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import Link from 'next/link';
import { NestedCategory } from '@/lib/api';

interface MobileMenuProps {
  navLinks: NestedCategory[];
  closeMenu: () => void;
}

const menuVariants = {
  hidden: { height: 0, opacity: 0 },
  visible: {
    height: 'auto',
    opacity: 1,
    transition: { duration: 0.25, ease: 'easeOut' as const },
  },
  exit: {
    height: 0,
    opacity: 0,
    transition: { duration: 0.2, ease: 'easeIn' as const },
  },
};

const MobileMenu: React.FC<MobileMenuProps> = ({ navLinks, closeMenu }) => {
  const [expandedCategory, setExpandedCategory] = useState<string | null>(null);

  const toggleCategory = (slug: string) => {
    setExpandedCategory(prev => (prev === slug ? null : slug));
  };

  // navLinks уже содержит HARDCODED_SERVICES от Header.tsx — не дублируем
  const sortedLinks = navLinks
    .filter(cat => (cat.header_order || 0) > 0)
    .sort((a, b) => (a.header_order || 0) - (b.header_order || 0));

  return (
    <motion.div
      variants={menuVariants}
      initial="hidden"
      animate="visible"
      exit="exit"
      className="absolute top-full left-0 w-full bg-white border-b border-[#e5e7eb] overflow-hidden shadow-lg z-40"
    >
      <div className="max-w-[1400px] mx-auto px-5 pb-4 overflow-y-auto max-h-[calc(100dvh-4rem)]">
        <div className="divide-y divide-gray-100">
          {sortedLinks.map((category) => (
            <div key={category.id}>
              <div className="flex items-center justify-between min-h-[40px]">
                <Link
                  href={`/catalog/${category.slug}`}
                  onClick={closeMenu}
                  className="text-base font-medium text-[#212121] hover:text-primary transition-colors"
                >
                  {category.name}
                </Link>

                {category.children && category.children.length > 0 && (
                  <button
                    onClick={() => toggleCategory(category.slug)}
                    className="flex items-center justify-center p-2 text-gray-400"
                    aria-label={expandedCategory === category.slug ? 'Свернуть' : 'Развернуть'}
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      className={`h-6 w-6 transition-transform duration-200 ${
                        expandedCategory === category.slug ? 'rotate-180' : ''
                      }`}
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth={2}
                        d="M19 9l-7 7-7-7"
                      />
                    </svg>
                  </button>
                )}
              </div>

              <AnimatePresence>
                {expandedCategory === category.slug && category.children && (
                  <motion.ul
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    className="overflow-hidden pl-4 pt-1 space-y-1.5"
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
    </motion.div>
  );
};

export default MobileMenu;