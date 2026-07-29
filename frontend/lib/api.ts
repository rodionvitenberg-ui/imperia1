// src/lib/api.ts

import { API_CONFIG } from './config';

// --- ТИПЫ ДАННЫХ ---

export interface SEOFields {
  meta_title?: string;
  meta_description?: string;
  h1?: string;
}

export interface Category {
  id: number;
  name: string;
  slug: string;
  parent: number | null;
  header_order?: number;
  children?: Category[];
  page_description?: string;
  meta_title?: string;
  meta_description?: string;
  h1?: string;
  noindex?: boolean;
}

export interface ServiceItem {
  id: number;
  name: string;
  price: string;
  category: 'repair' | 'maintenance';
  is_active: boolean;
  sort_order: number;
}

export interface NestedCategory extends Category {
  children?: NestedCategory[];
}

export interface ProductImage {
  id?: number;
  image: string;
  is_main: boolean;
  alt_text?: string;
  image_type?: 'main' | 'gallery' | '360' | 'video_poster';
  sort_order?: number;
}

export interface Tag {
  name: string;
  slug: string;
}

export interface Brand {
  id?: number;
  name: string;
  slug: string;
  logo?: string;
  description?: string;
  country?: string;
  website?: string;
}

export interface Attribute {
  id?: number;
  name: string;
  slug: string;
  unit: string;
  type?: 'str' | 'int' | 'bool' | 'enum';
  enum_options?: string[];
}

export interface AttributeValue {
  type: 'str' | 'int' | 'bool' | 'enum';
  value: string | number | boolean;
  display: string;
  unit?: string;
}

export interface ProductAttribute {
  id?: number;
  attribute: Attribute;
  value: string | AttributeValue; // строка для обратной совместимости, объект для новой версии
}

export interface WarehouseStock {
  warehouse: string;
  quantity: number;
  reserved: number;
  available: number;
  in_stock: boolean;
}

export interface StockSummary {
  total_available: number;
  in_stock: boolean;
  warehouses?: WarehouseStock[];
}

export interface ProductVariant {
  id: number;
  sku: string;
  name: string;
  price: string;
  price_override: string | null;
  is_active: boolean;
  sort_order: number;
  attributes?: ProductAttribute[];
  images?: ProductImage[];
  stock?: StockSummary;
}

/**
 * Продукт в списке (ProductListSerializer).
 */
export interface ProductListItem {
  id: number;
  name: string;
  slug: string;
  price: string;
  min_variant_price?: string;
  has_variants?: boolean;
  categories: Category[];
  brands?: Brand[];
  feature_tags?: Tag[];
  tags?: Tag[]; // обратная совместимость
  attributes?: ProductAttribute[];
  images?: ProductImage[];
  is_favorite: boolean;
  is_new: boolean;
  is_active: boolean;
  main_image?: ProductImage | null;
  average_rating?: number;
  reviews_count?: number;
}

/**
 * Продукт на детальной странице (ProductSerializer).
 */
export interface ProductDetail extends ProductListItem {
  description: string;
  attributes: ProductAttribute[];
  images: ProductImage[];
  variants?: ProductVariant[];
  stock?: StockSummary;
  meta_title?: string;
  meta_description?: string;
  h1?: string;
}

/** Обратно-совместимый тип (старые компоненты могут всё ещё использовать Product) */
export type Product = ProductDetail;

export const fetchCategories = async (): Promise<Category[]> => {
  try {
    // Проверяем, что API_CONFIG инициализирован
    if (!API_CONFIG?.PRODUCTS?.CATEGORIES) {
      throw new Error('API_CONFIG is not properly initialized');
    }
    
    const response = await fetch(API_CONFIG.PRODUCTS.CATEGORIES, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      next: { revalidate: 60, tags: ['categories'] }
    });
    
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }
    
    const data = await response.json();
    
    // Проверяем, что полученные данные являются массивом
    if (!Array.isArray(data)) {
      throw new Error('API returned non-array data for categories');
    }
    
    return data;
  } catch (error) {
    // В случае ошибки возвращаем пустой массив
    return [];
  }
};

// Строит иерархию категорий
export const buildCategoryTree = (categories: Category[]): NestedCategory[] => {
  const categoryMap: { [key: number]: NestedCategory } = {};
  const tree: NestedCategory[] = [];

  categories.forEach(category => {
    categoryMap[category.id] = { ...category, children: [] };
  });

  categories.forEach(category => {
    if (category.parent !== null) {
      const parent = categoryMap[category.parent];
      if (parent) {
        parent.children?.push(categoryMap[category.id]);
      }
    } else {
      tree.push(categoryMap[category.id]);
    }
  });

  return tree;
};

