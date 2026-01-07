// src/lib/api.ts

import { API_CONFIG } from './config';

// --- ТИПЫ ДАННЫХ ---

export interface Category {
  id: number;
  name: string;
  slug: string;
  parent: number | null;
}

export interface NestedCategory extends Category {
  header_order?: number;
  children?: NestedCategory[];
}

export interface ProductImage {
  image: string;
  is_main: boolean;
}

export interface Tag {
  name: string;
  slug: string;
}

export interface Attribute {
  name: string;
  unit: string;
  slug: string;
}

export interface ProductAttribute {
  attribute: Attribute;
  value: string;
}

export interface Product {
  id: number;
  slug: string;
  name: string;
  description: string;
  price: string;
  categories: Category[]; // Массив категорий вместо одной категории
  tags: Tag[]; // Массив объектов тегов, а не строк
  attributes: ProductAttribute[]; // Массив объектов атрибутов, а не строк
  images: ProductImage[];
  is_favorite: boolean;
  is_new: boolean;
  is_active: boolean;
  // Поля рейтинга (опциональные для совместимости)
  average_rating?: number;
  reviews_count?: number;
}

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
      next: { revalidate: 60 }
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

export const fetchAllProducts = async (): Promise<{ slug: string }[]> => {
  try {
    const res = await fetch(API_CONFIG.PRODUCTS.PRODUCTS);
    if (!res.ok) return [];
    const products: Product[] = await res.json();
    // Возвращаем только то, что нужно для generateStaticParams
    return products.map(p => ({ slug: p.slug }));
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
    
    const res = await fetch(url);
    if (!res.ok) {
      console.error(`Failed to fetch products for categories ${slugs.join(', ')}, status: ${res.status}`);
      return [];
    }
    return res.json();
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
    
    // Пока убираем бренды, так как они не работают через теги
    // if (params.brands && params.brands.length > 0) {
    //   params.brands.forEach(brand => {
    //     queryParams.append('tags__slug', brand);
    //   });
    // }
    
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

