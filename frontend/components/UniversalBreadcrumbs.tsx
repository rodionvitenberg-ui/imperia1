// src/components/UniversalBreadcrumbs.tsx
'use client';

import React from 'react';
import Link from 'next/link';
import { Product, NestedCategory } from '@/lib/api';

export interface BreadcrumbItem {
  name: string;
  href?: string; // Если нет href, то это текущая страница
  slug?: string;
}

interface UniversalBreadcrumbsProps {
  // Для страницы товара
  product?: Product;
  // Для страницы каталога или путь категорий для товара
  categoryPath?: NestedCategory[];
  // Кастомные крошки
  customItems?: BreadcrumbItem[];
}

// Список корневых категорий для правильной маршрутизации
const ROOT_CATEGORIES = [
  'uslugi',
  'mfu-i-printery', 
  'periferiya',
  'raznoe',
  'videonablyudenie',
  'kompyutery'
];

function isRootCategory(slug: string): boolean {
  return ROOT_CATEGORIES.includes(slug);
}

export default function UniversalBreadcrumbs({ 
  product, 
  categoryPath, 
  customItems 
}: UniversalBreadcrumbsProps) {
  // Собираем элементы хлебных крошек
  const items: BreadcrumbItem[] = [];

  // Всегда добавляем "Главная"
  items.push({ name: 'Главная', href: '/' });

  if (product && categoryPath && categoryPath.length > 0) {
    // Режим товара с правильным путем категорий
    categoryPath.forEach((category) => {
      const href = isRootCategory(category.slug) 
        ? `/pages/${category.slug}` 
        : `/catalog/${category.slug}`;
      
      items.push({
        name: category.name,
        href,
        slug: category.slug
      });
    });
    // Добавляем сам товар (без ссылки)
    items.push({ name: product.name });
    
  } else if (product) {
    // Фолбэк для товара без categoryPath (старая логика)
    if (product.categories && product.categories.length > 0) {
      product.categories.forEach((category) => {
        items.push({
          name: category.name,
          href: `/catalog/${category.slug}`,
          slug: category.slug
        });
      });
    }
    items.push({ name: product.name });
    
  } else if (categoryPath && categoryPath.length > 0) {
    // Режим каталога: добавляем путь категорий
    categoryPath.forEach((category) => {
      const href = isRootCategory(category.slug) 
        ? `/pages/${category.slug}` 
        : `/catalog/${category.slug}`;
      
      items.push({
        name: category.name,
        href,
        slug: category.slug
      });
    });
    
  } else if (customItems) {
    // Режим кастомных крошек
    items.push(...customItems);
  }

  if (items.length <= 1) {
    return null; // Не показываем крошки, если только "Главная"
  }

  return (
    <nav aria-label="Breadcrumb" className="text-sm text-gray-500">
      <ol className="flex items-center space-x-2 flex-wrap">
        {items.map((item, index) => {
          const isLast = index === items.length - 1;
          
          return (
            <li key={index} className="flex items-center">
              {index > 0 && (
                <svg 
                  className="h-4 w-4 flex-shrink-0 text-gray-300 mx-2" 
                  xmlns="http://www.w3.org/2000/svg" 
                  fill="currentColor" 
                  viewBox="0 0 20 20" 
                  aria-hidden="true"
                >
                  <path d="M5.555 17.776l8-16 .894.448-8 16-.894-.448z" />
                </svg>
              )}
              
              {isLast || !item.href ? (
                <span 
                  className="text-gray-900 font-medium truncate max-w-xs" 
                  title={item.name}
                >
                  {item.name}
                </span>
              ) : (
                <Link 
                  href={item.href}
                  className="hover:text-black transition-colors"
                >
                  {item.name}
                </Link>
              )}
            </li>
          );
        })}
      </ol>
    </nav>
  );
}