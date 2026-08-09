'use client';

import React from 'react';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Autoplay } from 'swiper/modules';
import { motion } from 'framer-motion';
import 'swiper/css';


/* ─── Shared icons ─────────────────────────── */
function ArrowIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
      <path strokeLinecap="round" strokeLinejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
    </svg>
  );
}

/* ─── Animation presets ────────────────────── */
const customEase = [0.32, 0.72, 0, 1] as const;
const fadeUp = {
  hidden: { opacity: 0, y: 24, filter: 'blur(4px)' },
  visible: (i: number) => ({
    opacity: 1, y: 0, filter: 'blur(0px)',
    transition: { duration: 0.7, ease: customEase, delay: i * 0.08 },
  }),
};

/* ─── Reusable CTA buttons ─────────────────── */
interface CTAButtonProps {
  label: string;
  href: string;
  accentColor?: string;
}

function PrimaryCTA({ label, href, accentColor = '#1061cd' }: CTAButtonProps) {
  const isGold = accentColor === '#eb9911';
  const textColor = isGold ? '#000' : '#fff';
  const defaultBg = isGold ? accentColor : accentColor;
  const hoverBg = isGold ? '#c47c0e' : accentColor + 'cc';
  return (
    <div className="p-[3px] rounded-full" style={{ backgroundColor: `${accentColor}26` }}>
      <a
        href={href}
        className="group inline-flex items-center gap-3 rounded-full px-7 py-3.5 text-sm font-bold transition-all duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] active:scale-[0.98]"
        style={{ backgroundColor: defaultBg, color: textColor }}
        onMouseEnter={(e) => {
          (e.currentTarget as HTMLAnchorElement).style.backgroundColor = hoverBg;
        }}
        onMouseLeave={(e) => {
          (e.currentTarget as HTMLAnchorElement).style.backgroundColor = defaultBg;
        }}
      >
        {label}
        <span className="flex h-8 w-8 items-center justify-center rounded-full bg-black/20 transition-transform duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] group-hover:translate-x-0.5 group-hover:-translate-y-[1px] group-hover:scale-105">
          <ArrowIcon className="h-4 w-4" />
        </span>
      </a>
    </div>
  );
}

function SecondaryCTA({ label, href, accentColor = '#1061cd' }: CTAButtonProps) {
  return (
    <div className="p-[3px] rounded-full bg-transparent">
      <a
        href={href}
        className="inline-flex items-center rounded-full border bg-white px-7 py-3.5 text-sm font-bold text-[#212121] min-h-[60px] transition-all duration-700 ease-[cubic-bezier(0.32,0.72,0,1)] active:scale-[0.98]"
        style={{ borderColor: '#bfbfbf' }}
        onMouseEnter={(e) => {
          const el = e.currentTarget as HTMLAnchorElement;
          el.style.borderColor = accentColor;
          el.style.color = accentColor;
        }}
        onMouseLeave={(e) => {
          const el = e.currentTarget as HTMLAnchorElement;
          el.style.borderColor = '#bfbfbf';
          el.style.color = '#212121';
        }}
      >
        {label}
      </a>
    </div>
  );
}

/* ─── Benefit & CTA types ──────────────────── */
interface Benefit {
  label: string;
  value: string;
}

interface CTA {
  label: string;
  href: string;
  variant: 'primary' | 'secondary';
}

/* ─── Slide data ───────────────────────────── */
interface SlideData {
  key: string;
  headline: React.ReactNode;
  subhead: string;
  image: string;
  imageSide: 'left' | 'right';
  gradientDirection: 'l' | 'r';
  benefits: Benefit[];
  ctas: [CTA, CTA];
  accentColor?: string;
}

