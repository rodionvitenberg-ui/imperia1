// src/app/products/[slug]/page.tsx
import ProductDisplay from "@/components/ProductDisplay";
import { Product, fetchAllProducts } from "@/lib/api";
import { API_CONFIG } from "@/lib/config";
import { Metadata } from "next";

// Говорит Next.js, какие страницы товаров нужно создать заранее
export async function generateStaticParams() {
  const products = await fetchAllProducts();
  return products.map((product) => ({
    slug: product.slug,
  }));
}

// Загружает данные для ОДНОГО товара
async function getProduct(slug: string): Promise<Product | null> {
  try {
    const res = await fetch(`${API_CONFIG.PRODUCTS.PRODUCTS}${slug}/`);
    if (!res.ok) {
      console.error(`Failed to fetch product with slug ${slug}, status: ${res.status}`);
      return null;
    }
    return res.json();
  } catch (error) {
    console.error(`Error fetching product with slug ${slug}:`, error);
    return null;
  }
}

// Динамические мета-данные для SEO
export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug } = await params;
  const product = await getProduct(slug);

  if (!product) {
    return {
      title: 'Товар не найден | Империя Электроники',
      description: 'Запрошенный товар не найден в нашем каталоге.',
    };
  }

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';
  const title = product.meta_title || product.h1 || product.name;
  const description = product.meta_description || `${product.name} — купить в Караколе по цене ${Number(product.price).toLocaleString()} сом. Характеристики, отзывы, доставка.`;
  const mainImage = product.images?.find(i => i.is_main) || product.images?.[0];
  const imageUrl = mainImage ? `${API_CONFIG.BASE_URL}${mainImage.image}` : undefined;

  // Формируем хлебные крошки для structured data
  const breadcrumbItems = product.categories?.map((cat, idx) => ({
    "@type": "ListItem" as const,
    "position": idx + 1,
    "name": cat.name,
    "item": `${siteUrl}/catalog/${cat.slug}`,
  })) ?? [];

  return {
    title: `${title} | Империя Электроники`,
    description,
    openGraph: {
      title: `${product.name} | Империя Электроники`,
      description,
      type: 'website',
      locale: 'ru_KG',
      siteName: 'Империя Электроники',
      ...(imageUrl && { images: [{ url: imageUrl, alt: product.name }] }),
    },
    twitter: {
      card: 'summary_large_image',
      title: `${product.name} | Империя Электроники`,
      description,
      ...(imageUrl && { images: [imageUrl] }),
    },
    other: {
      'application/ld+json': JSON.stringify({
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": breadcrumbItems,
      }),
    },
  };
}

// Сам компонент страницы
export default async function ProductPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const product = await getProduct(slug);

  if (!product) {
    return <div>Товар не найден</div>;
  }

  // Передаем полученные данные в клиентский компонент для отрисовки
  return <ProductDisplay product={product} />;
}