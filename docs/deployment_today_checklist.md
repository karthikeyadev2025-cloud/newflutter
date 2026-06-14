# Deployment And Publishing Checklist

## Current Code Status

This folder contains a clean Flutter rebuild scaffold for MyStore OS:

- Shop dashboard
- POS billing screen
- Products screen
- Bills screen
- Super admin command center
- Vercel web deploy config

The app is currently UI-first with sample data. Supabase methods from the original React app still need to be connected.

## Before Building

Install Flutter SDK, then run inside `mystoreos_flutter`:

```bash
flutter create --platforms=android,ios,web,windows,macos,linux .
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

## Vercel Deploy

Push this folder to a new GitHub repo, then import it in Vercel.

Vercel should read `vercel.json`.

Expected settings:

- Build command: `chmod +x ./scripts/vercel_build.sh && ./scripts/vercel_build.sh`
- Output directory: `build/web`

## Android Developer Account Publish

To publish today, you need:

- Flutter installed
- Android Studio installed
- Java 17+
- Google Play developer account
- App signing key or Play App Signing enabled

Build command:

```bash
flutter build appbundle --release
```

Upload:

```text
build/app/outputs/bundle/release/app-release.aab
```

## iOS Publishing

iOS cannot be built from Windows. It requires:

- macOS
- Xcode
- Apple Developer account

Build/archive through Xcode after running:

```bash
flutter build ios --release
```

## Next Required Engineering Work

1. Recover missing original `src/lib/api.js`.
2. Map API methods to Flutter services.
3. Add Supabase environment handling.
4. Connect authentication and role routing.
5. Replace sample data with live Supabase data.
6. Add barcode scanner, PDF invoice, Razorpay, WhatsApp, and offline sync.
