'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

// ─── Mock-данные ───────────────────────────────────
const MOCK_BRANDS = [
  { name: 'Intel', slug: 'intel' },
  { name: 'AMD', slug: 'amd' },
  { name: 'NVIDIA', slug: 'nvidia' },
  { name: 'ASUS', slug: 'asus' },
  { name: 'MSI', slug: 'msi' },
  { name: 'GIGABYTE', slug: 'gigabyte' },
  { name: 'Samsung', slug: 'samsung' },
  { name: 'Kingston', slug: 'kingston' },
];

const MOCK_ATTRIBUTES = [
  {
    id: 1, name: 'Количество ядер', slug: 'cores', unit: 'шт', values: ['2', '4', '6', '8', '12', '16', '24'],
  },
  {
    id: 2, name: 'Частота', slug: 'frequency', unit: 'ГГц', values: ['2.0', '2.5', '3.0', '3.5', '4.0', '4.5', '5.0'],
  },
  {
    id: 3, name: 'Сокет', slug: 'socket', unit: '', values: ['LGA1700', 'LGA1200', 'AM5', 'AM4'],
  },
  {
    id: 4, name: 'TDP', slug: 'tdp', unit: 'Вт', values: ['65', '95', '105', '125', '170'],
  },
  {
    id: 5, name: 'Объем кэша L3', slug: 'l3-cache', unit: 'МБ', values: ['8', '16', '32', '64', '96'],
  },
];

interface FilterState {
  brands: string[];
  attributes: Record<string, string[]>;
  isNew: boolean;
  isFavorite: boolean;
}

// ─── Компоненты вариантов ──────────────────────────

