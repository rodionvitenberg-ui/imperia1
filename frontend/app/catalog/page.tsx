// src/app/catalog/page.tsx
import { fetchCategories, buildCategoryTree, NestedCategory } from '@/lib/api';
import CatalogGrid from '@/components/CatalogGrid';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Каталог — Империя Электроники',
  description:
    'Полный каталог компьютерной техники, комплектующих и услуг в Караколе. Процессоры, видеокарты, ноутбуки, мониторы, периферия, ремонт ПК.',
  openGraph: {
    title: 'Каталог — Империя Электроники',
    description:
      'Полный каталог компьютерной техники, комплектующих и услуг в Караколе.',
    type: 'website',
    locale: 'ru_KG',
    siteName: 'Империя Электроники',
  },
  twitter: {
    card: 'summary',
    title: 'Каталог — Империя Электроники',
    description:
      'Полный каталог компьютерной техники, комплектующих и услуг в Караколе.',
  },
};

export default async function CatalogPage() {
  let categories = await fetchCategories();
  const categoryTree = buildCategoryTree(categories);

  // Корневые категории
  const apiCategories = categoryTree.filter(
    (cat) => cat.slug !== 'uslugi'
  );

  // Кастомная категория «Услуги и ремонт» (как в мегаменю)
  const SERVICES_CATEGORY: NestedCategory = {
    id: -1,
    name: 'Услуги и ремонт',
    slug: 'services',
    parent: null,
    children: [
      {
        id: -2,
        name: 'Ремонт ПК',
        slug: 'services',
        parent: -1,
      },
      {
        id: -3,
        name: 'Обслуживание и заправка картриджей',
        slug: 'services',
        parent: -1,
      },
    ],
  };

  const rootCategories = [...apiCategories, SERVICES_CATEGORY];

  return (
    <div className="max-w-[1400px] mx-auto px-5 py-12 md:py-16">
      {/* Заголовок */}
      <div className="mb-10">
        <h1
          className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-4"
          style={{ fontFamily: 'var(--font-display)' }}
        >
          Каталог товаров
        </h1>
        <p
          className="text-[14px] leading-[20px] text-gray-500 max-w-xl"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Широкий ассортимент компьютерной техники, комплектующих и
          аксессуаров. Найдите всё необходимое для работы, учёбы и игр.
        </p>
      </div>

      {/* Строка поиска */}
      <div className="mb-10">
        <form action="/search" method="GET" className="max-w-md">
          <div className="relative">
            <svg
              className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
            <input
              type="search"
              name="q"
              placeholder="Поиск по каталогу..."
              className="w-full pl-12 pr-4 py-3 rounded-[20px] border border-[#bfbfbf] text-[14px] leading-[20px] text-[#212121] bg-white outline-none transition-colors focus:border-[#1061cd] focus:ring-2 focus:ring-[#1061cd]/20"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            />
          </div>
        </form>
      </div>

      {/* Сетка категорий */}
      <CatalogGrid categories={rootCategories} />

      {/* Structured data BreadcrumbList */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify({
            '@context': 'https://schema.org',
            '@type': 'BreadcrumbList',
            itemListElement: [
              {
                '@type': 'ListItem',
                position: 1,
                name: 'Главная',
                item: 'https://imperia-electroniki.kg',
              },
              {
                '@type': 'ListItem',
                position: 2,
                name: 'Каталог',
                item: 'https://imperia-electroniki.kg/catalog',
              },
            ],
          }),
        }}
      />
    </div>
  );
}