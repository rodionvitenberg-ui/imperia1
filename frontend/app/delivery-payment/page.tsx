// src/app/delivery-payment/page.tsx
import React from 'react';

export const metadata = {
  title: 'Доставка и оплата — Империя Электроники',
  description:
    'Условия доставки и оплаты интернет-магазина Империя Электроники в Караколе. Бесплатная доставка, наличный и безналичный расчёт.',
};

const faqStructuredData = {
  '@context': 'https://schema.org',
  '@type': 'FAQPage',
  mainEntity: [
    {
      '@type': 'Question',
      name: 'Как осуществляется доставка?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'Доставка осуществляется по Караколу собственной курьерской службой. В пригород и регионы — через транспортные компании. Самовывоз из магазина по адресу ул. Гагарина, 28.',
      },
    },
    {
      '@type': 'Question',
      name: 'Сколько стоит доставка?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'По Караколу доставка бесплатна при заказе от 10 000 сом. При заказе до 10 000 сом стоимость доставки 200 сом. Доставка в регионы рассчитывается индивидуально.',
      },
    },
    {
      '@type': 'Question',
      name: 'Какие способы оплаты доступны?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'Наличными при получении, банковской картой онлайн (Visa, Mastercard, Элкарт), переводом на расчётный счёт для юридических лиц.',
      },
    },
    {
      '@type': 'Question',
      name: 'Как долго собирается и доставляется заказ?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'Сборка заказа занимает от 2 до 24 часов. Доставка по Караколу осуществляется в день готовности заказа. В пригород — на следующий день.',
      },
    },
  ],
};

export default function DeliveryPaymentPage() {
  return (
    <div className="max-w-[1400px] mx-auto px-5 py-12 md:py-16">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(faqStructuredData),
        }}
      />
      <div className="max-w-4xl mx-auto">
        <h1
          className="text-[24px] md:text-[32px] leading-[34px] md:leading-[38px] font-bold text-[#212121] mb-8"
          style={{ fontFamily: 'var(--font-display)' }}
        >
          Доставка и оплата
        </h1>

        <div
          className="space-y-8 text-[14px] leading-[22px] text-[#212121]"
          style={{ fontFamily: 'Open Sans, sans-serif, Helvetica, Arial' }}
        >
          {/* Доставка */}
          <section>
            <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-4">
              Доставка
            </h2>

            <div className="space-y-4">
              <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
                <h3 className="font-bold text-[#212121] mb-2">📍 Доставка по Караколу</h3>
                <p className="text-gray-600">
                  Бесплатно при заказе от 10 000 сом. При заказе до 10 000 сом — 200 сом.
                  Доставка осуществляется собственной курьерской службой в день готовности заказа.
                </p>
              </div>

              <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
                <h3 className="font-bold text-[#212121] mb-2">🚚 Доставка в регионы</h3>
                <p className="text-gray-600">
                  Отправляем через транспортные компании. Стоимость рассчитывается индивидуально
                  и зависит от веса и габаритов заказа. Свяжитесь с нами для уточнения деталей.
                </p>
              </div>

              <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
                <h3 className="font-bold text-[#212121] mb-2">🏪 Самовывоз</h3>
                <p className="text-gray-600">
                  Вы можете самостоятельно забрать заказ из магазина по адресу:{' '}
                  <strong>г. Каракол, ул. Гагарина, 28</strong>.
                  Самовывоз возможен в рабочее время: Пн–Пт 9:00–17:00, Сб 9:00–12:00.
                </p>
              </div>
            </div>
          </section>

          {/* Оплата */}
          <section>
            <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-4">
              Оплата
            </h2>

            <div className="space-y-4">
              <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
                <h3 className="font-bold text-[#212121] mb-2">💵 Наличные</h3>
                <p className="text-gray-600">
                  Оплата наличными курьеру при получении или в магазине при самовывозе.
                  Удобный способ без комиссии.
                </p>
              </div>

              <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
                <h3 className="font-bold text-[#212121] mb-2">💳 Банковская карта онлайн</h3>
                <p className="text-gray-600">
                  Оплата банковской картой (Visa, Mastercard, Элкарт) через защищённый
                  платёжный шлюз. Безопасно и быстро.
                </p>
              </div>

              <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
                <h3 className="font-bold text-[#212121] mb-2">🏦 Безналичный расчёт</h3>
                <p className="text-gray-600">
                  Для юридических лиц — оплата на расчётный счёт. Предоставляем все закрывающие
                  документы. Свяжитесь с нами для выставления счёта.
                </p>
              </div>
            </div>
          </section>

          {/* Сроки */}
          <section>
            <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-4">
              Сроки выполнения заказа
            </h2>
            <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
              <ul className="space-y-2">
                <li><strong>Обработка заказа:</strong> 1–2 часа</li>
                <li><strong>Подтверждение:</strong> звонок менеджера для согласования</li>
                <li><strong>Сборка:</strong> от 2 до 24 часов</li>
                <li><strong>Доставка по Караколу:</strong> в день готовности</li>
              </ul>
            </div>
          </section>

          {/* Гарантия */}
          <section>
            <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-4">
              Гарантия и возврат
            </h2>
            <div className="p-6 rounded-[8px] border border-[#e5e7eb] bg-[#f8f9fb]">
              <p className="text-gray-600 mb-3">
                На все товары предоставляется официальная гарантия производителя — от 1 до 2 лет
                в зависимости от категории товара. Гарантийное обслуживание осуществляется в
                нашем сервис-центре.
              </p>
              <p className="text-gray-600">
                Возврат товара осуществляется в соответствии с законодательством Кыргызской
                Республики. В течение 14 дней с момента покупки вы можете вернуть товар
                надлежащего качества, если он не был в употреблении.
              </p>
            </div>
          </section>

          {/* CTA */}
          <div className="mt-10 p-8 rounded-[8px] bg-[#1061cd] text-white text-center">
            <h2 className="text-[20px] font-bold mb-3">Остались вопросы?</h2>
            <p className="text-white/80 mb-6 max-w-md mx-auto">
              Свяжитесь с нами любым удобным способом — мы подробно ответим на все вопросы
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a
                href="tel:+996555953475"
                className="inline-flex items-center justify-center rounded-full bg-white px-6 py-3 text-sm font-bold text-[#1061cd] hover:bg-gray-100 transition-colors"
              >
                +996 555 95 34 75
              </a>
              <a
                href="/contacts"
                className="inline-flex items-center justify-center rounded-full border border-white/30 bg-white/10 px-6 py-3 text-sm font-bold text-white hover:bg-white/20 transition-colors"
              >
                Написать нам
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}