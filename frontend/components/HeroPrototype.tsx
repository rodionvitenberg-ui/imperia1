'use client';

import React, { useState, useEffect, useCallback } from 'react';
import { motion } from 'framer-motion';

/* ───────────────────────────────────────────
   PROTOTYPE: Hero Section — 3 variants
   Question: "What should this hero look like?"
   Switch via ?variant=A|B|C  + floating bar
   ─────────────────────────────────────────── */

// ─── Shared icons ───────────────────────────
function ArrowIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
      <path strokeLinecap="round" strokeLinejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
    </svg>
  );
}

function CheckIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
      <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
    </svg>
  );
}

const benefits = [
  { label: 'Гарантия', value: 'до 2 лет' },
  { label: 'Доставка', value: 'по городу бесплатно' },
  { label: 'Сборка ПК', value: 'в день заказа' },
];

// ─── Animation presets (soft-skill cubic-beziers) ───
const customEase = [0.32, 0.72, 0, 1] as const;

const fadeUp = {
  hidden: { opacity: 0, y: 24, filter: 'blur(4px)' },
  visible: (i: number) => ({
    opacity: 1,
    y: 0,
    filter: 'blur(0px)',
    transition: {
      duration: 0.7,
      ease: customEase,
      delay: i * 0.08,
    },
  }),
};

/* ═══════════════════════════════════════════
   VARIANT A — Friendly Split (upgraded)
   Soft-skill: double-bezel buttons, staggered
   reveal, generous whitespace, cubic-bezier
   ═══════════════════════════════════════════ */
