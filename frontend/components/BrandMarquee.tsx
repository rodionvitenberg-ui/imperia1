'use client';

import { useRef, useEffect, useState, useMemo, useId, type FC, type PointerEvent } from 'react';

interface BrandMarqueeProps {
  speed?: number;
  className?: string;
  curveAmount?: number;
  direction?: 'left' | 'right';
  interactive?: boolean;
}

/* ── Brand icons as inline SVGs ── */
const BRANDS = [
  {
    name: 'Intel',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <circle cx="50" cy="50" r="46" fill="#0071C5" />
        <text x="50" y="56" textAnchor="middle" fill="white" fontSize="14" fontFamily="Arial" fontWeight="bold">intel</text>
      </svg>
    ),
  },
  {
    name: 'AMD',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <rect x="4" y="4" width="92" height="92" rx="46" fill="#ED1C24" />
        <text x="50" y="58" textAnchor="middle" fill="white" fontSize="20" fontFamily="Arial" fontWeight="bold">AMD</text>
      </svg>
    ),
  },
  {
    name: 'NVIDIA',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <circle cx="50" cy="50" r="46" fill="#76B900" />
        <text x="50" y="56" textAnchor="middle" fill="white" fontSize="10" fontFamily="Arial" fontWeight="bold">nVIDIA</text>
      </svg>
    ),
  },
  {
    name: 'MSI',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <rect x="4" y="4" width="92" height="92" rx="8" fill="#FF0000" />
        <text x="50" y="58" textAnchor="middle" fill="white" fontSize="24" fontFamily="Arial" fontWeight="bold">MSI</text>
      </svg>
    ),
  },
  {
    name: 'ASUS',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <circle cx="50" cy="50" r="46" fill="#000000" />
        <text x="50" y="56" textAnchor="middle" fill="white" fontSize="14" fontFamily="Arial" fontWeight="bold">ASUS</text>
      </svg>
    ),
  },
  {
    name: 'GIGABYTE',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <rect x="4" y="4" width="92" height="92" rx="8" fill="#003399" />
        <text x="50" y="58" textAnchor="middle" fill="white" fontSize="9" fontFamily="Arial" fontWeight="bold">GIGABYTE</text>
      </svg>
    ),
  },
  {
    name: 'Kingston',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <rect x="4" y="4" width="92" height="92" rx="46" fill="#008080" />
        <text x="50" y="56" textAnchor="middle" fill="white" fontSize="10" fontFamily="Arial" fontWeight="bold">Kingston</text>
      </svg>
    ),
  },
  {
    name: 'Samsung',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <circle cx="50" cy="50" r="46" fill="#1428A0" />
        <text x="50" y="56" textAnchor="middle" fill="white" fontSize="11" fontFamily="Arial" fontWeight="bold">SAMSUNG</text>
      </svg>
    ),
  },
  {
    name: 'Western Digital',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <rect x="4" y="4" width="92" height="92" rx="8" fill="#005A8C" />
        <text x="50" y="56" textAnchor="middle" fill="white" fontSize="9" fontFamily="Arial" fontWeight="bold">WD</text>
      </svg>
    ),
  },
  {
    name: 'Seagate',
    svg: (
      <svg viewBox="0 0 100 100" className="w-16 h-16 md:w-20 md:h-20">
        <circle cx="50" cy="50" r="46" fill="#00A3E0" />
        <text x="50" y="56" textAnchor="middle" fill="white" fontSize="10" fontFamily="Arial" fontWeight="bold">Seagate</text>
      </svg>
    ),
  },
];