// Функция для получения пути категории по slug'у
export const getCategoryPath = (categoryTree: NestedCategory[], targetSlug: string): NestedCategory[] => {
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
};

// Функция для построения пути категории для товара (берет первую категорию)
export const buildProductCategoryPath = async (product: Product): Promise<NestedCategory[]> => {
  if (!product.categories || product.categories.length === 0) {
    return [];
  }
  
  try {
    const categories = await fetchCategories();
    const categoryTree = buildCategoryTree(categories);
    
    // Берем первую категорию товара и строим для неё полный путь
    const firstCategory = product.categories[0];
    return getCategoryPath(categoryTree, firstCategory.slug);
  } catch (error) {
    console.error('Error building product category path:', error);
    return [];
  }
};

export const fetchAllProducts = async (): Promise<Product[]> => {
  try {
    const res = await fetch(API_CONFIG.PRODUCTS.PRODUCTS);
    if (!res.ok) return [];
    const products: Product[] = await res.json();
    return products;
  } catch (error) {
    console.error("Failed to fetch all products:", error);
    return [];
  }
};

// Новый метод для получения товаров по нескольким слагам категорий
export const fetchProductsByCategorySlugs = async (slugs: string[]): Promise<Product[]> => {
  try {
    // Формируем строку запроса с несколькими categories__slug
    const query = slugs.map(slug => `categories__slug=${encodeURIComponent(slug)}`).join('&');
    const url = `${API_CONFIG.PRODUCTS.PRODUCTS}?${query}`;
    
    console.log(`[SSR] fetchProductsByCategorySlugs → ${url}`);
    const res = await fetch(url, { next: { revalidate: 0 } });
    console.log(`[SSR] fetchProductsByCategorySlugs → status ${res.status}`);
    if (!res.ok) {
      const errorText = await res.text();
      console.error(`Failed to fetch products for categories ${slugs.join(', ')}, status: ${res.status}, body: ${errorText.substring(0, 300)}`);
      return [];
    }
    const data = await res.json();
    console.log(`[SSR] fetchProductsByCategorySlugs → ${data.length} products`);
    return data;
  } catch (error) {
    console.error("Failed to fetch products by category slugs:", error);
    return [];
  }
};

// Типы для фильтров
export interface FilterAttribute {
  id: number;
  name: string;
  unit: string;
  values: string[];
  slug: string;
}

export interface FilterData {
  brands: Tag[];
  attributes: FilterAttribute[];
}

// Получить бренды для категории
export const fetchCategoryBrands = async (categoryId: number): Promise<Tag[]> => {
  try {
    const res = await fetch(API_CONFIG.PRODUCTS.CATEGORY_BRANDS(categoryId));
    if (!res.ok) {
      console.error(`Failed to fetch brands for category ${categoryId}, status: ${res.status}`);
      return [];
    }
    return res.json();
  } catch (error) {
    console.error("Failed to fetch category brands:", error);
    return [];
  }
};

// Получить атрибуты и их значения для категории
export const fetchCategoryFilters = async (categoryId: number): Promise<FilterAttribute[]> => {
  try {
    const res = await fetch(API_CONFIG.PRODUCTS.CATEGORY_FILTERS(categoryId));
    if (!res.ok) {
      console.error(`Failed to fetch filters for category ${categoryId}, status: ${res.status}`);
      return [];
    }
    return res.json();
  } catch (error) {
    console.error("Failed to fetch category filters:", error);
    return [];
  }
};

// Получить товары с применением фильтров
export const fetchProductsWithFilters = async (params: {
  categorySlugs: string[];
  brands?: string[];
  attributes?: Record<string, string[]>;
  isNew?: boolean;
  isFavorite?: boolean;
}): Promise<Product[]> => {
  try {
    const queryParams = new URLSearchParams();
    
    // Добавляем категории
    params.categorySlugs.forEach(slug => {
      queryParams.append('categories__slug', slug);
    });
    
    // Бренды
    if (params.brands && params.brands.length > 0) {
      params.brands.forEach(brand => {
        queryParams.append('brands__slug', brand);
      });
    }
    
    // Добавляем атрибуты
    if (params.attributes) {
      Object.entries(params.attributes).forEach(([attrSlug, values]) => {
        // Формируем параметр в формате attributes[slug]=value1,value2
        const paramName = `attributes[${attrSlug}]`;
        const paramValue = values.join(',');
        queryParams.append(paramName, paramValue);
      });
    }
    
    // Добавляем флаги
    if (params.isNew) {
      queryParams.append('is_new', 'true');
    }
    if (params.isFavorite) {
      queryParams.append('is_favorite', 'true');
    }
    
    const url = `${API_CONFIG.PRODUCTS.PRODUCTS}?${queryParams.toString()}`;
    console.log('📊 Filter params:', {
      categorySlugs: params.categorySlugs,
      brands: params.brands,
      attributes: params.attributes,
      isNew: params.isNew,
      isFavorite: params.isFavorite
    });
    
    const res = await fetch(url);
    if (!res.ok) {
      console.error(`Failed to fetch filtered products, status: ${res.status}`);
      const errorText = await res.text();
      console.error('Error response:', errorText);
      return [];
    }
    return res.json();
  } catch (error) {
    console.error("Failed to fetch filtered products:", error);
    return [];
  }
};

