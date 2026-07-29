// src/app/blog/[slug]/page.tsx

import { fetchBlogPosts, fetchBlogPost, type BlogPostDetail } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';
import { Metadata } from 'next';
import Link from 'next/link';

export async function generateStaticParams() {
  const posts = await fetchBlogPosts();
  return posts.map((post) => ({
    slug: post.slug,
  }));
}

async function getPost(slug: string): Promise<BlogPostDetail | null> {
  try {
    const res = await fetch(`${API_CONFIG.PRODUCTS.BLOG}${slug}/`);
    if (!res.ok) return null;
    return res.json();
  } catch (error) {
    console.error(`Error fetching blog post ${slug}:`, error);
    return null;
  }
}

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug } = await params;
  const post = await getPost(slug);

  if (!post) {
    return {
      title: 'Статья не найдена | Империя Электроники',
      description: 'Запрошенная статья блога не найдена.',
    };
  }

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';
  const canonicalUrl = `${siteUrl}/blog/${post.slug}`;
  const title = post.meta_title || post.title;
  const description = post.meta_description || post.excerpt?.substring(0, 160) || '';
  const imageUrl = post.image ? `${API_CONFIG.BASE_URL}${post.image}` : undefined;

  return {
    title: `${title} | Империя Электроники`,
    description,
    metadataBase: new URL(siteUrl),
    alternates: {
      canonical: canonicalUrl,
      languages: {
        'ru': canonicalUrl,
      },
    },
    openGraph: {
      title: `${post.title} | Империя Электроники`,
      description,
      type: 'article',
      locale: 'ru_KG',
      siteName: 'Империя Электроники',
      url: canonicalUrl,
      publishedTime: post.published_at,
      modifiedTime: post.updated_at,
      authors: post.author_name ? [post.author_name] : undefined,
      ...(imageUrl && { images: [{ url: imageUrl, alt: post.title }] }),
    },
    twitter: {
      card: 'summary_large_image',
      title: `${post.title} | Империя Электроники`,
      description,
      ...(imageUrl && { images: [imageUrl] }),
    },
  };
}

export default async function BlogPostPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const post = await getPost(slug);

  if (!post) {
    return (
      <main className="bg-[#f8f9fb] min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-[#212121] mb-4">Статья не найдена</h1>
          <Link href="/blog" className="text-[#1061cd] hover:underline">← Вернуться в блог</Link>
        </div>
      </main>
    );
  }

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://imperia-electroniki.kg';
  const canonicalUrl = `${siteUrl}/blog/${post.slug}`;
  const imageUrl = post.image ? `${API_CONFIG.BASE_URL}${post.image}` : undefined;

  // Article schema (Schema.org)
  const articleSchema: Record<string, unknown> = {
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": post.title,
    "description": post.meta_description || post.excerpt || '',
    "datePublished": post.published_at,
    "dateModified": post.updated_at,
    "url": canonicalUrl,
    "publisher": {
      "@type": "Organization",
      "name": "Империя Электроники",
      "logo": {
        "@type": "ImageObject",
        "url": `${siteUrl}/logo.png`,
      },
    },
  };

  if (post.author_name) {
    articleSchema["author"] = {
      "@type": "Person",
      "name": post.author_name,
    };
  }

  if (imageUrl) {
    articleSchema["image"] = imageUrl;
  }

  if (post.tags && post.tags.length > 0) {
    articleSchema["keywords"] = post.tags.map(t => t.name).join(', ');
  }

  // BreadcrumbList for blog
  const breadcrumbSchema = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {
        "@type": "ListItem",
        "position": 1,
        "name": "Главная",
        "item": siteUrl,
      },
      {
        "@type": "ListItem",
        "position": 2,
        "name": "Блог",
        "item": `${siteUrl}/blog`,
      },
      {
        "@type": "ListItem",
        "position": 3,
        "name": post.title,
      },
    ],
  };

  const structuredData = [articleSchema, breadcrumbSchema];

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(structuredData),
        }}
      />
      <main className="bg-[#f8f9fb] min-h-screen">
        <article className="max-w-[800px] mx-auto px-5 py-12">
          {/* Хлебные крошки */}
          <nav aria-label="Хлебные крошки" className="mb-6 text-sm text-[#888]">
            <Link href="/" className="hover:text-[#1061cd] transition-colors">Главная</Link>
            <span className="mx-2">/</span>
            <Link href="/blog" className="hover:text-[#1061cd] transition-colors">Блог</Link>
            <span className="mx-2">/</span>
            <span className="text-[#555]">{post.title}</span>
          </nav>

          {/* Заголовок */}
          <h1 className="text-[28px] md:text-[36px] font-bold text-[#212121] mb-4 leading-tight" style={{ fontFamily: 'var(--font-display)' }}>
            {post.title}
          </h1>

          {/* Мета-информация */}
          <div className="flex flex-wrap items-center gap-4 text-sm text-[#888] mb-8 pb-8 border-b border-[#e5e7eb]">
            {post.published_at && (
              <time dateTime={post.published_at}>
                {new Date(post.published_at).toLocaleDateString('ru-RU', { day: 'numeric', month: 'long', year: 'numeric' })}
              </time>
            )}
            {post.author_name && (
              <span className="text-[#1061cd]">{post.author_name}</span>
            )}
          </div>

          {/* Изображение */}
          {imageUrl && (
            <figure className="mb-10 rounded-[8px] overflow-hidden">
              <img
                src={imageUrl}
                alt={post.title}
                className="w-full h-auto object-cover"
              />
            </figure>
          )}

          {/* Контент */}
          <div
            className="prose prose-lg max-w-none
              prose-headings:text-[#212121] prose-headings:font-semibold
              prose-h2:text-[24px] prose-h2:mt-10 prose-h2:mb-4
              prose-h3:text-[20px] prose-h3:mt-8 prose-h3:mb-3
              prose-p:text-[#444] prose-p:leading-relaxed prose-p:mb-5
              prose-a:text-[#1061cd] prose-a:no-underline hover:prose-a:underline
              prose-strong:text-[#212121]
              prose-ul:my-5 prose-li:text-[#444]
              prose-img:rounded-[8px] prose-img:my-8"
            dangerouslySetInnerHTML={{ __html: post.content }}
          />

          {/* Теги */}
          {post.tags && post.tags.length > 0 && (
            <div className="mt-12 pt-8 border-t border-[#e5e7eb]">
              <h2 className="text-sm font-bold text-[#888] uppercase tracking-wide mb-3">Теги</h2>
              <div className="flex flex-wrap gap-2">
                {post.tags.map((tag) => (
                  <span key={tag.slug} className="inline-block px-3 py-1 bg-[#eef2ff] text-[#1061cd] text-xs rounded-full">
                    {tag.name}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Навигация назад */}
          <div className="mt-12 pt-8 border-t border-[#e5e7eb]">
            <Link href="/blog" className="inline-flex items-center text-[#1061cd] hover:underline text-sm font-medium">
              <svg className="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
              </svg>
              Все статьи блога
            </Link>
          </div>
        </article>
      </main>
    </>
  );
}