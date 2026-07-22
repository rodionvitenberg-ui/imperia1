// src/app/compare/page.tsx
'use client';

import React from 'react';
import { useCompare } from '@/contexts/CompareContext';
import { useCart } from '@/contexts/CartContext';
import { API_CONFIG } from '@/lib/config';
import Link from 'next/link';

function getAttrDisplay(value: unknown): string {
  if (typeof value === 'string') return value;
  if (typeof value === 'number' || typeof value === 'boolean') return String(value);
  if (value && typeof value === 'object') {
    const obj = value as Record<string, unknown>;
    if (typeof obj.display === 'string') return obj.display;
    if (typeof obj.value === 'string') return obj.value;
  }
  return '—';
}

export default function ComparePage() {
  const { compareItems, removeFromCompare, clearCompare } = useCompare();
  const { addToCart } = useCart();

  if (compareItems.length === 0) {
    return (
      <div className="max-w-[1400px] mx-auto px-5 py-16 md:py-24 text-center">
        <h1 className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-4" style={{ fontFamily: 'var(--font-display)' }}>
          Сравнение товаров
        </h1>
        <p className="text-[14px] leading-[20px] text-gray-500 mb-8" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
          Вы пока не добавили ни одного товара к сравнению.
        </p>
        <Link
          href="/catalog"
          className="inline-flex items-center justify-center rounded-full bg-[#1061cd] px-7 py-3.5 text-sm font-bold text-white hover:bg-[#0f54b3] transition-colors"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Перейти в каталог
        </Link>
      </div>
    );
  }

  // Сбор атрибутов
  const allAttributeNames = new Set<string>();
  compareItems.forEach(product => {
    const attrs = (product as any).attributes || [];
    attrs.forEach((attrObj: any) => {
      if (attrObj.attribute?.name) {
        allAttributeNames.add(attrObj.attribute.name);
      }
    });
  });
  const uniqueAttributes = Array.from(allAttributeNames);

  return (
    <div className="max-w-[1400px] mx-auto px-5 py-12">
      {/* Шапка */}
      <div className="max-w-5xl mx-auto flex justify-between items-center mb-8">
        <h1 className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121]" style={{ fontFamily: 'var(--font-display)' }}>
          Сравнение товаров
        </h1>
        <button
          onClick={clearCompare}
          className="text-[#1061cd] text-sm font-medium underline decoration-[#1061cd]/30 underline-offset-4 hover:decoration-[#1061cd]/60 transition-colors"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Очистить список
        </button>
      </div>

      {/* Таблица */}
      <div className="flex justify-center">
        <div className="overflow-x-auto pb-6 max-w-5xl w-full">
          <table className="w-auto mx-auto text-left border-collapse border border-[#e5e7eb] rounded-[8px] overflow-hidden">
            <thead>
              <tr className="bg-[#f8f9fb]">
                <th className="p-4 border-b border-r border-[#e5e7eb] bg-[#f8f9fb] min-w-[140px] w-[140px] sticky left-0 z-10 md:static">
                  <span className="text-[11px] text-gray-400 uppercase tracking-wider font-bold" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                    Характеристики
                  </span>
                </th>

                {compareItems.map(product => (
                  <th key={product.id} className="p-4 border-b border-r border-[#e5e7eb] bg-white w-[200px] min-w-[180px] max-w-[200px] align-top last:border-r-0">
                    <div className="relative group flex flex-col h-full">
                      <button
                        onClick={() => removeFromCompare(product.id)}
                        className="absolute -top-1 -right-1 z-20 bg-[#f8f9fb] hover:bg-red-100 text-gray-400 hover:text-red-500 rounded-full p-1 transition-colors"
                        title="Удалить"
                      >
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" /></svg>
                      </button>

                      <Link href={`/products/${product.slug}`} className="block mb-3 text-center">
                        <div className="aspect-square bg-white rounded-[8px] overflow-hidden mb-2 border border-[#e5e7eb] flex items-center justify-center p-3">
                          <img
                            src={API_CONFIG.MEDIA.buildImageUrl((product.images?.find((i: any) => i.is_main) || product.images?.[0])?.image ?? '')}
                            alt={product.name}
                            className="max-w-full max-h-full object-contain"
                          />
                        </div>
                        <div className="text-[13px] font-bold text-[#212121] line-clamp-2 hover:text-[#1061cd] transition-colors h-[40px] flex items-center justify-center" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                          {product.name}
                        </div>
                      </Link>

                      <div className="mt-auto text-center">
                        <div className="font-bold text-base text-[#212121] mb-3">
                          {Number(product.price).toLocaleString()} сом
                        </div>
                        <button
                          onClick={() => addToCart(product, 1)}
                          className="w-full py-2.5 bg-[#1061cd] text-white text-[12px] font-bold uppercase rounded-full hover:bg-[#0f54b3] transition-colors"
                          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                        >
                          В корзину
                        </button>
                      </div>
                    </div>
                  </th>
                ))}
              </tr>
            </thead>

            <tbody className="divide-y divide-[#e5e7eb] bg-white">
              {uniqueAttributes.map(attrName => (
                <tr key={attrName} className="hover:bg-[#f8f9fb] transition-colors">
                  <td className="p-4 text-[13px] text-gray-500 font-medium bg-white sticky left-0 md:static border-r border-[#e5e7eb] z-10" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                    {attrName}
                  </td>

                  {compareItems.map(product => {
                    const attrs = (product as any).attributes || [];
                    const foundAttr = attrs.find((a: any) => a.attribute?.name === attrName);

                    return (
                      <td key={product.id} className="p-4 text-[13px] text-[#212121] text-center border-r border-[#e5e7eb] last:border-r-0" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                        {foundAttr ? (
                          <span>
                            {getAttrDisplay(foundAttr.value)}
                            <span className="text-gray-400 text-[11px] ml-0.5">{foundAttr.attribute?.unit}</span>
                          </span>
                        ) : (
                          <span className="text-gray-300">—</span>
                        )}
                      </td>
                    );
                  })}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}