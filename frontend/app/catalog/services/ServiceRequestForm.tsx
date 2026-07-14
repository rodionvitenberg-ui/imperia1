'use client';

import React, { useState } from 'react';

export default function ServiceRequestForm() {
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [problem, setProblem] = useState('');
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // В реальном проекте здесь был бы API-запрос.
    // Пока просто показываем номер телефона для связи.
    setSubmitted(true);
  };

  if (submitted) {
    return (
      <section className="mt-16 p-8 rounded-[8px] bg-[#1061cd] text-white text-center">
        <h2 className="text-[20px] font-bold mb-3">Заявка принята!</h2>
        <p className="text-white/80 mb-4 max-w-md mx-auto">
          Мы свяжемся с вами в ближайшее время. Если хотите ускорить — позвоните нам:
        </p>
        <a
          href="tel:+996555953475"
          className="inline-flex items-center justify-center rounded-full bg-white px-6 py-3 text-sm font-bold text-[#1061cd] hover:bg-gray-100 transition-colors"
        >
          +996 555 95 34 75
        </a>
      </section>
    );
  }

  return (
    <section className="mt-16">
      <div className="border border-[#e5e7eb] rounded-[8px] p-6 md:p-8 bg-[#f8f9fb]">
        <h2
          className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-2"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Оставить заявку
        </h2>
        <p
          className="text-[14px] leading-[20px] text-gray-500 mb-6"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          Опишите проблему — мы перезвоним и подскажем решение
        </p>

        <form onSubmit={handleSubmit} className="max-w-lg space-y-4">
          <div>
            <label
              htmlFor="service-name"
              className="block text-[14px] font-bold text-[#212121] mb-1"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Ваше имя
            </label>
            <input
              id="service-name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
              placeholder="Иван"
              className="w-full px-4 py-2.5 rounded-[8px] border border-[#bfbfbf] text-[14px] text-[#212121] bg-white outline-none transition-colors focus:border-[#1061cd] focus:ring-2 focus:ring-[#1061cd]/20"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            />
          </div>

          <div>
            <label
              htmlFor="service-phone"
              className="block text-[14px] font-bold text-[#212121] mb-1"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Номер телефона
            </label>
            <input
              id="service-phone"
              type="tel"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              required
              placeholder="+996 XXX XXX XXX"
              className="w-full px-4 py-2.5 rounded-[8px] border border-[#bfbfbf] text-[14px] text-[#212121] bg-white outline-none transition-colors focus:border-[#1061cd] focus:ring-2 focus:ring-[#1061cd]/20"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            />
          </div>

          <div>
            <label
              htmlFor="service-problem"
              className="block text-[14px] font-bold text-[#212121] mb-1"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Описание проблемы
            </label>
            <textarea
              id="service-problem"
              value={problem}
              onChange={(e) => setProblem(e.target.value)}
              required
              rows={4}
              placeholder="Опишите, что случилось..."
              className="w-full px-4 py-2.5 rounded-[8px] border border-[#bfbfbf] text-[14px] text-[#212121] bg-white outline-none transition-colors focus:border-[#1061cd] focus:ring-2 focus:ring-[#1061cd]/20 resize-y"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            />
          </div>

          <div className="flex flex-col sm:flex-row gap-4 pt-2">
            <button
              type="submit"
              className="inline-flex items-center justify-center rounded-[20px] bg-[#1061cd] px-8 py-3 text-sm font-bold text-white hover:bg-[#0d4fa6] transition-colors"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Отправить заявку
            </button>
            <p
              className="text-[12px] leading-[16px] text-gray-400 self-center"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Нажимая кнопку, вы соглашаетесь с обработкой данных
            </p>
          </div>
        </form>
      </div>
    </section>
  );
}