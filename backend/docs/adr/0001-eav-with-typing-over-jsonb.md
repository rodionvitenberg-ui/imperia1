# ADR-001: EAV with typing over JSONB for product attributes

**Status:** Accepted
**Date:** 2026-07-07

## Context

Computer hardware products have hundreds of diverse attributes (screen diagonal, CPU frequency, VRAM size, matrix type, socket, etc.). Hardcoding every spec into database columns is infeasible. We needed a flexible schema that supports:

- Heterogeneous attributes per category
- Type-aware filtering (range filters for numeric specs, boolean toggles, enum faceting)
- Efficient faceted search across large catalogs

Two patterns were evaluated:

1. **JSONB** — store all attributes as a single JSON field on Product
2. **EAV (Entity–Attribute–Value)** — separate `Attribute` dictionary + `ProductAttribute` junction table, with typed value columns

## Decision

**We chose EAV with typed columns (`value_str`, `value_int`, `value_bool`, `value_enum`).**

## Rationale

### Why EAV over JSONB

1. **Indexed filtering.** JSONB GIN indexes work, but:
   - Range queries (`WHERE attributes->>'frequency' >= 100`) require expression indexes per attribute *type*, doubling index maintenance
   - Numeric values in JSONB require casting (`::int`), defeating index usage in complex ORM queries
   - EAV with dedicated `value_int` column supports native B-tree indexes for range filters out of the box

2. **Type safety at the database level.** JSONB stores everything as text internally. EAV with typed columns ensures an attribute declared as `int` cannot accidentally receive a string value.

3. **Attribute metadata.** The `Attribute` dictionary row carries `unit`, `type`, and `enum_options` — metadata that JSONB would require a separate schema table anyway.

4. **Django ORM compatibility.** Filtering `ProductAttribute.objects.filter(attribute__type='int', value_int__gte=100)` is straightforward. JSONB path queries require raw SQL or `KeyTransform` lookups that break across joined relations.

### Why typed columns, not a single `value` text field

The original implementation stored everything as `value CHAR(255)`. This prevented:

- Numeric range filters (e.g., "screen diagonal between 24 and 32 inches")
- Boolean toggles in faceted search ("curved: yes/no")
- Enum faceting without full-text search on text values

### Trade-offs accepted

- **Write complexity**: `set_typed_value()` must be called, or the caller must populate the correct column. Mitigated by the helper method and serializer-level handling.
- **Storage overhead**: four columns instead of one. Acceptable — each row stores only one non-null value column.
- **Migration from old schema**: the `value` column was dropped and replaced with four typed columns. Existing data must be migrated (a one-time script is planned).

## Alternatives considered

**JSONB (PostgreSQL native)**
Rejected because range queries on numeric attributes and type-safe enum faceting are harder to index efficiently. JSONB is a better fit for *schemaless* data (e.g., raw product feed dumps), not for *structured* faceted search.

**Hardcoded columns per category**
Rejected as unscalable — each new category would require schema migrations.

**Hybrid: JSONB for "extra" attributes + EAV for filterable ones**
Adds cognitive overhead (two code paths for attributes). Not justified yet — revisit if EAV row count becomes a bottleneck.

## Consequences

- Filters (`ProductFilter`) must query `value_str`, `value_int`, `value_bool`, or `value_enum` depending on `Attribute.type`
- The `Attribute.type` field must be set correctly before any `ProductAttribute` rows are created
- Adding a new attribute type requires a migration (new column) — acceptable frequency