// src/app/page.tsx
import HeroSlider from '@/components/HeroSlider';
import NewProducts from '@/components/NewProducts';
import BrandMarquee from '@/components/BrandMarquee';
import PopularProducts from '@/components/PopularProducts';
import RecentlyViewedProducts from '@/components/RecentlyViewedProducts';

export default function HomePage() {
  return (
    <main className="bg-[#f8f9fb]">
      <HeroSlider />
      <NewProducts />
      <BrandMarquee />
      <PopularProducts />
      <RecentlyViewedProducts />
    </main>
  );
}
