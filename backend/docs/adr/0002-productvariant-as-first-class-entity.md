# ADR-002: ProductVariant as a first-class entity

**Status:** Accepted
**Date:** 2026-07-07

## Context

Computer hardware products frequently come in multiple configurations:

- A laptop line (e.g., «ASUS ROG Zephyrus G14») available in 16GB/512GB, 32GB/1TB, and 32GB/2TB variants
- A monitor available in black/silver/white
- A keyboard available in different switch types

Each variant may have a different price, different stock levels, and slightly different attributes (e.g., the 32GB variant weighs more due to a larger cooling system).

The core question: should these variants be **separate Product rows** or a **first-class ProductVariant entity** under one Product?

## Decision

**We model ProductVariant as a first-class entity with a FK to Product.**

## Rationale

### Why not separate Products

1. **Loss of identity.** Search results would show «ASUS ROG 16GB» and «ASUS ROG 32GB» as two unrelated items. The user cannot see that these are the *same laptop* in different configurations.

2. **Broken filtering and comparison.** If each config is a separate Product, filtering by «RAM: 32GB» returns only that specific SKU. The user cannot navigate between configurations on the product detail page.

3. **SKU explosion in admin.** Managing 200 "products" that are actually 20 products × 10 configs each is a nightmare for catalog managers.

4. **SEO dilution.** Separate Product pages for each SKU dilute link equity. A single canonical Product page with variant switching concentrates SEO value.

### Why a separate entity, not just "more attributes"

Attributes alone cannot model:

- **Variant-specific pricing** (`price_override`)
- **Variant-specific stock** (the black model is out of stock, the silver is available)
- **Variant-specific images** (color swatches)
- **Variant-specific SKU** for inventory management

Embedding all of this into the Product via arrays or JSON would violate normalization and make stock queries impossible.

### Interface design (Codebase Design lens)

```
ProductVariant interface:
  ─ sku, name, price_override, is_active, sort_order
  └─ get_price() → self.price_override ?? self.product.price

Product interface (extended):
  ─ min_variant_price → MIN(variants.price_override) for active variants
  ─ has_variants → bool
```

This is a **deep module**: a single `get_price()` call hides the fallback logic. `min_variant_price` hides aggregate computation. Callers don't need to know whether a product has variants or not — they query `product.min_variant_price` uniformly.

### Seam placement

The seam is at `Product.variants` (related_name). Both product-level Stock and variant-level Stock share the same `Stock` model (nullable FK to Product or Variant). This is a **conditional seam** — one model serves two slots. Acceptable for now, but if Product-only and Variant-only stock logic diverges significantly, split into `ProductStock` and `VariantStock`.

## Alternatives considered

**Separate Product rows with a `parent_product` FK**
The inverse of our choice. Each SKU is its own Product, with an optional link to a "parent" grouping product. Rejected because:
- The "parent" product has no price, no stock, no SKU — it's a phantom entity
- Every query must filter out "parent" rows (`WHERE parent_product IS NULL` vs `WHERE parent_product IS NOT NULL`)
- Two different row types in the same table = constant conditional logic

**JSON field `configurations` on Product**
Rejected because you lose relational integrity (no FK from Stock, OrderItem, or Review to a specific config), and filtering/aggregation over nested JSON in PostgreSQL is painful.

## Consequences

- **OrderItem** currently references `Product`. It should eventually reference `ProductVariant` when a customer orders a specific configuration. (Phase 2)
- **Review** stays at the Product level — reviews are about the product line, not a specific SKU
- **Stock** can be product-level (for products without variants) or variant-level. The `unique_product_warehouse` and `unique_variant_warehouse` constraints enforce exclusivity
- **Filters** must consider variant prices when applying `min_price`/`max_price` — implemented via `Coalesce(Min(variants__price_override), price)` annotation