/** Общий аккордеон-группа */
function AccordionSection({
  title, children, startOpen = true, variant = 1, count,
}: {
  title: string; children: React.ReactNode; startOpen?: boolean; variant?: number; count?: number;
}) {
  const [open, setOpen] = useState(startOpen);
  return (
    <div className={`
      ${variant === 1 ? 'border-t border-white/10' : ''}
      ${variant === 2 ? 'border-t border-[#e5d9cc]' : ''}
      ${variant === 3 ? 'border-t border-[#eef1f4]' : ''}
      py-3
    `}>
      <button
        onClick={() => setOpen(!open)}
        className="flex w-full items-center justify-between text-left"
        aria-expanded={open}
      >
        <span className={`
          ${variant === 1 ? 'text-sm font-medium text-white/80 tracking-wide' : ''}
          ${variant === 2 ? 'text-sm font-bold text-[#2c2420] tracking-wider uppercase' : ''}
          ${variant === 3 ? 'text-[13px] font-semibold text-[#5a6872] tracking-wider uppercase' : ''}
        `}>
          {title}
          {count !== undefined && (
            <span className={`
              ml-2 inline-flex items-center justify-center w-5 h-5 rounded-full text-[10px] font-bold
              ${variant === 1 ? 'bg-white/15 text-white/70' : ''}
              ${variant === 2 ? 'bg-[#2c2420]/10 text-[#2c2420]' : ''}
              ${variant === 3 ? 'bg-[#1061cd]/10 text-[#1061cd]' : ''}
            `}>{count}</span>
          )}
        </span>
        <svg
          className={`w-4 h-4 transition-transform duration-300 ${open ? '' : '-rotate-90'}
            ${variant === 1 ? 'text-white/40' : ''}
            ${variant === 2 ? 'text-[#2c2420]/40' : ''}
            ${variant === 3 ? 'text-[#8a9aa8]' : ''}
          `}
          fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}
        >
          <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
        </svg>
      </button>
      <AnimatePresence initial={false}>
        {open && (
          <motion.div
            key="content"
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.25, ease: [0.32, 0.72, 0, 1] }}
            className="overflow-hidden"
          >
            <div className={`
              ${variant === 1 ? 'mt-3 space-y-2' : ''}
              ${variant === 2 ? 'mt-4 space-y-2' : ''}
              ${variant === 3 ? 'mt-3 space-y-1.5' : ''}
            `}>
              {children}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

/** Чекбокс */
function FilterCheckbox({
  label, checked, onChange, variant,
}: {
  label: string; checked: boolean; onChange: () => void; variant: number;
}) {
  return (
    <label className="flex items-center cursor-pointer group">
      <div className={`
        ${variant === 1 ? 'relative' : ''}
        ${variant === 2 ? 'relative' : ''}
        ${variant === 3 ? 'relative' : ''}
      `}>
        <input type="checkbox" className="sr-only" checked={checked} onChange={onChange} />
        {/* Custom checkbox */}
        <div className={`
          flex items-center justify-center transition-all duration-200
          ${variant === 1 ? 'w-4 h-4 rounded border border-white/20 group-hover:border-white/40 bg-white/5' : ''}
          ${variant === 1 && checked ? 'bg-[#1061cd] border-[#1061cd]' : ''}
          ${variant === 2 ? 'w-4 h-4 rounded-sm border-2 border-[#2c2420]/20 group-hover:border-[#2c2420]/40' : ''}
          ${variant === 2 && checked ? 'bg-[#2c2420] border-[#2c2420]' : ''}
          ${variant === 3 ? 'w-4 h-4 rounded border border-[#c8d2db] group-hover:border-[#1061cd] bg-white' : ''}
          ${variant === 3 && checked ? 'bg-[#1061cd] border-[#1061cd]' : ''}
        `}>
          {checked && (
            <svg className="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">
              <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
            </svg>
          )}
        </div>
      </div>
      <span className={`
        ml-3
        ${variant === 1 ? 'text-sm text-white/80' : ''}
        ${variant === 2 ? 'text-sm text-[#2c2420]/80' : ''}
        ${variant === 3 ? 'text-sm text-[#3a4a58]' : ''}
      `}>{label}</span>
    </label>
  );
}

// ─── VARIANT 1: Ethereal Glass Bottom Sheet ────────
function Variant1({ filters, setFilters, onClose }: {
  filters: FilterState; setFilters: (f: FilterState) => void; onClose: () => void;
}) {
  const update = (partial: Partial<FilterState>) => setFilters({ ...filters, ...partial });

  const toggleBrand = (slug: string) => {
    const next = filters.brands.includes(slug)
      ? filters.brands.filter(b => b !== slug)
      : [...filters.brands, slug];
    update({ brands: next });
  };

  const toggleAttr = (slug: string, value: string) => {
    const current = filters.attributes[slug] || [];
    const next = current.includes(value)
      ? current.filter(v => v !== value)
      : [...current, value];
    const nextAttrs = { ...filters.attributes };
    if (next.length) nextAttrs[slug] = next; else delete nextAttrs[slug];
    update({ attributes: nextAttrs });
  };

  const activeCount = filters.brands.length + Object.values(filters.attributes).flat().length + (filters.isNew ? 1 : 0) + (filters.isFavorite ? 1 : 0);

  return (
    <div className="fixed inset-0 z-50 flex items-end">
      <motion.div
        initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
        className="absolute inset-0 bg-black/60"
        onClick={onClose}
      />
      <motion.div
        initial={{ y: '100%' }} animate={{ y: 0 }} exit={{ y: '100%' }}
        transition={{ type: 'spring', damping: 30, stiffness: 300 }}
        className="relative w-full max-h-[85vh] rounded-t-[2rem] bg-[#0a0a0f] overflow-hidden"
        style={{ boxShadow: '0 -20px 60px rgba(0,0,0,0.6)' }}
      >
        {/* Double-bezel handle */}
        <div className="p-2">
          <div className="rounded-t-[calc(2rem-0.5rem)] bg-[#12121a]">
            {/* Drag handle */}
            <div className="flex justify-center pt-3 pb-1">
              <div className="w-10 h-1 rounded-full bg-white/15" />
            </div>

            {/* Header */}
            <div className="px-5 pb-2 flex items-center justify-between">
              <h2 className="text-lg font-medium text-white/90">Filters</h2>
              <div className="flex items-center gap-3">
                {activeCount > 0 && (
                  <span className="text-xs text-white/40 bg-white/10 px-2.5 py-1 rounded-full">{activeCount} active</span>
                )}
                <button onClick={onClose} className="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center text-white/60 hover:bg-white/20 transition-colors">
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
            </div>

            {/* Scrollable content */}
            <div className="overflow-y-auto max-h-[55vh] px-5 pb-2 space-y-0 scrollbar-thin">
              <AccordionSection title="Features" variant={1} startOpen>
                <FilterCheckbox variant={1} label="New" checked={filters.isNew} onChange={() => update({ isNew: !filters.isNew })} />
                <FilterCheckbox variant={1} label="Popular" checked={filters.isFavorite} onChange={() => update({ isFavorite: !filters.isFavorite })} />
              </AccordionSection>

              <AccordionSection title="Brand" variant={1} startOpen count={filters.brands.length}>
                <div className="max-h-40 overflow-y-auto space-y-1.5 scrollbar-thin">
                  {MOCK_BRANDS.map(b => (
                    <FilterCheckbox key={b.slug} variant={1} label={b.name} checked={filters.brands.includes(b.slug)} onChange={() => toggleBrand(b.slug)} />
                  ))}
                </div>
              </AccordionSection>

              {MOCK_ATTRIBUTES.map(attr => (
                <AccordionSection key={attr.id} title={`${attr.name}${attr.unit ? `, ${attr.unit}` : ''}`} variant={1} count={(filters.attributes[attr.slug] || []).length}>
                  <div className="max-h-36 overflow-y-auto space-y-1.5 scrollbar-thin">
                    {attr.values.map(v => (
                      <FilterCheckbox key={v} variant={1} label={v} checked={(filters.attributes[attr.slug] || []).includes(v)} onChange={() => toggleAttr(attr.slug, v)} />
                    ))}
                  </div>
                </AccordionSection>
              ))}
            </div>

            {/* Bottom action bar — button-in-button pattern */}
            <div className="px-5 py-4 border-t border-white/10">
              <button
                onClick={onClose}
                className="group relative w-full flex items-center justify-center gap-3 px-6 py-3 rounded-full bg-[#1061cd] text-white font-medium text-sm overflow-hidden transition-all active:scale-[0.98]"
              >
                <span>Show results</span>
                <span className="w-7 h-7 rounded-full bg-white/15 flex items-center justify-center group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform text-white/80">
                  <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M5 12h14m-6-6l6 6-6 6" />
                  </svg>
                </span>
              </button>
              <button onClick={() => setFilters({ brands: [], attributes: {}, isNew: false, isFavorite: false })}
                className="mt-2 w-full text-center text-xs text-white/30 hover:text-white/50 transition-colors">
                Clear all
              </button>
            </div>
          </div>
        </div>
      </motion.div>
    </div>
  );
}

// ─── VARIANT 2: Editorial Full-Screen Overlay ──────
function Variant2({ filters, setFilters, onClose }: {
  filters: FilterState; setFilters: (f: FilterState) => void; onClose: () => void;
}) {
  const update = (partial: Partial<FilterState>) => setFilters({ ...filters, ...partial });

  const toggleBrand = (slug: string) => {
    const next = filters.brands.includes(slug)
      ? filters.brands.filter(b => b !== slug)
      : [...filters.brands, slug];
    update({ brands: next });
  };

  const toggleAttr = (slug: string, value: string) => {
    const current = filters.attributes[slug] || [];
    const next = current.includes(value)
      ? current.filter(v => v !== value)
      : [...current, value];
    const nextAttrs = { ...filters.attributes };
    if (next.length) nextAttrs[slug] = next; else delete nextAttrs[slug];
    update({ attributes: nextAttrs });
  };

  const activeCount = filters.brands.length + Object.values(filters.attributes).flat().length + (filters.isNew ? 1 : 0) + (filters.isFavorite ? 1 : 0);

  return (
    <div className="fixed inset-0 z-50">
      <motion.div
        initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
        transition={{ duration: 0.3 }}
        className="absolute inset-0 bg-[#FDFBF7]"
      >
        {/* Decorative grain */}
        <div className="absolute inset-0 pointer-events-none opacity-[0.03]"
          style={{ backgroundImage: 'url("data:image/svg+xml,%3Csvg viewBox=\'0 0 256 256\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cfilter id=\'noise\'%3E%3CfeTurbulence type=\'fractalNoise\' baseFrequency=\'0.65\' numOctaves=\'3\' stitchTiles=\'stitch\'/%3E%3C/filter%3E%3Crect width=\'100%25\' height=\'100%25\' filter=\'url(%23noise)\'/%3E%3C/svg%3E")' }}
        />

        {/* Staggered entry wrapper */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, ease: [0.32, 0.72, 0, 1] }}
          className="relative h-full flex flex-col"
        >
          {/* Header — editorial style */}
          <div className="px-6 pt-12 pb-2 flex items-start justify-between">
            <div>
              <span className="text-[10px] font-bold uppercase tracking-[0.25em] text-[#2c2420]/40">Refine</span>
              <h2 className="text-[2rem] leading-tight font-[family-name:var(--font-display)] text-[#2c2420] mt-1">
                Filters
              </h2>
            </div>
            <button onClick={onClose} className="mt-2 w-10 h-10 rounded-full bg-[#2c2420]/5 flex items-center justify-center text-[#2c2420]/50 hover:bg-[#2c2420]/10 transition-all">
              <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          {/* Scrollable */}
          <div className="flex-1 overflow-y-auto px-6 pb-4 space-y-0">
            <AccordionSection title="Features" variant={2} startOpen>
              <FilterCheckbox variant={2} label="New" checked={filters.isNew} onChange={() => update({ isNew: !filters.isNew })} />
              <FilterCheckbox variant={2} label="Popular" checked={filters.isFavorite} onChange={() => update({ isFavorite: !filters.isFavorite })} />
            </AccordionSection>

            <AccordionSection title="Brand" variant={2} startOpen count={filters.brands.length}>
              <div className="max-h-40 overflow-y-auto space-y-1.5">
                {MOCK_BRANDS.map(b => (
                  <FilterCheckbox key={b.slug} variant={2} label={b.name} checked={filters.brands.includes(b.slug)} onChange={() => toggleBrand(b.slug)} />
                ))}
              </div>
            </AccordionSection>

            {MOCK_ATTRIBUTES.map(attr => (
              <AccordionSection key={attr.id} title={`${attr.name}${attr.unit ? `, ${attr.unit}` : ''}`} variant={2} count={(filters.attributes[attr.slug] || []).length}>
                <div className="max-h-36 overflow-y-auto space-y-1.5">
                  {attr.values.map(v => (
                    <FilterCheckbox key={v} variant={2} label={v} checked={(filters.attributes[attr.slug] || []).includes(v)} onChange={() => toggleAttr(attr.slug, v)} />
                  ))}
                </div>
              </AccordionSection>
            ))}
          </div>

          {/* Floating island bottom bar */}
          <div className="px-6 pb-8 pt-2">
            <div className="bg-[#2c2420] rounded-[2rem] px-6 py-4 flex items-center justify-between shadow-xl">
              <div>
                <span className="text-white/50 text-xs font-medium">{activeCount} filter{activeCount !== 1 ? 's' : ''} active</span>
              </div>
              <div className="flex gap-2">
                <button onClick={onClose}
                  className="px-6 py-2.5 rounded-full bg-white/10 text-white text-sm font-medium hover:bg-white/20 transition-colors">
                  Apply
                </button>
                <button onClick={() => setFilters({ brands: [], attributes: {}, isNew: false, isFavorite: false })}
                  className="px-4 py-2.5 rounded-full text-white/40 text-xs hover:text-white/60 transition-colors">
                  Reset
                </button>
              </div>
            </div>
          </div>
        </motion.div>
      </motion.div>
    </div>
  );
}

