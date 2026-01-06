'use client';

import React, { useEffect, useRef } from 'react';

// Интерфейс для Яндекс карт
declare global {
  interface Window {
    ymaps: any;
  }
}

// Metadata убран, так как это клиентский компонент
// Metadata должен быть в layout.tsx

export default function StoreLocationPage() {
  const mapRef = useRef<HTMLDivElement>(null);

  // Структурированные данные для SEO
  const structuredData = {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    "name": "Магазин компьютеров Каракол",
    "description": "Продажа компьютеров, ноутбуков и комплектующих в Караколе",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "ул. Гагарина, 28",
      "addressLocality": "Каракол",
      "addressCountry": "KG"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": "42.4908",
      "longitude": "78.3933"
    },
    "telephone": "+996555953475, +996555953466",
    "openingHours": [
      "Mo-Fr 09:00-18:00",
      "Sa 10:00-16:00"
    ],
    "priceRange": "$$",
    "image": "/store-front.jpg"
  };

  useEffect(() => {
    
    // Загружаем скрипт Яндекс.Карт
    const loadYandexMaps = () => {
      
      if (window.ymaps) {
        initMap();
        return;
      }

      // Проверяем, не загружен ли уже скрипт
      const existingScript = document.querySelector('script[src*="api-maps.yandex.ru"]');
      if (existingScript) {
        // Если скрипт уже загружается, ждем его загрузки
        existingScript.addEventListener('load', () => {
          if (window.ymaps) {
            window.ymaps.ready(initMap);
          }
        });
        return;
      }

      // Используем предоставленный API ключ
      const API_KEY = 'd3859a87-54b0-43f0-8f55-16bc9b15192a';

      const script = document.createElement('script');
      script.src = `https://api-maps.yandex.ru/2.1/?apikey=${API_KEY}&lang=ru_RU`;
      
      script.onload = () => {
        if (window.ymaps) {
          window.ymaps.ready(initMap);
        } else {
          console.error('loadYandexMaps: window.ymaps недоступен после загрузки скрипта');
          showMapFallback();
        }
      };
      
      script.onerror = (error) => {
        console.error('loadYandexMaps: ошибка загрузки скрипта:', error);
        showMapFallback();
      };
      
      document.head.appendChild(script);
    };

    // Показываем заглушку вместо карты
    const showMapFallback = () => {
      if (!mapRef.current) {
        return;
      }
      
      mapRef.current.innerHTML = `
        <div class="w-full h-full bg-gray-100 flex flex-col items-center justify-center p-8">
          <svg class="w-16 h-16 text-gray-400 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
          </svg>
          <h3 class="text-lg font-semibold text-gray-600 mb-2">Наш адрес</h3>
          <p class="text-gray-500 text-center">г. Каракол, ул. Гагарина 28</p>
          <p class="text-gray-500 text-center mt-1">Телефон: +996 555 95 34 75  +996 555 95 34 66</p>
          <p class="text-sm text-red-500 mt-4 text-center">Карта временно недоступна</p>
        </div>
      `;
    };

    // Инициализация карты
    const initMap = () => {
      if (!mapRef.current) {
        console.error('initMap: mapRef.current не найден');
        return;
      }

      try {
        const map = new window.ymaps.Map(mapRef.current, {
          center: [42.493559, 78.400792], // Координаты Каракола
          zoom: 15,
          controls: ['zoomControl', 'fullscreenControl', 'geolocationControl']
        });

        // Добавляем метку магазина
        const placemark = new window.ymaps.Placemark([42.493559, 78.400792], {
          balloonContent: `
            <div style="padding: 10px;">
              <h3 style="margin: 0 0 10px 0; color: #333;">Наш магазин компьютеров</h3>
              <p style="margin: 5px 0;"><strong>Адрес:</strong> г. Каракол, ул. Гагарина 28</p>
              <p style="margin: 5px 0;"><strong>Телефон:</strong> +996 555 95 34 75, +996 555 95 34 66</p>
              <p style="margin: 5px 0;"><strong>Время работы:</strong> 9:00 - 17:00</p>
            </div>
          `,
          hintContent: 'Магазин компьютерной техники'
        }, {
          preset: 'islands#redDotIcon',
          iconColor: '#dc2626'
        });

        map.geoObjects.add(placemark);
      } catch (error) {
        console.error('initMap: ошибка при создании карты:', error);
        showMapFallback();
      }
    };

    loadYandexMaps();
  }, []);

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Структурированные данные для поисковиков */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(structuredData),
        }}
      />
      
      {/* Скрытый контент для SEO */}
      <div className="sr-only">
        Магазин компьютерной техники в Караколе. Продажа ноутбуков, системных блоков, 
        готовых компьютерных сборок в городе Каракол, Кыргызстан. Доставка по Караколу.
        Адрес: г. Каракол, ул. Гагарина 28. Телефон: +996 555 95 34 75, +996 555 95 34 66.
        Время работы: понедельник-пятница 9:00-17:00, суббота 9:00-12:00.
      </div>
        {/* Header */}
        <div className="bg-white border-b border-gray-200">
          <div className="container mx-auto px-4 py-6">
            <div className="max-w-4xl mx-auto">
              <h1 className="text-3xl font-bold text-gray-900 mb-2">Найти наш магазин</h1>
              <p className="text-gray-600">Приезжайте к нам за лучшими компьютерами в Караколе</p>
            </div>
          </div>
        </div>

        {/* Main Content */}
        <div className="container mx-auto px-4 py-8">
          <div className="max-w-6xl mx-auto">
            
            {/* Contact Info Cards */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
              
              {/* Адрес */}
              <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                <div className="flex items-center mb-4">
                  <div className="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center">
                    <svg className="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                  </div>
                  <h3 className="text-lg font-semibold text-gray-900 ml-3">Адрес</h3>
                </div>
                <p className="text-gray-600">
                  г. Каракол<br />
                  ул. Гагарина, 28<br />
                  Кыргызская Республика
                </p>
              </div>

              {/* Телефон */}
              <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                <div className="flex items-center mb-4">
                  <div className="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                    <svg className="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                    </svg>
                  </div>
                  <h3 className="text-lg font-semibold text-gray-900 ml-3">Телефон</h3>
                </div>
                <p className="text-gray-600">
                  <a href="tel:+996555953475" className="hover:text-green-600 transition-colors">
                    +996 555 95 34 75
                  </a><br />
                  <a href="tel:+996555953466" className="hover:text-green-600 transition-colors">
                    +996 555 95 34 66
                  </a><br />
                  <span className="text-sm">Консультации и заказы</span>
                </p>
              </div>

              {/* Время работы */}
              <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                <div className="flex items-center mb-4">
                  <div className="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center">
                    <svg className="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                  </div>
                  <h3 className="text-lg font-semibold text-gray-900 ml-3">Время работы</h3>
                </div>
                <div className="text-gray-600 space-y-1">
                  <p>Пн - Пт: 9:00 - 17:00</p>
                  <p>Сб: 9:00 - 12:00</p>
                  <p className="text-red-600">Вс: Выходной</p>
                </div>
              </div>
            </div>

            {/* Map Container */}
            <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
              <div className="p-6 border-b border-gray-200">
                <h2 className="text-xl font-semibold text-gray-900 mb-2">Как нас найти</h2>
                <p className="text-gray-600">Интерактивная карта с точным местоположением нашего магазина</p>
              </div>
              
              {/* Yandex Map */}
              <div 
                ref={mapRef}
                className="w-full h-96"
                style={{ minHeight: '400px' }}
              >
                {/* Контейнер для карты - fallback управляется программно */}
              </div>
            </div>

            {/* Additional Info */}
            <div className="mt-8 bg-white rounded-lg shadow-sm border border-gray-200 p-6">
              <h2 className="text-xl font-semibold text-gray-900 mb-4">Дополнительная информация</h2>
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <h3 className="font-semibold text-gray-900 mb-3">Парковка</h3>
                  <p className="text-gray-600 mb-4">
                    Бесплатная парковка рядом с магазином. Удобный подъезд для автомобилей.
                  </p>
                </div>
                
                <div>
                  <h3 className="font-semibold text-gray-900 mb-3">Что мы предлагаем</h3>
                  <ul className="text-gray-600 space-y-2">
                    <li className="flex items-center">
                      <svg className="w-4 h-4 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                      </svg>
                      Демонстрация техники
                    </li>
                    <li className="flex items-center">
                      <svg className="w-4 h-4 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                      </svg>
                      Консультации специалистов
                    </li>
                    <li className="flex items-center">
                      <svg className="w-4 h-4 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                      </svg>
                      Тестирование перед покупкой
                    </li>
                    <li className="flex items-center">
                      <svg className="w-4 h-4 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
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