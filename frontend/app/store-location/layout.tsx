import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Найти магазин - Компьютеры в Караколе | Адрес и контакты',
  description: 'Адрес магазина компьютеров в Караколе. Интерактивная карта проезда, контактная информация, часы работы. Купить компьютер в Караколе.',
  keywords: 'магазин компьютеров каракол, адрес, контакты, карта проезда каракол, купить компьютер каракол, ноутбуки каракол',
  openGraph: {
    title: 'Найти магазин компьютеров в Караколе',
    description: 'Посетите наш магазин компьютеров в Караколе. Адрес, часы работы, контакты.',
    type: 'website',
  },
};

export default function StoreLocationLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}