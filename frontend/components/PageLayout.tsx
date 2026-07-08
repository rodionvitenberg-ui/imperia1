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
      {/* Хедер с хлебными крошками и кнопками - ВСЕГДА показывается если есть хлебные крошки */}
      {breadcrumbs && (
        <div className="bg-white border-b border-[#e5e7eb]">
          <div className="container mx-auto max-w-full px-4 py-3"> {/* Всегда max-w-full для хедера */}
            <div className="flex items-center justify-between min-h-[40px]"> {/* Фиксированная минимальная высота */}
              {/* Левая часть - хлебные крошки */}
              <div className="flex-1">
                {breadcrumbs}
              </div>
              
              {/* Правая часть - кнопки (всегда резервируем место) */}
              <div className="flex items-center gap-4 min-w-[200px] justify-end">
                {actions || <div />} {/* Пустой div если нет кнопок */}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Основной контент */}
      <div className={`container mx-auto ${containerClass} px-4 ${breadcrumbs ? 'py-2' : 'py-8 md:py-12'}`}>
        {showSidebar ? (
          /* Сетка с сайдбаром (каталог) */
          <div className="grid grid-cols-1 gap-x-6 lg:grid-cols-8">
            <aside className="lg:col-span-1 lg:sticky lg:top-4 lg:h-fit lg:max-h-[calc(100vh-2rem)] lg:overflow-y-auto">
              {sidebar}
            </aside>
            <main className="mt-6 lg:mt-0 lg:col-span-7">
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