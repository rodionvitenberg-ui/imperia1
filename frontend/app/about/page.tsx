// src/app/about/page.tsx
import type { Metadata } from 'next';
import { VariantA } from '@/components/about/VariantA';

export const metadata: Metadata = {
  title: 'О компании — Империя Электроники',
  description:
    'Узнайте больше о компании Империя Электроники — ваш надёжный партнёр в мире компьютерного оборудования в Караколе.',
};

export default function AboutPage() {
  return <VariantA />;
}