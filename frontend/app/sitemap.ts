import { MetadataRoute } from 'next';
import { fetchCategories, fetchAllProducts } from '@/lib/api';

const STATIC_PAGES = [
  { path: '', priority: 1.0, changefreq: 'daily' as const },
  { path: '/catalog', priority: 0.9, changefreq: 'daily' as const },
  { path: '/delivery-payment', priority: 0.8, changefreq: 'monthly' as const },
  { path: '/how-to-order', priority: 0.8, changefreq: 'monthly' as const },
  { path: '/contacts', priority: 0.7, changefreq: 'monthly' as const },
  { path: '/about', priority: 0.6, changefreq: 'monthly' as const },
  { path: '/care', priority: 0.5, changefreq: 'monthly' as const },
  { path: '/pc-assembly', priority: 0.7, changefreq: 'monthly' as const },
  { path: '/store-location', priority: 0.8, changefreq: 'monthly' as const },
  { path: '/compare', priority: 0.4, changefreq: 'weekly' as const },
  { path: '/search', priority: 0.4, changefreq: 'weekly' as const },
  { path: '/favorites', priority: 0.3, changefreq: 'weekly' as const },
];

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';

  // Статические страницы
  const staticEntries: MetadataRoute.Sitemap = STATIC_PAGES.map((page) => ({
    url: `${baseUrl}${page.path}`,
    lastModified: new Date(),
    changeFrequency: page.changefreq,
    priority: page.priority,
  }));

  // Страницы категорий
  let categoryEntries: MetadataRoute.Sitemap = [];
  try {
    const categories = await fetchCategories();
    categoryEntries = categories.map((category) => ({
      url: `${baseUrl}/catalog/${category.slug}`,
      lastModified: new Date(),
      changeFrequency: 'weekly' as const,
      priority: 0.7,
    }));
  } catch (error) {
    console.error('Sitemap: failed to fetch categories', error);
  }

  // Страницы товаров
  let productEntries: MetadataRoute.Sitemap = [];
  try {
    const products = await fetchAllProducts();
    productEntries = products.map((product) => ({
      url: `${baseUrl}/products/${product.slug}`,
      lastModified: new Date(),
      changeFrequency: 'weekly' as const,
      priority: 0.8,
    }));
  } catch (error) {
    console.error('Sitemap: failed to fetch products', error);
  }

  return [...staticEntries, ...categoryEntries, ...productEntries];
}