import { MetadataRoute } from 'next';
import { fetchCategories, fetchAllProducts, fetchBlogPosts } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';

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
  { path: '/blog', priority: 0.8, changefreq: 'weekly' as const },
  { path: '/terms', priority: 0.3, changefreq: 'yearly' as const },
  { path: '/privacy', priority: 0.3, changefreq: 'yearly' as const },
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
    productEntries = products.map((product) => {
      const mainImage = product.images?.find(i => i.is_main) || product.images?.[0];
      const entry: MetadataRoute.Sitemap[number] = {
        url: `${baseUrl}/products/${product.slug}`,
        lastModified: new Date(),
        changeFrequency: 'weekly' as const,
        priority: 0.8,
      };
      // Добавляем изображения в sitemap, если они есть
      if (mainImage) {
        (entry as Record<string, unknown>)['images'] = [
          {
            loc: `${API_CONFIG.BASE_URL}${mainImage.image}`,
            ...(mainImage.alt_text && { title: mainImage.alt_text }),
          },
        ];
      }
      return entry;
    });
  } catch (error) {
    console.error('Sitemap: failed to fetch products', error);
  }

  // Страницы блога
  let blogEntries: MetadataRoute.Sitemap = [];
  try {
    const posts = await fetchBlogPosts();
    blogEntries = posts.map((post) => ({
      url: `${baseUrl}/blog/${post.slug}`,
      lastModified: post.published_at ? new Date(post.published_at) : new Date(),
      changeFrequency: 'monthly' as const,
      priority: 0.6,
    }));
  } catch (error) {
    console.error('Sitemap: failed to fetch blog posts', error);
  }

  return [...staticEntries, ...categoryEntries, ...productEntries, ...blogEntries];
}
