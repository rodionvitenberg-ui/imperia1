// src/app/layout.tsx
import Layout from '@/components/Layout';
import { CartProvider } from '@/contexts/CartContext';
import { AuthProvider } from '@/contexts/AuthContext';
import { FavoritesProvider } from '@/contexts/FavoritesContext';
import { RecentlyViewedProvider } from '@/contexts/RecentlyViewedContext';
import { Toaster } from 'react-hot-toast';
import { Open_Sans } from 'next/font/google';
import './globals.css';
import { fetchCategories, buildCategoryTree, NestedCategory } from '@/lib/api';
import { CompareProvider } from '@/contexts/CompareContext';

const openSans = Open_Sans({ 
  subsets: ['latin', 'cyrillic'],
  weight: ['300', '400', '600', '700'],
  display: 'swap',
  variable: '--font-open-sans',
});

export const metadata = {
  title: 'Империя Электроники — Каракол',
  description: 'Компьютерное оборудование и электроника в Караколе. Доступные цены, доставка, гарантия.',
};

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  // Используем try-catch для обработки ошибок при загрузке категорий
  let categoryTree: NestedCategory[];
  try {
    const flatCategories = await fetchCategories();
    categoryTree = buildCategoryTree(flatCategories);
  } catch (error) {
    // Если не удалось загрузить категории, используем пустое дерево
    categoryTree = [];
  }

  return (
    <html lang="ru">
      <body className={`${openSans.className} ${openSans.variable}`}>
        <AuthProvider>
          <CartProvider>
            <CompareProvider>
            <FavoritesProvider>
              <RecentlyViewedProvider>
                <Layout categoryTree={categoryTree}>{children}</Layout>
                <Toaster
                  position="top-right"
                  toastOptions={{
                    duration: 3000, // Сократили с 4000 до 3000
                    style: {
                      background: '#fff',
                      color: '#374151',
                      borderRadius: '8px',
                      boxShadow: '0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)',
                      border: '1px solid #e5e7eb',
                      padding: '12px 16px',
                      maxWidth: '400px',
                    },
                    success: {
                      duration: 3000,
                      iconTheme: {
                        primary: '#10b981',
                        secondary: '#fff',
                      },
                    },
                    error: {
                      duration: 4000, // Ошибки чуть дольше
                      iconTheme: {
                        primary: '#ef4444',
                        secondary: '#fff',
                      },
                    },
                  }}
                />
              </RecentlyViewedProvider>
            </FavoritesProvider>
            </CompareProvider>
          </CartProvider>
        </AuthProvider>
      </body>
    </html>
  );
}
