# AGENTS.md — GarageGo (garagego)

> Guidelines for AI agents working in this Flutter codebase.
> Workspace root: `../` · Canonical fleet guide: [`../AGENTS.md`](../AGENTS.md)

## Mulai di sini (60 detik)

<!-- trace:begin start-here -->
- **App**: `garagego` (GarageGo) — GarageGo — Personal Vehicle Garage & Maintenance Manager: pencatat riwayat servis, penggantian oli, konsumsi BBM, jadwal pajak/STNK/asuransi, dan odometer untuk seluruh armada mobil dan motor keluarga.
- **Platform & jalankan**: Flutter Web (Cloudflare Pages `garagego-faishal` → https://garagego.faishal.id) + Android + iOS. `flutter run -d chrome` untuk web, `flutter run -d <device>` untuk mobile. applicationId: `id.faishal.garagego`.
- **Branch**: `main` = default dan rilis.
- **Cek**: `flutter analyze && flutter test` sebelum commit — wajib nol peringatan.
- **CLI**: `gh-faishal` (remote `faishalwahiduddin/garagego`) dan `wrangler-faishal` — jangan bare `gh`/`wrangler`.
- **Validasi (§VAL)**: Di setiap project tanpa kecuali, setiap input, form, dan mutation wajib divalidasi di frontend dan backend.
- **Larangan**: Jangan menjalankan dev server (`flutter run`) atau `flutter build` kecuali diminta secara eksplisit oleh pengguna.
<!-- trace:end -->

## Quick Commands

```bash
flutter run -d chrome                                       # Dev server (web)
flutter test                                                # Run all tests
flutter analyze                                             # Static analysis (run before every commit)
flutter build web --release                                 # Production web build
flutter build apk --release                                 # Android APK
flutter build appbundle --release                           # Android App Bundle (Play Store)
```

## Project Overview

**GarageGo** — All-in-One Garage, Vehicle Health & Cost Tracker: Garasi digital untuk mencatat kendaraan roda empat (mobil) dan roda dua (motor). Melacak jadwal ganti oli berkala, riwayat servis rutin/bengkel, konsumsi bahan bakar (km/L & cost per km), pengingat jatuh tempo pajak tahunan STNK & pelat 5 tahunan, serta estimasi nilai pengeluaran perawatan.

- **Ecosystem**: Lifestyle Utility Go-Series (Bersama FamilyGo, VaxGo, EyeGo, dan EmergencyGo.)
- **Subdomain**: https://garagego.faishal.id
- **Application ID**: `id.faishal.garagego`
- **Repository**: `faishalwahiduddin/garagego`

## Domain Terminology

| Term (ID) | Term (EN) | Context |
|-----------|-----------|---------|
| Garasi / Armada | Garage / Fleet | Kumpulan kendaraan mobil dan motor milik keluarga/pribadi |
| Log Servis & Oli | Service & Oil Log | Catatan tanggal servis, odometer (km), jenis oli, sparepart, dan biaya bengkel |
| Interval Servis | Service Interval | Rekomendasi jarak/waktu ganti oli berikutnya (misal tiap 5.000 km atau 6 bulan) |
| Log Bahan Bakar (BBM) | Fuel Log | Catatan liter pengisian BBM, harga per liter, dan odometer untuk hitung konsumsi km/L |
| Pajak STNK & Pelat | Vehicle Tax & Reg | Pengingat tanggal jatuh tempo PKB tahunan dan perpanjangan STNK 5 tahunan |
| Total Biaya Pemilikan | Total Cost of Ownership | Akumulasi pengeluaran BBM, servis, pajak, dan sparepart kendaraan |

## Mandatory Rules

1. **Dukungan Multi-Kendaraan (Mobil & Motor)**: Pengguna dapat menambah, mengedit, dan beralih antara beberapa kendaraan dengan ikon dan spesifikasi masing-masing.
2. **Offline-First & Privasi Data**: Seluruh riwayat pengeluaran, nomor polisi, dan odometer disimpan secara lokal tanpa sinkronisasi server pihak ketiga.
3. **Kalkulasi Akurat & Transparan**: Perhitungan efisiensi BBM (km/L) dan jadwal jatuh tempo servis/pajak dihitung on-device dengan validasi ketat.
4. **Validasi Wajib (§VAL)**: Nilai odometer tidak boleh negatif atau mundur secara tidak wajar, harga dan liter BBM wajib numerik positif, nama kendaraan tidak boleh kosong.
5. **Tanpa backend, tanpa akun**: Langsung siap dipakai tanpa registrasi, tanpa iklan berbayar.
