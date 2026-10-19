# PRD: GarageGo — Manajer Garasi dan Perawatan Kendaraan

## 1. Overview

**GarageGo** adalah garasi digital keluarga: mencatat riwayat servis dan
ganti oli, konsumsi BBM (km/L dan biaya per km), pengingat pajak STNK dan
pelat 5 tahunan, serta odometer untuk seluruh armada mobil dan motor.

- **Subdomain**: garagego.faishal.id
- **CF Project**: `garagego-faishal` · **appId**: `id.faishal.garagego`
- **Platform**: Web, Android, iOS
- **Repository**: `faishalwahiduddin/garagego`

## 2. Problem Statement

1. **Riwayat servis hilang.** Nota bengkel tercecer; pemilik lupa kapan
   terakhir ganti oli atau sparepart apa yang diganti.
2. **BBM tidak terpantau.** Konsumsi km/L dan biaya per km tidak pernah
   dihitung, pemborosan tidak terdeteksi.
3. **Pajak telat.** Denda PKB dan repot STNK terjadi karena tidak ada
   pengingat jatuh tempo yang rapi.

## 3. Target Users

- Pemilik mobil/motor pribadi yang merawat kendaraannya sendiri
- Keluarga dengan lebih dari satu kendaraan
- Pengguna yang ingin tahu total biaya kepemilikan kendaraannya

## 4. Features

### 4.1 MVP

| Kode | Fitur | SP | Deskripsi | Lokasi kode |
|---|---|:---:|---|---|
| `US-001` | **Shell + garasi** | 2 | Daftar kendaraan + switcher + CRUD | `lib/features/` |
| `US-002` | **Log servis/oli** | 5 | Tanggal, odometer, jenis oli, sparepart, biaya | `lib/features/` |
| `US-003` | **Log BBM** | 5 | Liter, harga/liter, odometer → km/L + Rp/km | `lib/features/` |
| `US-004` | **Pengingat pajak** | 3 | PKB tahunan + STNK 5 tahunan per kendaraan | `lib/features/` |
| `US-005` | **Interval servis** | 3 | Target ganti oli berikut (km atau bulan) | `lib/core/` |
| `US-006` | **Total biaya** | 3 | Akumulasi BBM + servis + pajak per kendaraan | `lib/features/` |
| `US-007` | **Ekspor/impor** | 2 | Backup file via share + FilePicker | `lib/features/` |
| `US-008` | **i18n** | 3 | Indonesia + Inggris | `lib/l10n/` |

### 4.2 Di luar cakupan

- Integrasi OBD/telemetri kendaraan
- Booking bengkel atau perbandingan harga bengkel
- Backend, akun, sinkronisasi cloud

## 5. Data Model

| Model | Isi |
|---|---|
| `Vehicle` | id, name, type (car/motor), plateNo, icon |
| `ServiceLog` | vehicleId, date, odometerKm, oilType, parts, cost |
| `FuelLog` | vehicleId, date, liters, pricePerLiter, odometerKm |
| `TaxReminder` | vehicleId, kind (pkb/stnk), dueDate, done |

Penyimpanan lokal: `shared_preferences` + file JSON. Validasi §VAL di
form dan layer storage.

## 6. User Flows

1. **Tambah kendaraan.** Isi nama, jenis, pelat → muncul di garasi →
   jadikan kendaraan aktif.
2. **Catat servis.** Pilih kendaraan → isi tanggal, odometer, oli, biaya →
   interval servis berikut terhitung otomatis.
3. **Catat BBM.** Isi liter, harga, odometer → konsumsi km/L dan biaya per
   km tampil di ringkasan.
4. **Pajak.** Isi tanggal jatuh tempo PKB/STNK → daftar pengingat tampil
   urut tanggal terdekat → tandai selesai setelah bayar.

## 7. Validasi (§VAL)

- Odometer wajib angka non-negatif; peringatan bila mundur dari catatan
  terakhir kendaraan yang sama.
- Liter dan harga BBM wajib numerik positif.
- Nama kendaraan wajib non-kosong; pelat opsional tapi unik bila diisi.
- Tanggal servis/pajak wajib tanggal valid, tidak boleh teks bebas.
- Biaya wajib angka non-negatif dalam Rupiah.

## 8. Acceptance Criteria

- [ ] km/L dihitung benar dari dua pengisian berurutan.
- [ ] Odometer mundur memicu peringatan konfirmasi.
- [ ] Pengingat pajak urut dari jatuh tempo terdekat.
- [ ] Backup file bisa diimpor kembali tanpa data hilang.
- [ ] `flutter analyze` nol peringatan, `flutter test` hijau.

## 9. Technical Constraints

- Offline-first; tanpa backend, tanpa akun.
- Multi-kendaraan mobil dan motor dalam satu garasi.
- MVVM + Riverpod + GoRouter feature-first.
- CLI: `gh-faishal`, `wrangler-faishal`.
- Version: `python3 ../tools/bump_version.py garagego patch`.