const slides: SlideData[] = [
  // ===== 1. Welcome =====
  {
    key: 'welcome',
    headline: <>Мы — торгово-сервисный центр <span className="text-[#1061cd]">Империя Электроники</span></>,
    subhead: 'Компьютерная техника, комплектующие, сборка ПК, ремонт и IT-услуги в Караколе.',
    image: '/hero-2.jpg',
    imageSide: 'right',
    gradientDirection: 'l',
    benefits: [
      { label: 'Гарантия', value: 'до 2 лет' },
      { label: 'Доставка', value: 'по Караколу' },
      { label: 'Сборка ПК', value: 'под ключ' },
    ],
    ctas: [
      { label: 'Смотреть каталог', href: '/catalog', variant: 'primary' },
      { label: 'Заказать', href: '/how-to-order', variant: 'secondary' },
    ],
  },
  // ===== 2. Безопасность / видеонаблюдение =====
  {
    key: 'security',
    headline: <>Безопасность <span className="text-[#1061cd]">под контролем</span></>,
    subhead: 'Установка систем видеонаблюдения для дома и бизнеса. Профессиональный монтаж в день обращения.',
    image: '/hero-1.jpg',
    imageSide: 'right',
    gradientDirection: 'l',
    benefits: [
      { label: 'Камеры', value: 'до 4K' },
      { label: 'Монтаж', value: 'в день заказа' },
      { label: 'Гарантия', value: '2 года' },
    ],
    ctas: [
      { label: 'Каталог IP-камер', href: '/catalog/videonablyudenie', variant: 'primary' },
      { label: 'Услуги монтажа', href: '/catalog/uslugi', variant: 'secondary' },
    ],
  },
  // ===== 3. Сборка ПК =====
  {
    key: 'pc-build',
    headline: <>Соберём компьютер <span className="text-[#1061cd]">вашей мечты</span></>,
    subhead: 'Бесплатная сборка при заказе от 50 000 сом. Профессиональная настройка и тестирование.',
    image: '/hero-3.jpg',
    imageSide: 'left',
    gradientDirection: 'r',
    benefits: [
      { label: 'Сборка', value: 'бесплатно' },
      { label: 'Готовность', value: 'от 1 дня' },
      { label: 'Тестирование', value: '24 часа' },
    ],
    ctas: [
      { label: 'Конфигуратор ПК', href: '/catalog/kompyutery', variant: 'primary' },
      { label: 'Аксессуары', href: '/catalog/accessories', variant: 'secondary' },
    ],
  },
  // ===== 4. Периферия =====
  {
    key: 'peripherals',
    headline: <>Всё для <span className="text-[#1061cd]">комфортной работы</span></>,
    subhead: 'Мониторы, клавиатуры, мыши и аксессуары от ведущих брендов мира. То, что делает работу приятной.',
    image: '/hero-4.jpg',
    imageSide: 'left',
    gradientDirection: 'r',
    benefits: [
      { label: 'Бренды', value: 'Logitech, Xiaomi' },
      { label: 'Механика', value: 'Cherry MX' },
      { label: 'Доставка', value: '1–2 дня' },
    ],
    ctas: [
      { label: 'Мониторы', href: '/catalog/monitors', variant: 'primary' },
      { label: 'Клавиатуры и мыши', href: '/catalog/peripherals', variant: 'secondary' },
    ],
  },
  // ===== 5. Оргтехника / принтеры =====
  {
    key: 'printers',
    headline: <>Печатай, сканируй, <span className="text-[#1061cd]">работай</span></>,
    subhead: 'Принтеры, МФУ и расходные материалы. Настроим, подключим, заправим картридж — вам останется только печатать.',
    image: 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=1200&h=800&fit=crop',
    imageSide: 'right',
    gradientDirection: 'l',
    benefits: [
      { label: 'Принтеры', value: 'HP, Canon, Kyocera' },
      { label: 'Заправка', value: 'картриджей' },
      { label: 'Ремонт', value: 'на месте' },
    ],
    ctas: [
      { label: 'Каталог принтеров', href: '/catalog/mfu-i-printery', variant: 'primary' },
      { label: 'Расходники', href: '/catalog/accessories', variant: 'secondary' },
    ],
  },
];

