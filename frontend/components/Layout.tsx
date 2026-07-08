// src/components/Layout.tsx
import Header from './Header';
import Footer from './Footer';
import TopBar from './TopBar';
import React from 'react';
import { NestedCategory } from '@/lib/api';

// Данные для топ-бара теперь живут здесь
const topBarLinks = [
  { name: 'О компании', href: '/about' },
  { name: 'Как сделать заказ', href: '/how-to-order' },
  { name: 'Контакты', href: '/contacts' },
  { name: 'Найти магазин', href: '/store-location' },
];

interface LayoutProps {
  children: React.ReactNode;
  categoryTree: NestedCategory[];
}

export default function Layout({ children, categoryTree }: LayoutProps) {
  return (
    <div className="flex min-h-screen flex-col">
      <TopBar links={topBarLinks} />
      <Header allCategories={categoryTree} topBarLinks={topBarLinks} />
      <main className="flex-grow bg-white">{children}</main>
      <Footer />
    </div>
  );
}