// src/app/catalog/[slug]/page.tsx

import { fetchCategories, buildCategoryTree, fetchProductsByCategorySlugs, Product, Category, NestedCategory } from '@/lib/api';
import CatalogClient from '@/components/CatalogClient';

// Список корневых категорий, которые должны вести на кастомные страницы
const ROOT_CATEGORIES = [
  'uslugi',
  'mfu-i-printery', 
  'periferiya',
  'raznoe',
  'videonablyudenie',
  'kompyutery'
];

// Функция для определения, является ли категория корневой
function isRootCategory(slug: string): boolean {
  return ROOT_CATEGORIES.includes(slug);
}

// Оптимизированная функция для получения всех слагов категории и её дочерних
function getAllCategorySlugs(categoryTree: NestedCategory[], targetSlug: string): string[] {
  const result: string[] = [];
  
  function collectAllSlugs(category: NestedCategory): void {
    result.push(category.slug);
    if (category.children && category.children.length > 0) {
      category.children.forEach(collectAllSlugs);
    }
  }
  
  function findCategory(nodes: NestedCategory[], slug: string): NestedCategory | null {
    for (const node of nodes) {
      if (node.slug === slug) {
        return node;
      }
      if (node.children && node.children.length > 0) {
        const found = findCategory(node.children, slug);
        if (found) {
          return found;
        }
      }
    }
    return null;
  }
  
  const foundCategory = findCategory(categoryTree, targetSlug);
  if (foundCategory) {
    collectAllSlugs(foundCategory);
  }
  
  return [...new Set(result)]; // Удаляем дубликаты
}

// Функция для получения пути категории
function getCategoryPath(categoryTree: NestedCategory[], targetSlug: string): NestedCategory[] {
  const path: NestedCategory[] = [];
  
  function findPath(nodes: NestedCategory[], slug: string): boolean {
    for (const node of nodes) {
      if (node.slug === slug) {
        path.push(node);
        return true;
      }
      if (node.children) {
        const found = findPath(node.children, slug);
        if (found) {
          path.unshift(node);
          return true;
        }
      }
    }
    return false;
  }
  
  findPath(categoryTree, targetSlug);
  return path;
}

// Эта функция говорит Next.js, какие страницы создавать
export async function generateStaticParams() {
  const categories = await fetchCategories();
  return categories.map((category) => ({
    slug: category.slug,
  }));
}

// Оптимизированная функция для получения всех товаров включая дочерние категории
async function getProductsForCategory(slug: string): Promise<{
  products: Product[];
  categoryPath: NestedCategory[];
}> {
  try {
    const categories = await fetchCategories();
    const categoryTree = buildCategoryTree(categories);
    const categoryPath = getCategoryPath(categoryTree, slug);
    
    if (categoryPath.length === 0) {
      return { products: [], categoryPath: [] };
    }
    
    // Получаем все слаги категории и её дочерних
    const allSlugs = getAllCategorySlugs(categoryTree, slug);
    
    // Получаем все товары из этих категорий
    const products = await fetchProductsByCategorySlugs(allSlugs);
    
    return { products, categoryPath };
  } catch (error) {
    console.error(error);
    return { products: [], categoryPath: [] };
  }
}

// Это сам компонент страницы
export default async function CatalogPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const { products, categoryPath } = await getProductsForCategory(slug);
  
  // Получаем все слаги для передачи в клиентский компонент
  const categories = await fetchCategories();
  const categoryTree = buildCategoryTree(categories);
  const allSlugs = getAllCategorySlugs(categoryTree, slug);

  return (
    <CatalogClient 
      initialProducts={products}
      categoryPath={categoryPath}
      categorySlugs={allSlugs}
    />
  );
}