/* ─── Single slide component ───────────────── */
function HeroSlide({ slide, active }: { slide: SlideData; active: boolean }) {
  const isLeft = slide.imageSide === 'right';
  const isWelcome = slide.key === 'welcome';

  return (
    <section className={`relative w-full overflow-hidden ${
      isWelcome ? 'h-[85vh] md:h-[88vh]' : 'h-[80vh]'
    } flex items-stretch`}>
      {/* ── Фоновое изображение (full-bleed) ── */}
      <div className="absolute inset-0 z-0">
        <motion.div
          // Ken Burns: медленный zoom для глубины
          initial={false}
          animate={active ? { scale: 1.08 } : { scale: 1 }}
          transition={{ duration: 40, ease: 'easeOut' }}
          className="absolute inset-0 h-full w-full"
        >
          <img
            src={slide.image}
            alt=""
            aria-hidden
            fetchPriority={isWelcome ? 'high' : 'auto'}
            loading="eager"
            className="absolute inset-0 h-full w-full object-cover object-center"
            onLoad={(e) => {
              const img = e.currentTarget;
              img.style.opacity = '0.99';
            }}
            style={{ pointerEvents: 'none' }}
          />
        </motion.div>
      </div>

      {/* ── Подложка на весь слайд: тёмная, изображение просвечивает ── */}
      <div
        className="absolute inset-0 z-10"
        style={{
          background: 'linear-gradient(to right, rgba(8,12,20,0.9) 0%, rgba(8,12,20,0.82) 45%, rgba(8,12,20,0.68) 100%)',
          backdropFilter: 'blur(6px)',
          WebkitBackdropFilter: 'blur(6px)',
        }}
      />

      {/* ── Контент поверх подложки ── */}
      <div className="relative z-20 w-full max-w-[1400px] mx-auto px-5 md:px-10">
        <div className={`flex flex-col justify-center h-full w-full ${
          isWelcome ? 'lg:max-w-2xl' : 'lg:w-[58%]'
        } ${isLeft ? 'lg:pr-16' : 'lg:ml-auto lg:pl-16'}`}>
        {active && (
          <>
            <motion.h1
              custom={0}
              variants={fadeUp}
              initial="hidden"
              animate="visible"
              className="font-sans text-3xl md:text-4xl lg:text-5xl font-extrabold leading-[1.15] max-w-xl text-white"
            >
              {slide.headline}
            </motion.h1>
            <motion.p
              custom={1}
              variants={fadeUp}
              initial="hidden"
              animate="visible"
              className="mt-5 max-w-md text-base md:text-lg leading-relaxed text-white/90"
            >
              {slide.subhead}
            </motion.p>
            <motion.div
              custom={2}
              variants={fadeUp}
              initial="hidden"
              animate="visible"
              className="mt-8 flex flex-wrap gap-4"
            >
              {slide.ctas.map((cta, i) =>
                cta.variant === 'primary'
                  ? <PrimaryCTA key={i} label={cta.label} href={cta.href} accentColor={slide.accentColor} />
                  : <SecondaryCTA key={i} label={cta.label} href={cta.href} accentColor={slide.accentColor} />
              )}
            </motion.div>
            <motion.div
              custom={3}
              variants={fadeUp}
              initial="hidden"
              animate="visible"
              className="mt-6 md:mt-10 flex gap-8 pt-4 md:pt-6 border-t border-white/15"
            >
              {slide.benefits.map((b) => (
                <div key={b.value} className="flex flex-col">
                  <span className="text-xs font-semibold uppercase tracking-wide text-white/60">{b.label}</span>
                  <span className="mt-1 text-sm font-bold text-white">{b.value}</span>
                </div>
              ))}
            </motion.div>
          </>
        )}
        </div>
      </div>
    </section>
  );
}

/* ─── Main export ──────────────────────────── */
export default function HeroSlider() {
  return (
    <Swiper
      modules={[Autoplay]}
      spaceBetween={0}
      slidesPerView={1}
      loop
      autoplay={{ delay: 5000, pauseOnMouseEnter: true, disableOnInteraction: false }}
      className="relative w-full"
    >
      {slides.map((slide) => (
        <SwiperSlide key={slide.key}>
          {({ isActive }) => <HeroSlide slide={slide} active={isActive} />}
        </SwiperSlide>
      ))}

    </Swiper>
  );
}