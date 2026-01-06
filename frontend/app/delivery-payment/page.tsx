// src/app/delivery-payment/page.tsx
import React from 'react';

export const metadata = {
  title: 'Доставка и оплата - Империя Электроники',
  description: 'Информация о способах доставки и оплаты в интернет-магазине Империя Электроники',
};

export default function DeliveryPaymentPage() {
  return (
    <div className="container mx-auto px-6 py-8">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">Доставка и оплата</h1>
        
        {/* Доставка */}
        <div className="mb-12">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Способы доставки</h2>
          
          <div className="grid lg:grid-cols-2 gap-6">
            {/* Курьерская доставка */}
            <div className="bg-blue-50 p-6 rounded-lg border border-blue-200">
              <div className="flex items-center mb-4">
                <div className="bg-blue-500 p-3 rounded-lg mr-4">
                  <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3a2 2 0 012-2h4a2 2 0 012 2v4m-6 4v10a2 2 0 002 2h4a2 2 0 002-2V11m-6 0h8m-8 0V8a2 2 0 012-2h4a2 2 0 012 2v3" />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold text-blue-900">Курьерская доставка</h3>
              </div>
              <div className="space-y-3 text-blue-800">
                <p><strong>По Москве:</strong> 500 ₽ (бесплатно от 5000 ₽)</p>
                <p><strong>По МО:</strong> 800 ₽ (бесплатно от 7000 ₽)</p>
                <p><strong>Время:</strong> 1-2 рабочих дня</p>
                <p><strong>Часы:</strong> 10:00 - 21:00</p>
                <p className="text-sm">Курьер предварительно свяжется с вами для согласования времени доставки</p>
              </div>
            </div>

            {/* Самовывоз */}
            <div className="bg-green-50 p-6 rounded-lg border border-green-200">
              <div className="flex items-center mb-4">
                <div className="bg-green-500 p-3 rounded-lg mr-4">
                  <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold text-green-900">Самовывоз</h3>
              </div>
              <div className="space-y-3 text-green-800">
                <p><strong>Стоимость:</strong> Бесплатно</p>
                <p><strong>Адрес:</strong> г. Москва, ул. Тверская, д. 15</p>
                <p><strong>Время:</strong> готов к выдаче на следующий день</p>
                <p><strong>Часы работы:</strong> Пн-Пт 9:00-19:00, Сб 10:00-16:00</p>
                <p className="text-sm">При получении необходим документ, удостоверяющий личность</p>
              </div>
            </div>

            {/* Доставка по России */}
            <div className="bg-purple-50 p-6 rounded-lg border border-purple-200">
              <div className="flex items-center mb-4">
                <div className="bg-purple-500 p-3 rounded-lg mr-4">
                  <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064" />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold text-purple-900">Доставка по России</h3>
              </div>
              <div className="space-y-3 text-purple-800">
                <p><strong>Транспортные компании:</strong> СДЭК, Boxberry, ПЭК</p>
                <p><strong>Стоимость:</strong> рассчитывается индивидуально</p>
                <p><strong>Время:</strong> 3-10 рабочих дней в зависимости от региона</p>
                <p className="text-sm">Точная стоимость и сроки доставки рассчитываются при оформлении заказа</p>
              </div>
            </div>

            {/* Экспресс-доставка */}
            <div className="bg-orange-50 p-6 rounded-lg border border-orange-200">
              <div className="flex items-center mb-4">
                <div className="bg-orange-500 p-3 rounded-lg mr-4">
                  <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold text-orange-900">Экспресс-доставка</h3>
              </div>
              <div className="space-y-3 text-orange-800">
                <p><strong>По Москве:</strong> 1200 ₽</p>
                <p><strong>Время:</strong> в течение 3 часов</p>
                <p><strong>Часы:</strong> 10:00 - 18:00</p>
                <p><strong>Условия:</strong> при сумме заказа от 10 000 ₽</p>
                <p className="text-sm">Доступно только для товаров в наличии на складе в Москве</p>
              </div>
            </div>
          </div>
        </div>

        {/* Оплата */}
        <div className="mb-12">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Способы оплаты</h2>
          
          <div className="grid lg:grid-cols-2 gap-6">
            {/* Онлайн оплата */}
            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
              <h3 className="text-xl font-semibold text-gray-900 mb-4">Онлайн оплата</h3>
              <div className="space-y-4">
                <div className="flex items-center space-x-3">
                  <svg className="w-5 h-5 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                  </svg>
                  <span>Банковские карты Visa, MasterCard, МИР</span>
                </div>
                <div className="flex items-center space-x-3">
                  <svg className="w-5 h-5 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                  </svg>
                  <span>Яндекс.Деньги, QIWI, WebMoney</span>
                </div>
                <div className="flex items-center space-x-3">
                  <svg className="w-5 h-5 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                  </svg>
                  <span>СБП (Система быстрых платежей)</span>
                </div>
                <p className="text-sm text-gray-600 mt-3">
                  Все онлайн-платежи защищены 3D-Secure протоколом
                </p>
              </div>
            </div>

            {/* Оплата при получении */}
            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
              <h3 className="text-xl font-semibold text-gray-900 mb-4">Оплата при получении</h3>
              <div className="space-y-4">
                <div className="flex items-center space-x-3">
                  <svg className="w-5 h-5 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
                  </svg>
                  <span>Наличными курьеру</span>
                </div>
                <div className="flex items-center space-x-3">
                  <svg className="w-5 h-5 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z" />
                    <path fillRule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clipRule="evenodd" />
                  </svg>
                  <span>Картой курьеру</span>
                </div>
                <div className="flex items-center space-x-3">
                  <svg className="w-5 h-5 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M6 2a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V4a2 2 0 00-2-2H6zm1 2a1 1 0 000 2h6a1 1 0 100-2H7zm6 7a1 1 0 011 1v3a1 1 0 11-2 0v-3a1 1 0 011-1zm-3 3a1 1 0 100 2h.01a1 1 0 100-2H10zm-4 1a1 1 0 011-1h.01a1 1 0 110 2H7a1 1 0 01-1-1zm1-4a1 1 0 100 2h.01a1 1 0 100-2H7zm2 0a1 1 0 100 2h.01a1 1 0 100-2H9zm2 0a1 1 0 100 2h.01a1 1 0 100-2H11zm2 0a1 1 0 100 2h.01a1 1 0 100-2H13z" clipRule="evenodd" />
                  </svg>
                  <span>Наличными в пункте выдачи</span>
                </div>
                <p className="text-sm text-gray-600 mt-3">
                  Возможность осмотра товара перед оплатой
                </p>
              </div>
            </div>

            {/* Банковский перевод */}
            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
              <h3 className="text-xl font-semibold text-gray-900 mb-4">Банковский перевод</h3>
              <div className="space-y-3">
                <p>Для юридических лиц и ИП</p>
                <div className="text-sm text-gray-600 space-y-1">
                  <p>• Безналичный расчет по счету</p>
                  <p>• НДС включен</p>
                  <p>• Полный пакет документов</p>
                  <p>• Отсрочка платежа до 5 рабочих дней</p>
                </div>
              </div>
            </div>

            {/* Рассрочка и кредит */}
            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
              <h3 className="text-xl font-semibold text-gray-900 mb-4">Рассрочка и кредит</h3>
              <div className="space-y-3">
                <p>Покупка в рассрочку от банков-партнеров</p>
                <div className="text-sm text-gray-600 space-y-1">
                  <p>• Рассрочка 0% до 12 месяцев</p>
                  <p>• Быстрое онлайн одобрение</p>
                  <p>• Минимальный пакет документов</p>
                  <p>• От 18 лет с паспортом РФ</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Дополнительная информация */}
        <div className="bg-gradient-to-r from-blue-50 to-purple-50 p-8 rounded-lg border border-blue-200">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">Важная информация</h2>
          
          <div className="grid md:grid-cols-2 gap-6">
            <div>
              <h3 className="text-lg font-semibold text-gray-900 mb-3">🛡️ Гарантии безопасности</h3>
              <ul className="space-y-2 text-gray-700 text-sm">
                <li>• Все товары проверяются перед отправкой</li>
                <li>• Страхование дорогостоящих грузов</li>
                <li>• Возврат/обмен в течение 14 дней</li>
                <li>• Защищенные платежи с 3D-Secure</li>
              </ul>
            </div>
            
            <div>
              <h3 className="text-lg font-semibold text-gray-900 mb-3">📦 Упаковка и отгрузка</h3>
              <ul className="space-y-2 text-gray-700 text-sm">
                <li>• Профессиональная упаковка</li>
                <li>• Отгрузка в день оплаты</li>
                <li>• Трек-номер для отслеживания</li>
                <li>• SMS-уведомления о статусе заказа</li>
              </ul>
            </div>
          </div>
        </div>

        {/* Контакты */}
        <div className="mt-8 text-center bg-gray-900 text-white p-6 rounded-lg">
          <h2 className="text-xl font-bold mb-4">Остались вопросы?</h2>
          <p className="mb-4">Свяжитесь с нами, и мы поможем выбрать оптимальный способ доставки и оплаты</p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="tel:+74951234567" className="bg-blue-600 hover:bg-blue-700 px-6 py-2 rounded-lg transition-colors">
              📞 +7 (495) 123-45-67
            </a>
            <a href="/contacts" className="bg-gray-700 hover:bg-gray-600 px-6 py-2 rounded-lg transition-colors">
              ✉️ Написать нам
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}