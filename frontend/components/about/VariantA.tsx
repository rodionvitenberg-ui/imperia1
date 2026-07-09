'use client';

import React, { useRef } from 'react';
import { motion } from 'framer-motion';

/**
 * Variant A — "Cinematic Center"
 * Hero по центру, Bento Grid преимуществ, горизонтальный аккордеон истории,
 * массивный CTA в конце.
 */
export default function VariantA() {
  const containerRef = useRef<HTMLDivElement>(null);

  const fadeInUp = {
    hidden: { opacity: 0, y: 40 },
    visible: (i: number) => ({
      opacity: 1,
      y: 0,
      transition: { duration: 0.7, delay: i * 0.12, ease: [0.25, 0.46, 0.45, 0.94] as const },
    }),
  };

  const advantages = [
    {
      title: 'Качество гарантировано',
      desc: 'Работаем только с проверенными производителями и предоставляем официальную гарантию на всё оборудование.',
      accent: '#1061cd',
    },
    {
      title: 'Экспертная поддержка',
      desc: 'Специалисты помогут подобрать оптимальную конфигурацию под любые задачи и бюджет.',
      accent: '#10b981',
    },
    {
      title: 'Быстрая доставка',
      desc: 'Оперативная обработка заказов и доставка в кратчайшие сроки по Иссык-Кульской области.',
      accent: '#8b5cf6',
    },
    {
      title: 'Конкурентные цены',
      desc: 'Лучшие цены в Караколе благодаря прямым контрактам с производителями.',
      accent: '#f59e0b',
    },
  ];

  return (
    <main ref={containerRef} className="overflow-x-hidden w-full max-w-full">
      {/* ========== ATTENTION: Cinematic Hero ========== */}
      <section className="relative py-24 md:py-36 lg:py-48">
        {/* Ambient radial gradient */}
        <div
          className="absolute inset-0 pointer-events-none"
          style={{
            background:
              'radial-gradient(ellipse 60% 50% at 50% 40%, rgba(16,97,205,0.07) 0%, transparent 70%)',
          }}
        />
        <div className="relative container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <motion.h1
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.8, ease: [0.25, 0.46, 0.45, 0.94] as const }}
              className="text-4xl sm:text-5xl lg:text-6xl font-bold text-[#212121] leading-[1.15] tracking-tight"
            >
              О компании
            </motion.h1>
            <motion.p
              initial={{ opacity: 0, y: 24 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.7, delay: 0.2, ease: [0.25, 0.46, 0.45, 0.94] as const }}
              className="mt-6 text-lg sm:text-xl text-[#4b5563] leading-relaxed max-w-2xl mx-auto"
            >
              Добро пожаловать в «Империю Электроники» — ваш надёжный партнёр
              в мире современных технологий и компьютерного оборудования.
            </motion.p>
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.6, delay: 0.4 }}
              className="mt-10 flex flex-col sm:flex-row items-center justify-center gap-4"
            >
              <a
                href="/catalog"
                className="inline-flex items-center justify-center min-w-[300px] px-8 py-3 bg-primary text-white text-[14px] font-bold rounded-[20px] border-2 border-transparent hover:opacity-90 transition-opacity"
              >
                Перейти в каталог
              </a>
              <a
                href="/contacts"
                className="inline-flex items-center justify-center min-w-[300px] px-8 py-3 bg-white text-[#212121] text-[14px] font-bold rounded-[20px] border border-[#bfbfbf] hover:border-[#212121] transition-colors"
              >
                Связаться с нами
              </a>
            </motion.div>
          </div>
        </div>
      </section>

      {/* ========== INTEREST: Bento Grid Advantages ========== */}
      <section className="py-24 md:py-36">
        <div className="container mx-auto px-6">
          <motion.h2
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: '-80px' }}
            variants={fadeInUp}
            custom={0}
            className="text-2xl md:text-3xl font-bold text-[#212121] mb-14 text-center"
          >
            Почему выбирают нас
          </motion.h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 grid-flow-dense max-w-5xl mx-auto">
            {advantages.map((item, i) => (
              <motion.div
                key={item.title}
                initial="hidden"
                whileInView="visible"
                viewport={{ once: true, margin: '-60px' }}
                variants={fadeInUp}
                custom={i + 1}
                className="group relative bg-white border border-[#e5e7eb] rounded-[8px] p-8 hover:border-[#bfbfbf] transition-colors duration-300"
              >
                {/* Accent bar */}
                <div
                  className="absolute top-0 left-0 right-0 h-1 rounded-t-[8px]"
                  style={{ backgroundColor: item.accent }}
                />
                <h3 className="text-xl font-semibold text-[#212121] mb-3 mt-2">
                  {item.title}
                </h3>
                <p className="text-[#4b5563] leading-relaxed">{item.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* ========== DESIRE: Horizontal Accordion — История & Миссия ========== */}
      <section className="py-24 md:py-36 bg-[#f9fafb]">
        <div className="container mx-auto px-6">
          <motion.h2
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: '-80px' }}
            variants={fadeInUp}
            custom={0}
            className="text-2xl md:text-3xl font-bold text-[#212121] mb-14 text-center"
          >
            Наш путь
          </motion.h2>

          <div className="max-w-5xl mx-auto flex flex-col md:flex-row gap-4">
            {/* Panel 1 — Миссия */}
            <AccordionPanel
              title="Наша миссия"
              defaultExpanded
              accent="#1061cd"
            >
              <p className="text-[#4b5563] leading-relaxed">
                Мы стремимся предоставить клиентам самое современное и качественное
                компьютерное оборудование по доступным ценам. Наша цель — сделать
                передовые технологии доступными в Кыргызстане для каждого: от
                студентов до крупных организаций.
              </p>
            </AccordionPanel>

            {/* Panel 2 — История */}
            <AccordionPanel title="История компании" accent="#10b981">
              <p className="text-[#4b5563] leading-relaxed">
                Компания «Империя Электроники» была основана с целью создания
                надёжного и профессионального сервиса в области продажи
                компьютерного оборудования. За годы работы мы завоевали доверие
                тысяч клиентов и стали одним из лидеров рынка в Иссык-Кульской
                области.
              </p>
            </AccordionPanel>

            {/* Panel 3 — Ценности */}
            <AccordionPanel title="Наши ценности" accent="#8b5cf6">
              <p className="text-[#4b5563] leading-relaxed">
                Честность, профессионализм и клиентоориентированность — три
                кита, на которых строится наша работа. Мы не просто продаём
                технику — мы помогаем людям и бизнесу расти с помощью технологий.
              </p>
            </AccordionPanel>
          </div>
        </div>
      </section>

      {/* ========== ACTION: CTA + Stats ========== */}
      <section className="py-24 md:py-36">
        <div className="container mx-auto px-6">
          <motion.div
            initial={{ opacity: 0, scale: 0.97 }}
            whileInView={{ opacity: 1, scale: 1 }}
            viewport={{ once: true, margin: '-80px' }}
            transition={{ duration: 0.7, ease: [0.25, 0.46, 0.45, 0.94] as const }}
            className="max-w-3xl mx-auto bg-[#1061cd] text-white rounded-[8px] p-10 md:p-14 text-center"
          >
            <h2 className="text-2xl md:text-3xl font-bold mb-4">
              Присоединяйтесь к нам!
            </h2>
            <p className="text-white/85 text-lg leading-relaxed mb-8 max-w-xl mx-auto">
              Откройте для себя мир передовых технологий вместе с нами.
              Подпишитесь на новости или посетите наш магазин в Караколе.
            </p>
            <a
              href="/contacts"
              className="inline-flex items-center justify-center min-w-[300px] px-8 py-3 bg-white text-[#1061cd] text-[14px] font-bold rounded-[20px] border-2 border-transparent hover:bg-white/90 transition-colors"
            >
              Связаться с нами
            </a>
          </motion.div>
        </div>
      </section>
    </main>
  );
}

