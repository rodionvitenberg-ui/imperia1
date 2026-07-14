// src/app/not-found.tsx
import Link from 'next/link';

export const metadata = {
  title: 'Страница не найдена — Империя Электроники',
  description: 'Запрошенная страница не существует. Вернитесь на главную или в каталог товаров.',
};

export default function NotFound() {
  return (
    <div className="max-w-[1400px] mx-auto px-5 py-16 md:py-24">
      <div className="max-w-lg mx-auto text-center">
        {/* 404 number */}
        <p
          className="text-[72px] md:text-[96px] leading-[1] font-bold text-[#bfbfbf] mb-4 select-none"
          style={{ fontFamily: 'var(--font-display)' }}
          aria-hidden="true"
        >
          404
        </p>

        {/* Title */}
        <h1
          className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-4"
          style={{ fontFamily: 'var(--font-display)' }}
        >
          Страница не найдена
        </h1>

        {/* Description */}
        <p
          className="text-[14px] leading-[20px] text-gray-500 mb-10"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Запрошенная страница не существует или была перемещена.
          Воспользуйтесь поиском или перейдите в каталог товаров.
        </p>

        {/* Actions */}
        <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
          <Link
            href="/"
            className="inline-flex items-center justify-center rounded-[20px] border-2 border-transparent bg-[#1061cd] px-6 py-3 text-[14px] font-bold text-white leading-[20px] hover:bg-[#0d4fa6] transition-colors min-w-[200px]"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            На главную
          </Link>
          <Link
            href="/catalog"
            className="inline-flex items-center justify-center rounded-[20px] border border-[#bfbfbf] bg-white px-6 py-3 text-[14px] font-bold text-[#212121] leading-[20px] hover:bg-gray-50 transition-colors min-w-[200px]"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            В каталог
          </Link>
        </div>
      </div>
    </div>
  );
}