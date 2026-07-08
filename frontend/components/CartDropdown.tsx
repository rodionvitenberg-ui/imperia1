'use client';

import React from 'react';
import { motion } from 'framer-motion';
import { useCart, CartItem } from '@/contexts/CartContext';
import { ProductImage } from '@/lib/api';
import Link from 'next/link';
import { dropdownPanelVariants, dropdownContentVariants } from '@/lib/animations';
import { API_CONFIG } from '@/lib/config';

const CartDropdown: React.FC = () => {
  const { items, totalPrice, totalItems, updateQuantity, removeFromCart } = useCart();

  // Функция для создания полного URL изображения
  const buildImageUrl = API_CONFIG.MEDIA.buildImageUrl;

  return (
    <motion.div
      variants={dropdownPanelVariants}
      initial="hidden"
      animate="visible"
      exit="hidden"
      className="absolute top-full left-0 w-full bg-white text-[#212121] border-t border-[#e5e7eb] overflow-hidden z-50"
    >
      <motion.div
        variants={dropdownContentVariants}
        className="container mx-auto px-6 py-6"
      >

        {/* Контент */}
        {items.length === 0 ? (
          <motion.div variants={dropdownContentVariants} className="text-center py-8">
            <svg className="w-16 h-16 mx-auto mb-4 text-[#bfbfbf]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
            </svg>
            <p className="text-[#212121] mb-4">Корзина пуста</p>
            <p className="text-[#212121] text-sm">Добавьте товары для покупки</p>
          </motion.div>
        ) : (
          <motion.div variants={dropdownContentVariants}>
            {/* Список товаров в корзине */}
            <div className="space-y-4 mb-6 max-h-96 overflow-y-auto">
              {items.slice(0, 5).map((item: CartItem) => {
                const mainImage = item.product.images?.find((img: ProductImage) => img.is_main) || item.product.images?.[0];
                
                return (
                  <div key={item.product.id} className="flex items-center space-x-3 p-3 bg-white border border-[#e5e7eb] rounded-[8px] group">
                    {/* Изображение */}
                    <Link href={`/products/${item.product.slug}`} className="flex-shrink-0">
                      <div className="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden">
                        {mainImage ? (
                          <img
                            src={buildImageUrl(mainImage.image)}
                            alt={item.product.name}
                            className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-200"
                          />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center">
                            <svg className="w-8 h-8 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                          </div>
                        )}
                      </div>
                    </Link>
                    
                    {/* Информация о товаре */}
                    <div className="flex-1 min-w-0">
                      <Link href={`/products/${item.product.slug}`}>
                        <h4 className="font-medium text-[#212121] hover:text-primary transition-colors truncate">
                          {item.product.name}
                        </h4>
                      </Link>
                      <p className="text-[#212121] text-sm">
                        {item.product.price} сом × {item.quantity} = {(Number(item.product.price) * item.quantity).toFixed(0)} сом
                      </p>
                    </div>
                    
                    {/* Управление количеством */}
                    <div className="flex items-center space-x-2">
                      <button
                        onClick={() => updateQuantity(item.product.id, Math.max(1, item.quantity - 1))}
                        className="w-8 h-8 rounded-full bg-gray-200 hover:bg-gray-300 flex items-center justify-center transition-colors"
                        disabled={item.quantity <= 1}
                      >
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20 12H4" />
                        </svg>
                      </button>
                      
                      <span className="w-8 text-center font-medium">{item.quantity}</span>
                      
                      <button
                        onClick={() => updateQuantity(item.product.id, item.quantity + 1)}
                        className="w-8 h-8 rounded-full bg-gray-200 hover:bg-gray-300 flex items-center justify-center transition-colors"
                      >
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                        </svg>
                      </button>
                    </div>
                    
                    {/* Кнопка удаления */}
                    <button
                      onClick={() => removeFromCart(item.product.id)}
                      className="w-8 h-8 rounded-full bg-red-100 hover:bg-red-200 flex items-center justify-center transition-colors opacity-0 group-hover:opacity-100"
                      title="Удалить из корзины"
                    >
                      <svg className="w-4 h-4 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>
                  </div>
                );
              })}
            </div>
            
            {/* Итого и кнопки */}
            <div className="border-t border-gray-200 pt-4">
              {items.length > 5 && (
                <p className="text-sm text-gray-500 mb-3 text-center">
                  И еще {items.length - 5} товаров в корзине
                </p>
              )}
              
              <div className="flex items-center justify-between mb-4">
                <span className="text-lg font-medium text-[#212121]">Итого:</span>
                <span className="text-xl font-bold text-[#212121]">{totalPrice} сом</span>
              </div>
              
              <div className="flex space-x-3">
                <Link
                  href="/cart"
                  className="flex-1 bg-primary text-white py-3 px-6 rounded-[20px] hover:bg-primary/90 transition-colors font-bold text-[14px] min-h-[40px] text-center"
                >
                  Перейти в корзину
                </Link>
              </div>
            </div>
          </motion.div>
        )}
      </motion.div>
    </motion.div>
  );
};

export default CartDropdown;