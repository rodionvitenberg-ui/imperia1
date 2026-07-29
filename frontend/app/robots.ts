import { MetadataRoute } from 'next';

export default function robots(): MetadataRoute.Robots {
  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';

  return {
    rules: [
      {
        userAgent: '*',
        allow: '/',
        disallow: [
          '/checkout',
          '/cart',
          '/profile',
          '/order-success',
          '/revalidate',
          '/api/*',
          '/*?*session=*',
          '/*?*token=*',
          '/*?*utm_*=*',
        ],
      },
      {
        userAgent: 'GPTBot',
        disallow: [
          '/checkout',
          '/cart',
          '/profile',
          '/order-success',
          '/revalidate',
        ],
      },
    ],
    sitemap: `${baseUrl}/sitemap.xml`,
  };
}