const BrandMarquee: FC<BrandMarqueeProps> = ({
  speed = 1.5,
  className,
  curveAmount = 200,
  direction = 'left',
  interactive = true,
}) => {
  const uid = useId();
  const pathId = `brand-curve-${uid}`;
  const pathD = `M-100,40 Q500,${40 + curveAmount} 1540,40`;

  const [spacing, setSpacing] = useState(0);
  const [offset, setOffset] = useState(0);
  const measureRef = useRef<SVGTextElement | null>(null);
  const textPathRef = useRef<SVGTextPathElement | null>(null);

  const dragRef = useRef(false);
  const lastXRef = useRef(0);
  const dirRef = useRef<'left' | 'right'>(direction);
  const velRef = useRef(0);

  /* ── Build the repeated string of icons ── */
  const iconStrings = useMemo(() => {
    // Each brand gets a unique unicode char that won't collapse.
    // We use surrogate-plane codepoints that have measurable width.
    return BRANDS.map((_, i) => String.fromCodePoint(0xE000 + i)).join('\u00A0\u00A0\u00A0\u00A0');
  }, []);

  const totalIconString = useMemo(() => {
    // Repeat enough for ~2000px
    return Array(Math.ceil(2500 / (BRANDS.length * 60)) + 2)
      .fill(iconStrings)
      .join('\u00A0');
  }, [iconStrings]);

  const ready = spacing > 0;

  useEffect(() => {
    if (measureRef.current) {
      setSpacing(measureRef.current.getComputedTextLength());
    }
  }, [iconStrings, className]);

  useEffect(() => {
    if (!spacing || !textPathRef.current) return;
    const initial = -spacing;
    textPathRef.current.setAttribute('startOffset', `${initial}px`);
    setOffset(initial);
  }, [spacing]);

  useEffect(() => {
    if (!spacing || !ready) return;
    let frame = 0;
    const step = () => {
      if (!dragRef.current && textPathRef.current) {
        const delta = dirRef.current === 'right' ? speed : -speed;
        const current = parseFloat(textPathRef.current.getAttribute('startOffset') || '0');
        let newOffset = current + delta;
        const wrap = spacing;
        if (newOffset <= -wrap) newOffset += wrap;
        if (newOffset > 0) newOffset -= wrap;
        textPathRef.current.setAttribute('startOffset', `${newOffset}px`);
        setOffset(newOffset);
      }
      frame = requestAnimationFrame(step);
    };
    frame = requestAnimationFrame(step);
    return () => cancelAnimationFrame(frame);
  }, [spacing, speed, ready]);

  const onPointerDown = (e: PointerEvent) => {
    if (!interactive) return;
    dragRef.current = true;
    lastXRef.current = e.clientX;
    velRef.current = 0;
    (e.target as HTMLElement).setPointerCapture(e.pointerId);
  };

  const onPointerMove = (e: PointerEvent) => {
    if (!interactive || !dragRef.current || !textPathRef.current) return;
    const dx = e.clientX - lastXRef.current;
    lastXRef.current = e.clientX;
    velRef.current = dx;
    const current = parseFloat(textPathRef.current.getAttribute('startOffset') || '0');
    let newOffset = current + dx;
    const wrap = spacing;
    if (newOffset <= -wrap) newOffset += wrap;
    if (newOffset > 0) newOffset -= wrap;
    textPathRef.current.setAttribute('startOffset', `${newOffset}px`);
    setOffset(newOffset);
  };

  const endDrag = () => {
    if (!interactive) return;
    dragRef.current = false;
    dirRef.current = velRef.current > 0 ? 'right' : 'left';
  };

  const cursorStyle = interactive ? (dragRef.current ? 'grabbing' : 'grab') : 'auto';

  /* ── SVG defs: each brand icon as a <symbol> ── */
  const brandSymbols = useMemo(() => {
    return BRANDS.map((brand, i) => (
      <symbol key={brand.name} id={`brand-${uid}-${i}`} viewBox="0 0 100 100">
        {brand.svg.props.children}
      </symbol>
    ));
  }, [uid]);

  return (
    <section className="w-full overflow-hidden bg-[#f8f9fb] py-12 md:py-16">
      <div className="max-w-[1400px] mx-auto px-5 mb-8">
        <div className="text-center">
          <span className="inline-flex items-center gap-1.5 text-[11px] font-bold uppercase tracking-[0.18em] text-[#1061cd] mb-2" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
            Бренды
          </span>
          <h2 className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121]" style={{ fontFamily: 'var(--font-display)' }}>
            Ведущие производители
          </h2>
        </div>
      </div>
      <div
        className="min-h-[180px] md:min-h-[220px] flex items-center justify-center w-full select-none"
        style={{ cursor: cursorStyle }}
        onPointerDown={onPointerDown}
        onPointerMove={onPointerMove}
        onPointerUp={endDrag}
        onPointerLeave={endDrag}
      >
        <svg
          className="w-full overflow-visible block"
          viewBox="0 0 1440 120"
          style={{ visibility: ready ? 'visible' : 'hidden' }}
        >
          <defs>
            <path id={pathId} d={pathD} fill="none" stroke="transparent" />
            {brandSymbols}
          </defs>

          {/* Hidden measure text */}
          <text ref={measureRef} style={{ visibility: 'hidden', opacity: 0, pointerEvents: 'none' }}>
            {iconStrings}
          </text>

          {ready && (
            <text xmlSpace="preserve" className={className ?? ''} fontSize="60" fill="#212121">
              <textPath ref={textPathRef} href={`#${pathId}`} startOffset={`${offset}px`} method="align" spacing="auto">
                {/* Render <use> elements along the path by repeating the iconStrings */}
                {totalIconString.split('').map((char, idx) => {
                  const code = char.charCodeAt(0) - 0xE000;
                  if (code >= 0 && code < BRANDS.length) {
                    return (
                      <tspan key={idx} dy="0">
                        <use href={`#brand-${uid}-${code}`} width="60" height="60" x="0" y="-30" />
                      </tspan>
                    );
                  }
                  // spacer character
                  return <tspan key={idx} dx="16" />;
                })}
              </textPath>
            </text>
          )}
        </svg>
      </div>
    </section>
  );
};

export default BrandMarquee;