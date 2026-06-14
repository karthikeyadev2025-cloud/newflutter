# MyStore OS UI/UX Recreation Blueprint

## Design Direction

Rebuild MyStore OS with a calm, professional business interface inspired by:

- Zoho Books: clean desktop shell, strong tables, quiet navigation, accounting-style clarity.
- Petpooja POS: fast billing flow, large touch targets, item grid, quick cart actions, cashier-friendly layout.

The app should feel like a serious retail operating system, not a marketing website. The first screen after login should be useful immediately.

## Core Product Feel

MyStore OS should feel:

- Fast for billing
- Trustworthy for money and GST
- Simple enough for small shops
- Dense enough for desktop use
- Touch-friendly on Android and iOS
- Clean and business-like on web and desktop

Avoid:

- Heavy gradients
- Decorative glassmorphism everywhere
- Oversized landing-page styling inside the app
- Too many colorful stat cards
- Emoji-based controls
- Nested card layouts

## Visual System

### Colors

Primary:

- Indigo blue: `#4F46E5`
- Deep navy: `#0F172A`

Neutrals:

- Page background: `#F8FAFC`
- Surface: `#FFFFFF`
- Border: `#E2E8F0`
- Text primary: `#0F172A`
- Text secondary: `#475569`
- Muted text: `#64748B`

Status:

- Success: `#10B981`
- Warning: `#F59E0B`
- Danger: `#EF4444`
- Info: `#3B82F6`

Use color mostly for meaning: active nav, actions, payment status, stock alerts, subscription warnings.

### Typography

Use a clean business font:

- Flutter: `Plus Jakarta Sans`, `Inter`, or system default.
- Numbers in invoices, IDs, SKUs: use a tabular/mono style where possible.

Text scale:

- App title: 20-22
- Page title: 18-22
- Section title: 14-16
- Table/body: 13-14
- Metadata: 11-12

## App Structure

### Desktop / Web Layout

Use a Zoho-style shell:

- Fixed left sidebar, 240px wide
- White sticky top bar
- Main canvas on light gray background
- Tables and work areas in white panels
- Search in top bar
- Primary action button on top right

Sidebar modules:

- Dashboard
- POS / Billing
- Products
- Customers
- Credit Book
- Restock
- Expenses
- Reports
- Support
- Settings

Admin gets a separate sidebar:

- Overview
- Users
- Shops
- Distributors
- Revenue
- Analytics
- Support
- CMS
- Settings

### Mobile Layout

Use a compact mobile shell:

- Top app bar with shop name and sync status
- Bottom navigation for 4-5 main actions
- Floating `New Bill` action
- Full-screen modal sheets for add/edit workflows

Mobile bottom tabs:

- Home
- POS
- Products
- Bills
- More

Put less-used modules under More:

- Credit
- Restock
- Reports
- Expenses
- Settings
- Support

## POS / Billing Experience

This should be the most polished screen.

### Desktop POS

Three-column layout:

1. Left: categories and quick filters
2. Center: product search and product grid/table
3. Right: current bill/cart

Key controls:

- Product search always focused
- Barcode scan field
- Customer selector
- Quantity stepper
- Discount field
- GST summary
- Payment mode selector
- Save draft
- Print/share invoice
- Complete sale

Cart behavior:

- Cart stays visible
- Quantity can be changed inline
- Remove item via icon button
- Totals update instantly
- Low stock warning appears before completing sale

### Mobile POS

Use two modes:

- Items mode: search, scan, item list
- Cart mode: bill summary and payment

Primary bottom action:

- If cart empty: `Scan`
- If cart has items: `View Bill - ₹amount`

This makes the billing flow fast on phones.

## Key Screens

### Dashboard

Desktop:

- Today sales
- Orders count
- Low stock
- Credit due
- Recent invoices table
- Top selling products
- Low stock alert panel

Mobile:

- Compact KPI row
- Continue billing button
- Recent bills
- Alerts

### Products

Primary view:

- Search
- Category filter
- Stock status filter
- Product table on desktop
- Product cards/list rows on mobile

Fields:

- Name
- Price
- Cost price
- Stock
- Unit
- HSN/SAC
- GST rate
- Barcode
- Batch
- Expiry
- Reorder level

Actions:

- Add product
- Scan barcode
- Import/export
- Edit
- Archive/delete

### Bills

Desktop:

- Invoice table with filters
- Status chips
- Payment method
- Customer
- Amount
- Date
- Actions: view, print, share, return

Mobile:

- Searchable list
- Tap opens invoice detail
- Bottom actions for share/print/payment

### Credit Book

Split into:

- Receivable
- Payable

Each entry should clearly show:

- Person/business name
- Phone
- Amount
- Due date or created date
- Paid/unpaid status
- Reminder action

### Reports

Keep reports quiet and data-first:

- Sales summary
- GST summary
- Product performance
- Credit outstanding
- Expense summary
- Export buttons

Charts should be simple and readable.

## Component Rules

Buttons:

- Primary: filled indigo
- Secondary: white with border
- Danger: red text or red filled only for destructive confirmation

Inputs:

- 40-44px height desktop
- 48px mobile
- Clear label above field
- Use helper text for GST/HSN where needed

Tables:

- Sticky header on desktop
- Row hover
- Status chips
- Right-align money values
- Use empty states with action buttons

Modals:

- Desktop: centered dialog
- Mobile: bottom sheet or full-screen flow

Cards:

- Use for repeated summary panels only
- Radius 8px
- Avoid card inside card

## Flutter Implementation Notes

Suggested folder structure:

```text
lib/
  app/
    app.dart
    router.dart
    theme.dart
    breakpoints.dart
  core/
    supabase/
    offline/
    widgets/
    utils/
  features/
    auth/
    dashboard/
    pos/
    products/
    bills/
    customers/
    credit/
    restock/
    reports/
    settings/
    admin/
```

Recommended responsive pattern:

- `ResponsiveScaffold`
- `DesktopShell`
- `MobileShell`
- Shared feature screens that adapt layout by width

Recommended first UI milestone:

1. Login
2. Desktop shell
3. Mobile shell
4. Shop dashboard
5. POS screen
6. Products screen
7. Bills screen

## Signature Screens To Design First

Design these before rebuilding everything:

- Shop desktop dashboard
- Desktop POS billing
- Mobile POS billing
- Product management
- Invoice detail
- Admin overview

These screens define the whole product language.

## Product Positioning

The app should look and feel like:

> A modern Indian retail operating system for billing, inventory, GST, credit, and shop growth.

It should not look like:

> A generic SaaS landing page with a dashboard attached.

