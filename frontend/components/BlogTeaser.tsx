'use client';

import { useEffect, useState, type FC } from 'react';
import Link from 'next/link';
import { fetchBlogPosts, type BlogPost } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';

const BlogTeaser: FC = () => {
  const [posts, setPosts] = useState<BlogPost[]>([]);
  const [ready, setReady] = useState(false);

  useEffect(() => {
    fetchBlogPosts().then(data => {
      setPosts(data.slice(0, 4));
      setReady(true);
    });
  }, []);

  if (!ready || posts.length === 0) return null;

  return (
    <section className="w-full pt-4 md:pt-8 pb-16 md:pb-24 bg-white">
      <div className="max-w-[1400px] mx-auto px-5">
        <div className="flex items-end justify-between mb-8">
          <div>
            <span className="text-[11px] font-bold uppercase tracking-[0.18em] text-[#1061cd] mb-2 inline-block" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>Блог</span>
            <h2 className="text-[24px] md:text-[32px] font-bold text-[#212121]" style={{ fontFamily: 'var(--font-display)' }}>Полезные статьи</h2>
          </div>
          <Link href="/blog" className="hidden sm:inline-flex items-center gap-2 text-[14px] font-bold text-[#1061cd] underline decoration-[#1061cd]/30 underline-offset-4 hover:text-[#0f54b3] transition-colors duration-200" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>Все статьи</Link>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {posts.map(post => (
            <Link key={post.id} href={`/blog/${post.slug}`} className="group block rounded-[8px] border border-[#e5e7eb] bg-white overflow-hidden hover:border-[#1061cd]/30 transition-colors duration-200">
              {post.image ? (
                <div className="relative h-44 bg-[#f5f5f5] overflow-hidden">
                  <img src={API_CONFIG.MEDIA.buildImageUrl(post.image)} alt={post.title} className="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-700 ease-out" />
                </div>
              ) : <div className="h-44 bg-gradient-to-br from-[#1061cd]/10 to-[#1061cd]/5 flex items-center justify-center"><span className="text-4xl text-[#1061cd]/30 font-bold">?</span></div>}
              <div className="p-4">
                <p className="text-[10px] text-[#888] uppercase tracking-wide mb-1">{new Date(post.published_at).toLocaleDateString('ru-RU', { day: 'numeric', month: 'long', year: 'numeric' })}</p>
                <h3 className="text-[14px] font-semibold text-[#212121] line-clamp-2 group-hover:text-[#1061cd] transition-colors">{post.title}</h3>
                {post.excerpt && <p className="text-[12px] text-[#777] line-clamp-2 mt-1">{post.excerpt}</p>}
              </div>
            </Link>
          ))}
        </div>
        <div className="mt-6 text-center sm:hidden">
          <Link href="/blog" className="inline-flex items-center gap-2 text-[14px] font-bold text-[#1061cd] underline decoration-[#1061cd]/30 underline-offset-4" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>Все статьи</Link>
        </div>
      </div>
    </section>
  );
};

export default BlogTeaser;
