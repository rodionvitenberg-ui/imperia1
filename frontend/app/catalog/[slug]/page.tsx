// src/app/catalog/[slug]/page.tsx

import { fetchCategories, buildCategoryTree, fetchProductsByCategorySlugs, Product, Category, NestedCategory } from '@/lib/api';
import CatalogClient from '@/components/CatalogClient';
import { Metadata } from 'next';

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

// Динамические мета-данные для категорий
export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug: rawSlug } = await params;
  const slug = decodeURIComponent(rawSlug);

  try {
    const categories = await fetchCategories();
    const categoryTree = buildCategoryTree(categories);
    const categoryPath = getCategoryPath(categoryTree, slug);
    
    if (categoryPath.length === 0) {
      return {
        title: 'Категория не найдена | Империя Электроники',
        description: 'Запрошенная категория не найдена в нашем каталоге.',
      };
    }

    const currentCategory = categoryPath[categoryPath.length - 1];
    
    // Используем SEO-поля из API, если они есть, иначе генерируем с городом
    let title: string;
    let description: string;

    if (currentCategory.meta_title) {
      title = currentCategory.meta_title;
    } else if (currentCategory.h1) {
      title = `${currentCategory.h1} | Империя Электроники`;
    } else {
      title = `${currentCategory.name} в Караколе — купить по лучшей цене | Империя Электроники`;
    }

    if (currentCategory.meta_description) {
      description = currentCategory.meta_description;
    } else {
      description = `Купить ${currentCategory.name.toLowerCase()} в Караколе. Широкий ассортимент, доступные цены, доставка по Караколу. Гарантия качества и профессиональные консультации.`;
    }

    // Формируем хлебные крошки для structured data (всегда /catalog/)
    const breadcrumbItems = categoryPath.map((cat, idx) => ({
      "@type": "ListItem",
      "position": idx + 1,
      "name": cat.name,
      "item": `https://imperia-electroniki.kg/catalog/${cat.slug}`
    }));

    return {
      title,
      description,
      openGraph: {
        title,
        description,
        type: 'website',
        locale: 'ru_KG',
        siteName: 'Империя Электроники',
      },
      twitter: {
        card: 'summary',
        title,
        description,
      },
      other: {
        'application/ld+json': JSON.stringify({
          "@context": "https://schema.org",
          "@type": "BreadcrumbList",
          "itemListElement": breadcrumbItems,
        }),
      },
    };
  } catch (error) {
    console.error('[generateMetadata] Error:', error);
    return {
      title: 'Каталог | Империя Электроники',
      description: 'Каталог компьютерной техники в Караколе.',
    };
  }
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
  allSlugs: string[];
}> {
  try {
    const categories = await fetchCategories();
    console.log(`[page.tsx] fetchCategories → ${categories.length} categories`);
    const categoryTree = buildCategoryTree(categories);
    const categoryPath = getCategoryPath(categoryTree, slug);
    console.log(`[page.tsx] slug="${slug}" → categoryPath length: ${categoryPath.length}`, categoryPath.map(c => c.slug));
    
    if (categoryPath.length === 0) {
      console.warn(`[page.tsx] ⚠️ Category not found for slug "${slug}"`);
      return { products: [], categoryPath: [], allSlugs: [] };
    }
    
    // Получаем все слаги категории и её дочерних
    const allSlugs = getAllCategorySlugs(categoryTree, slug);
    console.log(`[page.tsx] getAllCategorySlugs → ${allSlugs.length} slugs:`, allSlugs);
    
    // Получаем все товары из этих категорий
    const products = await fetchProductsByCategorySlugs(allSlugs);
    
    return { products, categoryPath, allSlugs };
  } catch (error) {
    console.error('[page.tsx] getProductsForCategory error:', error);
    return { products: [], categoryPath: [], allSlugs: [] };
  }
}

// Это сам компонент страницы
export default async function CatalogPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug: rawSlug } = await params;
  const slug = decodeURIComponent(rawSlug);
  const { products, categoryPath, allSlugs } = await getProductsForCategory(slug);
  
  console.log(`[page.tsx] Rendering CatalogPage for "${slug}" (raw: "${rawSlug}") → ${products.length} products, path: ${categoryPath.length}`);

  return (
    <CatalogClient 
      initialProducts={products}
      categoryPath={categoryPath}
      categorySlugs={allSlugs}
    />
  );
}