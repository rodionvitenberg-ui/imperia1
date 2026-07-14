"""
Candidate 3 — ImagePipeline: download → validate → deduplicate → attach.

Interface:
    ImagePipeline.download(url) → ImageCandidate | None
    ImagePipeline.attach_to_product(product, candidate) → ProductImage

A deep module: the caller only calls download() then attach_to_product().
Validation, checksum dedup, format preference, and resizing happen behind the interface.
"""

from __future__ import annotations

import hashlib
import io
from dataclasses import dataclass, field

from PIL import Image
from django.core.files.base import ContentFile

from products.models import Product, ProductImage
from .http_client import HttpClientInterface


# ═══════════════════════════════════════════════════════════════════════════════
# Configuration
# ═══════════════════════════════════════════════════════════════════════════════

MIN_IMAGE_WIDTH = 300  # px — minimum width to accept
MIN_IMAGE_SIZE = 20_000  # bytes — smaller is likely a thumbnail
MAX_IMAGES_PER_PRODUCT = 8


@dataclass
class ImageCandidate:
    """A downloaded image, validated and ready for attachment."""

    url: str
    content: bytes
    width: int
    height: int
    format: str  # "PNG", "JPEG", "WEBP"
    checksum: str  # MD5 hex digest for dedup
    content_type: str = ""


# ═══════════════════════════════════════════════════════════════════════════════
# ImagePipeline
# ═══════════════════════════════════════════════════════════════════════════════


@dataclass
class ImagePipeline:
    """
    Deep module for image scraping.

    Usage:
        pipeline = ImagePipeline(http_client)
        candidate = pipeline.download("https://example.com/img.jpg")
        if candidate:
            img = pipeline.attach_to_product(product, candidate, is_main=True)
    """

    http: HttpClientInterface
    min_width: int = MIN_IMAGE_WIDTH
    min_size: int = MIN_IMAGE_SIZE
    max_per_product: int = MAX_IMAGES_PER_PRODUCT

    # ---- dedup state ----
    _seen_checksums: set[str] = field(default_factory=set, init=False, repr=False)

    # ------------------------------------------------------------------
    # Public interface
    # ------------------------------------------------------------------

    def download(
        self,
        url: str,
        *,
        referer: str | None = None,
        timeout: int = 25,
    ) -> ImageCandidate | None:
        """
        Download and validate an image from *url*.

        Returns an ImageCandidate if the image meets quality thresholds
        (min width, min size). Returns None if:
        - HTTP request fails
        - Content is too small / too narrow
        - PIL cannot decode the image
        """
        try:
            body, content_type = self.http.get(
                url, timeout=timeout, referer=referer
            )
        except Exception:
            return None

        # Size check
        if len(body) < self.min_size:
            return None

        # Decode with PIL
        try:
            img = Image.open(io.BytesIO(body))
        except Exception:
            return None

        if img.width < self.min_width:
            return None

        # Determine format
        fmt = (img.format or "JPEG").upper()
        checksum = hashlib.md5(body).hexdigest()

        return ImageCandidate(
            url=url,
            content=body,
            width=img.width,
            height=img.height,
            format=fmt,
            checksum=checksum,
            content_type=content_type,
        )

    def attach_to_product(
        self,
        product: Product,
        candidate: ImageCandidate,
        *,
        is_main: bool = False,
        sort_order: int | None = None,
    ) -> ProductImage | None:
        """
        Attach a validated ImageCandidate to a Product as a ProductImage.

        Skips if the MD5 checksum has already been attached to this product
        (deduplication). Returns the created ProductImage, or None if skipped.

        The *sort_order* defaults to the current number of images for the product.
        """
        # Dedup by checksum
        dedup_key = f"{product.pk}:{candidate.checksum}"
        if dedup_key in self._seen_checksums:
            return None

        # Count existing images for this product
        count = product.images.count()
        if count >= self.max_per_product:
            return None

        if sort_order is None:
            sort_order = count

        ext = ".webp" if candidate.format == "WEBP" else ".png" if candidate.format == "PNG" else ".jpg"
        file_name = f"{product.slug}_{sort_order}{ext}"

        obj = ProductImage.objects.create(
            product=product,
            image=ContentFile(candidate.content, name=file_name),
            is_main=is_main,
            image_type="main" if is_main else "gallery",
            alt_text=product.name,
            sort_order=sort_order,
        )

        self._seen_checksums.add(dedup_key)
        return obj

    def reset_dedup(self) -> None:
        """Clear the internal checksum cache (useful between test cases)."""
        self._seen_checksums.clear()