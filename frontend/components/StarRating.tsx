// src/components/StarRating.tsx
import React from 'react';

interface StarRatingProps {
  rating?: number; // Средняя оценка (например, 4.2) - опционально
  reviewsCount?: number; // Количество отзывов - опционально
  size?: 'sm' | 'md' | 'lg'; // Размер звездочек
  showCount?: boolean; // Показывать ли количество отзывов
  interactive?: boolean; // Можно ли кликать по звездочкам
  onRatingClick?: (rating: number) => void; // Коллбэк при клике по конкретной звездочке
  disabled?: boolean; // Отключены ли звездочки (например, во время отправки)
}

const StarRating: React.FC<StarRatingProps> = ({ 
  rating = 0, // Значение по умолчанию
  reviewsCount = 0, // Значение по умолчанию
  size = 'sm', 
  showCount = true,
  interactive = false,
  onRatingClick,
  disabled = false
}) => {
  // Дополнительная защита от undefined/null значений
  const safeRating = rating || 0;
  const safeReviewsCount = reviewsCount || 0;
  // Размеры звездочек в зависимости от пропса size
  const starSize = {
    sm: 'w-3 h-3',
    md: 'w-4 h-4', 
    lg: 'w-5 h-5'
  }[size];

  const textSize = {
    sm: 'text-xs',
    md: 'text-sm',
    lg: 'text-base'
  }[size];

  // Обработчик клика по конкретной звездочке
  const handleStarClick = (starRating: number) => {
    if (interactive && !disabled && onRatingClick) {
      onRatingClick(starRating);
    }
  };

  // Если нет отзывов, показываем "Нет отзывов"
  if (safeReviewsCount === 0) {
    return (
      <div className="flex items-center gap-1">
        <div className="flex">
          {[1, 2, 3, 4, 5].map((star) => (
            <button
              key={star}
              type="button"
              onClick={() => handleStarClick(star)}
              disabled={!interactive || disabled}
              className={`${starSize} transition-all ${
                interactive && !disabled
                  ? 'cursor-pointer hover:scale-110 transform hover:text-yellow-400' 
                  : 'cursor-default'
              } ${ disabled ? 'opacity-50' : '' }`}
              title={interactive && !disabled ? `Оценить на ${star} звезд${star === 1 ? 'у' : star < 5 ? 'ы' : ''}` : undefined}
            >
              <svg
                className={`${starSize} text-gray-300 transition-colors`}
                fill="currentColor"
                viewBox="0 0 20 20"
              >
                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
              </svg>
            </button>
          ))}
        </div>
        {showCount && (
          <span className={`${textSize} text-gray-500`}>
            Нет отзывов
          </span>
        )}
      </div>
    );
  }

  // Рендерим звездочки с заливкой
  const renderStars = () => {
    const stars = [];

    // Рендерим 5 звездочек
    for (let i = 1; i <= 5; i++) {
      const isFilled = i <= Math.floor(safeRating);
      const isHalf = i === Math.ceil(safeRating) && safeRating % 1 !== 0;
      
      stars.push(
        <button
          key={i}
          type="button"
          onClick={() => handleStarClick(i)}
          disabled={!interactive || disabled}
          className={`${starSize} transition-all ${
            interactive && !disabled
              ? 'cursor-pointer hover:scale-110 transform hover:text-yellow-500' 
              : 'cursor-default'
          } ${ disabled ? 'opacity-50' : '' }`}
          title={interactive && !disabled ? `Оценить на ${i} звезд${i === 1 ? 'у' : i < 5 ? 'ы' : ''}` : undefined}
        >
          {isHalf ? (
            // Половинчатая звезда
            <div className={`relative ${starSize}`}>
              <svg
                className={`absolute ${starSize} text-gray-300`}
                fill="currentColor"
                viewBox="0 0 20 20"
              >
                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
              </svg>
              <div className="overflow-hidden" style={{ width: '50%' }}>
                <svg
                  className={`${starSize} text-yellow-400`}
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                </svg>
              </div>
            </div>
          ) : (
            // Обычная звезда
            <svg
              className={`${starSize} transition-colors ${
                isFilled ? 'text-yellow-400' : 'text-gray-300'
              }`}
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
            </svg>
          )}
        </button>
      );
    }

    return stars;
  };

  return (
    <div className="flex items-center gap-1">
      <div className="flex">
        {renderStars()}
      </div>
      {showCount && (
        <span className={`${textSize} text-gray-600`}>
          {safeRating.toFixed(1)} ({safeReviewsCount})
        </span>
      )}
    </div>
  );
};

export default StarRating;