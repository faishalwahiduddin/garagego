# BRD — GarageGo

> Batas SSOT. Dokumen ini milik **WHY dan WHAT tingkat bisnis**: tujuan,
> aktor, glosarium, dan aturan bisnis GarageGo. Alur rinci per fitur,
> katalog validasi, dan kriteria terima ada di [PRD](./PRD.md).

- App: `garagego` — garasi digital: servis, BBM, pajak, odometer.
- Stack: Flutter 3.x, Riverpod, GoRouter, SharedPreferences.
- Subdomain: garagego.faishal.id · appId: `id.faishal.garagego`.
- Repo: `faishalwahiduddin/garagego`. Aturan: [AGENTS.md](../AGENTS.md).

## 1. Tujuan dan latar

GarageGo ada agar pemilik kendaraan berhenti mengandalkan ingatan dan nota
kertas. Satu garasi digital untuk riwayat servis, efisiensi BBM, dan jatuh
tempo pajak seluruh armada keluarga.

Nilai yang diimplementasikan:

1. **Riwayat tidak hilang.** Setiap servis, oli, dan sparepart tercatat
   dengan tanggal, odometer, dan biaya.
2. **BBM terpantau.** Konsumsi km/L dan biaya per km dihitung on-device
   dari catatan pengisian.
3. **Pajak tidak telat.** Pengingat PKB tahunan dan STNK 5 tahunan per
   kendaraan dengan daftar urut tanggal.
4. **Biaya transparan.** Total biaya kepemilikan terakumulasi dari BBM,
   servis, dan pajak.

Di luar lingkup: telemetri OBD, booking bengkel, backend atau akun.

## 2. Aktor dan peran

| Aktor | Sifat | Kemampuan |
|---|---|---|
| Pemilik kendaraan | Tanpa akun, profil lokal | Kelola garasi, log, pengingat, backup |
| Keluarga | Perangkat yang sama | Lihat dan catat untuk kendaraan bersama |

Tidak ada peran berbasis server.

## 3. Glosarium domain

- **Garasi/Armada.** Kumpulan kendaraan mobil dan motor milik keluarga.
- **Log servis dan oli.** Catatan tanggal servis, odometer, jenis oli,
  sparepart, dan biaya bengkel.
- **Interval servis.** Rekomendasi jarak atau waktu ganti oli berikutnya.
- **Log BBM.** Catatan liter, harga per liter, dan odometer tiap pengisian.
- **Pajak STNK dan pelat.** Jatuh tempo PKB tahunan dan perpanjangan STNK
  5 tahunan.
- **Total biaya kepemilikan.** Akumulasi pengeluaran BBM, servis, pajak,
  dan sparepart per kendaraan.

## 4. Aturan bisnis

1. Satu garasi mendukung banyak kendaraan mobil dan motor dengan switcher.
2. Perhitungan km/L memakai dua pengisian berurutan kendaraan yang sama.
3. Odometer yang mundur dari catatan terakhir wajib memicu peringatan
   konfirmasi sebelum disimpan.
4. Seluruh riwayat pengeluaran, nomor polisi, dan odometer disimpan lokal
   tanpa sinkronisasi server pihak ketiga.
5. Tanpa backend, tanpa akun, tanpa iklan.
6. Backup file wajib bisa diimpor kembali tanpa kehilangan data.

## 5. Risiko dan batasan

- Akurasi km/L bergantung pada kedisiplinan mencatat tiap pengisian.
- Pengingat pajak seakurat tanggal yang dimasukkan pengguna.
