"""
Генерация человекочитаемых номеров заказа: «Айбек-1», «Айбек-2», …
Счётчик общий по первому слову имени (без учёта регистра).
"""
from __future__ import annotations

import re
from typing import Optional

from django.db.models.functions import Lower

# Буквы (в т.ч. кириллица), цифры, дефис внутри токена
_TOKEN_CLEAN_RE = re.compile(r'[^\w\-]+', re.UNICODE)
_SEQ_TAIL_RE = re.compile(r'-(\d+)$')


def extract_name_token(first_name: Optional[str]) -> str:
    """Первое слово имени; fallback «Гость»."""
    raw = (first_name or '').strip()
    if not raw:
        return 'Гость'
    word = raw.split()[0]
    cleaned = _TOKEN_CLEAN_RE.sub('', word)
    if not cleaned:
        return 'Гость'
    # max_length order_number=50 → token + '-' + digits
    return cleaned[:40]


def next_sequence_for_token(token: str) -> int:
    """
    Максимальный N среди order_number вида «token-N» (case-insensitive) + 1.
    """
    from .models import Order

    prefix_lower = f'{token.casefold()}-'
    candidates = (
        Order.objects.annotate(_on_lower=Lower('order_number'))
        .filter(_on_lower__startswith=prefix_lower)
        .values_list('order_number', flat=True)
    )

    max_n = 0
    token_lower = token.casefold()
    for number in candidates:
        if not number:
            continue
        m = _SEQ_TAIL_RE.search(number)
        if not m:
            continue
        base = number[: m.start()]
        if base.casefold() != token_lower:
            continue
        try:
            n = int(m.group(1))
        except ValueError:
            continue
        if n > max_n:
            max_n = n

    return max_n + 1


def generate_order_number(first_name: Optional[str]) -> str:
    """Собрать следующий номер: {token}-{N}."""
    token = extract_name_token(first_name)
    n = next_sequence_for_token(token)
    return f'{token}-{n}'


def mask_phone(phone: Optional[str], visible_digits: int = 5) -> str:
    """
    Публичная маска телефона: первые visible_digits цифр + «•».
    Полный номер на фронт не отдаём.
    """
    digits = ''.join(c for c in (phone or '') if c.isdigit())
    if not digits:
        return ''
    show = digits[:visible_digits]
    rest = max(0, len(digits) - visible_digits)
    return show + ('•' * min(rest, 8))
