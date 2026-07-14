'use client';

import React, { useState, useEffect } from 'react';
import { Product, fetchNewProducts } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';
import { useCart } from '@/contexts/CartContext';

/* ── Icons ───────────────────────────────── */
function CartIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
    </svg>
  );
}

function SparkleIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z" />
    </svg>
  );
}

function ArrowRightIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={2}>
      <path strokeLinecap="round" strokeLinejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3" />
    </svg>
  );
}

/* ── Bento cell layout map (6-col grid, mathematically gapless) ── */
const BENTO_CELLS = [
  { col: 'col-span-2', row: 'row-span-2', size: 'lg' },    // 0 — hero
  { col: 'col-span-2', row: 'row-span-2', size: 'md' },     // 1
  { col: 'col-span-1', row: 'row-span-3', size: 'tall' },   // 2
  { col: 'col-span-1', row: 'row-span-2', size: 'tall' },   // 3
  { col: 'col-span-2', row: 'row-span-2', size: 'md' },     // 4
  { col: 'col-span-1', row: 'row-span-1', size: 'sm' },     // 5
  { col: 'col-span-1', row: 'row-span-1', size: 'sm' },     // 6
  { col: 'col-span-2', row: 'row-span-2', size: 'md' },      // 7
] as const;

type BentoCell = (typeof BENTO_CELLS)[number];

/* ── BentoCard ───────────────────────────── */
function BentoCard({ product, cell }: { product: Product; cell: BentoCell }) {
  const { addToCart } = useCart();
  const [isCartClicked, setIsCartClicked] = useState(false);
  const main = product.images?.find((i) => i.is_main) || product.images?.[0];
  const brand = product.brands?.[0];
  const attrs = product.attributes?.slice(0, cell.size === 'lg' ? 4 : 2) ?? [];
  const price = Number(product.price).toLocaleString();

  const handleCart = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    addToCart(product, 1);
    setIsCartClicked(true);
    setTimeout(() => setIsCartClicked(false), 600);
  };

  return (
    <a
      href={`/products/${product.slug}`}
      className={`${cell.col} ${cell.row} group relative overflow-hidden rounded-[8px] border border-[#e5e7eb] bg-white hover:border-[#1061cd]/30 transition-colors duration-200 cursor-pointer flex flex-col`}
    >
      {/* Image area */}
      <div className="relative flex-1 min-h-0 bg-[#f5f5f5] overflow-hidden">
        <img
          src={API_CONFIG.MEDIA.buildImageUrl(main?.image ?? '')}
          alt={product.name}
          className="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-700 ease-out"
        />
        {/* Gradient overlay — large cards only */}
        {cell.size === 'lg' && (
          <div className="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent" />
        )}

        {/* Brand badge — large cards, top-left */}
        {cell.size === 'lg' && brand && (
          <div className="absolute top-3 left-3 z-10">
            <span className="inline-block px-2 py-0.5 rounded-[4px] bg-[#1061cd] text-[10px] font-bold text-white uppercase tracking-wide">
              {brand.name}
            </span>
          </div>
        )}

        {/* Price tag — large cards, bottom-left */}
        {cell.size === 'lg' && (
          <div className="absolute bottom-3 left-3 z-10">
            <span className="inline-block px-3 py-1.5 rounded-full bg-white/90 backdrop-blur-sm text-sm font-bold text-[#212121] border border-[#e5e7eb]">
              {price} сом
            </span>
          </div>
        )}
      </div>

      {/* Info footer */}
      <div className="p-2.5 md:p-3 flex flex-col gap-0.5 bg-white">
        {brand && cell.size !== 'lg' && (
          <span className="text-[10px] text-[#1061cd] font-bold uppercase tracking-wide truncate">
            {brand.name}
          </span>
        )}
        <h3 className="text-[12px] md:text-[13px] font-bold text-[#212121] leading-[16px] line-clamp-2" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
          {product.name}
        </h3>
        {cell.size !== 'lg' && (
          <p className="text-sm font-semibold text-[#212121] mt-0.5">
            {price} сом
          </p>
        )}
        {attrs.length > 0 && (cell.size === 'lg' || cell.size === 'md') && (
          <div className="flex flex-wrap gap-1 mt-0.5">
            {attrs.map((attr, i) => (
              <span key={i} className="text-[9px] px-1 py-0.5 bg-gray-100 text-[#555] rounded-sm uppercase leading-none">
                {typeof attr.value === 'object' ? attr.value.display : String(attr.value)}
              </span>
            ))}
          </div>
        )}
      </div>
    </a>
  );
}

/* ── Main component ──────────────────────── */
export default function NewProducts() {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const load = async () => {
      try {
        setLoading(true);
        const data = await fetchNewProducts(8);
        setProducts(data);
      } catch (err) {
        console.error('Failed to load new products:', err);
      } finally {
        setLoading(false);
      }
    };
    load();
  }, []);

  if (loading) {
    return (
      <div className="py-20 text-center">
        <p className="text-[#212121]" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>Загрузка...</p>
      </div>
    );
  }

  if (products.length === 0) {
    return (
      <div className="py-20 text-center">
        <p className="text-[#212121]" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>Новые товары не найдены</p>
      </div>
    );
  }

  const displayProducts = products.slice(0, 8);

  return (
    <section className="w-full pt-4 md:pt-8 pb-4 md:pb-6">
      <div className="max-w-[1400px] mx-auto px-5">
        {/* Header row */}
        <div className="flex items-end justify-between mb-8">
          <div>
            <h2 className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121]" style={{ fontFamily: 'var(--font-display)' }}>
              Новые товары
            </h2>
          </div>
          <a
            href="/catalog?is_new=true"
            className="hidden sm:inline-flex items-center gap-2 text-[14px] font-bold text-[#1061cd] underline decoration-[#1061cd]/30 underline-offset-4 hover:text-[#0f54b3] hover:decoration-[#1061cd]/60 transition-colors duration-200"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Все новинки
            <ArrowRightIcon className="w-4 h-4" />
          </a>
        </div>

        {/* Bento grid — 6 columns, gapless via dense auto-flow */}
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3 grid-flow-dense auto-rows-[180px] sm:auto-rows-[200px] lg:auto-rows-[170px]">
          {displayProducts.map((product, idx) => {
            const cell = BENTO_CELLS[idx] ?? { col: 'col-span-1', row: 'row-span-1', size: 'sm' };
            return <BentoCard key={product.id} product={product} cell={cell} />;
          })}
        </div>

        {/* Mobile "view all" link */}
        <div className="mt-6 text-center sm:hidden">
          <a
            href="/catalog?is_new=true"
            className="inline-flex items-center gap-2 text-[14px] font-bold text-[#1061cd] underline decoration-[#1061cd]/30 underline-offset-4 hover:text-[#0f54b3] hover:decoration-[#1061cd]/60 transition-colors duration-200"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Все новинки
            <ArrowRightIcon className="w-4 h-4" />
          </a>
        </div>
      </div>
    </section>
  );
}