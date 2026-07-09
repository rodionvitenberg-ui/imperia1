---
version: alpha
name: imperiaelectroniki.kg
description: Light-mode e-commerce design system for Newegg, characterized by a white surface, blue accent, dense catalog navigation, and utility-first product merchandising.
colors:
  primary: "#1061cd"
  secondary: "#212121"
  tertiary: "#bfbfbf"
  neutral:
    0: "#ffffff"
    100: "#e5e7eb"
    900: "#212121"
  surface:
    default: "#ffffff"
    elevated: "#ffffff"
  on-surface:
    default: "#212121"
  error: "#d92d20"
typography:
  headline-display:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "32px"
    fontWeight: 700
    lineHeight: "38px"
    letterSpacing: "0px"
  headline-lg:
    fontFamily: "Montserrat Solid"
    fontSize: "24px"
    fontWeight: 700
    lineHeight: "34px"
    letterSpacing: "0px"
  headline-md:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "20px"
    fontWeight: 600
    lineHeight: "24px"
    letterSpacing: "0px"
  body-lg:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: "24px"
    letterSpacing: "0px"
  body-md:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: "24px"
    letterSpacing: "0px"
  body-sm:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: "20px"
    letterSpacing: "0px"
  label-lg:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "14px"
    fontWeight: 700
    lineHeight: "20px"
    letterSpacing: "0px"
  label-md:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "14px"
    fontWeight: 700
    lineHeight: "20px"
    letterSpacing: "0px"
  label-sm:
    fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    fontSize: "12px"
    fontWeight: 700
    lineHeight: "16px"
    letterSpacing: "0px"
rounded:
  none: "0px"
  sm: "8px"
  md: "20px"
  lg: "20px"
  xl: "20px"
  full: "9999px"
spacing:
  xs: "2px"
  sm: "10px"
  md: "20px"
  lg: "24px"
  xl: "34px"
components:
  button:
    primary:
      backgroundColor: "{colors.primary}"
      color: "{colors.neutral.0}"
      borderColor: "transparent"
      borderRadius: "{rounded.md}"
      borderWidth: "2px"
      borderStyle: "solid"
      padding: "8px 24px"
      fontSize: "14px"
      fontWeight: 700
      minWidth: "300px"
      minHeight: "40px"
      textDecoration: "none"
      boxShadow: "none"
      fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    secondary:
      backgroundColor: "{colors.neutral.0}"
      color: "{colors.secondary}"
      borderColor: "{colors.tertiary}"
      borderRadius: "{rounded.md}"
      borderWidth: "2px"
      borderStyle: "solid"
      padding: "8px 24px"
      fontSize: "14px"
      fontWeight: 700
      minWidth: "300px"
      minHeight: "40px"
      textDecoration: "none"
      boxShadow: "none"
      fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
    link:
      backgroundColor: "transparent"
      color: "{colors.secondary}"
      borderColor: "transparent"
      borderRadius: "{rounded.none}"
      borderWidth: "0px"
      borderStyle: "none"
      padding: "0px"
      fontSize: "14px"
      fontWeight: 400
      minWidth: "0px"
      minHeight: "0px"
      textDecoration: "underline"
      boxShadow: "none"
      fontFamily: "Open Sans, sans-serif, Helvetica, Arial"
  card:
    backgroundColor: "{colors.surface.default}"
    borderColor: "{colors.neutral.100}"
    borderRadius: "{rounded.sm}"
    borderWidth: "1px"
    borderStyle: "solid"
    padding: "16px"
    boxShadow: "none"
    textColor: "{colors.on-surface.default}"
---

# Overview

Newegg’s visual language is utilitarian, retail-first, and information-dense. The interface favors a white background, dark body text, and a vivid blue accent for primary actions and brand emphasis. Typography is simple and highly legible, with Open Sans carrying most of the experience and a more distinctive Montserrat Solid used for select large headings.

The layout should feel compact, navigable, and optimized for browsing large inventories, especially in category-heavy contexts.

# Colors

Use a clean light palette anchored by white surfaces and dark text.

- **Primary blue**: `#1061cd` for primary CTAs, links requiring emphasis, and brand highlights.
- **Secondary text**: `#212121` for primary content, navigation, and most link text.
- **Tertiary gray**: `#bfbfbf` for borders and non-prominent UI outlines.
- **Surface white**: `#ffffff` for page background and cards.
- **Border neutral**: `#e5e7eb` for card edges and subtle separators.

Suggested roles:
- `colors.primary` → action color
- `colors.secondary` → text and link color
- `colors.tertiary` → border and divider color
- `colors.surface.default` → app/page background
- `colors.on-surface.default` → default text color

