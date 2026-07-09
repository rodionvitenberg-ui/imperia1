// src/components/MegaMenu.tsx
'use client';

import React from 'react';
import { motion } from 'framer-motion';
import Link from 'next/link';
import { NestedCategory } from '@/lib/api';
import { dropdownPanelVariants, dropdownContentVariants } from '@/lib/animations';

interface MegaMenuProps {
  content: NestedCategory[];
  onClose?: () => void;
}

/* ─── Рекурсивные подкатегории (до 3 уровней) ─── */
function SubcategoryList({ items, depth = 0, onClose }: { items: NestedCategory[]; depth?: number; onClose?: () => void }) {
  if (depth > 2) return null;

  if (depth === 2) {
    // Правнуки — жирные, с синим буллитом, заметный отступ сверху
    return (
      <ul className="mt-3 space-y-1.5">
        {items.map((item) => (
          <li key={item.id} className="flex items-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-[#1061cd] flex-shrink-0" />
            <Link
              href={`/catalog/${item.slug}`}
              onClick={onClose}
              className="text-[14px] font-bold text-[#212121] hover:text-primary transition-colors"
            >
              {item.name}
            </Link>
          </li>
        ))}
      </ul>
    );
  }

  return (
    <ul className={depth === 0 ? 'space-y-2.5' : 'ml-0 mt-2 space-y-2'}>
      {items.map((item) => (
        <li key={item.id}>
          <Link
            href={`/catalog/${item.slug}`}
            onClick={onClose}
            className={
              depth === 0
                ? 'text-[14px] font-semibold text-[#212121] hover:text-primary transition-colors'
                : 'text-[14px] text-[#444] hover:text-primary transition-colors'
            }
          >
            {item.name}
          </Link>
          {item.children && item.children.length > 0 && depth < 2 && (
            <SubcategoryList items={item.children} depth={depth + 1} onClose={onClose} />
          )}
        </li>
      ))}
    </ul>
  );
}

const MegaMenu = ({ content, onClose }: MegaMenuProps) => {
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
        className="max-w-[1400px] mx-auto px-5 flex justify-center gap-x-16 py-10"
      >
        {content.map((column) => (
          <motion.div key={column.id} variants={dropdownContentVariants} className="min-w-[140px]">
            {/* Родительская категория — жирный заголовок колонки */}
            <div className="mb-3">
              <Link
                href={`/catalog/${column.slug}`}
                onClick={onClose}
                className="block font-bold text-[14px] text-[#212121] hover:text-primary transition-colors"
              >
                {column.name}
              </Link>
            </div>

            {/* Все подуровни рекурсивно */}
            {column.children && column.children.length > 0 && (
              <SubcategoryList items={column.children} depth={0} onClose={onClose} />
            )}
          </motion.div>
        ))}
      </motion.div>
    </motion.div>
  );
};

export default MegaMenu;