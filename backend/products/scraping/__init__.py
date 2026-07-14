"""
Scraping infrastructure for Imperia.

Layers (bottom-up):
  1. http_client  — ScraperHttpClient: retry, UA rotation, rate-limiting
  2. donor_site   — DonorSite interface + NeweggAdapter
  3. image_pipeline — ImagePipeline: download → validate → dedup → attach
"""

from .http_client import ScraperHttpClient, InMemoryHttpClient
from .donor_site import DonorSite, ProductRef, ProductDetails, NeweggAdapter
from .image_pipeline import ImagePipeline, ImageCandidate

__all__ = [
    "ScraperHttpClient",
    "InMemoryHttpClient",
    "DonorSite",
    "ProductRef",
    "ProductDetails",
    "NeweggAdapter",
    "ImagePipeline",
    "ImageCandidate",
]