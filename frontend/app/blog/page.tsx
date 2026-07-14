import { fetchBlogPosts, type BlogPost } from '@/lib/api';
import Link from 'next/link';
import { API_CONFIG } from '@/lib/config';

export default async function BlogPage() {
  const posts: BlogPost[] = await fetchBlogPosts();
  return (
    <main className="bg-[#f8f9fb] min-h-screen">
      <div className="max-w-[1200px] mx-auto px-5 py-12">
        <h1 className="text-[28px] md:text-[36px] font-bold text-[#212121] mb-8" style={{ fontFamily: 'var(--font-display)' }}>Блог</h1>
        {posts.length === 0 ? (
          <p className="text-[#777]">Статей пока нет.</p>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {posts.map(post => (
              <Link key={post.id} href={`/blog/${post.slug}`} className="group block rounded-[8px] border border-[#e5e7eb] bg-white overflow-hidden hover:border-[#1061cd]/30 transition-colors duration-200">
                {post.image ? (
                  <div className="h-48 bg-[#f5f5f5] overflow-hidden">
                    <img src={API_CONFIG.MEDIA.buildImageUrl(post.image)} alt={post.title} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-700 ease-out" />
                  </div>
                ) : <div className="h-48 bg-gradient-to-br from-[#1061cd]/10 to-[#1061cd]/5 flex items-center justify-center"><span className="text-5xl text-[#1061cd]/30 font-bold">?</span></div>}
                <div className="p-5">
                  <p className="text-[11px] text-[#888] uppercase tracking-wide mb-2">{new Date(post.published_at).toLocaleDateString('ru-RU', { day: 'numeric', month: 'long', year: 'numeric' })}</p>
                  <h2 className="text-[16px] font-semibold text-[#212121] line-clamp-2 group-hover:text-[#1061cd] transition-colors">{post.title}</h2>
                  {post.excerpt && <p className="text-[13px] text-[#777] line-clamp-2 mt-2">{post.excerpt}</p>}
                </div>
              </Link>
            ))}
          </div>
        )}
      </div>
    </main>
  );
}