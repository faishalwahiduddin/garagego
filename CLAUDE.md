# CLAUDE.md — GarageGo

## Overview
GarageGo — Personal Vehicle Garage & Maintenance Manager: pencatat riwayat servis, penggantian oli, konsumsi BBM, jadwal pajak/STNK/asuransi, dan odometer untuk seluruh armada mobil dan motor keluarga. **100% offline-first, tanpa backend, tanpa akun.**
Bahasa Indonesia & English supported.

**Subdomain:** garagego.faishal.id · **CF Project:** `garagego-faishal` · **appId:** `id.faishal.garagego`
**Git remote:** `git@github.com:faishalwahiduddin/garagego.git`

## Tech Stack
**Flutter 3.44.8 · Dart 3.12.2 · Riverpod 3.x · GoRouter · Cloudflare**

## Quick Commands
```bash
flutter run -d chrome                                       # Dev server (web)
flutter test                                                # Run all tests
flutter analyze                                             # Static analysis
flutter build web --release                                 # Production web build
flutter build appbundle --release                           # Android App Bundle
```

## Rules & Conventions
1. **Architecture: MVVM + Riverpod (feature-first)** di bawah `lib/features/` dan `lib/core/`.
2. **Offline-first**: Penyimpanan lokal on-device via `shared_preferences`.
3. **No dev servers**: Jangan jalankan dev server atau build kecuali diminta eksplisit.
4. **Validasi Wajib (§VAL)**: Setiap input data kendaraan, log servis, catatan bensin, dan tanggal pajak wajib divalidasi dengan jelas di frontend dan backend.
5. **CLI Wrappers**: Gunakan `gh-faishal` dan `wrangler-faishal`.
