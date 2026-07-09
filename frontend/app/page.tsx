// src/app/page.tsx
import HeroSlider from '@/components/HeroSlider';
import PopularProducts from '@/components/PopularProducts';
import NewProducts from '@/components/NewProducts';
import RecentlyViewedProducts from '@/components/RecentlyViewedProducts';

export default function HomePage() {
  return (
    <div className="bg-[#f8f9fb]">
      <HeroSlider />
      <PopularProducts />
      <NewProducts />
      <RecentlyViewedProducts />
    </div>
  );
}
