# MyStore OS Flutter Rebuild Brief

## Current repo status

Repository checked: `https://github.com/karthikeyadev2025-cloud/mystoreos.git`

The app is currently a React + Vite web app, with Supabase as the intended production backend and Capacitor configuration for wrapping the web app as Android/iOS.

Important finding: many files import `src/lib/api.js`, but that file is not present in the cloned repo. The `.gitignore` contains `api.*`, so it may have been accidentally excluded. A Flutter rebuild can still proceed, but the missing API layer must be recovered or recreated from the Supabase schema and screen usage.

Flutter is not installed in this local environment, so I could not run `flutter create`, `flutter pub get`, or produce Android/iOS/web/desktop builds here yet.

## Existing product surface

Public web pages:

- Landing page
- Pricing
- Blog index and blog detail
- State landing pages
- About, contact, support
- Privacy policy and terms
- Alternative comparison pages

Authentication and account flow:

- Login
- Register
- Auth callback
- Password reset
- Pending approval
- Onboarding
- Role-based dashboard routing

Roles:

- Shop / staff
- Customer
- Distributor
- Admin
- CA
- Affiliate

Core shop features:

- Dashboard
- POS / quick bill
- Products and inventory
- Barcode scanning / barcode manager
- Bills, estimates, challans
- GST fields, HSN/SAC, GST rate
- Tally/GSTR exports
- PDF voucher and credit note generation
- Customer credit ledger
- Supplier/distributor restocking
- Customers
- Expenses
- Reports
- Settings
- UPI / QR payment
- WhatsApp sharing and reminders
- Subscription plan gating
- Offline write queue

Backend:

- Supabase PostgreSQL schema and migrations are included.
- Supabase Edge Functions are included for auth, Razorpay, support chat, trial expiry, and user deletion.
- Realtime updates are used for orders and products.

## Recommended Flutter target

Build one Flutter codebase for:

- Android
- iOS
- Web
- Windows desktop
- macOS desktop
- Linux desktop

Recommended app architecture:

- Flutter 3.x
- Dart
- `go_router` for routing
- `supabase_flutter` for auth, database, storage, realtime, and edge functions
- `riverpod` or `bloc` for app state
- `drift` or `isar` for offline local storage
- `mobile_scanner` for barcode/QR scanning
- `pdf` + `printing` for invoices and credit notes
- `url_launcher` for WhatsApp, UPI, and external links
- `razorpay_flutter` for Android/iOS payments, with web fallback through hosted checkout
- `fl_chart` or Syncfusion charts for reports

## Migration strategy

### Phase 1: Recover backend contract

Before screen rebuild starts, recover or recreate `src/lib/api.js`.

Tasks:

- List all API methods used by the React app.
- Map each method to Supabase tables, RPCs, or edge functions.
- Confirm row-level security policies.
- Confirm role model and profile fields.
- Confirm payment/subscription tables.

### Phase 2: Flutter foundation

Create the Flutter project with:

- App shell
- Theme/design tokens based on the existing brand
- Responsive layout system for phone, tablet, desktop, and web
- Supabase initialization
- Auth session persistence
- Role-based router
- Environment configuration
- Basic offline queue foundation

### Phase 3: MVP app flows

Build the first usable release around the shopkeeper workflow:

- Login/register
- Shop dashboard
- Product list/add/edit
- POS billing
- Bills list
- Invoice PDF
- Customer credit ledger
- Basic settings

### Phase 4: Extended roles

Add:

- Customer storefront
- Distributor dashboard
- Admin dashboard
- CA dashboard
- Affiliate dashboard
- Support tickets
- Pricing/subscription screens

### Phase 5: Store builds and deployment

Produce:

- Android AAB for Play Store
- iOS archive for App Store, requires macOS + Xcode
- Web build for Vercel or Supabase hosting
- Windows/macOS/Linux desktop builds

## Important decision

There are two possible paths:

1. Fast path: keep the React app and ship Android/iOS through Capacitor. This is already partially configured.
2. Native rebuild path: rebuild in Flutter for better long-term mobile and desktop experience. This is the better long-term architecture, but it is a real rebuild, not a simple conversion.

My recommendation: use the Flutter rebuild path, but start with a shopkeeper MVP first. Rebuilding all roles and admin panels at once will be slower and riskier.

## Immediate blockers

- Flutter SDK is not installed in this environment.
- The repo is missing `src/lib/api.js`, likely due to `.gitignore` excluding `api.*`.
- iOS builds require macOS and Xcode.
- Production Supabase URL and anon key are not included, which is correct for security, but needed for live testing.

## Next step

Install Flutter SDK, recover the missing API layer, then scaffold the Flutter app and rebuild the shopkeeper MVP first.
