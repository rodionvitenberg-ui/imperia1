// src/components/AccordionFilterGroup.tsx
'use client';

import React, { useState, ReactNode } from 'react';

interface AccordionFilterGroupProps {
  title: string;
  children: ReactNode;
  startOpen?: boolean; // Необязательный пропс, чтобы задать начальное состояние
}

const AccordionFilterGroup: React.FC<AccordionFilterGroupProps> = ({
  title,
  children,
  startOpen = true, // По умолчанию секция будет открыта
}) => {
  const [isOpen, setIsOpen] = useState(startOpen);

  const toggleOpen = () => setIsOpen(!isOpen);

  return (
    <div className="border-t border-gray-200 py-4">
      {/* Кнопка-заголовок для управления состоянием */}
      <button
        onClick={toggleOpen}
        className="flex w-full items-center justify-between text-left focus:outline-none"
        aria-expanded={isOpen}
      >
        <h4 className="font-semibold text-gray-800">{title}</h4>
        
        {/* Иконка-стрелочка (шеврон) */}
        <svg
          xmlns="http://www.w3.org/2000/svg"
          className={`h-5 w-5 transform text-gray-500 transition-transform duration-200 ${
            isOpen ? '' : '-rotate-90'
          }`}
          viewBox="0 0 20 20"
          fill="currentColor"
        >
          <path
            fillRule="evenodd"
            d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
            clipRule="evenodd"
          />
        </svg>
      </button>

      {/* Контент, который будет показываться или скрываться */}
      {isOpen && <div className="mt-4">{children}</div>}
    </div>
  );
};

export default AccordionFilterGroup;