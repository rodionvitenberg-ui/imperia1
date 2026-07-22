"""
Signals for on-demand Next.js ISR revalidation.
Fires when catalog data changes in Django admin.
"""
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from .revalidation import revalidate_tag
from products.models import Category, Product, Brand, Attribute


@receiver([post_save, post_delete], sender=Category)
def revalidate_category(sender, **kwargs):
    revalidate_tag('categories')


@receiver([post_save, post_delete], sender=Product)
def revalidate_product(sender, **kwargs):
    revalidate_tag('products')


@receiver([post_save, post_delete], sender=Brand)
def revalidate_brand(sender, **kwargs):
    revalidate_tag('brands')


@receiver([post_save, post_delete], sender=Attribute)
def revalidate_attribute(sender, **kwargs):
    revalidate_tag('attributes')