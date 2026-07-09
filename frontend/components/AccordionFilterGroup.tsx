// src/components/AccordionFilterGroup.tsx
'use client';

import React, { useState, ReactNode } from 'react';

interface AccordionFilterGroupProps {
  title: string;
  children: ReactNode;
  startOpen?: boolean;
  variant?: 'default' | 'mobile';
}

const AccordionFilterGroup: React.FC<AccordionFilterGroupProps> = ({
  title,
  children,
  startOpen = true,
  variant = 'default',
}) => {
  const [isOpen, setIsOpen] = useState(startOpen);
  const isMobile = variant === 'mobile';

  const toggleOpen = () => setIsOpen(!isOpen);

  return (
    <div className={`${isMobile ? 'py-2' : 'py-4'} ${isMobile ? '' : 'border-t border-gray-200'}`}>
      {/* Кнопка-заголовок */}
      <button
        onClick={toggleOpen}
        className={`flex w-full items-center justify-between text-left focus:outline-none ${
          isMobile
            ? 'bg-transparent hover:bg-transparent active:bg-transparent'
            : ''
        }`}
        aria-expanded={isOpen}
      >
        <h4 className={`${isMobile ? 'text-sm font-semibold text-[#212121]' : 'font-semibold text-gray-800'}`}>{title}</h4>
        
        <svg
          xmlns="http://www.w3.org/2000/svg"
          className={`h-5 w-5 transform text-gray-400 transition-transform duration-200 ${
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

      {isOpen && <div className={isMobile ? 'mt-2' : 'mt-4'}>{children}</div>}
    </div>
  );
};

export default AccordionFilterGroup;