// src/components/TopBar.tsx
import React from 'react';
import Link from 'next/link';

// Определяем типы
interface TopBarLink {
  name: string;
  href: string;
}
interface TopBarProps {
  links: TopBarLink[];
}

// 1. Компонент ПРИНИМАЕТ пропс 'links'
const TopBar = ({ links }: TopBarProps) => {
  return (
    <div className="hidden md:block bg-[#f5f5f5] border-b border-[#e5e7eb] px-6">
      <div className="container mx-auto flex h-8 justify-end">
        <ul className="flex items-center space-x-4 text-xs">
          {links.map((link, index) => (
            <li key={link.name} className="flex items-center">
              <Link href={link.href} className="text-[#212121] hover:text-primary">
                {link.name}
              </Link>
              {index < links.length - 1 && (
                <span className="ml-4 h-3 w-px bg-[#bfbfbf]"></span>
              )}
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default TopBar;