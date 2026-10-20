// BAST capture (standards §TRACE, profil Flutter) — jalankan dari akar app: node test/bast/bast_flows.mjs
import { runFlutterBast } from "/Users/rumah/projects/scripts/trace-graph/kit/flutter-web.mjs";

const ID = { "flutter.locale": '"id"' };
const READY = { ...ID, "flutter.onboarding_completed": "true" };

/** Muat ulang app dengan preferensi lokal (bahasa Indonesia, onboarding selesai) dan aktifkan semantics. */
async function boot(page, prefs = READY) {
  await page.evaluate((p) => { localStorage.clear(); for (const [k, v] of Object.entries(p)) localStorage.setItem(k, v); }, prefs);
  await page.goto(new URL(page.url()).origin + "/", { waitUntil: "load" });
  const ph = page.locator("flt-semantics-placeholder");
  await ph.waitFor({ state: "attached", timeout: 30000 }).catch(() => {});
  await ph.dispatchEvent("click").catch(() => {});
  await page.waitForTimeout(2500);
}
const btn = (page, name) => page.getByRole("button", { name }).first();
const card = (page, name) => page.getByRole("group", { name }).first();

/** Fokuskan kolom (locator), tunggu fokus terpasang, ganti isinya. */
async function fill(page, loc, text) {
  await loc.waitFor({ state: "attached", timeout: 15000 });
  const box = await loc.boundingBox();
  await page.mouse.click(box.x + box.width / 2, box.y + box.height / 2);
  await page.waitForTimeout(600);
  await page.keyboard.press("ControlOrMeta+A");
  await page.keyboard.type(text, { delay: 40 });
  await page.waitForTimeout(500);
}
const field = (page, label) => page.getByLabel(label).or(page.getByText(label)).first();

