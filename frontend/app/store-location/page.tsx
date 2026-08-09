'use client';

import React, { useEffect, useRef } from 'react';
import Link from 'next/link';

declare global {
  interface Window {
    ymaps: any;
  }
}

const structuredData = {
  '@context': 'https://schema.org',
  '@type': 'LocalBusiness',
  name: 'Империя Электроники — магазин компьютерной техники в Караколе',
  description:
    'Продажа компьютеров, ноутбуков, комплектующих и периферии в Караколе. Сборка ПК, ремонт, гарантийное обслуживание.',
  url: 'https://imperia-electroniki.kg',
  telephone: ['+996555953475', '+996555953466'],
  email: 'imperiaelectroniki@gmail.com',
  address: {
    '@type': 'PostalAddress',
    streetAddress: 'ул. Гагарина, 28',
    addressLocality: 'Каракол',
    addressCountry: 'KG',
  },
  geo: {
    '@type': 'GeoCoordinates',
    latitude: '42.4908',
    longitude: '78.3933',
  },
  openingHoursSpecification: [
    {
      '@type': 'OpeningHoursSpecification',
      dayOfWeek: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      opens: '09:00',
      closes: '17:00',
    },
    {
      '@type': 'OpeningHoursSpecification',
      dayOfWeek: 'Saturday',
      opens: '09:00',
      closes: '12:00',
    },
  ],
  priceRange: '$$',
  image: '/store-front.jpg',
  sameAs: ['https://wa.me/996555953475', 'https://wa.me/996555953466'],
};

const API_KEY = 'd3859a87-54b0-43f0-8f55-16bc9b15192a';

