// src/app/pc-assembly/page.tsx
import React from 'react';

export const metadata = {
  title: 'Сборка игровых компьютеров - Империя Электроники',
  description: 'Профессиональная сборка игровых компьютеров под ваши задачи и бюджет. Гарантия качества и производительности.',
};

export default function PcAssemblyPage() {
  return (
    <div className="container mx-auto px-6 py-8">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">Сборка игровых компьютеров</h1>
        
        <div className="prose prose-lg max-w-none">
          <p className="text-xl text-gray-600 mb-8 leading-relaxed">
            Собираем мощные игровые компьютеры под ваши задачи и бюджет. 
            Профессиональный подход, качественные комплектующие и гарантия результата.
          </p>

          {/* Преимущества */}
          <div className="bg-gradient-to-r from-blue-500 to-purple-600 text-white p-8 rounded-lg mb-8">
            <h2 className="text-2xl font-bold mb-6 text-center">Почему стоит заказать сборку у нас?</h2>
            <div className="grid md:grid-cols-2 gap-6">
              <div className="flex items-start space-x-3">
                <svg className="w-6 h-6 mt-1 text-yellow-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-semibold">Экспертный подбор</h3>
                  <p className="text-sm">Совместимость и оптимизация под ваши задачи</p>
                </div>
              </div>
              <div className="flex items-start space-x-3">
                <svg className="w-6 h-6 mt-1 text-green-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-semibold">Гарантия качества</h3>
                  <p className="text-sm">1 год гарантии на сборку + гарантия производителей</p>
                </div>
              </div>
              <div className="flex items-start space-x-3">
                <svg className="w-6 h-6 mt-1 text-pink-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-semibold">Тестирование</h3>
                  <p className="text-sm">Полное тестирование на стабильность и производительность</p>
                </div>
              </div>
              <div className="flex items-start space-x-3">
                <svg className="w-6 h-6 mt-1 text-orange-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 2L3 7v11a1 1 0 001 1h12a1 1 0 001-1V7l-7-5zM6 9a1 1 0 112 0v6a1 1 0 11-2 0V9zm6 0a1 1 0 112 0v6a1 1 0 11-2 0V9z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-semibold">Поддержка</h3>
                  <p className="text-sm">Техническая поддержка и помощь в настройке</p>
                </div>
              </div>
            </div>
          </div>

          {/* Конфигурации */}
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Готовые конфигурации</h2>
          
          <div className="grid md:grid-cols-3 gap-6 mb-8">
            {/* Бюджетная */}
            <div className="bg-green-50 p-6 rounded-lg border border-green-200">
              <div className="text-center mb-4">
                <h3 className="text-xl font-bold text-green-900">Стартовая</h3>
                <p className="text-2xl font-bold text-green-600">от 60 000 ₽</p>
              </div>
              <ul className="space-y-2 text-green-800 text-sm">
                <li>• AMD Ryzen 5 5600 / Intel Core i5-12400F</li>
                <li>• GTX 1660 Super / RTX 3060</li>
                <li>• 16 GB DDR4 RAM</li>
                <li>• SSD 500 GB</li>
                <li>• 80+ Bronze 500W PSU</li>
              </ul>
              <p className="text-xs text-green-600 mt-3">
                Full HD, высокие настройки, 60+ FPS в современных играх
              </p>
            </div>

            {/* Средняя */}
            <div className="bg-blue-50 p-6 rounded-lg border border-blue-200 relative">
              <div className="absolute -top-3 left-1/2 transform -translate-x-1/2">
                <span className="bg-blue-500 text-white px-4 py-1 rounded-full text-sm font-bold">ПОПУЛЯРНАЯ</span>
              </div>
              <div className="text-center mb-4 mt-2">
                <h3 className="text-xl font-bold text-blue-900">Игровая</h3>
                <p className="text-2xl font-bold text-blue-600">от 120 000 ₽</p>
              </div>
              <ul className="space-y-2 text-blue-800 text-sm">
                <li>• AMD Ryzen 7 5700X / Intel Core i7-12700F</li>
                <li>• RTX 3070 / RTX 4060 Ti</li>
                <li>• 32 GB DDR4 RAM</li>
                <li>• SSD 1 TB NVMe</li>
                <li>• 80+ Gold 650W PSU</li>
              </ul>
              <p className="text-xs text-blue-600 mt-3">
                1440p, максимальные настройки, 80+ FPS в AAA играх
              </p>
            </div>

            {/* Премиум */}
            <div className="bg-purple-50 p-6 rounded-lg border border-purple-200">
              <div className="text-center mb-4">
                <h3 className="text-xl font-bold text-purple-900">Энтузиаст</h3>
                <p className="text-2xl font-bold text-purple-600">от 250 000 ₽</p>
              </div>
              <ul className="space-y-2 text-purple-800 text-sm">
                <li>• AMD Ryzen 9 7900X / Intel Core i9-13900K</li>
                <li>• RTX 4080 / RTX 4090</li>
                <li>• 32 GB DDR5 RAM</li>
                <li>• SSD 2 TB NVMe Gen4</li>
                <li>• 80+ Platinum 850W PSU</li>
              </ul>
              <p className="text-xs text-purple-600 mt-3">
                4K, максимальные настройки, 120+ FPS, стриминг
              </p>
            </div>
          </div>

          {/* Процесс сборки */}
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Как проходит сборка</h2>
          
          <div className="space-y-6 mb-8">
            <div className="flex items-start space-x-4">
              <div className="bg-blue-500 text-white w-10 h-10 rounded-full flex items-center justify-center font-bold text-lg flex-shrink-0">
                1
              </div>
              <div>
                <h3 className="text-lg font-semibold text-gray-900">Консультация и подбор</h3>
                <p className="text-gray-700">
                  Определяем ваши потребности, бюджет и подбираем оптимальную конфигурацию. 
                  Обсуждаем все детали и согласовываем компоненты.
                </p>
              </div>
            </div>

            <div className="flex items-start space-x-4">
              <div className="bg-green-500 text-white w-10 h-10 rounded-full flex items-center justify-center font-bold text-lg flex-shrink-0">
                2
              </div>
              <div>
                <h3 className="text-lg font-semibold text-gray-900">Заказ и поставка компонентов</h3>
                <p className="text-gray-700">
                  Заказываем все необходимые компоненты у проверенных поставщиков. 
                  Проверяем комплектацию и отсутствие дефектов.
                </p>
              </div>
            </div>

            <div className="flex items-start space-x-4">
              <div className="bg-purple-500 text-white w-10 h-10 rounded-full flex items-center justify-center font-bold text-lg flex-shrink-0">
                3
              </div>
              <div>
                <h3 className="text-lg font-semibold text-gray-900">Профессиональная сборка</h3>
                <p className="text-gray-700">
                  Аккуратная сборка с соблюдением всех технологий. Качественная прокладка кабелей, 
                  установка системы охлаждения и настройка BIOS.
                </p>
              </div>
            </div>

            <div className="flex items-start space-x-4">
              <div className="bg-orange-500 text-white w-10 h-10 rounded-full flex items-center justify-center font-bold text-lg flex-shrink-0">
                4
              </div>
              <div>
                <h3 className="text-lg font-semibold text-gray-900">Тестирование и настройка</h3>
                <p className="text-gray-700">
                  Полное тестирование стабильности, температурных режимов и производительности. 
                  Установка и настройка операционной системы.
                </p>
              </div>
            </div>

            <div className="flex items-start space-x-4">
              <div className="bg-red-500 text-white w-10 h-10 rounded-full flex items-center justify-center font-bold text-lg flex-shrink-0">
                5
              </div>
              <div>
                <h3 className="text-lg font-semibold text-gray-900">Передача и поддержка</h3>
                <p className="text-gray-700">
                  Передача готового компьютера с документацией и инструкциями. 
                  Консультации по использованию и техническая поддержка.
                </p>
              </div>
            </div>
          </div>

          {/* Дополнительные услуги */}
          <div className="bg-gray-50 p-8 rounded-lg mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Дополнительные услуги</h2>
            
            <div className="grid md:grid-cols-2 gap-6">
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">🎨 Модификации</h3>
                <ul className="space-y-2 text-gray-700 text-sm">
                  <li>• RGB подсветка и кастомное охлаждение</li>
                  <li>• Жесткие трубки и кастомная СВО</li>
                  <li>• Покраска и декорирование корпуса</li>
                  <li>• Гравировка и персонализация</li>
                </ul>
              </div>
              
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">🔧 Сервис</h3>
                <ul className="space-y-2 text-gray-700 text-sm">
                  <li>• Разгон процессора и видеокарты</li>
                  <li>• Настройка профилей производительности</li>
                  <li>• Установка дополнительного ПО</li>
                  <li>• Обучение и консультации</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Гарантии */}
          <div className="bg-blue-50 p-6 rounded-lg mb-8 border border-blue-200">
            <h2 className="text-2xl font-bold text-blue-900 mb-4">Наши гарантии</h2>
            <div className="grid md:grid-cols-3 gap-4">
              <div className="text-center">
                <div className="text-3xl font-bold text-blue-600">1 год</div>
                <p className="text-blue-800 text-sm">Гарантия на сборку</p>
              </div>
              <div className="text-center">
                <div className="text-3xl font-bold text-blue-600">24/7</div>
                <p className="text-blue-800 text-sm">Техническая поддержка</p>
              </div>
              <div className="text-center">
                <div className="text-3xl font-bold text-blue-600">100%</div>
                <p className="text-blue-800 text-sm">Качество сборки</p>
              </div>
            </div>
          </div>

          {/* CTA */}
          <div className="bg-gradient-to-r from-green-500 to-blue-600 text-white p-8 rounded-lg text-center">
            <h2 className="text-2xl font-bold mb-4">Готовы собрать ваш идеальный игровой ПК?</h2>
            <p className="text-lg mb-6">
              Свяжитесь с нами для бесплатной консультации и подбора конфигурации
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a
                href="tel:+74951234567"
                className="bg-white text-green-600 px-8 py-3 rounded-lg font-bold hover:bg-gray-100 transition-colors"
              >
                📞 Позвонить сейчас
              </a>
              <a
                href="/contacts"
                className="bg-white/20 text-white px-8 py-3 rounded-lg font-bold hover:bg-white/30 transition-colors"
              >
                ✉️ Написать нам
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}