/* ── Horizontal Accordion Panel ── */
function AccordionPanel({
  title,
  children,
  accent,
  defaultExpanded = false,
}: {
  title: string;
  children: React.ReactNode;
  accent: string;
  defaultExpanded?: boolean;
}) {
  const [expanded, setExpanded] = React.useState(defaultExpanded);

  return (
    <div
      onClick={() => setExpanded(!expanded)}
      className="flex-1 cursor-pointer group"
    >
      <div
        className={`relative bg-white border border-[#e5e7eb] rounded-[8px] overflow-hidden transition-all duration-500 ease-out ${
          expanded ? 'md:flex-[3]' : 'md:flex-[1]'
        }`}
      >
        {/* Accent top bar */}
        <div className="h-1 w-full" style={{ backgroundColor: accent }} />
        <div className="p-6 md:p-8">
          <div className="flex items-center justify-between mb-3">
            <h3 className="text-lg font-semibold text-[#212121]">{title}</h3>
            <span
              className={`text-[#bfbfbf] text-xl transition-transform duration-300 ${
                expanded ? 'rotate-180' : ''
              }`}
            >
              ▾
            </span>
          </div>
          <motion.div
            initial={false}
            animate={{
              height: expanded ? 'auto' : 0,
              opacity: expanded ? 1 : 0,
            }}
            transition={{ duration: 0.4, ease: 'easeInOut' }}
            className="overflow-hidden"
          >
            <div className="pt-2">{children}</div>
          </motion.div>
        </div>
      </div>
    </div>
  );
}

export { VariantA };