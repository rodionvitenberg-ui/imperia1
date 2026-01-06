// src/app/care/page.tsx
import React from 'react';

export const metadata = {
  title: 'Забота о клиентах - Империя Электроники',
  description: 'Узнайте о том, как мы заботимся о наших клиентах: сервис, поддержка, гарантии и дополнительные услуги.',
};

export default function CarePage() {
  return (
    <div className="container mx-auto px-6 py-8">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">Забота о клиентах</h1>
        
        <div className="prose prose-lg max-w-none">
          <p className="text-xl text-gray-600 mb-8 leading-relaxed">
            В «Империи Электроники» каждый клиент особенный. Мы создали комплексную систему заботы, 
            которая сопровождает вас на каждом этапе покупки и использования наших товаров.
          </p>

          {/* Основные принципы */}
          <div className="bg-gradient-to-r from-blue-500 to-purple-600 text-white p-8 rounded-lg mb-8">
            <h2 className="text-2xl font-bold mb-6 text-center">Наши принципы заботы</h2>
            <div className="grid md:grid-cols-2 gap-6">
              <div className="flex items-start space-x-3">
                <svg className="w-8 h-8 mt-1 text-yellow-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-bold text-lg">Индивидуальный подход</h3>
                  <p className="text-sm">Каждый клиент получает персональное внимание и решение под свои потребности</p>
                </div>
              </div>
              <div className="flex items-start space-x-3">
                <svg className="w-8 h-8 mt-1 text-green-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-bold text-lg">Ответственность</h3>
                  <p className="text-sm">Мы несем полную ответственность за качество товаров и услуг</p>
                </div>
              </div>
              <div className="flex items-start space-x-3">
                <svg className="w-8 h-8 mt-1 text-pink-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-bold text-lg">Прозрачность</h3>
                  <p className="text-sm">Честная информация о товарах, ценах и условиях сотрудничества</p>
                </div>
              </div>
              <div className="flex items-start space-x-3">
                <svg className="w-8 h-8 mt-1 text-orange-300" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="font-bold text-lg">Развитие</h3>
                  <p className="text-sm">Постоянно совершенствуем сервис на основе ваших потребностей</p>
                </div>
              </div>
            </div>
          </div>

          {/* Сервисы заботы */}
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Наши сервисы заботы</h2>
          
          <div className="space-y-6 mb-8">
            <div className="bg-blue-50 p-6 rounded-lg border-l-4 border-blue-500">
              <h3 className="text-xl font-semibold text-blue-900 mb-3">🛡️ Расширенные гарантии</h3>
              <p className="text-blue-800 mb-4">
                Помимо стандартной гарантии производителя, мы предоставляем дополнительные гарантийные программы:
              </p>
              <ul className="list-disc list-inside text-blue-700 space-y-1">
                <li>Замена товара в первые 14 дней без объяснения причин</li>
                <li>Ускоренный гарантийный ремонт (до 3 дней)</li>
                <li>Предоставление подменного оборудования на время ремонта</li>
                <li>Расширенная гарантия до 3 лет на премиум товары</li>
              </ul>
            </div>

            <div className="bg-green-50 p-6 rounded-lg border-l-4 border-green-500">
              <h3 className="text-xl font-semibold text-green-900 mb-3">📞 Круглосуточная поддержка</h3>
              <p className="text-green-800 mb-4">
                Наша служба поддержки работает для вас 24/7:
              </p>
              <ul className="list-disc list-inside text-green-700 space-y-1">
                <li>Техническая консультация по любым вопросам</li>
                <li>Помощь в настройке и подключении оборудования</li>
                <li>Удаленная диагностика и решение проблем</li>
                <li>Консультации по совместимости и модернизации</li>
              </ul>
            </div>

            <div className="bg-purple-50 p-6 rounded-lg border-l-4 border-purple-500">
              <h3 className="text-xl font-semibold text-purple-900 mb-3">🚀 Персональные консультации</h3>
              <p className="text-purple-800 mb-4">
                Индивидуальный подход к каждому клиенту:
              </p>
              <ul className="list-disc list-inside text-purple-700 space-y-1">
                <li>Персональный менеджер для VIP клиентов</li>
                <li>Консультации по выбору оборудования</li>
                <li>Планирование модернизации и апгрейда</li>
                <li>Помощь в планировании IT-бюджета</li>
              </ul>
            </div>

            <div className="bg-orange-50 p-6 rounded-lg border-l-4 border-orange-500">
              <h3 className="text-xl font-semibold text-orange-900 mb-3">🎓 Обучение и мастер-классы</h3>
              <p className="text-orange-800 mb-4">
                Делимся знаниями и опытом:
              </p>
              <ul className="list-disc list-inside text-orange-700 space-y-1">
                <li>Бесплатные мастер-классы по сборке ПК</li>
                <li>Обучение работе с новым оборудованием</li>
                <li>Вебинары по технологическим трендам</li>
                <li>Индивидуальные консультации по настройке</li>
              </ul>
            </div>
          </div>

          {/* Отзывы и качество */}
          <div className="bg-gray-50 p-8 rounded-lg mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Контроль качества обслуживания</h2>
            
            <div className="grid md:grid-cols-2 gap-6">
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">📊 Мониторинг удовлетворенности</h3>
                <ul className="space-y-2 text-gray-700 text-sm">
                  <li>• Регулярные опросы клиентов</li>
                  <li>• Анализ обратной связи и предложений</li>
                  <li>• Система оценки качества сервиса</li>
                  <li>• Постоянное улучшение процессов</li>
                </ul>
              </div>
              
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">🏆 Наши достижения</h3>
                <ul className="space-y-2 text-gray-700 text-sm">
                  <li>• 98% довольных клиентов</li>
                  <li>• Время ответа поддержки менее 1 часа</li>
                  <li>• 15 000+ успешно выполненных заказов</li>
                  <li>• Средняя оценка сервиса 4.9/5</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Экстренные ситуации */}
          <div className="bg-red-50 p-6 rounded-lg mb-8 border border-red-200">
            <h2 className="text-2xl font-bold text-red-900 mb-4">Экстренная помощь</h2>
            <p className="text-red-800 mb-4">
              В случае критических ситуаций мы готовы оказать экстренную помощь:
            </p>
            <div className="grid md:grid-cols-2 gap-4">
              <div>
                <h3 className="font-semibold text-red-900 mb-2">🚨 Когда обращаться:</h3>
                <ul className="text-red-700 text-sm space-y-1">
                  <li>• Полный отказ критически важного оборудования</li>
                  <li>• Потеря данных</li>
                  <li>• Проблемы в рабочие часы бизнеса</li>
                </ul>
              </div>
              <div>
                <h3 className="font-semibold text-red-900 mb-2">⚡ Что мы предоставим:</h3>
                <ul className="text-red-700 text-sm space-y-1">
                  <li>• Выездная диагностика в течение 2 часов</li>
                  <li>• Подменное оборудование</li>
                  <li>• Приоритетный ремонт</li>
                </ul>
              </div>
            </div>
            <div className="mt-4 p-3 bg-red-200 rounded-lg">
              <p className="text-red-900 font-semibold text-center">
                📞 Горячая линия экстренной помощи: +7 (495) 123-45-67 (доб. 911)
              </p>
            </div>
          </div>

          {/* Заключение */}
          <div className="bg-gradient-to-r from-green-500 to-blue-600 text-white p-8 rounded-lg text-center">
            <h2 className="text-2xl font-bold mb-4">Ваше доверие — наша ответственность</h2>
            <p className="text-lg mb-6">
              Мы продолжаем развивать сервис заботы о клиентах, потому что ваш успех — это наш успех
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a
                href="/contacts"
                className="bg-white text-green-600 px-8 py-3 rounded-lg font-bold hover:bg-gray-100 transition-colors"
              >
                ✉️ Связаться с нами
              </a>
              <a
                href="tel:+74951234567"
                className="bg-white/20 text-white px-8 py-3 rounded-lg font-bold hover:bg-white/30 transition-colors"
              >
                📞 Горячая линия
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}