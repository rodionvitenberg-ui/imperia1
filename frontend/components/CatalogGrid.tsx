'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { NestedCategory } from '@/lib/api';

interface CatalogGridProps {
  categories: NestedCategory[];
}

const CATEGORY_IMAGES: Record<string, string> = {
  components: 'https://images.unsplash.com/photo-1553406830-ef2513450d76?w=600&h=400&fit=crop',
  'ready-pcs': 'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=600&h=400&fit=crop',
  laptops: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600&h=400&fit=crop',
  monitors: 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600&h=400&fit=crop',
  peripherals: 'https://images.unsplash.com/photo-1618384887929-16ec33fab9ef?w=600&h=400&fit=crop',
  accessories: 'https://images.unsplash.com/photo-1597851778616-1ff76f7e8c3c?w=600&h=400&fit=crop',
  services: 'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=600&h=400&fit=crop',
};

function getCategoryImage(slug: string): string {
  return CATEGORY_IMAGES[slug] || `https://picsum.photos/seed/${slug}/600/400`;
}

export default function CatalogGrid({ categories }: CatalogGridProps) {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
      {categories.map((category) => (
        <CategoryCard key={category.id} category={category} />
      ))}
    </div>
  );
}

function CategoryCard({ category }: { category: NestedCategory }) {
  const [imgLoaded, setImgLoaded] = useState(false);
  const childLinks = (category.children || []).slice(0, 3);
  const hasMore = (category.children?.length || 0) > 3;

  const handleCardClick = () => {
    window.location.href = `/catalog/${category.slug}`;
  };

  return (
    <div
      onClick={handleCardClick}
      role="link"
      tabIndex={0}
      onKeyDown={(e) => { if (e.key === 'Enter') handleCardClick(); }}
      className="group block bg-white border border-[#e5e7eb] rounded-[8px] overflow-hidden transition-all duration-200 hover:border-[#1061cd] hover:shadow-sm cursor-pointer"
    >
      {/* Изображение */}
      <div className="relative aspect-[3/2] bg-gray-100 overflow-hidden">
        {!imgLoaded && (
          <div className="absolute inset-0 bg-gray-100 animate-pulse" />
        )}
        <img
          src={getCategoryImage(category.slug)}
          alt={category.name}
          className={`w-full h-full object-cover transition-all duration-500 ease-out group-hover:scale-105 ${
            imgLoaded ? 'opacity-100' : 'opacity-0'
          }`}
          onLoad={() => setImgLoaded(true)}
          loading="lazy"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent" />
      </div>

      {/* Контент */}
      <div className="p-4">
        <div className="flex items-center justify-between mb-2">
          <h2
            className="text-[20px] leading-[24px] font-semibold text-[#212121] group-hover:text-[#1061cd] transition-colors"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            {category.name}
          </h2>
          <svg
            className="w-5 h-5 text-[#1061cd] transition-transform duration-200 group-hover:translate-x-1"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
          </svg>
        </div>

        {/* Дочерние категории */}
        {childLinks.length > 0 && (
          <div className="space-y-1" onClick={(e) => e.stopPropagation()}>
            {childLinks.map((child) => (
              <span
                key={child.id}
                className="block text-[14px] leading-[20px] text-[#212121] hover:text-[#1061cd] transition-colors"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                <Link
                  href={`/catalog/${child.slug}`}
                  className="hover:text-[#1061cd] transition-colors"
                >
                  {child.name}
                </Link>
              </span>
            ))}
            {hasMore && (
              <span
                className="block text-[14px] leading-[20px] text-[#1061cd] font-semibold mt-1"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Ещё {(category.children?.length || 0) - 3} →
              </span>
            )}
          </div>
        )}
      </div>
    </div>
  );
}