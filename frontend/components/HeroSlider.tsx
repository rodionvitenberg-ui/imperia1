// src/components/HeroSlider.tsx
'use client';

import React from 'react';
// Импортируем компоненты Swiper
import { Swiper, SwiperSlide } from 'swiper/react';
// Добавляем новый модуль EffectFade для плавной смены слайдов
import { Navigation, Pagination, Autoplay, EffectFade } from 'swiper/modules';

// Импортируем стили Swiper, включая новый стиль для эффекта "fade"
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css/effect-fade';

const slideData = [
  { id: 1, imageUrl: '/hero-1.jpg', title: '5% скидка за покупку двух компьютеров в подарок!', subtitle: 'Будь лучшим!', buttonText: 'КУПИ', buttonLink: '/catalog/gaming-pc' },
  { id: 2, imageUrl: '/hero-2.jpg', title: 'Купи камеру!', subtitle: 'Она не даст твою хату обокрасть!', buttonText: 'Видеонаблюдение', buttonLink: '/catalog/videocards' },
  { id: 3, imageUrl: '/hero-3.jpg', title: 'Сельская эстетика', subtitle: 'Ты можешь поставить свое железо даже в сарае - и оно не сгорит!', buttonText: 'Каталог', buttonLink: '/catalog/periferiya' },
  { id: 4, imageUrl: '/hero-4.jpg', title: 'Заправь картридж!', subtitle: 'Мы сделаем это за 270 сом.', buttonText: 'Заправься тонером!', buttonLink: '/catalog/memory' },
  { id: 5, imageUrl: '/hero-5.jpg', title: 'Хочешь такую же красоту?', subtitle: 'Напиши нам - окажем услугу!', buttonText: 'Задорого...', buttonLink: '/catalog/motherboards' },
];

const HeroSlider = () => {
  return (
    <section className="relative h-[75vh] w-full group">
      <Swiper
        modules={[Navigation, Pagination, Autoplay, EffectFade]}
        effect="fade"
        fadeEffect={{ crossFade: true }}
        slidesPerView={1}
        spaceBetween={0}
        loop={true}
        autoplay={{
          delay: 5000,
          disableOnInteraction: false,
        }}
        pagination={{
          clickable: true,
          el: '.swiper-pagination-custom',
        }}
        navigation={{
          nextEl: '.swiper-button-next-custom',
          prevEl: '.swiper-button-prev-custom',
        }}
        className="h-full w-full"
      >
        {slideData.map((slide) => (
          <SwiperSlide key={slide.id}>
            {/* === НАПОЛНЕНИЕ ОДНОГО СЛАЙДА (ЗАПОЛНЕННАЯ ЧАСТЬ) === */}
            <div className="relative h-full w-full">
              {/* Фоновое изображение */}
              <div
                className="absolute inset-0 bg-cover bg-center"
                style={{ backgroundImage: `url(${slide.imageUrl})` }}
              />
              {/* Затемняющий слой для читаемости текста */}
              <div className="absolute inset-0 bg-black/60" />

              {/* Контент слайда */}
              <div className="relative z-10 flex h-full flex-col items-center justify-center text-center text-white p-4">
                <h1 className="text-4xl md:text-6xl font-extrabold uppercase tracking-wider">
                  {slide.title}
                </h1>
                <p className="mt-4 text-lg md:text-xl max-w-2xl">
                  {slide.subtitle}
                </p>
                <a
                  href={slide.buttonLink}
                  className="mt-8 inline-block bg-primary text-white font-bold py-3 px-8 rounded-[20px] hover:bg-primary/90 transition-colors duration-300 text-[14px] min-w-[300px] min-h-[40px] text-center"
                >
                  {slide.buttonText}
                </a>
              </div>
            </div>
            {/* ======================================================= */}
          </SwiperSlide>
        ))}
      </Swiper>

      {/* Наши собственные стрелки и контейнер для пагинации */}
      <div className="absolute bottom-5 left-1/2 -translate-x-1/2 z-10 flex items-center justify-center gap-8">
        
        {/* Стрелка НАЗАД: 
            opacity-100 (видна всегда на мобилке) 
            md:opacity-0 md:group-hover:opacity-100 (скрыта на ПК, пока не наведешь) */}
        <div className="swiper-button-prev-custom cursor-pointer rounded-full p-2 transition-opacity duration-300 opacity-100 md:opacity-0 md:group-hover:opacity-100">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="white" className="w-6 h-6">
            <path strokeLinecap="round" strokeLinejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
          </svg>
        </div>

        {/* ПАГИНАЦИЯ: hidden (скрыта на мобилке), md:block (видна на ПК) */}
        <div className="swiper-pagination-custom hidden md:block" />

        {/* Стрелка ВПЕРЕД: аналогично, видна всегда на мобилке */}
        <div className="swiper-button-next-custom cursor-pointer rounded-full p-2 transition-opacity duration-300 opacity-100 md:opacity-0 md:group-hover:opacity-100">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="white" className="w-6 h-6">
            <path strokeLinecap="round" strokeLinejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
          </svg>
        </div>
      </div>
    </section>
  );
};

export default HeroSlider;