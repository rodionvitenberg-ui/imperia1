// src/components/PageLayout.tsx
'use client';

import React from 'react';

interface PageLayoutProps {
  children: React.ReactNode;
  breadcrumbs?: React.ReactNode;
  actions?: React.ReactNode; // Кнопки сортировки, фильтров и т.д.
  sidebar?: React.ReactNode; // Боковая панель для фильтров
  showSidebar?: boolean;
  centered?: boolean; // Для страницы товара - центрировать контент
  maxWidth?: 'full' | '7xl'; // Максимальная ширина контейнера
}

const PageLayout: React.FC<PageLayoutProps> = ({
  children,
  breadcrumbs,
  actions,
  sidebar,
  showSidebar = false,
  centered = false,
  maxWidth = 'full'
}) => {
  const containerClass = maxWidth === '7xl' ? 'max-w-7xl' : 'max-w-full';
  
  return (
    <div className="flex flex-col min-h-screen">
      {/* Хедер с хлебными крошками и кнопками — sticky под основным хедером */}
      {breadcrumbs && (
        <div className="bg-white border-b border-[#e5e7eb] sticky top-16 z-40">
          <div className="container mx-auto max-w-full px-4 py-1.5 md:py-2">
            {/* Мобилка: колонка. Десктоп: строка */}
            <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-1.5 md:gap-0">
              {/* Левая часть - хлебные крошки */}
              <div className="flex-1 min-w-0">
                {breadcrumbs}
              </div>
              
              {/* Правая часть - кнопки */}
              <div className="flex items-center gap-4 md:min-w-[200px] md:justify-end">
                {actions || <div />}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Основной контент */}
      <div className={`container mx-auto ${containerClass} px-4 ${showSidebar ? 'py-0' : breadcrumbs ? 'py-2' : 'py-8 md:py-12'}`}>
        {sidebar ? (
          /* Сетка с сайдбаром (каталог) — единый relative-контейнер, overflow-hidden на десктопе */
          <div className="relative lg:overflow-hidden" style={{ minHeight: 'calc(100vh - 120px)' }}>
            {/* Сайдбар: абсолютный, анимируется через transform. Закрыт → уходит за левый край контейнера */}
            <aside
              className={`hidden lg:block lg:absolute lg:top-0 lg:bottom-0 lg:left-0 lg:overflow-y-auto filter-scrollbar transition-transform duration-300 ease-in-out ${
                showSidebar ? 'translate-x-0' : '-translate-x-full'
              }`}
              style={{ width: 'calc(25% - 0.75rem)' }}
            >
              {sidebar}
            </aside>
            {/* Main: анимируется через margin-left синхронно с сайдбаром */}
            <main
              className={`transition-[margin] duration-300 ease-in-out ${
                showSidebar ? 'lg:ml-[25%]' : 'ml-0'
              }`}
            >
              {children}
            </main>
          </div>
        ) : (
          /* Центрированный контент (товар) */
          <div className={centered ? 'max-w-7xl mx-auto' : ''}>
            {children}
          </div>
        )}
      </div>
    </div>
  );
};

export default PageLayout;