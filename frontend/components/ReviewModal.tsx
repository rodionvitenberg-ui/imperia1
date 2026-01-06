// src/components/ReviewModal.tsx
'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import InteractiveStarRating from './InteractiveStarRating';
import { Product } from '@/lib/api';
import { useAuth } from '@/contexts/AuthContext';
import { API_CONFIG } from '@/lib/config';

interface ReviewModalProps {
  isOpen: boolean;
  onClose: () => void;
  product: Product;
  onSubmit: (rating: number) => Promise<void>;
}

const ReviewModal: React.FC<ReviewModalProps> = ({ 
  isOpen, 
  onClose, 
  product, 
  onSubmit 
}) => {
  const [rating, setRating] = useState(0);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const { user } = useAuth();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (rating === 0) {
      alert('Пожалуйста, выберите оценку');
      return;
    }

    if (!user) {
      alert('Для оставления отзыва необходимо войти в систему');
      return;
    }

    setIsSubmitting(true);
    
    try {
      await onSubmit(rating);
      setRating(0);
      onClose();
    } catch (error) {
      console.error('Ошибка при отправке отзыва:', error);
      alert('Произошла ошибка при отправке отзыва');
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleClose = () => {
    setRating(0);
    onClose();
  };

  if (!isOpen) return null;

  return (
    <AnimatePresence>
      <div className="fixed inset-0 z-50 flex items-center justify-center">
        {/* Backdrop */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="absolute inset-0 bg-black bg-opacity-50"
          onClick={handleClose}
        />
        
        {/* Modal */}
        <motion.div
          initial={{ opacity: 0, scale: 0.95, y: 20 }}
          animate={{ opacity: 1, scale: 1, y: 0 }}
          exit={{ opacity: 0, scale: 0.95, y: 20 }}
          className="relative bg-white rounded-lg shadow-xl p-6 w-full max-w-md mx-4"
        >
          {/* Header */}
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900">
              Оценить товар
            </h3>
            <button
              onClick={handleClose}
              className="text-gray-400 hover:text-gray-600 transition-colors"
            >
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          {/* Product Info */}
          <div className="mb-6">
            <div className="flex items-center gap-3 mb-4">
              {product.images && product.images.length > 0 && (
                <img
                  src={API_CONFIG.MEDIA.buildImageUrl(product.images.find(img => img.is_main)?.image || product.images[0]?.image || '')}
                  alt={product.name}
                  className="w-12 h-12 object-cover rounded"
                />
              )}
              <div>
                <h4 className="font-medium text-gray-900">{product.name}</h4>
                <p className="text-sm text-gray-500">{Number(product.price).toLocaleString()} сом</p>
              </div>
            </div>
          </div>

          {/* Rating Form */}
          <form onSubmit={handleSubmit}>
            <div className="mb-6">
              <label className="block text-sm font-medium text-gray-700 mb-3">
                Ваша оценка
              </label>
              <InteractiveStarRating
                onRate={setRating}
                currentRating={rating}
                size="lg"
                disabled={isSubmitting}
              />
            </div>

            {/* Auth Warning */}
            {!user && (
              <div className="mb-4 p-3 bg-yellow-50 border border-yellow-200 rounded">
                <p className="text-sm text-yellow-800">
                  Для оставления отзыва необходимо <button type="button" className="underline">войти в систему</button>
                </p>
              </div>
            )}

            {/* Submit Button */}
            <div className="flex justify-end gap-3">
              <button
                type="button"
                onClick={handleClose}
                className="px-4 py-2 text-sm text-gray-700 bg-gray-100 hover:bg-gray-200 rounded transition-colors"
                disabled={isSubmitting}
              >
                Отмена
              </button>
              <button
                type="submit"
                className="px-4 py-2 text-sm text-white bg-blue-600 hover:bg-blue-700 rounded transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={isSubmitting || !user || rating === 0}
              >
                {isSubmitting ? 'Отправка...' : 'Оставить отзыв'}
              </button>
            </div>
          </form>
        </motion.div>
      </div>
    </AnimatePresence>
  );
};

export default ReviewModal;