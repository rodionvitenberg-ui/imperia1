// src/app/page.tsx
import type { Metadata } from 'next';
import HeroSlider from '@/components/HeroSlider';
import NewProducts from '@/components/NewProducts';
import BrandMarquee from '@/components/BrandMarquee';
import WhyUs from '@/components/WhyUs';
import PopularProducts from '@/components/PopularProducts';
import BlogTeaser from '@/components/BlogTeaser';
import RecentlyViewedProducts from '@/components/RecentlyViewedProducts';

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';

export const metadata: Metadata = {
  alternates: {
    canonical: '/',
  },
};

export default function HomePage() {
  return (
    <main className="bg-[#f8f9fb]">
      {/* Семантический заголовок для SEO и доступности */}
      <h1 className="sr-only">
        Империя Электроники — компьютерная техника в Караколе. Продажа компьютеров, ноутбуков, комплектующих. Сборка ПК, ремонт, гарантийное обслуживание.
      </h1>
      <HeroSlider />
      <WhyUs />
      <NewProducts />
      <BrandMarquee />
      <PopularProducts />
      <BlogTeaser />
      <RecentlyViewedProducts />
    </main>
  );
}
