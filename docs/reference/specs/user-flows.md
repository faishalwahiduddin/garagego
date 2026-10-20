# User flows — GarageGo

> Narasi per flow (SSOT nama/role/modul: `docs/reference/system/traceability.json`; case uji: `docs/trace/flows.yaml`;
> panduan BAST: `docs/client/bast/guide/`). Matriks lengkap: `docs/reference/system/traceability-matrix.md`.

## FLOW-GAR-01 — Menambah kendaraan dan memilih kendaraan aktif

- Role: USR (`ROL-001`) · Modul: `MOD-001` · Story: US-001 · Kebutuhan: FR-001, FR-002

1. Buka app (onboarding pertama kali → **Lewati**); Garasi berisi kendaraan contoh.
2. Ketuk **Tambah Kendaraan**, isi nama, pelat, tahun, odometer, interval oli → simpan.
3. Pilih kendaraan aktif lewat switcher; seluruh tab mengikuti kendaraan aktif.

## FLOW-SRV-01 — Mencatat servis dan memantau jadwal perawatan

- Role: USR (`ROL-001`) · Modul: `MOD-002` · Story: US-002, US-005 · Kebutuhan: FR-003, FR-004

1. Ketuk tab **Perawatan**: jadwal dua pemicu (km/bulan) dengan status aman/segera/terlewat.
2. Tandai jadwal selesai atau tambah jadwal; log servis tercatat dan odometer kendaraan diperbarui.
3. Jalankan inspeksi checklist sebelum perjalanan.

## FLOW-FUE-01 — Mencatat pengisian BBM dan melihat efisiensi

- Role: USR (`ROL-001`) · Modul: `MOD-003` · Story: US-003 · Kebutuhan: FR-005

1. Ketuk tab **BBM** → tambah catatan: jenis BBM, odometer, volume, harga/L, SPBU.
2. Ringkasan menampilkan rata-rata km/L, terbaik, dan Rp/km dari pengisian berurutan.

## FLOW-DOC-01 — Memantau pajak dan dokumen kendaraan

- Role: USR (`ROL-001`) · Modul: `MOD-004` · Story: US-004 · Kebutuhan: FR-006

1. Ketuk tab **Brankas**: PKB tahunan, STNK 5 tahunan, asuransi, dll. dengan sisa hari.
2. Tambah dokumen (jenis, judul, nomor, jatuh tempo, biaya).

## FLOW-TCO-01 — Melihat total biaya dan skor kesehatan kendaraan

- Role: USR (`ROL-001`) · Modul: `MOD-001` · Story: US-006 · Kebutuhan: FR-007

1. Di tab **Garasi** baca skor kesehatan, peringatan, dan total biaya kepemilikan kendaraan aktif.

## FLOW-SET-01 — Mencadangkan data dan mengatur preferensi

- Role: USR (`ROL-001`) · Modul: `MOD-005` · Story: US-007, US-008 · Kebutuhan: FR-008, FR-009, NFR-001

1. Ketuk tab **Pengaturan**: tema, bahasa, zona waktu.
2. Ekspor/impor cadangan `.grg` atau ekspor CSV servis & BBM.
