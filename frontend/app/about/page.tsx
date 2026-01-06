// src/app/about/page.tsx
import React from 'react';

export const metadata = {
  title: 'О компании - Империя Электроники',
  description: 'Узнайте больше о компании Империя Электроники - вашем надежном партнере в мире компьютерного оборудования',
};

export default function AboutPage() {
  return (
    <div className="container mx-auto px-6 py-8">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">О компании</h1>
        
        <div className="prose prose-lg max-w-none">
          <p className="text-xl text-gray-600 mb-6 leading-relaxed">
            Добро пожаловать в «Империю Электроники» - ваш надежный партнер в мире современных технологий и компьютерного оборудования.
          </p>
          
          <div className="bg-gray-50 p-6 rounded-lg mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">Наша миссия</h2>
            <p className="text-gray-700 leading-relaxed">
              Мы стремимся предоставить нашим клиентам самое современное и качественное компьютерное оборудование по доступным ценам. 
              Наша цель - сделать передовые технологии доступными в Кыргызстане для каждого.
            </p>
          </div>

          <h2 className="text-2xl font-semibold text-gray-900 mb-4">Почему выбирают нас?</h2>
          
          <div className="grid md:grid-cols-2 gap-6 mb-8">
            <div className="bg-blue-50 p-6 rounded-lg">
              <h3 className="text-xl font-semibold text-blue-900 mb-3">Качество гарантировано</h3>
              <p className="text-blue-800">
                Мы работаем только с проверенными производителями и предоставляем официальную гарантию на компьютерное оборудование.
              </p>
            </div>
            
            <div className="bg-green-50 p-6 rounded-lg">
              <h3 className="text-xl font-semibold text-green-900 mb-3">Экспертная поддержка</h3>
              <p className="text-green-800">
                Наши специалисты помогут подобрать оптимальную конфигурацию и ответят на все ваши вопросы.
              </p>
            </div>
            
            <div className="bg-purple-50 p-6 rounded-lg">
              <h3 className="text-xl font-semibold text-purple-900 mb-3">Быстрая доставка</h3>
              <p className="text-purple-800">
                Оперативная обработка заказов и доставка в кратчайшие сроки по Иссык-Кульской области.
              </p>
            </div>
            
            <div className="bg-orange-50 p-6 rounded-lg">
              <h3 className="text-xl font-semibold text-orange-900 mb-3">Конкурентные цены</h3>
              <p className="text-orange-800">
                Лучшие цены в Караколе благодаря сотрудничеству с производителями.
              </p>
            </div>
          </div>

          <h2 className="text-2xl font-semibold text-gray-900 mb-4">Наша история</h2>
          <p className="text-gray-700 mb-6 leading-relaxed">
            Компания «Империя Электроники» была основана с целью создания надежного и профессионального сервиса 
            в области продажи компьютерного оборудования. За годы работы мы завоевали доверие тысяч клиентов 
            и стали одним из лидеров рынка в Иссык-Кульской области.
          </p>

          <div className="bg-gradient-to-r from-blue-500 to-purple-600 text-white p-8 rounded-lg text-center">
            <h2 className="text-2xl font-bold mb-4">Присоединяйтесь к нам!</h2>
            <p className="text-lg">
              Откройте для себя мир передовых технологий вместе с нами.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}