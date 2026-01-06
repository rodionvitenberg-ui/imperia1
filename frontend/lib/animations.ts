// src/lib/animations.ts
/**
 * Централизованные настройки анимации для всех dropdown и модальных компонентов
 * Обеспечивает единообразную скорость и стиль анимации по всему приложению
 */

// Единые настройки времени и кривых анимации
export const ANIMATION_CONFIG = {
  // Основные тайминги
  duration: 0.25,  // Более быстрая анимация (было 0.3)
  staggerDelay: 0.08,  // Задержка между дочерними элементами (было 0.1 и 0.3)
  
  // Стандартная кривая анимации для всех компонентов
  ease: [0.25, 0.46, 0.45, 0.94] as const,  // easeOutQuart - более плавная
  
  // Альтернативная кривая для быстрых переходов
  easeQuick: [0.4, 0, 0.2, 1] as const,  // Material Design easing
} as const;

// Варианты анимации для dropdown панелей (мегаменю, корзина, избранное, поиск)
export const dropdownPanelVariants = {
  hidden: {
    height: 0,
    opacity: 0,
    transition: {
      duration: ANIMATION_CONFIG.duration,
      ease: ANIMATION_CONFIG.ease,
    }
  },
  visible: {
    height: 'auto',
    opacity: 1,
    transition: {
      duration: ANIMATION_CONFIG.duration,
      ease: ANIMATION_CONFIG.ease,
      staggerChildren: ANIMATION_CONFIG.staggerDelay,
    }
  }
};

// Варианты анимации для контента внутри dropdown'ов
export const dropdownContentVariants = {
  hidden: {
    opacity: 0,
    y: -10,  // Уменьшаем смещение для более мягкой анимации
  },
  visible: {
    opacity: 1,
    y: 0,
    transition: {
      duration: ANIMATION_CONFIG.duration,
      ease: ANIMATION_CONFIG.ease,
    }
  }
};

// Варианты анимации для модальных окон
export const modalVariants = {
  hidden: {
    opacity: 0,
    scale: 0.95,
    transition: {
      duration: ANIMATION_CONFIG.duration,
      ease: ANIMATION_CONFIG.ease,
    }
  },
  visible: {
    opacity: 1,
    scale: 1,
    transition: {
      duration: ANIMATION_CONFIG.duration,
      ease: ANIMATION_CONFIG.ease,
    }
  }
};

// Варианты анимации для backdrop модальных окон
export const backdropVariants = {
  hidden: {
    opacity: 0,
    transition: {
      duration: ANIMATION_CONFIG.duration,
      ease: ANIMATION_CONFIG.ease,
    }
  },
  visible: {
    opacity: 1,
    transition: {
      duration: ANIMATION_CONFIG.duration,
      ease: ANIMATION_CONFIG.ease,
    }
  }
};

// Варианты анимации для элементов списка (товары в dropdown'ах)
export const listItemVariants = {
  hidden: {
    opacity: 0,
    x: -10,
  },
  visible: {
    opacity: 1,
    x: 0,
    transition: {
      duration: ANIMATION_CONFIG.duration * 0.8,  // Чуть быстрее основной анимации
      ease: ANIMATION_CONFIG.ease,
    }
  }
};

// Хук для hover эффектов с едиными настройками
export const hoverTransition = {
  duration: 0.15,  // Быстрые hover эффекты
  ease: ANIMATION_CONFIG.easeQuick,
};

// Логирование настроек в development режиме
if (process.env.NODE_ENV === 'development') {
  console.log('🎭 Animation config loaded:', {
    duration: ANIMATION_CONFIG.duration,
    staggerDelay: ANIMATION_CONFIG.staggerDelay,
    ease: ANIMATION_CONFIG.ease,
  });
}