function VariantA() {
  return (
    <section className="relative min-h-[60vh] md:min-h-[70vh] w-full overflow-hidden bg-[#f8f9fb] flex items-center">
      {/* Left: text */}
      <div className="relative z-20 w-full lg:w-1/2 px-6 md:px-12 lg:px-20 xl:px-24 py-16 md:py-24">
        {/* Eyebrow badge — soft-skill pill */}
        <motion.span
          custom={0} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="inline-block rounded-full bg-[#1061cd]/8 px-4 py-1.5 text-[11px] font-semibold uppercase tracking-[0.18em] text-[#1061cd]"
        >
          Добро пожаловать
        </motion.span>

        {/* Headline */}
        <motion.h1
          custom={1} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-6 font-sans text-3xl md:text-4xl lg:text-5xl font-extrabold leading-[1.15] text-[#212121] max-w-xl"
        >
          Техника, которая работает — <span className="text-[#1061cd]">для вас</span>
        </motion.h1>

        {/* Subhead */}
        <motion.p
          custom={2} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-5 max-w-md text-base md:text-lg leading-relaxed text-gray-500"
        >
          Мы не просто магазин. Мы — соседи. Поможем выбрать, соберём под ключ и будем на связи, если что-то пойдёт не так.
        </motion.p>

        {/* CTAs — soft-skill button-in-button + double-bezel */}
        <motion.div
          custom={3} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-8 flex flex-wrap gap-4"
        >
          {/* Primary: double-bezel outer shell */}
          <div className="p-[3px] rounded-full bg-[#1061cd]/15">
            <a
              href="/catalog"
              className="group inline-flex items-center gap-3 rounded-full bg-[#1061cd] px-7 py-3.5 text-sm font-bold text-white transition-all duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] hover:bg-[#0f54b3] active:scale-[0.98]"
            >
              Смотреть каталог
              {/* Nested icon circle — soft-skill button-in-button */}
              <span className="flex h-8 w-8 items-center justify-center rounded-full bg-black/20 transition-transform duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] group-hover:translate-x-0.5 group-hover:-translate-y-[1px] group-hover:scale-105">
                <ArrowIcon className="h-4 w-4" />
              </span>
            </a>
          </div>

          {/* Secondary: outlined double-bezel */}
          <div className="p-[2px] rounded-full bg-[#bfbfbf]/30">
            <a
              href="/how-to-order"
              className="inline-flex items-center rounded-full border border-[#bfbfbf] bg-white px-7 py-3.5 text-sm font-bold text-[#212121] transition-all duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] hover:border-[#1061cd] hover:text-[#1061cd] active:scale-[0.98]"
            >
              Как заказать
            </a>
          </div>
        </motion.div>

        {/* Benefits row */}
        <motion.div
          custom={4} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-10 flex gap-8 border-t border-gray-100 pt-6"
        >
          {benefits.map((b) => (
            <div key={b.value} className="flex flex-col">
              <span className="text-xs font-semibold uppercase tracking-wide text-gray-400">{b.label}</span>
              <span className="mt-1 text-sm font-bold text-[#212121]">{b.value}</span>
            </div>
          ))}
        </motion.div>
      </div>

      {/* Right: background image (desktop) */}
      <div className="hidden lg:block lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2">
        <div
          className="h-full w-full bg-cover bg-center"
          style={{ backgroundImage: "url('/hero-1.jpg')" }}
        />
        <div className="absolute inset-0 bg-gradient-to-l from-transparent via-[#f8f9fb]/30 to-[#f8f9fb]" />
      </div>

      {/* Mobile: faint bg */}
      <div className="absolute inset-0 z-0 lg:hidden">
        <div
          className="h-full w-full bg-cover bg-center opacity-10"
          style={{ backgroundImage: "url('/hero-1.jpg')" }}
        />
      </div>
    </section>
  );
}

/* ═══════════════════════════════════════════
   VARIANT B — Poster Bold
   poster-hero inspiration: gradient mesh bg,
   massive typography, decorative SVG geometry,
   high contrast, compact but high-impact
   ═══════════════════════════════════════════ */
function VariantB() {
  return (
    <section className="relative min-h-[65vh] md:min-h-[75vh] w-full overflow-hidden bg-[#0a0a14] flex items-center">
      {/* Decorative SVG elements — poster-hero style */}
      <svg className="absolute inset-0 w-full h-full pointer-events-none z-0" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <radialGradient id="glow1" cx="20%" cy="30%" r="60%">
            <stop offset="0%" stopColor="#1061cd" stopOpacity="0.35" />
            <stop offset="100%" stopColor="transparent" />
          </radialGradient>
          <radialGradient id="glow2" cx="80%" cy="70%" r="50%">
            <stop offset="0%" stopColor="#8b5cf6" stopOpacity="0.2" />
            <stop offset="100%" stopColor="transparent" />
          </radialGradient>
          <radialGradient id="glow3" cx="50%" cy="20%" r="40%">
            <stop offset="0%" stopColor="#06b6d4" stopOpacity="0.12" />
            <stop offset="100%" stopColor="transparent" />
          </radialGradient>
        </defs>
        <rect width="100%" height="100%" fill="url(#glow1)" />
        <rect width="100%" height="100%" fill="url(#glow2)" />
        <rect width="100%" height="100%" fill="url(#glow3)" />
        {/* Abstract geometric shapes — poster-hero decorative */}
        <circle cx="85%" cy="25%" r="12" fill="none" stroke="rgba(255,255,255,0.08)" strokeWidth="2" />
        <circle cx="82%" cy="28%" r="28" fill="none" stroke="rgba(255,255,255,0.04)" strokeWidth="1.5" />
        <circle cx="78%" cy="22%" r="44" fill="none" stroke="rgba(16,97,205,0.06)" strokeWidth="1" />
        {/* Triangle accent */}
        <polygon points="15%,80% 18%,72% 21%,80%" fill="none" stroke="rgba(139,92,246,0.3)" strokeWidth="1.5" />
        {/* Dots grid */}
        {Array.from({ length: 20 }).map((_, i) => (
          <circle key={i} cx={`${8 + (i % 10) * 10}%`} cy={`${60 + Math.floor(i / 10) * 12}%`} r="1.5" fill="rgba(255,255,255,0.06)" />
        ))}
      </svg>

      {/* Noise/grain overlay — poster-hero texture */}
      <div className="absolute inset-0 pointer-events-none z-[1] opacity-[0.025]"
        style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.7' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E")`,
          backgroundSize: '256px 256px',
        }}
      />

      <div className="relative z-20 w-full max-w-6xl mx-auto px-6 md:px-12 lg:px-20 py-16 md:py-28">
        {/* Eyebrow — poster-hero compact badge */}
        <motion.span
          custom={0} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="inline-block rounded-full border border-white/15 bg-white/5 backdrop-blur-sm px-4 py-1.5 text-[10px] font-bold uppercase tracking-[0.22em] text-[#8bb4f8]"
        >
          Добро пожаловать в Империю
        </motion.span>

        {/* Massive headline — poster-hero text-6xl/7xl */}
        <motion.h1
          custom={1} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-6 font-sans text-4xl md:text-6xl lg:text-7xl font-black leading-[1.05] text-white max-w-3xl"
        >
          Техника, которая <span className="text-[#60a5fa]">работает</span>
          <br />
          <span className="text-white/80">для вас</span>
        </motion.h1>

        {/* Subhead — tight + high contrast */}
        <motion.p
          custom={2} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-6 max-w-lg text-base md:text-lg leading-relaxed text-white/50"
        >
          Не просто магазин — ваш сосед в мире электроники. Подберём, соберём, доставим.
        </motion.p>

        {/* CTAs — poster-hero bold + button-in-button */}
        <motion.div
          custom={3} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-10 flex flex-wrap gap-4"
        >
          <a
            href="/catalog"
            className="group inline-flex items-center gap-3 rounded-full bg-[#1061cd] px-8 py-4 text-sm font-bold text-white transition-all duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] hover:bg-[#1d6fe0] hover:shadow-[0_0_40px_rgba(16,97,205,0.4)] active:scale-[0.98]"
          >
            Смотреть каталог
            <span className="flex h-8 w-8 items-center justify-center rounded-full bg-white/15 transition-transform duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] group-hover:translate-x-1 group-hover:-translate-y-[1px] group-hover:scale-110">
              <ArrowIcon className="h-4 w-4" />
            </span>
          </a>
          <a
            href="/how-to-order"
            className="inline-flex items-center rounded-full border border-white/20 bg-white/5 backdrop-blur-sm px-8 py-4 text-sm font-bold text-white/80 transition-all duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] hover:border-white/40 hover:bg-white/10 hover:text-white active:scale-[0.98]"
          >
            Как заказать
          </a>
        </motion.div>

        {/* Benefits — poster-hero icon row */}
        <motion.div
          custom={4} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
          className="mt-12 flex flex-wrap gap-8"
        >
          {benefits.map((b) => (
            <div key={b.value} className="flex items-center gap-3">
              <span className="flex h-8 w-8 items-center justify-center rounded-full bg-white/8">
                <CheckIcon className="h-4 w-4 text-[#60a5fa]" />
              </span>
              <div className="flex flex-col">
                <span className="text-[10px] font-bold uppercase tracking-[0.15em] text-white/30">{b.label}</span>
                <span className="text-sm font-semibold text-white/80">{b.value}</span>
              </div>
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}

/* ═══════════════════════════════════════════
   VARIANT C — Soft Structural Premium
   soft-skill: Editorial Luxury vibe with
   Soft Structuralism. Double-bezel card,
   massive whitespace, ultra-soft shadows,
   grain texture, editorial typography
   ═══════════════════════════════════════════ */
function VariantC() {
  return (
    <section className="relative min-h-[80vh] md:min-h-[90vh] w-full overflow-hidden bg-[#FDFBF7] flex items-center">
      {/* Grain overlay — soft-skill texture */}
      <div className="absolute inset-0 pointer-events-none z-0 opacity-[0.025]"
        style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.6' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E")`,
          backgroundSize: '256px 256px',
        }}
      />

      {/* Subtle radial ambient glow */}
      <div className="absolute top-0 right-0 w-[600px] h-[600px] rounded-full bg-[#1061cd]/[0.03] blur-3xl pointer-events-none z-0" />
      <div className="absolute bottom-0 left-1/4 w-[400px] h-[400px] rounded-full bg-[#8b5cf6]/[0.02] blur-3xl pointer-events-none z-0" />

      <div className="relative z-10 w-full max-w-5xl mx-auto px-6 md:px-12 lg:px-20 py-20 md:py-32 lg:py-40">
        <div className="flex flex-col lg:flex-row lg:items-center lg:gap-20">
          {/* Left: typography block — editorial massive */}
          <div className="flex-1 max-w-xl">
            {/* Eyebrow — soft-skill editorial pill */}
            <motion.span
              custom={0} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
              className="inline-block rounded-full border border-[#2c2420]/10 bg-[#2c2420]/3 px-4 py-1.5 text-[10px] font-bold uppercase tracking-[0.22em] text-[#2c2420]/50"
            >
              Добро пожаловать
            </motion.span>

            {/* Headline — soft-skill editorial massive */}
            <motion.h1
              custom={1} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
              className="mt-6 font-sans text-4xl md:text-5xl lg:text-6xl font-extrabold leading-[1.08] text-[#2c2420]"
            >
              Техника,
              <br />
              которая работает
              <br />
              <span className="text-[#1061cd]">для вас</span>
            </motion.h1>

            {/* Subhead — editorial refined */}
            <motion.p
              custom={2} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
              className="mt-6 max-w-md text-base md:text-lg leading-relaxed text-[#2c2420]/55"
            >
              Мы не просто магазин. Мы — соседи. Поможем выбрать, соберём под ключ и будем на связи, если что-то пойдёт не так.
            </motion.p>

            {/* CTAs — soft-skill editorial link style */}
            <motion.div
              custom={3} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
              className="mt-8 flex flex-wrap items-center gap-6"
            >
              <a
                href="/catalog"
                className="group inline-flex items-center gap-3 text-base font-bold text-[#1061cd] transition-all duration-500 ease-[cubic-bezier(0.32,0.72,0,1)] hover:text-[#0f54b3]"
              >
                Смотреть каталог
                <span className="flex h-7 w-7 items-center justify-center rounded-full bg-[#1061cd]/10 transition-all duration-500 ease-[cubic-bezier(0.32,0.72,0,1)] group-hover:bg-[#1061cd]/20 group-hover:translate-x-1">
                  <ArrowIcon className="h-3.5 w-3.5" />
                </span>
              </a>
              <a
                href="/how-to-order"
                className="text-base font-medium text-[#2c2420]/50 underline underline-offset-4 decoration-[#2c2420]/15 transition-all duration-500 ease-[cubic-bezier(0.32,0.72,0,1)] hover:text-[#2c2420]/80 hover:decoration-[#2c2420]/40"
              >
                Как заказать
              </a>
            </motion.div>

            {/* Benefits — editorial row with icons */}
            <motion.div
              custom={4} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
              className="mt-10 flex flex-wrap gap-8"
            >
              {benefits.map((b) => (
                <div key={b.value} className="flex flex-col">
                  <span className="text-[10px] font-bold uppercase tracking-[0.18em] text-[#2c2420]/30">{b.label}</span>
                  <span className="mt-1 text-sm font-semibold text-[#2c2420]">{b.value}</span>
                </div>
              ))}
            </motion.div>
          </div>

          {/* Right: Double-bezel card — soft-skill architecture */}
          <motion.div
            custom={5} variants={fadeUp} initial="hidden" whileInView="visible" viewport={{ once: true }}
            className="mt-12 lg:mt-0 flex-1 flex justify-center"
          >
            {/* Outer shell — double-bezel */}
            <div className="p-2 rounded-[2.5rem] bg-[#2c2420]/4 shadow-[0_0_0_1px_rgba(44,36,32,0.06)]">
              {/* Inner core */}
              <div className="relative overflow-hidden rounded-[calc(2.5rem-0.5rem)] bg-white shadow-[inset_0_1px_1px_rgba(255,255,255,0.5),0_20px_60px_rgba(44,36,32,0.06)]">
                {/* Image placeholder — soft-skill editorial */}
                <div
                  className="w-full aspect-[4/3] bg-cover bg-center"
                  style={{ backgroundImage: "url('/hero-1.jpg')" }}
                />
                {/* Card content overlay */}
                <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-white via-white/80 to-transparent p-6 pt-12">
                  <p className="text-xs font-semibold uppercase tracking-[0.15em] text-[#1061cd]">Акция месяца</p>
                  <p className="mt-1 text-lg font-bold text-[#2c2420] leading-tight">
                    Сборка ПК — бесплатно при заказе от 50 000 ₽
                  </p>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  );
}

/* ═══════════════════════════════════════════
   PROTOTYPE SWITCHER — floating bottom bar
   ═══════════════════════════════════════════ */
const VARIANTS = [
  { key: 'A', label: 'Friendly Split', component: VariantA },
  { key: 'B', label: 'Poster Bold', component: VariantB },
  { key: 'C', label: 'Soft Structural', component: VariantC },
] as const;

function PrototypeSwitcher({
  current,
  onChange,
}: {
  current: string;
  onChange: (key: string) => void;
}) {
  // Production gate
  if (typeof process !== 'undefined' && process.env.NODE_ENV === 'production') {
    return null;
  }

  const idx = VARIANTS.findIndex((v) => v.key === current);
  const currentVariant = VARIANTS[idx] || VARIANTS[0];

  const goPrev = () => {
    const prev = (idx - 1 + VARIANTS.length) % VARIANTS.length;
    onChange(VARIANTS[prev].key);
  };
  const goNext = () => {
    const next = (idx + 1) % VARIANTS.length;
    onChange(VARIANTS[next].key);
  };

  return (
    <div className="fixed bottom-5 left-1/2 -translate-x-1/2 z-[100] select-none">
      <div className="flex items-center gap-1.5 rounded-full bg-white/85 backdrop-blur-xl px-2 py-2 shadow-[0_8px_32px_rgba(0,0,0,0.08),0_0_0_1px_rgba(0,0,0,0.04)]">
        {/* Left arrow */}
        <button
          onClick={goPrev}
          className="w-8 h-8 rounded-full bg-[#f0f3f6] flex items-center justify-center text-[#6a7a88] hover:bg-[#e5e9ed] hover:text-[#212121] transition-all duration-200"
          aria-label="Previous variant"
        >
          <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M15 19l-7-7 7-7" />
          </svg>
        </button>

        {/* Variant label */}
        <span className="px-3 text-xs font-bold text-[#212121] tracking-wide min-w-[120px] text-center select-none">
          {currentVariant.key} — {currentVariant.label}
        </span>

        {/* Right arrow */}
        <button
          onClick={goNext}
          className="w-8 h-8 rounded-full bg-[#f0f3f6] flex items-center justify-center text-[#6a7a88] hover:bg-[#e5e9ed] hover:text-[#212121] transition-all duration-200"
          aria-label="Next variant"
        >
          <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M9 5l7 7-7 7" />
          </svg>
        </button>
      </div>

      {/* Dot indicators */}
      <div className="flex justify-center gap-1.5 mt-2">
        {VARIANTS.map((v) => (
          <button
            key={v.key}
            onClick={() => onChange(v.key)}
            className={`w-2 h-2 rounded-full transition-all duration-300 ${
              v.key === current
                ? 'bg-[#1061cd] w-4'
                : 'bg-[#bfbfbf] hover:bg-[#8a9aa8]'
            }`}
            aria-label={`Switch to variant ${v.key}`}
          />
        ))}
      </div>
    </div>
  );
}

/* ═══════════════════════════════════════════
   MAIN EXPORT
   ═══════════════════════════════════════════ */
export default function HeroPrototype() {
  const [variant, setVariant] = useState('A');

  // Read variant from URL on mount
  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const v = (params.get('variant') || 'A').toUpperCase();
    if (VARIANTS.some((x) => x.key === v)) {
      setVariant(v);
    }
  }, []);

  // Sync variant to URL
  const changeVariant = useCallback((key: string) => {
    setVariant(key);
    const url = new URL(window.location.href);
    url.searchParams.set('variant', key);
    window.history.replaceState({}, '', url.toString());
  }, []);

  // Keyboard navigation
  useEffect(() => {
    const handleKey = (e: KeyboardEvent) => {
      // Don't intercept when input/textarea/contenteditable is focused
      const tag = (e.target as HTMLElement).tagName;
      const isEditable =
        tag === 'INPUT' || tag === 'TEXTAREA' || (e.target as HTMLElement).isContentEditable;
      if (isEditable) return;

      const idx = VARIANTS.findIndex((v) => v.key === variant);
      if (e.key === 'ArrowRight') {
        e.preventDefault();
        const next = (idx + 1) % VARIANTS.length;
        changeVariant(VARIANTS[next].key);
      } else if (e.key === 'ArrowLeft') {
        e.preventDefault();
        const prev = (idx - 1 + VARIANTS.length) % VARIANTS.length;
        changeVariant(VARIANTS[prev].key);
      }
    };
    window.addEventListener('keydown', handleKey);
    return () => window.removeEventListener('keydown', handleKey);
  }, [variant, changeVariant]);

  const CurrentComponent = VARIANTS.find((v) => v.key === variant)?.component || VariantA;

  return (
    <>
      <CurrentComponent />
      <PrototypeSwitcher current={variant} onChange={changeVariant} />
    </>
  );
}