const flows = [
  {
    flow: "FLOW-GAR-01", tc: "FLOW-GAR-01-T01", role: "ROL-001",
    title: "Menambah kendaraan dan memilih kendaraan aktif",
    summary: "Pengguna membuka GarageGo pertama kali, menambahkan kendaraan baru ke garasi, lalu memilihnya sebagai kendaraan aktif.",
    async run(page, g) {
      await boot(page, ID);
      await g.step("Buka aplikasi", "Saat pertama dibuka, GarageGo menampilkan layar perkenalan. Ketuk **Lewati** untuk langsung masuk.");
      await g.tap("Lewati", { exact: true });
      await page.waitForTimeout(1200);
      await g.step("Lihat garasi", "Tab **Garasi** menampilkan kendaraan contoh beserta skor kesehatan, odometer, dan biaya.");
      await g.tap(btn(page, /^Tambah Kendaraan/));
      await page.waitForTimeout(800);
      await g.step("Buka formulir kendaraan", "Ketuk ikon **Tambah Kendaraan** di kanan atas. Pilih jenis **Mobil** atau **Motor**.");
      await g.tap(btn(page, /^Motor$/));
      await fill(page, field(page, "Nama / Model Kendaraan"), "Yamaha NMAX 155");
      await fill(page, field(page, "Nomor Pelat Polisi"), "D 4321 GG");
      await fill(page, field(page, "Odometer Saat Ini (km)"), "8200");
      await g.step("Isi data kendaraan", "Isi **Nama / Model Kendaraan** (2–50 karakter), **Nomor Pelat Polisi** (wajib, maks. 15 karakter), dan **Odometer Saat Ini (km)**.");
      await g.tap(btn(page, /^Simpan ke Garasi/));
      await page.waitForTimeout(1200);
      await g.step("Simpan ke garasi", "Ketuk **Simpan ke Garasi**. Kendaraan baru muncul di deretan pemilih kendaraan di atas.");
      await page.waitForTimeout(3000);
      await page.mouse.move(215, 88);
      await page.mouse.wheel(600, 0); // geser deretan pemilih kendaraan ke kanan
      await page.waitForTimeout(800);
      await g.tap(btn(page, /^Yamaha NMAX 155/));
      await g.step("Pilih kendaraan aktif", "Ketuk kartu **Yamaha NMAX 155** untuk menjadikannya kendaraan aktif; semua tab mengikuti kendaraan ini.");
    },
  },
  {
    flow: "FLOW-SRV-01", tc: "FLOW-SRV-01-T01", role: "ROL-001",
    title: "Mencatat servis dan memantau jadwal perawatan",
    summary: "Pengguna membuka jadwal perawatan dua pemicu (km/bulan), menandai satu pekerjaan selesai, dan melihatnya tercatat di riwayat servis.",
    async run(page, g) {
      await boot(page);
      await g.tap(page.getByRole("tab", { name: /^Perawatan/ }));
      await g.step("Buka tab Perawatan", "Ketuk tab **Perawatan**. Setiap jadwal berstatus **Aman**, **Segera**, atau **Terlewat** berdasarkan sisa km dan sisa hari.");
      await g.tap(btn(page, /^Tandai Selesai/));
      await page.waitForTimeout(800);
      await g.step("Tandai pekerjaan selesai", "Ketuk **Tandai Selesai / Reset** pada **Ganti Oli Mesin Sintetik**. Dialog menjelaskan interval akan direset dan dicatat ke riwayat.");
      await g.tap(page.getByRole("button", { name: /^Tandai Selesai$/ }).last());
      await page.waitForTimeout(1500);
      await g.step("Konfirmasi", "Ketuk **Tandai Selesai**. Status jadwal kembali **Aman** dan odometer kendaraan diperbarui.");
      await g.tap(page.getByRole("tab", { name: /^Riwayat/ }));
      await g.step("Lihat riwayat servis", "Buka sub-tab **Riwayat**: catatan servis baru tersimpan lengkap dengan tanggal, odometer, dan biaya.");
    },
  },
  {
    flow: "FLOW-FUE-01", tc: "FLOW-FUE-01-T01", role: "ROL-001",
    title: "Mencatat pengisian BBM dan melihat efisiensi",
    summary: "Pengguna mencatat pengisian BBM; GarageGo menghitung km/L dan biaya per km dari pengisian berurutan.",
    async run(page, g) {
      await boot(page);
      await g.tap(page.getByRole("tab", { name: /^BBM/ }));
      await g.step("Buka tab BBM", "Ketuk tab **BBM**. Ringkasan menampilkan **Rata-Rata Efisiensi**, **Biaya per KM**, dan riwayat pengisian.");
      await g.tap(btn(page, /^Catat Pengisian BBM/));
      await page.waitForTimeout(800);
      await fill(page, field(page, "Kilometer Odometer (km)"), "24900");
      await fill(page, field(page, "Volume (Liter / kWh)"), "30");
      await fill(page, field(page, "Harga Satuan (Rp/Liter)"), "13700");
      await g.step("Isi pengisian", "Ketuk **Catat Pengisian BBM**, lalu isi **Kilometer Odometer**, **Volume** (0–500 L), dan **Harga Satuan**. Biarkan **Isi Tangki Penuh** aktif agar km/L akurat.");
      await g.tap(btn(page, /^Simpan$/));
      await page.waitForTimeout(1200);
      await g.step("Simpan dan baca efisiensi", "Ketuk **Simpan**. Catatan baru masuk ke riwayat dan km/L serta Rp/km dihitung ulang otomatis.");
    },
  },
  {
    flow: "FLOW-DOC-01", tc: "FLOW-DOC-01-T01", role: "ROL-001",
    title: "Memantau pajak dan dokumen kendaraan",
    summary: "Pengguna membuka **Brankas** untuk melihat sisa hari PKB tahunan, STNK 5 tahunan, dan asuransi kendaraan aktif.",
    async run(page, g) {
      await boot(page);
      await g.tap(page.getByRole("tab", { name: /^Brankas/ }));
      await g.step("Buka Brankas", "Ketuk tab **Brankas**. Setiap dokumen menampilkan sisa hari, tanggal **Masa Berlaku**, dan biaya.");
      await g.tap(btn(page, /^Tambah Dokumen/));
      await page.waitForTimeout(800);
      await g.step("Tambah dokumen", "Ketuk **Tambah Dokumen** untuk mencatat uji emisi, SIM, BPKB, atau dokumen lain beserta jatuh temponya.");
    },
  },
  {
    flow: "FLOW-TCO-01", tc: "FLOW-TCO-01-T01", role: "ROL-001",
    title: "Melihat total biaya dan skor kesehatan kendaraan",
    summary: "Di tab **Garasi** pengguna membaca skor kesehatan, odometer, biaya per km, dan rincian total biaya kepemilikan.",
    async run(page, g) {
      await boot(page);
      await g.step("Baca skor kesehatan", "Tab **Garasi** menampilkan skor kesehatan kendaraan aktif dan peringatan yang perlu ditindaklanjuti.");
      await page.mouse.move(215, 500);
      await page.mouse.wheel(0, 650);
      await page.waitForTimeout(900);
      await g.step("Baca ringkasan biaya", "Gulir ke bawah: **Odometer**, **Biaya / KM**, **Konsumsi BBM**, dan **Total Biaya (TCO)**.");
      await page.mouse.wheel(0, 450);
      await page.waitForTimeout(900);
      await g.step("Rincian TCO", "Bagian **Total Biaya Kepemilikan (TCO)** merinci biaya BBM, perawatan, serta pajak & STNK.");
    },
  },
  {
    flow: "FLOW-SET-01", tc: "FLOW-SET-01-T01", role: "ROL-001",
    title: "Mencadangkan data dan mengatur preferensi",
    summary: "Pengguna membuka **Pengaturan** untuk mengatur tema dan bahasa, serta mengekspor cadangan `.grg` atau CSV.",
    async run(page, g) {
      await boot(page);
      await g.tap(page.getByRole("tab", { name: /^Pengaturan/ }));
      await g.step("Buka Pengaturan", "Ketuk tab **Pengaturan**: daftar kendaraan, **Mode Tema**, **Bahasa Aplikasi**, dan **Zona Waktu**.");
      await page.mouse.move(215, 500);
      await page.mouse.wheel(0, 450);
      await page.waitForTimeout(900);
      await g.step("Cadangkan data", "Pada **Portabilitas & Cadangan Data** pilih **Ekspor Cadangan (.grg)**, **Pulihkan dari berkas (.grg)**, atau ekspor CSV riwayat servis/BBM.");
    },
  },
];

// BAST_NO_BUILD=1 memakai build/web yang sudah ada; BAST_ONLY=FLOW-A,FLOW-B merekam ulang sebagian flow.
const only = process.env.BAST_ONLY?.split(",");
await runFlutterBast(import.meta.dirname + "/../..", flows.filter((f) => !only || only.includes(f.flow)), { build: !process.env.BAST_NO_BUILD });
