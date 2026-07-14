// src/app/page.tsx
import HeroSlider from '@/components/HeroSlider';
import NewProducts from '@/components/NewProducts';
import BrandMarquee from '@/components/BrandMarquee';
import WhyUs from '@/components/WhyUs';
import PopularProducts from '@/components/PopularProducts';
import BlogTeaser from '@/components/BlogTeaser';
import RecentlyViewedProducts from '@/components/RecentlyViewedProducts';

export default function HomePage() {
  return (
    <main className="bg-[#f8f9fb]">
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
