'use client';

import React, { useState, useEffect, useCallback } from 'react';
import Link from 'next/link';

const STORAGE_KEY = 'cookie-consent';

type ConsentValue = 'accepted' | 'declined';

export default function CookieConsent() {
  const [visible, setVisible] = useState(false);
  const [exiting, setExiting] = useState(false);

  useEffect(() => {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (!stored) {
      const tid = setTimeout(() => setVisible(true), 600);
      return () => clearTimeout(tid);
    }
  }, []);

  const handleChoice = useCallback((value: ConsentValue) => {
    localStorage.setItem(STORAGE_KEY, value);
    setExiting(true);
    setTimeout(() => setVisible(false), 300);
  }, []);

  if (!visible) return null;

  return (
    <div
      className={`fixed bottom-0 left-0 right-0 z-50 flex justify-center pb-6 px-4 transition-all duration-300 ease-out ${
        exiting ? 'opacity-0 translate-y-4 pointer-events-none' : 'opacity-100 translate-y-0'
      }`}
      role="dialog"
      aria-labelledby="cookie-consent-title"
      aria-modal="false"
    >
      <div className="w-full max-w-2xl bg-white rounded-[8px] border border-[#e5e7eb] shadow-lg p-5">
        <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4">
          {/* Text */}
          <p
            id="cookie-consent-title"
            className="flex-1 text-[14px] leading-[20px] text-[#212121]"
            style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
          >
            Мы используем файлы cookie для улучшения работы сайта. Продолжая использовать сайт, вы
            соглашаетесь с{' '}
            <Link
              href="/privacy"
              className="text-[#1061cd] underline hover:text-[#0d4fa6] transition-colors"
            >
              Политикой конфиденциальности
            </Link>
            .
          </p>

          {/* Buttons */}
          <div className="flex items-center gap-3 shrink-0">
            <button
              type="button"
              onClick={() => handleChoice('declined')}
              className="rounded-[20px] border border-[#bfbfbf] bg-white px-5 py-2 text-[14px] font-bold text-[#212121] leading-[20px] hover:bg-gray-50 transition-colors"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Отказаться
            </button>
            <button
              type="button"
              onClick={() => handleChoice('accepted')}
              className="rounded-[20px] border-2 border-transparent bg-[#1061cd] px-5 py-2 text-[14px] font-bold text-white leading-[20px] hover:bg-[#0d4fa6] transition-colors"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Принять
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}