// Получить связанные товары на основе категорий
export const fetchRelatedProducts = async (product: Product, limit: number = 8): Promise<Product[]> => {
  try {
    // Сначала пробуем получить товары с фильтрами
    const queryParams = new URLSearchParams();
    
    // Исключаем текущий товар
    queryParams.append('exclude_id', product.id.toString());
    
    // Добавляем категории товара для поиска похожих
    if (product.categories && product.categories.length > 0) {
      product.categories.forEach(category => {
        queryParams.append('categories__slug', category.slug);
      });
    }
    
    const url = `${API_CONFIG.PRODUCTS.PRODUCTS}?${queryParams.toString()}`;
    
    const res = await fetch(url);
    if (!res.ok) {
      const errorText = await res.text();
      console.error(`Failed to fetch related products, status: ${res.status}`);
      console.error('Error response:', errorText);
      
      // Если не работает с фильтрами, пробуем просто получить любые товары
      return await fetchRelatedProductsSimple(product, limit);
    }
    
    const products: Product[] = await res.json();
    console.log('🎲 Related products found:', products.length);
    
    // Обрабатываем лимит на фронтенде
    return products.slice(0, limit);
  } catch (error) {
    console.error("Failed to fetch related products:", error);
    // Fallback к простому методу
    return await fetchRelatedProductsSimple(product, limit);
  }
};

// Функция поиска товаров по запросу
export const searchProducts = async (query: string, limit: number = 20): Promise<Product[]> => {
  try {
    if (!query.trim()) {
      return [];
    }
    
    const queryParams = new URLSearchParams();
    queryParams.append('search', query.trim());
    
    if (limit > 0) {
      queryParams.append('limit', limit.toString());
    }
    
    const url = `${API_CONFIG.PRODUCTS.PRODUCTS}?${queryParams.toString()}`;
    console.log('🔍 Searching products:', { query, url });
    
    const res = await fetch(url);
    if (!res.ok) {
      console.error(`Failed to search products, status: ${res.status}`);
      const errorText = await res.text();
      console.error('Error response:', errorText);
      return [];
    }
    
    const products: Product[] = await res.json();
    console.log('✅ Search results found:', products.length);
    
    return products;
  } catch (error) {
    console.error("Failed to search products:", error);
    return [];
  }
};

// Простой метод получения связанных товаров
export const fetchRelatedProductsSimple = async (product: Product, limit: number = 8): Promise<Product[]> => {
  try {
    console.log('🔄 Trying simple related products fetch...');
    const res = await fetch(`${API_CONFIG.PRODUCTS.PRODUCTS}?limit=${limit + 2}`);
    if (!res.ok) {
      console.error(`Simple fetch failed, status: ${res.status}`);
      return [];
    }
    
    const allProducts: Product[] = await res.json();
    // Фильтруем текущий товар и ограничиваем количество
    const filteredProducts = allProducts
      .filter(p => p.id !== product.id)
      .slice(0, limit);
    
    console.log('✅ Simple related products found:', filteredProducts.length);
    return filteredProducts;
  } catch (error) {
    console.error('Simple related products fetch failed:', error);
    return [];
  }
};

// Функция для получения новых товаров (с тегом new)
export const fetchNewProducts = async (limit: number = 8): Promise<Product[]> => {
  try {
    const queryParams = new URLSearchParams();
    queryParams.append('is_new', 'true');

    if (limit > 0) {
      queryParams.append('limit', limit.toString());
    }

    const url = `${API_CONFIG.PRODUCTS.PRODUCTS}?${queryParams.toString()}`;
    console.log('🆕 Fetching new products:', { limit, url });

    const res = await fetch(url);
    if (!res.ok) {
      console.error(`Failed to fetch new products, status: ${res.status}`);
      const errorText = await res.text();
      console.error('Error response:', errorText);
      return [];
    }

    const products: Product[] = await res.json();
    console.log('✅ New products found:', products.length);

    return products;
  } catch (error) {
    console.error('Failed to fetch new products:', error);
    return [];
  }
};

