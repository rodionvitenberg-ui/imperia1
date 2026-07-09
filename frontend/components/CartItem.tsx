// src/components/CartItem.tsx
'use client';

import React from 'react';
import { CartItem as CartItemType } from '@/contexts/CartContext';
import { useCart } from '@/contexts/CartContext';
import { API_CONFIG } from '@/lib/config';
import Link from 'next/link';

interface CartItemProps {
  item: CartItemType;
}

export default function CartItem({ item }: CartItemProps) {
  const { updateQuantity, removeFromCart } = useCart();
  const { product, quantity } = item;

  const mainImage = product.images?.find(img => img.is_main) || product.images?.[0];
  const productPrice = parseFloat(product.price);
  const totalPrice = productPrice * quantity;

  return (
    <div className="bg-white border border-[#e5e7eb] rounded-[8px] p-4 transition-all duration-200 hover:border-[#1061cd]/30">
      <div className="flex items-start gap-4">
        {/* Product Image */}
        <Link href={`/products/${product.slug}`} className="flex-shrink-0">
          <div className="w-20 h-20 bg-gray-100 rounded-[8px] overflow-hidden group cursor-pointer border border-[#e5e7eb]">
            {mainImage ? (
              <img 
                src={API_CONFIG.MEDIA.buildImageUrl(mainImage.image)}
                alt={product.name}
                className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-200"
              />
            ) : (
              <div className="w-full h-full flex items-center justify-center">
                <svg className="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
              </div>
            )}
          </div>
        </Link>
        
        {/* Product Info */}
        <div className="flex-1 min-w-0">
          <Link 
            href={`/products/${product.slug}`}
            className="block group"
          >
            <h3 
              className="text-[13px] leading-[18px] font-bold text-[#212121] group-hover:text-[#1061cd] transition-colors line-clamp-2"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              {product.name}
            </h3>
          </Link>
          
          {/* Price per item */}
          <div className="mt-2">
            <span 
              className="text-[14px] leading-[20px] font-bold text-[#212121]"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              {productPrice.toLocaleString('ru-RU')} сом
            </span>
            <span 
              className="text-[12px] leading-[16px] text-gray-500 ml-1"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              за шт.
            </span>
          </div>
          
          {/* Characteristics (only values) */}
          {product.attributes && product.attributes.length > 0 && (
            <div className="mt-2">
              <div className="flex flex-wrap gap-1">
                {product.attributes.map((attr, index) => (
                  <span 
                    key={index} 
                    className="inline-block px-2 py-1 text-[11px] leading-[14px] bg-gray-100 text-gray-600 rounded"
                    style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                  >
                    {typeof attr.value === 'object' ? attr.value.display : String(attr.value)}
                  </span>
                ))}
              </div>
            </div>
          )}
        </div>

        {/* Remove Button */}
        <div className="flex-shrink-0">
          <button
            onClick={() => removeFromCart(product.id)}
            className="p-1.5 text-gray-400 hover:text-red-500 transition-colors"
            aria-label="Удалить товар"
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
            </svg>
          </button>
        </div>
      </div>

      {/* Quantity Controls and Total */}
      <div className="flex items-center justify-between mt-4 pt-3 border-t border-[#e5e7eb]">
        {/* Quantity Controls */}
        <div className="flex items-center gap-3">
          <span 
            className="text-[13px] leading-[18px] text-gray-500"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Количество:
          </span>
          <div className="flex items-center border border-[#bfbfbf] rounded-[8px] overflow-hidden">
            <button
              onClick={() => updateQuantity(product.id, quantity - 1)}
              className="p-2 hover:bg-gray-50 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
              disabled={quantity <= 1}
              aria-label="Уменьшить количество"
            >
              <svg className="w-4 h-4 text-[#212121]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20 12H4" />
              </svg>
            </button>
            
            <input
              type="number"
              min="1"
              max="999"
              value={quantity}
              onChange={(e) => {
                const newQuantity = parseInt(e.target.value) || 1;
                if (newQuantity >= 1 && newQuantity <= 999) {
                  updateQuantity(product.id, newQuantity);
                }
              }}
              className="w-14 text-center py-2 border-0 focus:ring-0 text-[13px] leading-[18px] font-bold text-[#212121]"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            />
            
            <button
              onClick={() => updateQuantity(product.id, quantity + 1)}
              className="p-2 hover:bg-gray-50 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
              disabled={quantity >= 999}
              aria-label="Увеличить количество"
            >
              <svg className="w-4 h-4 text-[#212121]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
              </svg>
            </button>
          </div>
        </div>

        {/* Total Price */}
        <div className="text-right">
          <div 
            className="text-[16px] leading-[22px] font-bold text-[#212121]"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            {totalPrice.toLocaleString('ru-RU')} сом
          </div>
          {quantity > 1 && (
            <div 
              className="text-[11px] leading-[14px] text-gray-500"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              {quantity} × {productPrice.toLocaleString('ru-RU')} сом
            </div>
          )}
        </div>
      </div>
    </div>
  );
}