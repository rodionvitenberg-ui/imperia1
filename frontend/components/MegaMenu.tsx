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

/* ─── Сплит-колонки для больших категорий ── */
const MAX_ITEMS_PER_COLUMN = 6;

function splitIntoColumns<T>(items: T[], max: number): T[][] {
  const columns: T[][] = [];
  for (let i = 0; i < items.length; i += max) {
    columns.push(items.slice(i, i + max));
  }
  return columns;
}

/* ─── Flat список заголовков с сылками ───── */
function SimpleLinkList({ items, onClose }: { items: NestedCategory[]; onClose?: () => void }) {
  return (
    <ul className="space-y-2">
      {items.map((item) => (
        <li key={item.id}>
          {item.children && item.children.length > 0 ? (
            <span className="block text-[14px] font-bold text-[#212121] mb-1 mt-2 first:mt-0">
              <Link
                href={`/catalog/${item.slug}`}
                onClick={onClose}
                className="hover:text-primary transition-colors"
              >
                {item.name}
              </Link>
            </span>
          ) : (
            <Link
              href={`/catalog/${item.slug}`}
              onClick={onClose}
              className="block text-[14px] text-[#444] hover:text-primary transition-colors"
            >
              {item.name}
            </Link>
          )}
          {item.children && item.children.length > 0 && (
            <ul className="space-y-1.5 ml-0 mt-1 mb-1">
              {item.children.map((child) => (
                <li key={child.id}>
                  <Link
                    href={`/catalog/${child.slug}`}
                    onClick={onClose}
                    className="block text-[14px] text-[#444] hover:text-primary transition-colors"
                  >
                    {child.name}
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </li>
      ))}
    </ul>
  );
}

/* ─── Корневая колонка ──────────────────── */
function MenuColumn({ column, onClose }: { column: NestedCategory; onClose?: () => void }) {
  // Для категорий с большим числом дочерних — разбиваем на подколонки
  const children = column.children || [];
  const needsSplit = children.length > MAX_ITEMS_PER_COLUMN;

  if (!needsSplit) {
    return (
      <div className="min-w-[160px] max-w-[200px]">
        <div className="mb-3">
          <Link
            href={`/catalog/${column.slug}`}
            onClick={onClose}
            className="block font-bold text-[14px] text-[#212121] hover:text-primary transition-colors"
          >
            {column.name}
          </Link>
        </div>
        <SimpleLinkList items={children} onClose={onClose} />
      </div>
    );
  }

  // Разбиваем на две равные колонки
  const half = Math.ceil(children.length / 2);
  const leftCol = children.slice(0, half);
  const rightCol = children.slice(half);

  return (
    <div className="flex gap-6">
      <div className="min-w-[160px] max-w-[200px]">
        <div className="mb-3">
          <Link
            href={`/catalog/${column.slug}`}
            onClick={onClose}
            className="block font-bold text-[14px] text-[#212121] hover:text-primary transition-colors"
          >
            {column.name}
          </Link>
        </div>
        <SimpleLinkList items={leftCol} onClose={onClose} />
      </div>
      <div className="min-w-[160px] max-w-[200px]">
        {/* Повторяем заголовок для связности (кликабельный) */}
        <div className="mb-3">
          <Link
            href={`/catalog/${column.slug}`}
            onClick={onClose}
            className="block font-bold text-[14px] text-[#212121] hover:text-primary transition-colors"
            tabIndex={-1}
          >
            &nbsp;
          </Link>
        </div>
        <SimpleLinkList items={rightCol} onClose={onClose} />
      </div>
    </div>
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
        className="max-w-[1400px] mx-auto px-5 flex flex-wrap justify-center gap-x-10 gap-y-6 py-10"
      >
        {content.map((column) => (
          <motion.div key={column.id} variants={dropdownContentVariants}>
            <MenuColumn column={column} onClose={onClose} />
          </motion.div>
        ))}
      </motion.div>
    </motion.div>
  );
};

export default MegaMenu;