// ─── VARIANT 3: Soft Structural Floating Card ──────
function Variant3({ filters, setFilters, onClose }: {
  filters: FilterState; setFilters: (f: FilterState) => void; onClose: () => void;
}) {
  const update = (partial: Partial<FilterState>) => setFilters({ ...filters, ...partial });

  const toggleBrand = (slug: string) => {
    const next = filters.brands.includes(slug)
      ? filters.brands.filter(b => b !== slug)
      : [...filters.brands, slug];
    update({ brands: next });
  };

  const toggleAttr = (slug: string, value: string) => {
    const current = filters.attributes[slug] || [];
    const next = current.includes(value)
      ? current.filter(v => v !== value)
      : [...current, value];
    const nextAttrs = { ...filters.attributes };
    if (next.length) nextAttrs[slug] = next; else delete nextAttrs[slug];
    update({ attributes: nextAttrs });
  };

  const allActivePills: { label: string; onRemove: () => void }[] = [];
  if (filters.isNew) allActivePills.push({ label: 'New', onRemove: () => update({ isNew: false }) });
  if (filters.isFavorite) allActivePills.push({ label: 'Popular', onRemove: () => update({ isFavorite: false }) });
  filters.brands.forEach(b => {
    const name = MOCK_BRANDS.find(m => m.slug === b)?.name || b;
    allActivePills.push({ label: name, onRemove: () => toggleBrand(b) });
  });
  Object.entries(filters.attributes).forEach(([slug, values]) => {
    values.forEach(v => {
      allActivePills.push({ label: `${slug}: ${v}`, onRemove: () => toggleAttr(slug, v) });
    });
  });

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div
        initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
        className="absolute inset-0 bg-[#2a3a48]/30 backdrop-blur-sm"
        onClick={onClose}
      />
      <motion.div
        initial={{ opacity: 0, scale: 0.92, y: 20 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.92, y: 20 }}
        transition={{ type: 'spring', damping: 28, stiffness: 280 }}
        className="relative w-full max-w-sm bg-white rounded-[1.5rem] overflow-hidden"
        style={{ boxShadow: '0 25px 80px rgba(16,97,205,0.08), 0 8px 32px rgba(0,0,0,0.04)' }}
      >
        {/* Header */}
        <div className="px-5 pt-5 pb-2 flex items-center justify-between">
          <h2 className="text-base font-semibold text-[#1a2a38]">Filters</h2>
          <button onClick={onClose} className="w-8 h-8 rounded-full bg-[#f0f3f6] flex items-center justify-center text-[#6a7a88] hover:bg-[#e5e9ed] transition-colors">
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        {/* Active pills */}
        {allActivePills.length > 0 && (
          <div className="px-5 pb-1">
            <div className="flex flex-wrap gap-1.5">
              {allActivePills.map((pill, i) => (
                <span key={i} className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full bg-[#1061cd]/8 text-[#1061cd] text-[11px] font-medium">
                  {pill.label}
                  <button onClick={pill.onRemove} className="ml-0.5 hover:text-[#1061cd]/70">
                    <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                      <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </span>
              ))}
            </div>
          </div>
        )}

        {/* Scrollable */}
        <div className="overflow-y-auto max-h-[50vh] px-5 pb-2">
          <AccordionSection title="Features" variant={3} startOpen>
            <FilterCheckbox variant={3} label="New" checked={filters.isNew} onChange={() => update({ isNew: !filters.isNew })} />
            <FilterCheckbox variant={3} label="Popular" checked={filters.isFavorite} onChange={() => update({ isFavorite: !filters.isFavorite })} />
          </AccordionSection>

          <AccordionSection title="Brand" variant={3} startOpen count={filters.brands.length}>
            <div className="max-h-36 overflow-y-auto space-y-1.5">
              {MOCK_BRANDS.map(b => (
                <FilterCheckbox key={b.slug} variant={3} label={b.name} checked={filters.brands.includes(b.slug)} onChange={() => toggleBrand(b.slug)} />
              ))}
            </div>
          </AccordionSection>

          {MOCK_ATTRIBUTES.map(attr => (
            <AccordionSection key={attr.id} title={`${attr.name}${attr.unit ? `, ${attr.unit}` : ''}`} variant={3} count={(filters.attributes[attr.slug] || []).length}>
              <div className="max-h-32 overflow-y-auto space-y-1.5">
                {attr.values.map(v => (
                  <FilterCheckbox key={v} variant={3} label={v} checked={(filters.attributes[attr.slug] || []).includes(v)} onChange={() => toggleAttr(attr.slug, v)} />
                ))}
              </div>
            </AccordionSection>
          ))}
        </div>

        {/* Bottom — inline buttons */}
        <div className="px-5 py-4 flex gap-2 bg-[#f8fafb]">
          <button onClick={onClose}
            className="flex-1 py-2.5 rounded-full bg-[#1061cd] text-white text-sm font-medium hover:bg-[#1061cd]/90 transition-colors active:scale-[0.98]">
            Apply
          </button>
          <button onClick={() => setFilters({ brands: [], attributes: {}, isNew: false, isFavorite: false })}
            className="flex-1 py-2.5 rounded-full bg-white border border-[#dce2e8] text-[#5a6872] text-sm font-medium hover:bg-[#f0f3f6] transition-colors active:scale-[0.98]">
            Clear
          </button>
        </div>
      </motion.div>
    </div>
  );
}

