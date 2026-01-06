// src/app/page.tsx
import HeroSlider from '@/components/HeroSlider';
import PopularProducts from '@/components/PopularProducts';
import RecentlyViewedProducts from '@/components/RecentlyViewedProducts';

export default function HomePage() {
  return (
    <div>
      <HeroSlider />
      <PopularProducts />
      <RecentlyViewedProducts />
    </div>
  );
}