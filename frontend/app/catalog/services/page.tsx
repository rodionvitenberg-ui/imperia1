import { fetchServices, ServiceItem } from '@/lib/api';
import Link from 'next/link';
import ServiceRequestForm from './ServiceRequestForm';

export const metadata = {
  title: 'Услуги и ремонт — Империя Электроники',
  description: 'Ремонт ПК и оргтехники, обслуживание, заправка картриджей в Караколе.',
};

export default async function ServicesPage() {
  const services = await fetchServices();

  const repairItems = services.filter((s) => s.category === 'repair');
  const maintenanceItems = services.filter((s) => s.category === 'maintenance');

  return (
    <div className="min-h-screen bg-white">
      {/* Хлебные крошки */}
      <div className="bg-white border-b border-[#e5e7eb] sticky top-16 z-40">
        <div className="max-w-[1400px] mx-auto px-5 py-3">
          <nav className="flex items-center gap-2 text-[14px] text-[#212121]">
            <Link href="/" className="hover:text-primary transition-colors">
              Главная
            </Link>
            <span className="text-[#bfbfbf]">/</span>
            <span className="font-medium">Услуги и ремонт</span>
          </nav>
        </div>
      </div>

      <div className="max-w-[1000px] mx-auto px-5 py-10">
        {/* Заголовок страницы */}
        <h1 className="text-[32px] leading-[38px] font-bold text-[#212121] mb-10">
          Услуги и ремонт
        </h1>

        {/* Секция: Ремонт ПК и оргтехники */}
        <section id="pc-repair" className="mb-14">
          <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-6 pb-3 border-b border-[#e5e7eb]">
            Ремонт ПК и оргтехники
          </h2>

          {repairItems.length === 0 ? (
            <p className="text-[14px] text-[#6b7280] py-6">
              В данный момент список услуг по ремонту пуст. Пожалуйста, свяжитесь с нами для уточнения.
            </p>
          ) : (
            <div className="border border-[#e5e7eb] rounded-[8px] overflow-hidden">
              {repairItems.map((item, idx) => (
                <ServiceRow key={item.id} item={item} isLast={idx === repairItems.length - 1} />
              ))}
            </div>
          )}
        </section>

        {/* Секция: Обслуживание */}
        <section id="maintenance" className="mb-14">
          <h2 className="text-[20px] leading-[24px] font-semibold text-[#212121] mb-6 pb-3 border-b border-[#e5e7eb]">
            Обслуживание
          </h2>

          {maintenanceItems.length === 0 ? (
            <p className="text-[14px] text-[#6b7280] py-6">
              В данный момент список услуг по обслуживанию пуст. Пожалуйста, свяжитесь с нами для уточнения.
            </p>
          ) : (
            <div className="border border-[#e5e7eb] rounded-[8px] overflow-hidden">
              {maintenanceItems.map((item, idx) => (
                <ServiceRow key={item.id} item={item} isLast={idx === maintenanceItems.length - 1} />
              ))}
            </div>
          )}
        </section>

        {/* Форма заявки */}
        <ServiceRequestForm />
      </div>
    </div>
  );
}

function ServiceRow({ item, isLast }: { item: ServiceItem; isLast: boolean }) {
  return (
    <div
      className={`flex items-center justify-between px-5 py-4 ${
        isLast ? '' : 'border-b border-[#e5e7eb]'
      }`}
    >
      <span className="text-[14px] text-[#212121]">{item.name}</span>
      <span className="text-[14px] font-bold text-[#212121] whitespace-nowrap ml-4">
        {Number(item.price).toLocaleString('ru-RU')} сом
      </span>
    </div>
  );
}