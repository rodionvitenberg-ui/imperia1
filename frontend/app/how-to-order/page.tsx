// src/app/how-to-order/page.tsx
import React from 'react';

export const metadata = {
  title: 'Как сделать заказ - Империя Электроники',
  description: 'Пошаговая инструкция как оформить заказ в интернет-магазине Империя Электроники',
};

export default function HowToOrderPage() {
  return (
    <div className="container mx-auto px-6 py-8">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">Как сделать заказ</h1>
        
        <div className="prose prose-lg max-w-none">
          <p className="text-xl text-gray-600 mb-8 leading-relaxed">
            Оформить заказ в нашем интернет-магазине очень просто! Следуйте пошаговой инструкции ниже.
          </p>

          <div className="space-y-8">
            {/* Шаг 1 */}
            <div className="bg-blue-50 p-6 rounded-lg border-l-4 border-blue-500">
              <div className="flex items-start space-x-4">
                <div className="bg-blue-500 text-white w-8 h-8 rounded-full flex items-center justify-center font-bold text-lg">
                  1
                </div>
                <div className="flex-1">
                  <h2 className="text-2xl font-semibold text-blue-900 mb-3">Выберите товары</h2>
                  <p className="text-blue-800 mb-4">
                    Найдите нужные товары, используя поиск или навигацию по категориям. 
                    Ознакомьтесь с характеристиками товаров.
                  </p>
                  <ul className="list-disc list-inside text-blue-700 space-y-1">
                    <li>Используйте фильтры для быстрого поиска</li>
                    <li>Сравнивайте характеристики товаров</li>
                  </ul>
                </div>
              </div>
            </div>

            {/* Шаг 2 */}
            <div className="bg-green-50 p-6 rounded-lg border-l-4 border-green-500">
              <div className="flex items-start space-x-4">
                <div className="bg-green-500 text-white w-8 h-8 rounded-full flex items-center justify-center font-bold text-lg">
                  2
                </div>
                <div className="flex-1">
                  <h2 className="text-2xl font-semibold text-green-900 mb-3">Добавьте в корзину</h2>
                  <p className="text-green-800 mb-4">
                    Нажмите кнопку "Добавить в корзину" на странице товара. 
                    Вы можете продолжить покупки или перейти к оформлению заказа.
                  </p>
                  <ul className="list-disc list-inside text-green-700 space-y-1">
                    <li>Выберите количество товара</li>
                    <li>Проверьте выбранную конфигурацию</li>
                    <li>Добавьте сопутствующие товары при необходимости</li>
                  </ul>
                </div>
              </div>
            </div>

            {/* Шаг 3 */}
            <div className="bg-purple-50 p-6 rounded-lg border-l-4 border-purple-500">
              <div className="flex items-start space-x-4">
                <div className="bg-purple-500 text-white w-8 h-8 rounded-full flex items-center justify-center font-bold text-lg">
                  3
                </div>
                <div className="flex-1">
                  <h2 className="text-2xl font-semibold text-purple-900 mb-3">Оформите заказ</h2>
                  <p className="text-purple-800 mb-4">
                    Перейдите в корзину, проверьте состав заказа и нажмите "Оформить заказ". 
                    Заполните контактную информацию и выберите способ доставки.
                  </p>
                  <ul className="list-disc list-inside text-purple-700 space-y-1">
                    <li>Укажите ваши контактные данные</li>
                    <li>Выберите способ доставки</li>
                    <li>Выберите способ оплаты</li>
                    <li>Добавьте комментарий к заказу при необходимости</li>
                  </ul>
                </div>
              </div>
            </div>

            {/* Шаг 4 */}
            <div className="bg-orange-50 p-6 rounded-lg border-l-4 border-orange-500">
              <div className="flex items-start space-x-4">
                <div className="bg-orange-500 text-white w-8 h-8 rounded-full flex items-center justify-center font-bold text-lg">
                  4
                </div>
                <div className="flex-1">
                  <h2 className="text-2xl font-semibold text-orange-900 mb-3">Подтвердите заказ</h2>
                  <p className="text-orange-800 mb-4">
                    Проверьте все данные заказа и подтвердите его. 
                    После подтверждения вы получите SMS и email с деталями заказа.
                  </p>
                  <ul className="list-disc list-inside text-orange-700 space-y-1">
                    <li>Получите номер заказа</li>
                    <li>Сохраните контактные данные менеджера</li>
                    <li>Ожидайте звонка для подтверждения</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          {/* Дополнительная информация */}
          <div className="mt-12 bg-gray-50 p-8 rounded-lg">
            <h2 className="text-2xl font-semibold text-gray-900 mb-6">Полезная информация</h2>
            
            <div className="grid md:grid-cols-2 gap-6">
              <div>
                <h3 className="text-lg font-medium text-gray-900 mb-3">Способы оплаты</h3>
                <ul className="space-y-2 text-gray-700">
                  <li>• Наличными при получении</li>
                  <li>• Банковской картой онлайн</li>
                  <li>• Банковским переводом</li>
                  <li>• Через электронные кошельки</li>
                </ul>
              </div>
              
              <div>
                <h3 className="text-lg font-medium text-gray-900 mb-3">Время обработки</h3>
                <ul className="space-y-2 text-gray-700">
                  <li>• Обработка заказа: 1-2 часа</li>
                  <li>• Подтверждение: звонок менеджера</li>
                  <li>• Сборка заказа: 2-24 часа</li>
                  <li>• Уведомление о готовности к отправке</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Блок помощи */}
          <div className="mt-8 bg-gradient-to-r from-blue-500 to-purple-600 text-white p-8 rounded-lg text-center">
            <h2 className="text-2xl font-bold mb-4">Нужна помощь?</h2>
            <p className="text-lg mb-6">
              Наши специалисты готовы помочь вам с выбором и оформлением заказа
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a
                href="tel:+996555953475"
                className="bg-white text-blue-600 px-6 py-3 rounded-lg font-medium hover:bg-gray-100 transition-colors"
              >
                📞 +996 555 95 34 75
              </a>
              <a
                href="/contacts"
                className="bg-white/20 text-white px-6 py-3 rounded-lg font-medium hover:bg-white/30 transition-colors"
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