If additional semantic colors are needed, keep them restrained and consistent with the existing palette. The source data does not provide a full semantic state system, so error and success colors should be introduced cautiously.

# Typography

Typography is practical and readable rather than expressive. Use Open Sans for nearly all UI text. Use Montserrat Solid sparingly for larger section headings when a stronger branded title treatment is needed.

## Headline styles
- **headline-display**: 32px / 38px, bold, Open Sans
- **headline-lg**: 24px / 34px, bold, Montserrat Solid
- **headline-md**: 20px / 24px, semibold, Open Sans

## Body and labels
- **body-lg**: 16px / 24px, regular, Open Sans
- **body-md**: 16px / 24px, regular, Open Sans
- **body-sm**: 14px / 20px, regular, Open Sans
- **label-lg**: 14px / 20px, bold, Open Sans
- **label-md**: 14px / 20px, bold, Open Sans
- **label-sm**: 12px / 16px, bold, Open Sans

Implementation guidance:
- Prefer `Open Sans, sans-serif, Helvetica, Arial` for fallback coverage.
- Keep letter spacing at `0px`.
- Avoid decorative or condensed fonts outside the provided heading treatment.
- Reserve `Montserrat Solid` for prominent headings; it may feel heavier than the rest of the system and should be used intentionally.

# Layout

The layout is dense and catalog-oriented.

- Use compact vertical spacing and controlled whitespace.
- Favor stacked content blocks, category lists, and product grids over oversized hero sections.
- Maintain strong scanability with clear hierarchy, short labels, and repeatable card patterns.
- Use `spacing.xs` through `spacing.xl` to separate dense modules without making the interface feel airy.
- Page background should remain white unless a specific module requires separation.

Practical guidance:
- Keep navigation and filter UI highly visible.
- Use strong alignment and consistent gutters.
- Allow cards to define hierarchy through borders more than shadows.
- Avoid excessive center alignment for core commerce flows.

# Elevation & Depth

Elevation is minimal.

- `card` surfaces use a 1px border and no shadow.
- The provided shadow token `sm` exists, but the overall system mostly relies on border and contrast rather than layered depth.
- Treat overlays, menus, and drawers as exceptions; the source data does not define a broader depth scale, so use shadow sparingly and only when necessary.

Default rule: prefer flat surfaces, visible boundaries, and minimal z-axis drama.

# Shapes

Shapes are soft but restrained.

- **Cards**: `8px` radius for subtle separation.
- **Primary and secondary buttons**: `20px` radius for pill-like CTAs.
- **Links**: square/unstyled geometry with no radius.
- **Full rounding**: available as `9999px` for badges, avatars, or chips if needed.

Use shape to reinforce function:
- Larger radius for primary actions.
- Smaller radius for content containers.
- No rounding for text links and utility surfaces.

# Components

## Button

### Primary button
- Blue filled background
- White text
- 2px transparent border
- 20px radius
- 8px 24px padding
- 14px bold text
- Minimum size: 300px wide by 40px tall

Use for the dominant action in a task flow.

### Secondary button
- White background
- Dark text
- Gray border
- Same sizing as primary
- Same radius and weight

Use for alternate actions beside a primary button.

### Link button
- Transparent background
- Underlined dark text
- No border or radius
- 14px regular text

Use for low-emphasis actions, legal links, or inline navigation.

## Card
- White background
- 1px light border
- 8px radius
- 16px padding
- No shadow

Use for product tiles, content modules, and summary panels.

Component behavior guidance:
- Keep button labels short and action-oriented.
- Ensure button widths do not break compact layouts; the provided minimum width suggests a desktop-first CTA pattern.
- Prefer borders over shadows for cards.
- Align card content to a predictable grid for rapid comparison of products.

# Do's and Don'ts

## Do
- Do use white surfaces with dark text and blue emphasis.
- Do keep typography simple and readable, using Open Sans for most content.
- Do use bold labels for filters, product metadata, and actions.
- Do preserve compact spacing in category-heavy views.
- Do style primary actions as blue, filled, and heavily rounded.
- Do use card borders to establish separation instead of shadows.
- Do keep links underlined when they are intended to be navigational or legal.

## Don't
- Don't introduce dark mode or saturated background panels without explicit product need.
- Don't add decorative display fonts beyond the provided heading system.
- Don't rely on shadows to define structure; the system is intentionally flat.
- Don't make buttons small, square, or visually delicate.
- Don't turn product browsing into a spacious marketing layout.
- Don't use tertiary gray as body text; reserve it for borders and secondary chrome.
- Don't invent unsupported token families or component variants when the source data is silent.