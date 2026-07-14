"""
Candidate 1 — ScraperHttpClient: a deep module that hides retry, UA rotation,
rate-limiting, and proxy support behind a single interface: get(url) → bytes.

Interface:
    get(url, *, timeout) → bytes
    get_soup(url, *, timeout) → BeautifulSoup

Adapters:
    ScraperHttpClient   — real HTTP (live network)
    InMemoryHttpClient  — test double (returns canned responses, no network)
"""

from __future__ import annotations

import random
import time
from dataclasses import dataclass, field
from typing import Protocol
from urllib.parse import urlparse

import requests
from bs4 import BeautifulSoup


# ═══════════════════════════════════════════════════════════════════════════════
# Configuration
# ═══════════════════════════════════════════════════════════════════════════════

USER_AGENTS: list[str] = [
    (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
    ),
    (
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
    ),
    (
        "Mozilla/5.0 (X11; Linux x86_64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
    ),
]

DEFAULT_MAX_RETRIES = 3
DEFAULT_BACKOFF_SECONDS = 1.5
DEFAULT_TIMEOUT = 25
DEFAULT_DELAY = 0.8
DEFAULT_MAX_REQUESTS_PER_SECOND = 2.0


# ═══════════════════════════════════════════════════════════════════════════════
# Interface
# ═══════════════════════════════════════════════════════════════════════════════


class HttpClientInterface(Protocol):
    """Interface that ScraperHttpClient and InMemoryHttpClient both satisfy."""

    def get(
        self,
        url: str,
        *,
        timeout: int = DEFAULT_TIMEOUT,
        referer: str | None = None,
    ) -> tuple[bytes, str]:
        """Return (body_bytes, content_type)."""

    def get_soup(
        self,
        url: str,
        *,
        timeout: int = DEFAULT_TIMEOUT,
    ) -> BeautifulSoup | None:
        """Return parsed HTML, or None on failure."""


# ═══════════════════════════════════════════════════════════════════════════════
# Implementation: Real HTTP client
# ═══════════════════════════════════════════════════════════════════════════════


@dataclass
class ScraperHttpClient:
    """
    Deep module: retry, UA rotation, rate-limiting, and proxy support
    live behind a one-method interface.

    Usage:
        client = ScraperHttpClient(delay=0.8, max_retries=3)
        body, ct = client.get("https://example.com/page")
        soup = client.get_soup("https://example.com/page")
    """

    delay: float = DEFAULT_DELAY
    max_retries: int = DEFAULT_MAX_RETRIES
    backoff: float = DEFAULT_BACKOFF_SECONDS
    timeout: int = DEFAULT_TIMEOUT
    user_agents: list[str] = field(default_factory=lambda: USER_AGENTS.copy())
    proxy: str | None = None

    # ---- internal state ----
    _last_request_time: float = field(default=0.0, init=False, repr=False)

    # ------------------------------------------------------------------
    # Public interface
    # ------------------------------------------------------------------

    def get(
        self,
        url: str,
        *,
        timeout: int | None = None,
        referer: str | None = None,
    ) -> tuple[bytes, str]:
        """
        Fetch *url*, returning (body_bytes, content_type).

        Retries on 5xx / connection errors with exponential backoff.
        Respects self.delay between requests to avoid rate-limiting.
        """
        timeout = timeout if timeout is not None else self.timeout
        self._respect_delay()

        headers = self._build_headers(referer)

        last_exc: Exception | None = None
        for attempt in range(1, self.max_retries + 1):
            try:
                resp = requests.get(
                    url,
                    headers=headers,
                    timeout=timeout,
                    proxies={"http": self.proxy, "https": self.proxy}
                    if self.proxy
                    else None,
                )
                resp.raise_for_status()
                content_type = resp.headers.get("content-type", "")
                return resp.content, content_type
            except requests.RequestException as exc:
                last_exc = exc
                if attempt < self.max_retries:
                    wait = self.backoff ** attempt
                    time.sleep(wait)
                    headers = self._build_headers(referer)  # rotate UA each attempt
        raise last_exc  # type: ignore[misc]

    def get_soup(
        self,
        url: str,
        *,
        timeout: int | None = None,
    ) -> BeautifulSoup | None:
        """Fetch *url* and return a BeautifulSoup parser, or None on failure."""
        try:
            body, _ = self.get(url, timeout=timeout)
            return BeautifulSoup(body, "html.parser")
        except requests.RequestException:
            return None

    # ------------------------------------------------------------------
    # Implementation helpers (not part of the interface)
    # ------------------------------------------------------------------

    def _build_headers(self, referer: str | None = None) -> dict[str, str]:
        headers: dict[str, str] = {
            "User-Agent": random.choice(self.user_agents),
            "Accept-Language": "en-US,en;q=0.9",
        }
        if referer:
            headers["Referer"] = referer
        return headers

    def _respect_delay(self) -> None:
        """Block until at least `self.delay` seconds have passed since the last request."""
        elapsed = time.monotonic() - self._last_request_time
        if elapsed < self.delay:
            time.sleep(self.delay - elapsed)
        self._last_request_time = time.monotonic()


# ═══════════════════════════════════════════════════════════════════════════════
# Adapter: In-memory test double
# ═══════════════════════════════════════════════════════════════════════════════


@dataclass
class InMemoryHttpClient:
    """
    Test double: returns canned HTML per URL.
    No network, no delay, fully deterministic.

    Usage:
        client = InMemoryHttpClient({
            "https://example.com/page": b"<html>...</html>",
        })
        body, ct = client.get("https://example.com/page")
    """

    pages: dict[str, bytes] = field(default_factory=dict)
    content_type: str = "text/html; charset=utf-8"

    def get(
        self,
        url: str,
        *,
        timeout: int = DEFAULT_TIMEOUT,
        referer: str | None = None,
    ) -> tuple[bytes, str]:
        body = self.pages.get(url)
        if body is None:
            raise requests.RequestException(f"URL not in canned pages: {url}")
        return body, self.content_type

    def get_soup(
        self,
        url: str,
        *,
        timeout: int = DEFAULT_TIMEOUT,
    ) -> BeautifulSoup | None:
        body = self.pages.get(url)
        if body is None:
            return None
        return BeautifulSoup(body, "html.parser")