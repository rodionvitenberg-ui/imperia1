'use client';

import React from 'react';
import Link from 'next/link';

const Footer = () => {
  return (
    <footer className="bg-[#f8f9fb] text-[#212121] px-6 py-8 mt-16 border-t border-[#e5e7eb]">
      <div className="container mx-auto">
        <div className="flex flex-col md:flex-row items-start justify-between gap-8">
          {/* Левая часть - социальные иконки */}
          <div className="flex-shrink-0">
            <div className="flex flex-col items-start gap-4">
              <h3 className="text-lg font-semibold mb-2 text-[#212121]">Мы в соцсетях</h3>
              <div className="flex items-center space-x-4">
                {/* Telegram */}
                <a
                  href="#"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                  aria-label="Telegram"
                >
                  <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm4.64 6.8c-.15 1.58-.8 5.42-1.13 7.19-.14.75-.42 1-.68 1.03-.58.05-1.02-.38-1.58-.75-.88-.58-1.38-.94-2.23-1.5-.99-.65-.35-1.01.22-1.59.15-.15 2.71-2.48 2.76-2.69.01-.03.01-.14-.07-.2-.08-.06-.19-.04-.27-.02-.11.02-1.86 1.18-5.26 3.47-.5.35-.95.52-1.36.51-.45-.01-1.31-.25-1.95-.46-.78-.26-1.4-.4-1.35-.84.03-.23.36-.47.98-.72 3.85-1.69 6.43-2.8 7.73-3.35 3.68-1.54 4.45-1.8 4.95-1.81.11 0 .36.03.52.17.13.12.17.27.19.38-.01.06.01.24-.01.37z"/>
                  </svg>
                </a>

                {/* WhatsApp */}
                <a
                  href="#"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                  aria-label="WhatsApp"
                >
                  <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.520-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.890-5.335 11.893-11.893A11.821 11.821 0 0020.885 3.488"/>
                  </svg>
                </a>

                {/* Instagram */}
                <a
                  href="#"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                  aria-label="Instagram"
                >
                  <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                  </svg>
                </a>
              </div>
            </div>
          </div>

          {/* Правая часть - две колонки ссылок */}
          <div className="flex flex-col md:flex-row gap-8 md:gap-16">
            {/* Первая колонка - Компания */}
            <div className="flex flex-col">
             <div className="flex flex-col space-y-2">
                <Link
                  href="/blog"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                >
                  Блог
                </Link>
                <Link
                  href="/about"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                >
                  О компании
                </Link>
                <Link
                  href="/contacts"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                >
                  Контакты
                </Link>
              </div>
            </div>

            {/* Вторая колонка - Помощь покупателю */}
            <div className="flex flex-col">
              <div className="flex flex-col space-y-2">
                <Link
                  href="/how-to-order"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                >
                  Как сделать заказ
                </Link>
                <Link
                  href="/delivery-payment"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                >
                  Доставка и оплата
                </Link>
                <Link
                  href="/store-location"
                  className="text-[#212121] hover:text-primary transition-colors duration-200"
                >
                  Найти магазин
                </Link>
              </div>
            </div>
          </div>
        </div>

        {/* Нижняя часть - копирайт */}
        <div className="border-t border-[#e5e7eb] mt-8 pt-8">
          <div className="flex flex-col md:flex-row justify-between items-center gap-4">
            <p className="text-[#212121] text-sm">
              © 2026 Империя Электроники. Все права защищены.
            </p>
            <div className="flex items-center gap-2 text-[#212121] text-xs">
              <Link
                href="/terms"
                className="hover:text-primary transition-colors duration-200"
              >
                Правила пользования
              </Link>
              <span className="text-[#bfbfbf]">•</span>
              <Link
                href="/privacy"
                className="hover:text-primary transition-colors duration-200"
              >
                Политика конфиденциальности
              </Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;