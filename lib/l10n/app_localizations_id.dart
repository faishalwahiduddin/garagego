// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => 'Manajer Garasi, Servis & BBM Kendaraan';

  @override
  String get settings => 'Pengaturan';

  @override
  String get appearance => 'Tampilan';

  @override
  String get theme => 'Tema';

  @override
  String get language => 'Bahasa';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get selectTheme => 'Pilih Tema';

  @override
  String get selectLanguage => 'Pilih Bahasa';

  @override
  String get localeIndonesian => 'Bahasa Indonesia';

  @override
  String get localeEnglish => 'English';

  @override
  String get localeArabic => 'العربية';

  @override
  String get localeJavanese => 'Basa Jawa';

  @override
  String get localeSundanese => 'Basa Sunda';

  @override
  String get localeChinese => '中文';

  @override
  String get localeJapanese => '日本語';

  @override
  String get localeSpanish => 'Español';

  @override
  String get about => 'Tentang';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get delete => 'Hapus';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Tambah';

  @override
  String get search => 'Cari';

  @override
  String get filter => 'Filter';

  @override
  String get reset => 'Reset';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get yes => 'Ya';

  @override
  String get no => 'Tidak';

  @override
  String get close => 'Tutup';

  @override
  String get navGarage => 'Garasi';

  @override
  String get navMaintenance => 'Perawatan';

  @override
  String get navFuel => 'BBM';

  @override
  String get navGlovebox => 'Brankas';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get vehiclesTitle => 'Daftar Kendaraan di Garasi';

  @override
  String get addVehicle => 'Tambah Kendaraan';

  @override
  String get editVehicle => 'Edit Kendaraan';

  @override
  String get vehicleName => 'Nama Kendaraan';

  @override
  String get plateNumber => 'Plat Nomor';

  @override
  String get odometer => 'Odometer (km)';

  @override
  String get car => 'Mobil';

  @override
  String get motorcycle => 'Motor';

  @override
  String get vehicleType => 'Tipe Kendaraan';

  @override
  String get brand => 'Merk / Pabrikan';

  @override
  String get modelYear => 'Tahun Pembuatan';

  @override
  String get fuelType => 'Jenis BBM';

  @override
  String get oilCapacity => 'Kapasitas Oli (L)';

  @override
  String get activeVehicle => 'Kendaraan Aktif';

  @override
  String get setActive => 'Jadikan Aktif';

  @override
  String get noVehicles => 'Belum ada kendaraan di garasi';

  @override
  String get maintenanceTitle => 'Jadwal & Riwayat Servis';

  @override
  String get addServiceLog => 'Catat Servis Baru';

  @override
  String get serviceDate => 'Tanggal Servis';

  @override
  String get serviceCost => 'Biaya Servis';

  @override
  String get workshop => 'Bengkel';

  @override
  String get notes => 'Catatan';

  @override
  String get isOilChange => 'Ganti Oli Mesin';

  @override
  String get serviceSchedule => 'Jadwal Servis Berkala';

  @override
  String get addSchedule => 'Tambah Jadwal';

  @override
  String get oilLifeRemaining => 'Sisa Masa Pakai Oli';

  @override
  String get oilResetSuccess =>
      'Counter oli berhasil direset ke odometer saat ini!';

  @override
  String get noServiceLogs => 'Belum Ada Riwayat Servis';

  @override
  String get noSchedules => 'Belum Ada Jadwal Servis';

  @override
  String get inspectionChecklist => 'Checklist Inspeksi Kendaraan';

  @override
  String get startInspection => 'Mulai Inspeksi';

  @override
  String get fuelTitle => 'Catatan Pengisian BBM';

  @override
  String get addFuelLog => 'Catat Pengisian BBM';

  @override
  String get liters => 'Volume (Liter)';

  @override
  String get totalCost => 'Total Biaya';

  @override
  String get pricePerLiter => 'Harga per Liter';

  @override
  String get fullTank => 'Isi Penuh (Full Tank)';

  @override
  String get gasStation => 'SPBU';

  @override
  String get fuelEfficiency => 'Konsumsi BBM Rata-rata';

  @override
  String get costPerKm => 'Biaya per Kilometer';

  @override
  String get noFuelLogs => 'Belum Ada Catatan BBM';

  @override
  String get gloveboxTitle => 'Brankas Dokumen & Pajak';

  @override
  String get addDocument => 'Tambah Dokumen';

  @override
  String get stnkTaxExpiry => 'Jatuh Tempo Pajak Tahunan STNK';

  @override
  String get stnk5YearExpiry => 'Jatuh Tempo STNK 5 Tahunan (Ganti Plat)';

  @override
  String get simExpiry => 'Masa Berlaku SIM';

  @override
  String get insuranceExpiry => 'Asuransi Kendaraan';

  @override
  String daysRemaining(Object count) {
    return '$count hari tersisa';
  }

  @override
  String get expired => 'Sudah Kadaluarsa';

  @override
  String get noDocuments => 'Belum Ada Dokumen Tercatat';

  @override
  String get dataManagement => 'Manajemen Data & Cadangan';

  @override
  String get exportBackup => 'Ekspor Cadangan (JSON)';

  @override
  String get importBackup => 'Pulihkan Cadangan (JSON)';

  @override
  String get exportCsv => 'Ekspor ke CSV';

  @override
  String get resetAllData => 'Atur Ulang Data';

  @override
  String get privacyNotice =>
      'Data 100% tersimpan lokal di perangkat tanpa cloud eksternal.';

  @override
  String get aksiCepat => 'Aksi Cepat';

  @override
  String get aksiCepatGarasi => 'Aksi Cepat Garasi';

  @override
  String get aturUlangData => 'Atur Ulang Data';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'Atur pengingat ganti oli, filter, rem, dan sparepart.';

  @override
  String get audit10PoinKeselamatanJalanMud =>
      'Audit 10-poin keselamatan jalan & mudik';

  @override
  String get auditKelayakanJalanKeselamatan =>
      'Audit kelayakan jalan & keselamatan sebelum perjalanan mudik atau harian.';

  @override
  String get bahasaAplikasi => 'Bahasa Aplikasi';

  @override
  String get batal => 'Batal';

  @override
  String get belumAdaCatatanBbm => 'Belum Ada Catatan BBM';

  @override
  String get belumAdaDokumenTercatat => 'Belum Ada Dokumen Tercatat';

  @override
  String get belumAdaHasilCeklis => 'Belum Ada Hasil Ceklis';

  @override
  String get belumAdaJadwalServis => 'Belum Ada Jadwal Servis';

  @override
  String get belumAdaRiwayatServis => 'Belum Ada Riwayat Servis';

  @override
  String get belumAdaCatatanServis => 'Belum ada catatan servis.';

  @override
  String get belumAdaJadwalPerawatanBerkala =>
      'Belum ada jadwal perawatan berkala.';

  @override
  String get biayaKm => 'Biaya / KM';

  @override
  String get biayaTotalRp => 'Biaya Total (Rp)';

  @override
  String get biayaPerKm => 'Biaya per KM';

  @override
  String get bukaBrankas => 'Buka Brankas';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      'Cadangan lengkap seluruh data garasi, jadwal servis, dokumen, dan log BBM dapat disalin ke clipboard di bawah:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Cadangkan seluruh kendaraan, servis, BBM, dan jadwal';

  @override
  String get cariRiwayatServisAtauBengkel =>
      'Cari riwayat servis atau bengkel...';

  @override
  String get catatPengisianBbm => 'Catat Pengisian BBM';

  @override
  String get catatPengisianPertama => 'Catat Pengisian Pertama';

  @override
  String get catatServisBaru => 'Catat Servis Baru';

  @override
  String get catatServisPertama => 'Catat Servis Pertama';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'Catat struk pengisian bensin untuk memantau konsumsi km/L dan cost/km.';

  @override
  String get catatanOpsional => 'Catatan (Opsional)';

  @override
  String get catatanLokasiBerkasFisik => 'Catatan / Lokasi Berkas Fisik';

  @override
  String get catatanBbmBerhasilDisimpan => 'Catatan BBM berhasil disimpan!';

  @override
  String get catatanPemeriksaOpsional => 'Catatan Pemeriksa (Opsional)';

  @override
  String get catatanSparepartPengerjaan => 'Catatan Sparepart / Pengerjaan';

  @override
  String get catatanServisBerhasilDitambahk =>
      'Catatan servis berhasil ditambahkan!';

  @override
  String get catatanTambahanKondisiKendaraa =>
      'Catatan tambahan kondisi kendaraan...';

  @override
  String get ceklisKondisiKendaraan => 'Ceklis Kondisi Kendaraan';

  @override
  String get checklistInspeksiKendaraan => 'Checklist Inspeksi Kendaraan';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'Counter oli berhasil direset ke odometer saat ini!';

  @override
  String get daftarKendaraanDiGarasi => 'Daftar Kendaraan di Garasi';

  @override
  String get daftarMasaBerlakuDokumenLisens =>
      'Daftar Masa Berlaku Dokumen & Lisensi';

  @override
  String get dataCsvBerhasilDisalinKeClipbo =>
      'Data CSV berhasil disalin ke Clipboard!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      'Data cadangan berhasil dipulihkan ke garasi!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'Data format CSV siap diekspor ke Excel / Spreadsheet:';

  @override
  String get dataGarasiBerhasilDiresetKeSta =>
      'Data garasi berhasil direset ke standar.';

  @override
  String get diperlukanUntukAkurasiKalkulas =>
      'Diperlukan untuk akurasi kalkulasi km/L';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'Dual-Trigger Reminder: Alarm akan aktif jika jarak (km) ATAU waktu (bulan) tercapai.';

  @override
  String get eksporBackupJson => 'Ekspor Backup JSON';

  @override
  String get eksporCsvRiwayatBbm => 'Ekspor CSV Riwayat BBM';

  @override
  String get eksporCsvRiwayatServis => 'Ekspor CSV Riwayat Servis';

  @override
  String get eksporCadanganJson => 'Ekspor Cadangan JSON';

  @override
  String get eksporFormatTabelSpreadsheetUn =>
      'Ekspor format tabel spreadsheet untuk pencatatan bengkel';

  @override
  String get eksporSeluruhPengisianBbmKeFor =>
      'Ekspor seluruh pengisian BBM ke format CSV spreadsheet';

  @override
  String get estimasiBiayaPremiRp => 'Estimasi Biaya / Premi (Rp)';

  @override
  String get gantiPelat5Th => 'Ganti Pelat 5 Th';

  @override
  String get garasiMasihKosong => 'Garasi Masih Kosong';

  @override
  String get hargaSatuanRpLiter => 'Harga Satuan (Rp/Liter)';

  @override
  String get hasilCeklisInspeksiBerhasilDis =>
      'Hasil ceklis inspeksi berhasil disimpan!';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi =>
      'Hitung konsumsi km/L dan biaya bensin';

  @override
  String get imporPulihkanBackupJson => 'Impor / Pulihkan Backup JSON';

  @override
  String get intervalJarakKm => 'Interval Jarak (km)';

  @override
  String get intervalOliKm => 'Interval Oli (km)';

  @override
  String get intervalWaktu => 'Interval Waktu';

  @override
  String get isiTangkiPenuhFullTank => 'Isi Tangki Penuh (Full Tank)?';

  @override
  String get jadwalServisMendatang => 'Jadwal Servis Mendatang';

  @override
  String get jenisBahanBakar => 'Jenis Bahan Bakar';

  @override
  String get jenisDokumen => 'Jenis Dokumen';

  @override
  String get judulKeteranganDokumen => 'Judul / Keterangan Dokumen';

  @override
  String get kategori => 'Kategori:';

  @override
  String get kembalikanDataDariBerkasCadang =>
      'Kembalikan data dari berkas cadangan JSON yang valid';

  @override
  String get kilometerOdometerKm => 'Kilometer Odometer (km)';

  @override
  String get konfirmasiReset => 'Konfirmasi Reset';

  @override
  String get konsumsiBbm => 'Konsumsi BBM';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'Lakukan inspeksi 10 poin ban, rem, oli, lampu, dan aki.';

  @override
  String get lihatSemua => 'Lihat Semua';

  @override
  String get lisensiPamakean => 'Lisensi Pamakean';

  @override
  String get lisensiPanganggo => 'Lisensi Panganggo';

  @override
  String get lisensiPenggunaan => 'Lisensi Penggunaan';

  @override
  String get menghapusSemuaLogServisBbmDanR =>
      'Menghapus semua log servis, BBM, dan riwayat garasi';

  @override
  String get mobil => 'Mobil';

  @override
  String get mobilAtauMotorKeluargaBaru => 'Mobil atau motor keluarga baru';

  @override
  String get modeTema => 'Mode Tema';

  @override
  String get motor => 'Motor';

  @override
  String get mulaiCeklis => 'Mulai Ceklis';

  @override
  String get mulaiInspeksiPertama => 'Mulai Inspeksi Pertama';

  @override
  String get namaModelKendaraan => 'Nama / Model Kendaraan';

  @override
  String get namaBengkelToko => 'Nama Bengkel / Toko';

  @override
  String get namaBengkelTokoOpsional => 'Nama Bengkel / Toko (Opsional)';

  @override
  String get namaPekerjaanKomponen => 'Nama Pekerjaan / Komponen';

  @override
  String get namaSpbuLokasi => 'Nama SPBU / Lokasi';

  @override
  String get nomorDokumenNoPolisNoPolisi =>
      'Nomor Dokumen / No. Polis / No. Polisi';

  @override
  String get nomorPelatPolisi => 'Nomor Pelat Polisi';

  @override
  String get odometerPengerjaanKm => 'Odometer Pengerjaan (km)';

  @override
  String get odometerSaatIniKm => 'Odometer Saat Ini (km)';

  @override
  String get odometerTerakhirDikerjakanKm =>
      'Odometer Terakhir Dikerjakan (km)';

  @override
  String get opsiJadwal => 'Opsi Jadwal';

  @override
  String get pkbTahunan => 'PKB Tahunan';

  @override
  String get pajakStnk => 'Pajak & STNK';

  @override
  String get pajakPkbTahunan => 'Pajak PKB Tahunan';

  @override
  String get pekerjaanServis => 'Pekerjaan / Servis';

  @override
  String get pelat5Th => 'Pelat 5 Th';

  @override
  String get pengaturanGarasi => 'Pengaturan Garasi';

  @override
  String get penggantianOliMesinResetCounte =>
      'Penggantian Oli Mesin (Reset Counter)';

  @override
  String get pilihBahasaSelectLanguage => 'Pilih Bahasa / Select Language';

  @override
  String get pilihAtauBuatKendaraanTerlebih =>
      'Pilih atau buat kendaraan terlebih dahulu.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Pilih atau tambah kendaraan terlebih dahulu.';

  @override
  String get portabilitasCadanganData => 'Portabilitas & Cadangan Data';

  @override
  String get pulihkanData => 'Pulihkan Data';

  @override
  String get pulihkanDariBackupJson => 'Pulihkan dari Backup JSON';

  @override
  String get rataRataEfisiensi => 'Rata-Rata Efisiensi';

  @override
  String get rekorIritTerbaik => 'Rekor Irit Terbaik';

  @override
  String get resetCounterOliMesin => 'Reset Counter Oli Mesin';

  @override
  String get resetDataGarasi => 'Reset Data Garasi';

  @override
  String get resetOli => 'Reset Oli';

  @override
  String get resetSeluruhData => 'Reset Seluruh Data?';

  @override
  String get rincianPartYangDiganti => 'Rincian part yang diganti...';

  @override
  String get riwayatLengkap => 'Riwayat Lengkap';

  @override
  String get riwayatPengisianBahanBakar => 'Riwayat Pengisian Bahan Bakar';

  @override
  String get salinCsv => 'Salin CSV';

  @override
  String get salinKeClipboard => 'Salin ke Clipboard';

  @override
  String get salinanJsonBackupBerhasilDisal =>
      'Salinan JSON backup berhasil disalin ke Clipboard!';

  @override
  String get servisTerakhir => 'Servis Terakhir';

  @override
  String get setPengingatBerkalaGantiPartKm =>
      'Set pengingat berkala ganti part km/bulan';

  @override
  String get simpan => 'Simpan';

  @override
  String get simpanAuditInspeksi => 'Simpan Audit Inspeksi';

  @override
  String get simpanKeGarasi => 'Simpan ke Garasi';

  @override
  String get simpanRiwayatBengkelDanGantiOl =>
      'Simpan riwayat bengkel dan ganti oli';

  @override
  String get simpanTanggalJatuhTempoStnkAsu =>
      'Simpan tanggal jatuh tempo STNK, asuransi, dan dokumen kendaraan Anda.';

  @override
  String get statusOliMesin => 'Status Oli Mesin';

  @override
  String get tahunPembuatan => 'Tahun Pembuatan';

  @override
  String get tambahDokumen => 'Tambah Dokumen';

  @override
  String get tambahDokumenPertama => 'Tambah Dokumen Pertama';

  @override
  String get tambahJadwalBaru => 'Tambah Jadwal Baru';

  @override
  String get tambahJadwalPerawatan => 'Tambah Jadwal Perawatan';

  @override
  String get tambahKendaraan => 'Tambah Kendaraan';

  @override
  String get tambahKendaraanBaru => 'Tambah Kendaraan Baru';

  @override
  String get tampilanBahasa => 'Tampilan & Bahasa';

  @override
  String get tandaiSelesai => 'Tandai Selesai';

  @override
  String get tandaiSelesaiReset => 'Tandai Selesai / Reset';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      'Tandai selesai akan mereset hitungan interval dan otomatis mencatat ke Riwayat Servis.';

  @override
  String get tanggalMasaBerlakuJatuhTempo =>
      'Tanggal Masa Berlaku / Jatuh Tempo';

  @override
  String get tanggalTerakhirDikerjakan => 'Tanggal Terakhir Dikerjakan';

  @override
  String get teksJsonTidakBolehKosong => 'Teks JSON tidak boleh kosong!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Tempelkan teks data JSON cadangan yang pernah diekspor sebelumnya:';

  @override
  String get tentangAplikasiLisensi => 'Tentang Aplikasi & Lisensi';

  @override
  String get termasukGantiOli => 'Termasuk Ganti Oli?';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'Tindakan ini akan mengosongkan semua data dan mengembalikan contoh awal garasi.';

  @override
  String get totalBiayaRp => 'Total Biaya (Rp)';

  @override
  String get totalBiayaTco => 'Total Biaya (TCO)';

  @override
  String get totalBiayaBengkel => 'Total Biaya Bengkel';

  @override
  String get totalBiayaKepemilikanTco => 'Total Biaya Kepemilikan (TCO)';

  @override
  String get totalPengeluaranBbm => 'Total Pengeluaran BBM';

  @override
  String get tutup => 'Tutup';

  @override
  String get ubah => 'Ubah';

  @override
  String get volumeLiterKwh => 'Volume (Liter / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'Gagal memulihkan backup: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 =>
      'Misal: Pajak PKB Tahunan STNK 2026';

  @override
  String get hintPlatB1234 => 'B 1234 ABC';

  @override
  String get misalStnkDiDompet => 'Misal: STNK di dompet, BPKB di lemari arsip';

  @override
  String get misalKurasMinyakRem => 'Misal: Kuras Minyak Rem DOT 4';

  @override
  String selesaikanJadwal(String title) {
    return 'Selesaikan: $title';
  }

  @override
  String jadwalCount(String count) {
    return 'Jadwal ($count)';
  }

  @override
  String riwayatCount(String count) {
    return 'Riwayat ($count)';
  }

  @override
  String inspeksiCount(String count) {
    return 'Inspeksi ($count)';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return 'Rekomendasi pabrik $label berhasil dimuat!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'Muat Standar Pabrik ($label)';
  }

  @override
  String odometerValue(String odo) {
    return 'Odometer: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return 'Kendaraan $name berhasil ditambahkan ke garasi!';
  }
}
