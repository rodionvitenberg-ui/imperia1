# Domain Glossary — Imperia Hardware E-Commerce

This glossary defines the ubiquitous language for the Imperia backend. Every term here has exactly one meaning; if you find yourself using a term differently, update this file.

---

## Core Domain

**Product (Товар)**
A catalog item representing a distinct product line, e.g., «Ноутбук ASUS ROG Zephyrus G14». A Product has a **base price**, which serves as the fallback when no Variant overrides it. A Product may or may not have Variants.

**Variant (Вариант товара)**
A specific configuration of a Product, identified by a unique **SKU**. A Variant can override the base price (`price_override`), carry its own Stock records, and have its own Attributes (e.g., «16GB / 512GB SSD, Чёрный» vs «32GB / 1TB SSD, Серый»). A Variant belongs to exactly one Product.

**Effective Price (Эффективная цена)**
The price a customer actually pays. Computed as `variant.price_override ?? product.price`. For listing purposes, `Product.min_variant_price` returns the minimum effective price across all active Variants.

**Featured Product (Популярный товар)**
A product flagged for promotion on the homepage or category pages. Stored as `Product.is_favorite` (historical name — to be renamed to `is_featured`). Not to be confused with Wishlist («избранное»).

**Wishlist (Избранное)**
A per-user collection of saved products (not yet implemented — planned for Phase 3). Distinct from Featured.

---

## Attributes

**Attribute (Атрибут / Характеристика)**
A named characteristic from the shared reference dictionary, e.g., «Диагональ экрана», «Тип матрицы», «Объём VRAM». Every Attribute has a **type**: `str`, `int`, `bool`, or `enum`. Attributes of type `enum` must specify `enum_options` (a JSON array of allowed values).

**ProductAttribute (Значение атрибута)**
A concrete value binding an Attribute to a Product or Variant. Stores the typed value in the appropriate column (`value_str`, `value_int`, `value_bool`, `value_enum`) based on `Attribute.type`. Callers should use `get_display_value()` for human-readable output and `set_typed_value()` for writing.

**Category Attribute (Атрибут категории)**
A many-to-many link between Category and Attribute, defining which Attributes are relevant, filterable, and/or required for products in that category.

---

## Inventory

**Stock (Складской остаток)**
A record of how many units of a Product or Variant are physically present at a specific **warehouse**. Tracks `quantity` (total on shelf) and `reserved` (held for pending orders).

**Available (Доступно)**
Computed as `max(0, quantity - reserved)`. The number of units a customer can actually order right now.

**In Stock (В наличии)**
Boolean: `available > 0`. Used for filtering and display.

**Warehouse (Склад)**
A named location identifier, e.g., `default`, `msk`, `spb`. Each Stock record is unique per (product, warehouse) or (variant, warehouse).

---

## Orders

**Order (Заказ)**
A customer's purchase. Has a lifecycle **status** (`pending → confirmed → shipped → delivered → cancelled`), a unique `order_number`, contact/delivery fields, and a list of **OrderItems**.

**OrderItem (Позиция заказа)**
A line in an Order: which Product, at what quantity, at what price-per-unit at the time of purchase. `total_price = quantity × price`.

**Order Status History**
A chronological log of status transitions (not yet implemented — planned for Phase 2).

**Payment (Оплата)**
A record of a payment transaction for an Order (not yet implemented — planned for Phase 2).

**Delivery (Доставка)**
A record of delivery tracking for an Order (not yet implemented — planned for Phase 2).

---

## Catalog Organization

**Category (Категория)**
A node in the category tree (`parent` → children). Products can belong to multiple Categories. A Category links to relevant Brands and Attributes for filtering. `header_order` controls navigation menu placement (0 = hidden).

**Brand (Бренд / Производитель)**
A manufacturer or brand, identified by name and slug. Products can link to multiple Brands (e.g., a laptop co-branded with NVIDIA).

**Tag (Тег)**
A lightweight, non-structured label for filtering, e.g., «игровой», «IPS», «HDR». Stored as `feature_tags` on Product. Tags are intentionally flat — for structured specs, use Attributes.

---

## Reviews

**Review (Отзыв)**
A customer's rating (1–5) and optional text for a Product. One review per customer per product. Carries a `verified_purchase` flag set when the customer has actually ordered the product.

---

## Price Sheet Import (Импорт прайса)

**Price Sheet (Прайс-лист)**
A supplier spreadsheet (e.g., «прайс для Родиона.xlsx») containing exactly two columns: a human-readable product title and a price. Rows without a price are **Section headers**, not products. Imported via the `import_price_sheet` management command.

**Section (Секция прайса)**
A header row in the Price Sheet that groups subsequent product rows, e.g., «HDD», «Monitors TFT», «Processor». Each Section maps to exactly one or more Categories. Section mapping can create new Categories when no existing Category fits (e.g., «Сетевое оборудование», «Источники бесперебойного питания», «Офисная мебель»).

**Price Sheet Row (Строка прайса)**
A title + numeric price pair. The importer normalizes the title (strips tender/broken markers), detects Brand and Attribute values embedded in the title text, rounds the price **up to the nearest 5 som** (e.g., 422 → 425), and creates or updates a Product.

**Tender marker (Тендерная пометка)**
A token in a Row title such as «- тендер» or «б\у». Tender products are still imported but the marker is stripped from the display name.

---
## Cross-cutting

**Slug (ЧПУ)**
A URL-safe unique identifier used in API endpoints and front-end routing. Example: `apple-macbook-pro-16`. Slugs are auto-generated from names but must be unique. **Slugs MUST be ASCII-only** (Latin characters, digits, hyphens). Cyrillic characters in slugs are forbidden — use transliteration when generating slugs from Russian names (e.g., `процессоры` → `processory`, `игровой` → `igrovoj`). The `seed_data` command provides a `slugify()` helper that performs Cyrillic→Latin transliteration before Django's `slugify`.

**Active (Активен)**
A boolean flag on Product and Variant. Inactive items are hidden from the storefront but preserved in the database (soft delete).