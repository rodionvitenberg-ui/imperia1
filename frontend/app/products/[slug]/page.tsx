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
  const canonicalUrl = `${siteUrl}/products/${product.slug}`;
  const title = product.meta_title || product.h1 || product.name;
  const description = product.meta_description || `${product.name} — купить в Караколе по цене ${Number(product.price).toLocaleString()} сом. Характеристики, отзывы, доставка.`;
  const mainImage = product.images?.find(i => i.is_main) || product.images?.[0];
  const imageUrl = mainImage ? `${API_CONFIG.BASE_URL}${mainImage.image}` : undefined;

  return {
    title: `${title} | Империя Электроники`,
    description,
    metadataBase: new URL(siteUrl),
    alternates: {
      canonical: canonicalUrl,
      languages: {
        'ru': canonicalUrl,
      },
    },
    openGraph: {
      title: `${product.name} | Империя Электроники`,
      description,
      type: 'website',
      locale: 'ru_KG',
      siteName: 'Империя Электроники',
      url: canonicalUrl,
      ...(imageUrl && { images: [{ url: imageUrl, alt: product.name }] }),
    },
    twitter: {
      card: 'summary_large_image',
      title: `${product.name} | Империя Электроники`,
      description,
      ...(imageUrl && { images: [imageUrl] }),
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

  // Готовим structured data (Product schema + BreadcrumbList + AggregateRating)
  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';
  const canonicalUrl = `${siteUrl}/products/${product.slug}`;
  const mainImage = product.images?.find(i => i.is_main) || product.images?.[0];
  const imageUrl = mainImage ? `${API_CONFIG.BASE_URL}${mainImage.image}` : undefined;

  // Хлебные крошки (начинаем с "Главная")
  const breadcrumbItems: Array<Record<string, unknown>> = [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Главная",
      "item": siteUrl,
    },
  ];
  if (product.categories) {
    product.categories.forEach((cat, idx) => {
      breadcrumbItems.push({
        "@type": "ListItem",
        "position": idx + 2,
        "name": cat.name,
        "item": `${siteUrl}/catalog/${cat.slug}`,
      });
    });
  }
  breadcrumbItems.push({
    "@type": "ListItem",
    "position": breadcrumbItems.length + 1,
    "name": product.name,
  });

  // Product schema
  const productSchema: Record<string, unknown> = {
    "@context": "https://schema.org",
    "@type": "Product",
    "name": product.name,
    "description": product.meta_description || product.description?.substring(0, 300) || `${product.name} — купить в Караколе.`,
    "sku": product.id,
    "url": canonicalUrl,
    "category": product.categories?.[0]?.name || "",
  };

  if (imageUrl) {
    productSchema["image"] = imageUrl;
  }

  // Бренд
  if (product.brands && product.brands.length > 0) {
    productSchema["brand"] = {
      "@type": "Brand",
      "name": product.brands[0].name,
    };
  }

  // Offer
  const availability = product.stock?.in_stock
    ? "https://schema.org/InStock"
    : "https://schema.org/OutOfStock";

  productSchema["offers"] = {
    "@type": "Offer",
    "price": String(product.price),
    "priceCurrency": "KGS",
    "availability": availability,
    "url": canonicalUrl,
    "priceValidUntil": new Date(new Date().setFullYear(new Date().getFullYear() + 1)).toISOString().split('T')[0],
  };

  // AggregateRating
  if ((product.reviews_count ?? 0) > 0) {
    productSchema["aggregateRating"] = {
      "@type": "AggregateRating",
      "ratingValue": String(product.average_rating ?? 0),
      "bestRating": "5",
      "worstRating": "1",
      "reviewCount": String(product.reviews_count ?? 0),
    };
  }

  const structuredData = [
    productSchema,
    {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": breadcrumbItems,
    },
  ];

  // Передаем полученные данные в клиентский компонент для отрисовки
  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(structuredData),
        }}
      />
      <ProductDisplay product={product} />
    </>
  );
}