export default function StoreLocationPage() {
  const mapRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const loadYandexMaps = () => {
      if (window.ymaps) {
        window.ymaps.ready(initMap);
        return;
      }

      const existingScript = document.querySelector(
        'script[src*="api-maps.yandex.ru"]'
      );
      if (existingScript) {
        existingScript.addEventListener('load', () => {
          if (window.ymaps) window.ymaps.ready(initMap);
        });
        return;
      }

      const script = document.createElement('script');
      script.src = `https://api-maps.yandex.ru/2.1/?apikey=${API_KEY}&lang=ru_RU`;
      script.onload = () => {
        if (window.ymaps) window.ymaps.ready(initMap);
        else showMapFallback();
      };
      script.onerror = () => showMapFallback();
      document.head.appendChild(script);
    };

    const showMapFallback = () => {
      if (!mapRef.current) return;
      mapRef.current.innerHTML = `
        <div class="w-full h-full bg-[#f8f9fb] flex flex-col items-center justify-center p-8">
          <svg class="w-16 h-16 text-[#bfbfbf] mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
          </svg>
          <h3 class="text-[16px] font-bold text-[#212121] mb-2">Наш адрес</h3>
          <p class="text-[14px] text-gray-500 text-center">г. Каракол, ул. Гагарина 28</p>
          <p class="text-[12px] text-red-500 mt-4">Карта временно недоступна</p>
        </div>
      `;
    };

    const initMap = () => {
      if (!mapRef.current) return;

      try {
        const map = new window.ymaps.Map(
          mapRef.current,
          {
            center: [42.493559, 78.400792],
            zoom: 15,
            controls: ['zoomControl', 'fullscreenControl', 'geolocationControl'],
          }
        );

        // Белая круглая подложка под логотип
        const circle = new window.ymaps.Placemark(
          [42.493559, 78.400792],
          {},
          {
            iconLayout: 'default#image',
            iconImageHref: 'data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="60" height="60"%3E%3Ccircle cx="30" cy="30" r="28" fill="white" stroke="%23e5e7eb" stroke-width="1.5" /%3E%3C/svg%3E',
            iconImageSize: [60, 60],
            iconImageOffset: [-30, -48],
            hideIconOnBalloonOpen: false,
            balloon: { enabled: false },
          }
        );

        // Кастомная иконка — логотип компании поверх круга
        const placemark = new window.ymaps.Placemark(
          [42.493559, 78.400792],
          {
            balloonContent: `
              <div style="padding: 12px; font-family: 'Open Sans', sans-serif;">
                <p style="margin:4px 0;font-size:13px;color:#555;"><strong>Империя Электроники</strong></p>
                <p style="margin:4px 0;font-size:13px;color:#555;"><strong>Адрес:</strong> г. Каракол, ул. Гагарина 28</p>
                <p style="margin:4px 0;font-size:13px;color:#555;"><strong>Телефон:</strong> +996 555 95 34 75</p>
                <p style="margin:4px 0;font-size:13px;color:#555;"><strong>Время:</strong> Пн–Пт 9:00–17:00, Сб 9:00–12:00</p>
              </div>
            `,
            hintContent: 'Империя Электроники',
          },
          {
            iconLayout: 'default#image',
            iconImageHref: '/logo.png',
            iconImageSize: [36, 36],
            iconImageOffset: [-18, -42],
            hideIconOnBalloonOpen: false,
          }
        );

        map.geoObjects.add(placemark);
        map.geoObjects.add(circle);
      } catch (error) {
        console.error('initMap error:', error);
        showMapFallback();
      }
    };

    loadYandexMaps();
  }, []);

  return (
    <div className="min-h-screen bg-[#f8f9fb]">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(structuredData) }}
      />

      {/* Header */}
      <div className="bg-white border-b border-[#e5e7eb]">
        <div className="max-w-[1400px] mx-auto px-5 py-8">
          <div className="max-w-4xl mx-auto">
            {/* Хлебные крошки */}
            <nav className="flex items-center gap-2 text-[14px] text-[#212121] mb-4">
              <Link href="/" className="hover:text-primary transition-colors">
                Главная
              </Link>
              <span className="text-[#bfbfbf]">/</span>
              <span className="font-medium">Найти магазин</span>
            </nav>
            <h1
              className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-2"
              style={{ fontFamily: 'var(--font-display)' }}
            >
              Найти магазин
            </h1>
            <p
              className="text-[14px] leading-[20px] text-gray-500"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Приезжайте к нам — посмотрите технику вживую, получите консультацию
            </p>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-[1400px] mx-auto px-5 py-8">
        <div className="max-w-6xl mx-auto">
          {/* Contact Info Cards */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            {/* Адрес */}
            <div className="bg-white rounded-[8px] border border-[#e5e7eb] p-6">
              <div className="flex items-center mb-4">
                <div className="w-12 h-12 rounded-full bg-[#1061cd]/10 flex items-center justify-center text-[#1061cd]">
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                </div>
                <h3
                  className="text-[16px] font-bold text-[#212121] ml-3"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Адрес
                </h3>
              </div>
              <p
                className="text-[14px] leading-[20px] text-gray-500"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                г. Каракол<br />
                ул. Гагарина, 28<br />
                Кыргызская Республика
              </p>
            </div>

            {/* Телефон */}
            <div className="bg-white rounded-[8px] border border-[#e5e7eb] p-6">
              <div className="flex items-center mb-4">
                <div className="w-12 h-12 rounded-full bg-[#1061cd]/10 flex items-center justify-center text-[#1061cd]">
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                  </svg>
                </div>
                <h3
                  className="text-[16px] font-bold text-[#212121] ml-3"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Телефон
                </h3>
              </div>
              <p
                className="text-[14px] leading-[20px] text-gray-500"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                <a href="tel:+996555953475" className="hover:text-[#1061cd] transition-colors">
                  +996 555 95 34 75
                </a>
                <br />
                <a href="tel:+996555953466" className="hover:text-[#1061cd] transition-colors">
                  +996 555 95 34 66
                </a>
                <br />
                <span className="text-[12px]">Консультации и заказы</span>
              </p>
            </div>

            {/* Время работы */}
            <div className="bg-white rounded-[8px] border border-[#e5e7eb] p-6">
              <div className="flex items-center mb-4">
                <div className="w-12 h-12 rounded-full bg-[#1061cd]/10 flex items-center justify-center text-[#1061cd]">
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <h3
                  className="text-[16px] font-bold text-[#212121] ml-3"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Время работы
                </h3>
              </div>
              <div
                className="text-[14px] leading-[20px] text-gray-500 space-y-1"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                <p>Пн – Пт: 9:00 – 17:00</p>
                <p>Сб: 9:00 – 12:00</p>
                <p className="text-[#bfbfbf]">Вс: выходной</p>
              </div>
            </div>
          </div>

          {/* Map */}
          <div className="bg-white rounded-[8px] border border-[#e5e7eb] overflow-hidden mb-8">
            <div className="p-6 border-b border-[#e5e7eb]">
              <h2
                className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-1"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Как нас найти
              </h2>
              <p
                className="text-[14px] leading-[20px] text-gray-500"
                style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
              >
                Наш магазин на карте Каракола — ищите иконку с логотипом
              </p>
            </div>
            <div
              ref={mapRef}
              className="w-full h-[400px]"
              style={{ minHeight: '400px' }}
            />
          </div>

          {/* Additional Info */}
          <div className="bg-white rounded-[8px] border border-[#e5e7eb] p-6">
            <h2
              className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-6"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Дополнительная информация
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h3
                  className="text-[16px] font-bold text-[#212121] mb-3"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  О магазине
                </h3>
                <p
                  className="text-[14px] leading-[20px] text-gray-500 mb-4"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Магазин компьютерной техники в Караколе с широким ассортиментом
                  ноутбуков, системных блоков, готовых сборок и периферии.
                  Работаем для вас с понедельника по пятницу с 9:00 до 17:00,
                  в субботу с 9:00 до 12:00.
                </p>
                <p
                  className="text-[14px] leading-[20px] text-gray-500"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  В нашем ассортименте: ноутбуки, системные блоки, мониторы,
                  принтеры, МФУ, комплектующие, периферия, расходные материалы.
                  Сборка компьютеров под любые задачи.
                </p>
              </div>
              <div>
                <h3
                  className="text-[16px] font-bold text-[#212121] mb-3"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Парковка
                </h3>
                <p
                  className="text-[14px] leading-[20px] text-gray-500 mb-6"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Бесплатная парковка рядом с магазином. Удобный подъезд для
                  автомобилей.
                </p>
                <h3
                  className="text-[16px] font-bold text-[#212121] mb-3"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  Что мы предлагаем
                </h3>
                <ul
                  className="text-[14px] leading-[20px] text-gray-500 space-y-2"
                  style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
                >
                  <li className="flex items-center gap-2">
                    <svg className="w-4 h-4 text-[#1061cd]" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                    </svg>
                    Демонстрация техники
                  </li>
                  <li className="flex items-center gap-2">
                    <svg className="w-4 h-4 text-[#1061cd]" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                    </svg>
                    Консультации специалистов
                  </li>
                  <li className="flex items-center gap-2">
                    <svg className="w-4 h-4 text-[#1061cd]" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                    </svg>
                    Тестирование перед покупкой
                  </li>
                  <li className="flex items-center gap-2">
                    <svg className="w-4 h-4 text-[#1061cd]" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                    </svg>
                    Гарантийное обслуживание
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}