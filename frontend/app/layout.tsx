// src/app/layout.tsx
import Layout from '@/components/Layout';
import { CartProvider } from '@/contexts/CartContext';
import { AuthProvider } from '@/contexts/AuthContext';
import { FavoritesProvider } from '@/contexts/FavoritesContext';
import { RecentlyViewedProvider } from '@/contexts/RecentlyViewedContext';
import { Toaster } from 'react-hot-toast';
import { Open_Sans, Geist } from 'next/font/google';
import './globals.css';
import { fetchCategories, buildCategoryTree, NestedCategory } from '@/lib/api';
import { CompareProvider } from '@/contexts/CompareContext';
import { cn } from "@/lib/utils";

const geist = Geist({subsets:['latin'],variable:'--font-sans'});

const openSans = Open_Sans({ 
  subsets: ['latin', 'cyrillic'],
  weight: ['300', '400', '600', '700'],
  display: 'swap',
  variable: '--font-open-sans',
});

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';

export const metadata = {
  metadataBase: new URL(siteUrl),
  title: 'Империя Электроники — Каракол',
  description: 'Компьютерное оборудование и электроника в Караколе. Доступные цены, доставка, гарантия.',
  alternates: {
    canonical: '/',
    languages: {
      'ru': '/',
    },
  },
  openGraph: {
    title: 'Империя Электроники — компьютерная техника в Караколе',
    description: 'Компьютерное оборудование и электроника в Караколе. Доступные цены, доставка, гарантия.',
    type: 'website',
    locale: 'ru_KG',
    siteName: 'Империя Электроники',
    url: siteUrl,
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Империя Электроники — компьютерная техника в Караколе',
    description: 'Компьютерное оборудование и электроника в Караколе. Доступные цены, доставка, гарантия.',
  },
  robots: {
    index: true,
    follow: true,
  },
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

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';

  const localBusinessSchema = {
    "@context": "https://schema.org",
    "@type": "ComputerStore",
    "name": "Империя Электроники",
    "url": siteUrl,
    "description": "Продажа компьютеров, ноутбуков и комплектующих в Караколе. Сборка ПК, ремонт, гарантийное обслуживание.",
    "logo": `${siteUrl}/logo.png`,
    "image": `${siteUrl}/logo.png`,
    "telephone": ["+996555953475", "+996555953466"],
    "email": "info@imperia-electroniki.kg",
    "priceRange": "KGS",
    "currenciesAccepted": "KGS",
    "paymentAccepted": "Cash, Credit Card, Bank Transfer",
    "openingHoursSpecification": [
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
        "opens": "09:00",
        "closes": "18:00"
      },
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": "Saturday",
        "opens": "10:00",
        "closes": "16:00"
      }
    ],
    "contactPoint": [
      {
        "@type": "ContactPoint",
        "telephone": "+996555953475",
        "contactType": "sales",
        "availableLanguage": ["Russian", "Kyrgyz"]
      },
      {
        "@type": "ContactPoint",
        "telephone": "+996555953466",
        "contactType": "customer support",
        "availableLanguage": ["Russian", "Kyrgyz"]
      }
    ],
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "ул. Гагарина, 28",
      "addressLocality": "Каракол",
      "addressCountry": "KG"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 42.4907,
      "longitude": 78.3936
    },
    "sameAs": [
      "https://www.instagram.com/imperia_electroniki",
      "https://wa.me/996555953475"
    ]
  };

  const websiteSchema = {
    "@context": "https://schema.org",
    "@type": "WebSite",
    "name": "Империя Электроники",
    "url": siteUrl,
    "potentialAction": {
      "@type": "SearchAction",
      "target": {
        "@type": "EntryPoint",
        "urlTemplate": `${siteUrl}/search?q={search_term_string}`
      },
      "query-input": "required name=search_term_string"
    }
  };

  return (
    <html lang="ru" className={cn("font-sans", geist.variable)}>
      <body className={`${openSans.className} ${openSans.variable}`}>
        {/* Structured data for Organization and WebSite (Schema.org JSON-LD) */}
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(localBusinessSchema),
          }}
        />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(websiteSchema),
          }}
        />
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
