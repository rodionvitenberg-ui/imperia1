from django import template
from products.models import AdminSection

register = template.Library()


@register.simple_tag(takes_context=True)
def get_visible_sections(context, user):
    """
    Returns a dict of section_key -> is_visible for the given user.
    Superusers see sections where is_visible=True.
    Regular staff users see sections where is_visible_by_default=True.
    """
    qs = AdminSection.objects.all()
    result = {}
    for section in qs:
        if user.is_superuser:
            result[section.key] = section.is_visible
        else:
            result[section.key] = section.is_visible_by_default
    return result


@register.simple_tag
def get_section_visibility(sections, key):
    """Returns whether a specific section key is visible in the sections dict."""
    return sections.get(key, False)