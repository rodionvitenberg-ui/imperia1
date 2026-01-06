import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Поиск товаров | My Shop',
  description: 'Поиск компьютеров, периферии, МФУ и другой техники в нашем интернет-магазине',
  keywords: 'поиск товаров, компьютеры, периферия, МФУ, принтеры, техника',
};

export default function SearchLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}