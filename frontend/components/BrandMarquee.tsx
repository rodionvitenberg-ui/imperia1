'use client';

import { useEffect, useState, useRef, type FC } from 'react';
import { fetchBrands, type Brand } from '@/lib/api';
import { API_CONFIG } from '@/lib/config';

const BrandMarquee: FC = () => {
  const [brands, setBrands] = useState<Brand[]>([]);
  const [ready, setReady] = useState(false);
  const innerRef = useRef<HTMLDivElement>(null);
  const posRef = useRef(0);
  const speed = 0.6;
  const dragRef = useRef(false);
  const lastXRef = useRef(0);
  const velRef = useRef(0);
  const dirRef = useRef<'left' | 'right'>('left');
  const frameRef = useRef(0);

  useEffect(() => {
    fetchBrands().then(data => {
      setBrands(data.slice(0, 16));
      setReady(true);
    });
  }, []);

  useEffect(() => {
    if (!ready || brands.length === 0) return;
    const step = () => {
      if (!dragRef.current && innerRef.current) {
        const delta = dirRef.current === 'right' ? speed : -speed;
        posRef.current += delta;
        const half = innerRef.current.scrollWidth / 2;
        if (posRef.current <= -half) posRef.current += half;
        if (posRef.current > 0) posRef.current -= half;
        innerRef.current.style.transform = `translateX(${posRef.current}px)`;
      }
      frameRef.current = requestAnimationFrame(step);
    };
    frameRef.current = requestAnimationFrame(step);
    return () => cancelAnimationFrame(frameRef.current);
  }, [ready, brands]);

  const onPointerDown = (e: React.PointerEvent) => {
    dragRef.current = true;
    lastXRef.current = e.clientX;
    velRef.current = 0;
    (e.target as HTMLElement).setPointerCapture(e.pointerId);
  };

  const onPointerMove = (e: React.PointerEvent) => {
    if (!dragRef.current || !innerRef.current) return;
    const dx = e.clientX - lastXRef.current;
    lastXRef.current = e.clientX;
    velRef.current = dx;
    posRef.current += dx;
    innerRef.current.style.transform = `translateX(${posRef.current}px)`;
  };

  const endDrag = () => {
    dragRef.current = false;
    dirRef.current = velRef.current > 0 ? 'right' : 'left';
  };

  if (!ready || brands.length === 0) return null;

  const items = [...brands, ...brands];

  return (
    <section className="w-full overflow-hidden bg-[#f8f9fb] py-4 md:py-6">
      <div className="max-w-[1400px] mx-auto">
        <div className="relative select-none cursor-grab active:cursor-grabbing"
          onPointerDown={onPointerDown}
          onPointerMove={onPointerMove}
          onPointerUp={endDrag}
          onPointerLeave={endDrag}
        >
          <div className="absolute left-0 top-0 bottom-0 w-12 md:hidden z-10 pointer-events-none bg-gradient-to-r from-[#f8f9fb] to-transparent" />
          <div className="absolute right-0 top-0 bottom-0 w-12 md:hidden z-10 pointer-events-none bg-gradient-to-l from-[#f8f9fb] to-transparent" />

          <div ref={innerRef} className="flex gap-8 md:gap-12 lg:gap-16 items-center py-4 will-change-transform whitespace-nowrap">
            {items.map((brand, idx) => (
              <a
                key={`${brand.slug}-${idx}`}
                href={brand.website || '#'}
                target={brand.website ? '_blank' : undefined}
                rel={brand.website ? 'noopener noreferrer' : undefined}
                className="flex-shrink-0 flex items-center gap-2.5 opacity-70 hover:opacity-100 transition-opacity duration-300"
                onClick={e => { if (dragRef.current) e.preventDefault(); }}
                draggable={false}
              >
                {brand.logo ? (
                  <img
                    src={API_CONFIG.MEDIA.buildImageUrl(brand.logo)}
                    alt={brand.name}
                    className="h-14 md:h-20 w-auto object-contain"
                    draggable={false}
                  />
                ) : (
                  <span className="text-sm md:text-base font-semibold text-gray-700 whitespace-nowrap px-2">
                    {brand.name}
                  </span>
                )}
              </a>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default BrandMarquee;