// src/app/products/[slug]/page.tsx
import ProductDisplay from "@/components/ProductDisplay";
import { Product, fetchAllProducts } from "@/lib/api";
import { API_CONFIG } from "@/lib/config";

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