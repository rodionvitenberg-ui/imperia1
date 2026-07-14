import React from 'react';

const benefits = [
  {
    icon: (
      <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z" />
      </svg>
    ),
    title: 'Гарантия до 2 лет',
    desc: 'Официальное сервисное обслуживание',
  },
  {
    icon: (
      <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12" />
      </svg>
    ),
    title: 'Бесплатная доставка',
    desc: 'При заказе от 10 000 сом',
  },
  {
    icon: (
      <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M11.42 15.17l-4.91-4.91 5.66-5.66 4.91 4.91-5.66 5.66z" />
        <path strokeLinecap="round" strokeLinejoin="round" d="M9.75 14.25l-1.5 1.5 3 3 1.5-1.5" />
        <path strokeLinecap="round" strokeLinejoin="round" d="M19.5 14.25l-1.5-1.5-2.25 2.25 1.5 1.5 2.25-2.25z" />
      </svg>
    ),
    title: 'Собственный сервис-центр',
    desc: 'Ремонт любой сложности',
  },
  {
    icon: (
      <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
      </svg>
    ),
    title: 'Опыт более 10 лет',
    desc: 'Тысячи довольных клиентов',
  },
];

export default function WhyUs() {
  return (
    <section className="bg-white border-y border-[#e5e7eb]">
      <div className="max-w-[1400px] mx-auto px-5">
        <div className="grid grid-cols-2 md:grid-cols-4 divide-y md:divide-y-0 md:divide-x divide-[#e5e7eb]">
          {benefits.map((item) => (
            <div
              key={item.title}
              className="flex items-center gap-4 py-6 md:py-8 px-4 md:px-6 transition-colors duration-200 hover:bg-[#f8f9fb]"
            >
              <div className="w-12 h-12 shrink-0 rounded-full bg-[#1061cd]/10 flex items-center justify-center text-[#1061cd]">
                {item.icon}
              </div>
              <div className="min-w-0">
                <span
                  className="block text-[13px] font-bold text-[#212121] leading-tight"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  {item.title}
                </span>
                <span
                  className="block text-[12px] text-gray-500 leading-tight mt-0.5"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  {item.desc}
                </span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}