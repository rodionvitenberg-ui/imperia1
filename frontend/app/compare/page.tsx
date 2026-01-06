// src/app/compare/page.tsx
'use client';

import React from 'react';
import { useCompare } from '@/contexts/CompareContext';
import { useCart } from '@/contexts/CartContext';
import Link from 'next/link';

const API = (process.env.NEXT_PUBLIC_API_URL ?? 'http://92.113.146.158').replace(/\/$/, '');
const buildImgUrl = (src?: string) => {
  if (!src) return '/placeholder.jpg';
  if (/^(https?:|data:|blob:)/i.test(src)) return src;
  return `${API}${src.startsWith('/') ? src : `/${src}`}`;
};

export default function ComparePage() {
  const { compareItems, removeFromCompare, clearCompare } = useCompare();
  const { addToCart } = useCart();

  if (compareItems.length === 0) {
    return (
      <div className="container mx-auto px-4 py-20 text-center">
        <h1 className="text-3xl font-bold mb-4">Сравнение товаров</h1>
        <p className="text-gray-600 mb-8">Вы пока не добавили ни одного товара к сравнению.</p>
        <Link href="/" className="bg-black text-white px-6 py-3 rounded-lg font-medium hover:bg-gray-800 transition-colors">
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
    <div className="container mx-auto px-4 py-12">
      {/* Шапка страницы тоже центрирована по ширине таблицы */}
      <div className="max-w-5xl mx-auto flex justify-between items-center mb-8">
        <button 
          onClick={clearCompare}
          className="text-red-500 hover:text-red-600 text-sm font-medium underline"
        >
          Очистить список
        </button>
      </div>

      {/* Обертка для центрирования таблицы */}
      <div className="flex justify-center">
        <div className="overflow-x-auto pb-6 max-w-5xl w-full scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-transparent">
          <table className="w-auto mx-auto text-left border-collapse border border-gray-100 shadow-sm rounded-lg overflow-hidden">
            <thead>
              <tr className="bg-gray-50">
                {/* Колонка названий характеристик */}
                <th className="p-3 border-b border-r border-gray-200 bg-white min-w-[140px] w-[140px] sticky left-0 z-10 md:static shadow-[4px_0_5px_-2px_rgba(0,0,0,0.05)] md:shadow-none">
                  <span className="text-xs text-gray-400 uppercase tracking-wider font-semibold">Характеристики</span>
                </th>
                
                {/* Колонки товаров */}
                {compareItems.map(product => (
                  <th key={product.id} className="p-3 border-b border-r border-gray-200 bg-white w-[200px] min-w-[180px] max-w-[200px] align-top last:border-r-0">
                    <div className="relative group flex flex-col h-full">
                      {/* Кнопка удалить */}
                      <button 
                        onClick={() => removeFromCompare(product.id)}
                        className="absolute -top-1 -right-1 z-20 bg-gray-100 hover:bg-red-100 text-gray-400 hover:text-red-500 rounded-full p-1 transition-colors"
                        title="Удалить"
                      >
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" /></svg>
                      </button>
                      
                      <Link href={`/products/${product.slug}`} className="block mb-2 text-center">
                        <div className="aspect-square bg-white rounded-lg overflow-hidden mb-2 border border-gray-100 flex items-center justify-center p-2">
                           <img 
                              src={buildImgUrl(product.images?.find(i => i.is_main)?.image || product.images?.[0]?.image)} 
                              alt={product.name}
                              className="max-w-full max-h-full object-contain"
                           />
                        </div>
                        <div className="text-sm font-medium text-gray-900 line-clamp-2 hover:text-blue-600 transition-colors h-[40px] flex items-center justify-center">
                          {product.name}
                        </div>
                      </Link>
                      
                      <div className="mt-auto text-center">
                        <div className="font-bold text-base mb-2">
                          {Number(product.price).toLocaleString()} сом
                        </div>
                        
                        <button
                          onClick={() => addToCart(product, 1)}
                          className="w-full py-2 bg-black text-white text-xs font-bold uppercase rounded hover:bg-gray-800 transition-colors"
                        >
                          В корзину
                        </button>
                      </div>
                    </div>
                  </th>
                ))}
              </tr>
            </thead>
            
            <tbody className="divide-y divide-gray-100">
              {uniqueAttributes.map(attrName => (
                <tr key={attrName} className="hover:bg-gray-50 transition-colors text-sm">
                  {/* Ячейка названия атрибута */}
                  <td className="p-3 text-gray-500 font-medium bg-white sticky left-0 md:static border-r border-gray-100 shadow-[4px_0_5px_-2px_rgba(0,0,0,0.05)] md:shadow-none z-10">
                    {attrName}
                  </td>
                  
                  {/* Ячейки значений */}
                  {compareItems.map(product => {
                    const attrs = (product as any).attributes || [];
                    const foundAttr = attrs.find((a: any) => a.attribute?.name === attrName);
                    
                    return (
                      <td key={product.id} className="p-3 text-gray-900 text-center border-r border-gray-100 last:border-r-0">
                        {foundAttr ? (
                          <span>
                              {foundAttr.value} 
                              <span className="text-gray-400 text-xs ml-0.5">
                                {foundAttr.attribute?.unit}
                              </span>
                          </span>
                        ) : (
                          <span className="text-gray-200">—</span>
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