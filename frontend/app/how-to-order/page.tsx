// src/app/how-to-order/page.tsx
import React from 'react';

export const metadata = {
  title: 'Как сделать заказ - Империя Электроники',
  description: 'Пошаговая инструкция как оформить заказ в интернет-магазине Империя Электроники',
};

export default function HowToOrderPage() {
  const faqStructuredData = {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "Как выбрать товары в интернет-магазине?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Используйте поиск или навигацию по категориям, чтобы найти нужные товары. Ознакомьтесь с характеристиками, используйте фильтры для быстрого поиска и сравнивайте товары между собой."
        }
      },
      {
        "@type": "Question",
        "name": "Как добавить товар в корзину?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Нажмите кнопку «Добавить в корзину» на странице товара. Вы можете продолжить покупки или перейти к оформлению заказа. Выберите количество товара и проверьте выбранную конфигурацию."
        }
      },
      {
        "@type": "Question",
        "name": "Как оформить заказ в интернет-магазине?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Перейдите в корзину, проверьте состав заказа и нажмите «Оформить заказ». Заполните контактную информацию, выберите способ доставки и добавьте комментарий к заказу при необходимости."
        }
      },
      {
        "@type": "Question",
        "name": "Как подтверждается заказ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Проверьте все данные заказа и подтвердите его. После подтверждения с вами свяжется наш менеджер для финального согласования — обсудит детали, уточнит способ оплаты и ответит на вопросы."
        }
      },
      {
        "@type": "Question",
        "name": "Какие способы оплаты доступны?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Вы можете оплатить наличными при получении, перевести банковской картой онлайн или через электронные кошельки."
        }
      },
      {
        "@type": "Question",
        "name": "Сколько времени занимает обработка заказа?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Обработка заказа занимает 1–2 часа. После этого вам позвонит менеджер для подтверждения. Сборка заказа занимает от 2 до 24 часов. Вы получите уведомление о готовности к отправке."
        }
      }
    ]
  };

  return (
    <div className="max-w-[1400px] mx-auto px-5 py-12 md:py-16">
      {/* Структурированные данные FAQPage для поисковых систем и AI */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(faqStructuredData),
        }}
      />
      <div className="max-w-4xl mx-auto">
        <h1 className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-8" style={{ fontFamily: 'var(--font-display)' }}>
          Как сделать заказ
        </h1>

        <p className="text-[16px] leading-[24px] text-gray-500 mb-12" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
          Оформить заказ в нашем интернет-магазине очень просто! Следуйте пошаговой инструкции ниже.
        </p>

        <div className="space-y-10">
          {/* Шаг 1 */}
          <div className="p-6 md:p-8 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
            <div className="flex items-start gap-5">
              <div className="w-9 h-9 shrink-0 rounded-full bg-[#1061cd] flex items-center justify-center text-sm font-bold text-white" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                1
              </div>
              <div className="flex-1 min-w-0">
                <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-3" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Выберите товары
                </h2>
                <p className="text-[14px] leading-[20px] text-gray-500 mb-4" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Найдите нужные товары, используя поиск или навигацию по категориям.
                  Ознакомьтесь с характеристиками товаров.
                </p>
                <ul className="space-y-1" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Используйте фильтры для быстрого поиска</li>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Сравнивайте характеристики товаров</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Шаг 2 */}
          <div className="p-6 md:p-8 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
            <div className="flex items-start gap-5">
              <div className="w-9 h-9 shrink-0 rounded-full bg-[#1061cd] flex items-center justify-center text-sm font-bold text-white" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                2
              </div>
              <div className="flex-1 min-w-0">
                <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-3" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Добавьте в корзину
                </h2>
                <p className="text-[14px] leading-[20px] text-gray-500 mb-4" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Нажмите кнопку «Добавить в корзину» на странице товара.
                  Вы можете продолжить покупки или перейти к оформлению заказа.
                </p>
                <ul className="space-y-1" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Выберите количество товара</li>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Проверьте выбранную конфигурацию</li>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Добавьте сопутствующие товары при необходимости</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Шаг 3 */}
          <div className="p-6 md:p-8 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
            <div className="flex items-start gap-5">
              <div className="w-9 h-9 shrink-0 rounded-full bg-[#1061cd] flex items-center justify-center text-sm font-bold text-white" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                3
              </div>
              <div className="flex-1 min-w-0">
                <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-3" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Оформите заказ
                </h2>
                <p className="text-[14px] leading-[20px] text-gray-500 mb-4" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Перейдите в корзину, проверьте состав заказа и нажмите «Оформить заказ».
                  Заполните контактную информацию и выберите способ доставки.
                </p>
                <ul className="space-y-1" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Укажите ваши контактные данные</li>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Выберите способ доставки</li>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Добавьте комментарий к заказу при необходимости</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Шаг 4 */}
          <div className="p-6 md:p-8 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
            <div className="flex items-start gap-5">
              <div className="w-9 h-9 shrink-0 rounded-full bg-[#1061cd] flex items-center justify-center text-sm font-bold text-white" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                4
              </div>
              <div className="flex-1 min-w-0">
                <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-3" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Подтвердите заказ
                </h2>
                <p className="text-[14px] leading-[20px] text-gray-500 mb-4" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  Проверьте все данные заказа и подтвердите его. После подтверждения с вами свяжется наш менеджер для финального согласования — обсудит детали, уточнит способ оплаты и ответит на вопросы.
                </p>
                <ul className="space-y-1" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Получите номер заказа</li>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Ожидайте звонка менеджера для подтверждения</li>
                  <li className="text-[14px] leading-[20px] text-gray-600">— Согласуйте способ оплаты и доставку</li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        {/* Полезная информация */}
        <div className="mt-16 p-6 md:p-8 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
          <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-6" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
            Полезная информация
          </h2>

          <div className="grid md:grid-cols-2 gap-8">
            <div>
              <h3 className="text-[14px] leading-[20px] font-bold text-[#1061cd] mb-4 uppercase tracking-[0.1em]" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                Способы оплаты
              </h3>
              <ul className="space-y-2" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                <li className="text-[14px] leading-[20px] text-[#212121]">— Наличными при получении</li>
                <li className="text-[14px] leading-[20px] text-[#212121]">— Переводом банковской картой онлайн</li>
                <li className="text-[14px] leading-[20px] text-[#212121]">— Через электронные кошельки</li>
              </ul>
            </div>

            <div>
              <h3 className="text-[14px] leading-[20px] font-bold text-[#1061cd] mb-4 uppercase tracking-[0.1em]" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                Время обработки
              </h3>
              <ul className="space-y-2" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
                <li className="text-[14px] leading-[20px] text-[#212121]">— Обработка заказа: 1–2 часа</li>
                <li className="text-[14px] leading-[20px] text-[#212121]">— Подтверждение: звонок менеджера</li>
                <li className="text-[14px] leading-[20px] text-[#212121]">— Сборка заказа: 2–24 часа</li>
                <li className="text-[14px] leading-[20px] text-[#212121]">— Уведомление о готовности к отправке</li>
              </ul>
            </div>
          </div>
        </div>

        {/* Блок помощи */}
        <div className="mt-10 p-8 md:p-10 rounded-[8px] bg-[#1061cd] text-white text-center">
          <h2 className="text-[20px] md:text-[24px] leading-[28px] font-bold mb-4" style={{ fontFamily: 'var(--font-display)' }}>
            Нужна помощь?
          </h2>
          <p className="text-[14px] md:text-[16px] leading-[22px] text-white/80 mb-6 max-w-md mx-auto" style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}>
            Наши специалисты готовы помочь вам с выбором и оформлением заказа
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="tel:+996555953475"
              className="inline-flex items-center justify-center rounded-full bg-white px-6 py-3 text-sm font-bold text-[#1061cd] hover:bg-gray-100 transition-colors"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              +996 555 95 34 75
            </a>
            <a
              href="/contacts"
              className="inline-flex items-center justify-center rounded-full border border-white/30 bg-white/10 px-6 py-3 text-sm font-bold text-white hover:bg-white/20 transition-colors"
              style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
            >
              Написать нам
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}