// ─── MAIN EXPORT ───────────────────────────────────
export default function FilterPrototype() {
  // Read variant from URL
  const [variant, setVariant] = useState(1);
  const [open, setOpen] = useState(false);
  const [filters, setFilters] = useState<FilterState>({
    brands: ['intel', 'amd'], attributes: { cores: ['6', '8'] }, isNew: true, isFavorite: false,
  });

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const v = parseInt(params.get('variant') || '1', 10);
    if (v >= 1 && v <= 3) setVariant(v);
  }, []);

  useEffect(() => {
    const url = new URL(window.location.href);
    url.searchParams.set('variant', String(variant));
    window.history.replaceState({}, '', url.toString());
  }, [variant]);

  const switchVariant = (v: number) => {
    setVariant(v);
    setOpen(false);
  };

  // Display full filter state on screen
  const renderStateDisplay = () => (
    <div className="mt-8 p-4 rounded-[8px] bg-[#f8fafb] border border-[#e5e7eb]">
      <h4 className="text-xs font-bold uppercase tracking-wider text-[#5a6872] mb-2">Current Filter State</h4>
      <pre className="text-xs text-[#3a4a58] font-mono whitespace-pre-wrap">{JSON.stringify(filters, null, 2)}</pre>
    </div>
  );

  return (
    <div className="min-h-screen bg-white">
      {/* Hero section */}
      <div className="max-w-lg mx-auto px-4 pt-12 pb-4">
        <span className="text-[10px] font-bold uppercase tracking-[0.2em] text-[#1061cd]">Prototype</span>
        <h1 className="text-2xl font-bold text-[#212121] mt-1">Mobile Filter Windows</h1>
        <p className="text-sm text-[#5a6872] mt-1">3 variants — switch via bottom bar or URL <code className="text-[#1061cd] bg-[#1061cd]/8 px-1.5 py-0.5 rounded text-xs">?variant=1</code></p>

        {/* Product grid mock */}
        <div className="mt-6 grid grid-cols-2 gap-3">
          {['Intel Core i7-14700K', 'AMD Ryzen 7 7800X3D', 'Intel Core i5-14600K', 'AMD Ryzen 9 7950X'].map((name, i) => (
            <div key={i} className="rounded-[8px] border border-[#e5e7eb] p-3 bg-white">
              <div className="w-full aspect-square rounded-[4px] bg-[#f0f3f6] flex items-center justify-center text-[#8a9aa8] text-[10px] font-medium">IMG</div>
              <p className="text-xs text-[#212121] mt-2 font-medium leading-tight">{name}</p>
              <p className="text-sm font-bold text-[#1061cd] mt-1">${i % 2 === 0 ? '429' : '479'}</p>
            </div>
          ))}
        </div>

        {renderStateDisplay()}

        {/* Hint */}
        <p className="text-xs text-[#8a9aa8] mt-4 text-center">
          Current variant: <strong className="text-[#212121]">{variant}</strong> —{' '}
          {variant === 1 ? 'Ethereal Glass Bottom Sheet' : variant === 2 ? 'Editorial Full-Screen Overlay' : 'Soft Structural Floating Card'}
        </p>
      </div>

      {/* Open button */}
      <div className="max-w-lg mx-auto px-4 pb-24">
        <button
          onClick={() => setOpen(true)}
          className="w-full py-3 rounded-full bg-[#1061cd] text-white font-bold text-sm hover:bg-[#1061cd]/90 transition-colors active:scale-[0.98]"
        >
          Open Filters (Variant {variant})
        </button>
      </div>

      {/* Filter overlay */}
      <AnimatePresence>
        {open && (
          <>
            {variant === 1 && <Variant1 filters={filters} setFilters={setFilters} onClose={() => setOpen(false)} />}
            {variant === 2 && <Variant2 filters={filters} setFilters={setFilters} onClose={() => setOpen(false)} />}
            {variant === 3 && <Variant3 filters={filters} setFilters={setFilters} onClose={() => setOpen(false)} />}
          </>
        )}
      </AnimatePresence>

      {/* Variant switcher — floating bottom bar */}
      <div className="fixed bottom-4 left-1/2 -translate-x-1/2 z-40">
        <div className="bg-white/80 backdrop-blur-xl rounded-full px-3 py-2 shadow-lg border border-[#e5e7eb] flex items-center gap-2">
          {[1, 2, 3].map(v => (
            <button
              key={v}
              onClick={() => switchVariant(v)}
              className={`
                w-10 h-10 rounded-full flex items-center justify-center text-xs font-bold transition-all duration-300
                ${variant === v
                  ? 'bg-[#1061cd] text-white shadow-md scale-105'
                  : 'bg-[#f0f3f6] text-[#6a7a88] hover:bg-[#e5e9ed]'
                }
              `}
            >
              {v}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
}