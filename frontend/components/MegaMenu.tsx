// src/components/MegaMenu.tsx
'use client';

import React from 'react';
import { motion } from 'framer-motion';
import Link from 'next/link';
import { NestedCategory } from '@/lib/api';
import { dropdownPanelVariants, dropdownContentVariants } from '@/lib/animations';

interface MegaMenuProps {
  content: NestedCategory[];
}

const MegaMenu = ({ content }: MegaMenuProps) => {
  return (
    <motion.div
      variants={dropdownPanelVariants}
      initial="hidden"
      animate="visible"
      exit="hidden"
      className="absolute top-full left-0 w-full bg-white text-sm text-[#212121] border-t border-[#e5e7eb] overflow-hidden"
    >
      <motion.div
        variants={dropdownContentVariants}
        className="container mx-auto flex justify-center gap-x-16 px-6 py-10"
      >
        {content.map((column) => (
          <motion.div key={column.id} variants={dropdownContentVariants}>
            
            {/* Родительская категория: просто меняет цвет при наведении */}
            <div className="mb-4">
              <Link 
                href={`/catalog/${column.slug}`} 
                className="block font-bold text-[#212121] hover:text-primary transition-colors"
              >
                {column.name}
              </Link>
            </div>

            {/* Подкатегории: тоже добавляем аккуратный ховер для консистентности */}
            <ul className="space-y-3">
              {column.children?.map((link) => (
                <li key={link.id}>
                  <Link 
                    href={`/catalog/${link.slug}`} 
                    className="text-[#212121] hover:text-primary transition-colors"
                  >
                    {link.name}
                  </Link>
                </li>
              ))}
            </ul>
          </motion.div>
        ))}
      </motion.div>
    </motion.div>
  );
};

export default MegaMenu;