// Функция для получения популярных товаров
export const fetchPopularProducts = async (limit: number = 8): Promise<Product[]> => {
  try {
    const queryParams = new URLSearchParams();
    queryParams.append('is_favorite', 'true');
    
    if (limit > 0) {
      queryParams.append('limit', limit.toString());
    }
    
    const url = `${API_CONFIG.PRODUCTS.PRODUCTS}?${queryParams.toString()}`;
    console.log('🔥 Fetching popular products:', { limit, url });
    
    const res = await fetch(url);
    if (!res.ok) {
      console.error(`Failed to fetch popular products, status: ${res.status}`);
      const errorText = await res.text();
      console.error('Error response:', errorText);
      return [];
    }
    
    const products: Product[] = await res.json();
    console.log('✅ Popular products found:', products.length);
    
    return products;
  } catch (error) {
    console.error('Failed to fetch popular products:', error);
    return [];
  }
};

// Функция для получения услуг
export const fetchServices = async (): Promise<ServiceItem[]> => {
  try {
    const res = await fetch(API_CONFIG.SERVICES.ITEMS, {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' },
      next: { revalidate: 60 },
    });
    if (!res.ok) {
      console.error(`Failed to fetch services, status: ${res.status}`);
      return [];
    }
    return res.json();
  } catch (error) {
    console.error('Failed to fetch services:', error);
    return [];
  }
};

// Функция для получения CSRF токена
const getCSRFToken = (): string | null => {
  if (typeof document !== 'undefined') {
    const cookieValue = document.cookie
      .split('; ')
      .find(row => row.startsWith('csrftoken='))
      ?.split('=')[1];
    return cookieValue || null;
  }
  return null;
};

// Функция для отправки отзыва
export const submitReview = async (productSlug: string, rating: number): Promise<void> => {
  try {
    const csrfToken = getCSRFToken();
    const headers: Record<string, string> = {
      'Content-Type': 'application/json',
    };
    
    if (csrfToken) {
      headers['X-CSRFToken'] = csrfToken;
    }
    
    const response = await fetch(`${API_CONFIG.PRODUCTS.PRODUCTS}${productSlug}/reviews/`, {
      method: 'POST',
      credentials: 'include', // Для session-based аутентификации
      headers,
      body: JSON.stringify({ rating })
    });
    
    if (!response.ok) {
      const errorData = await response.text();
      console.error('Ошибка отправки отзыва:', errorData);
      throw new Error(`Failed to submit review: ${response.status} ${errorData}`);
    }
  } catch (error) {
    console.error('Error submitting review:', error);
    throw error;
  }
};

/**
 * Получить все бренды.
 */
export async function fetchBrands(): Promise<Brand[]> {
  const res = await fetch(API_CONFIG.PRODUCTS.BRANDS, {
    next: { revalidate: 3600 },
  });
  if (!res.ok) {
    console.error(`Failed to fetch brands, status: ${res.status}`);
    return [];
  }
  try {
    return await res.json();
  } catch {
    return [];
  }
}

export interface BlogPost {
  id: number;
  title: string;
  slug: string;
  excerpt: string;
  image?: string;
  published_at: string;
}

export interface BlogPostDetail extends BlogPost {
  content: string;
  author?: number;
  author_name?: string;
  status: string;
  tags?: Tag[];
  meta_title?: string;
  meta_description?: string;
  created_at: string;
  updated_at: string;
}

export async function fetchBlogPosts(): Promise<BlogPost[]> {
  const res = await fetch(API_CONFIG.PRODUCTS.BLOG, {
    next: { revalidate: 300 },
  });
  if (!res.ok) {
    console.error(`Failed to fetch blog posts, status: ${res.status}`);
    return [];
  }
  try {
    return await res.json();
  } catch {
    return [];
  }
}

export async function fetchBlogPost(slug: string): Promise<BlogPostDetail | null> {
  try {
    const res = await fetch(`${API_CONFIG.PRODUCTS.BLOG}${slug}/`, {
      next: { revalidate: 300 },
    });
    if (!res.ok) return null;
    return await res.json();
  } catch (error) {
    console.error(`Failed to fetch blog post ${slug}:`, error);
    return null;
  }
}
