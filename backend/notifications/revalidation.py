"""
On-demand Next.js ISR revalidation via HTTP.
Sends a POST request to Next.js /revalidate endpoint when Django data changes.
"""
import logging
import requests
from django.conf import settings

logger = logging.getLogger(__name__)


def revalidate_tag(tag: str):
    """Invalidate Next.js cache for a given tag."""
    nextjs_url = getattr(settings, 'NEXTJS_URL', 'http://localhost:3000')
    secret = getattr(settings, 'REVALIDATION_SECRET', '')
    url = f"{nextjs_url}/revalidate"

    try:
        response = requests.post(
            url,
            json={'tag': tag},
            headers={'x-revalidation-secret': secret},
            timeout=2,
        )
        if response.status_code == 200:
            logger.info(f"✅ Revalidation triggered for tag '{tag}' — {response.status_code}")
        else:
            logger.warning(f"⚠️ Revalidation returned {response.status_code} for tag '{tag}': {response.text}")
    except requests.RequestException as e:
        logger.error(f"❌ Revalidation request failed for tag '{tag}': {e}")