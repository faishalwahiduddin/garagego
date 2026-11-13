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
  String get exportBackup => 'Ekspor Cadangan (.grg)';

  @override
  String get importBackup => 'Pulihkan Cadangan (.grg)';

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
      'Bagikan berkas cadangan .grg berisi seluruh data garasi, jadwal servis, dokumen, dan log BBM.';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Bagikan seluruh kendaraan, servis, BBM, dan jadwal sebagai berkas .grg';

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
  String get eksporBackupJson => 'Ekspor Cadangan (.grg)';

  @override
  String get eksporCsvRiwayatBbm => 'Ekspor CSV Riwayat BBM';

  @override
  String get eksporCsvRiwayatServis => 'Ekspor CSV Riwayat Servis';

  @override
  String get eksporCadanganJson => 'Ekspor Cadangan (.grg)';

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
  String get imporPulihkanBackupJson => 'Impor / Pulihkan Cadangan (.grg)';

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
      'Kembalikan data dari berkas cadangan .grg yang valid';

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
  String get lisensiPanganggo => 'Lisensi Penggunaan';

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
  String get pulihkanDariBackupJson => 'Pulihkan dari berkas (.grg)';

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
      'Berkas cadangan .grg siap dibagikan!';

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
  String get teksJsonTidakBolehKosong => 'Berkas cadangan tidak boleh kosong!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Pilih berkas cadangan .grg yang pernah diekspor sebelumnya.';

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

  @override
  String get timezone => 'Zona Waktu';

  @override
  String get timezoneAuto => 'Otomatis (ikut perangkat)';

  @override
  String get licenseUsageTitle => 'Lisensi Penggunaan';

  @override
  String get licenseUsageNotice =>
      'Bebas digunakan untuk keperluan personal dan non-profit.';

  @override
  String get licenseUsageBadgeText => 'Personal & Non-Profit';

  @override
  String get validationVehicleNameRequired =>
      'Nama kendaraan tidak boleh kosong';

  @override
  String get validationVehicleNameMinLength =>
      'Nama kendaraan minimal 2 karakter';

  @override
  String get validationVehicleNameMaxLength =>
      'Nama kendaraan maksimal 50 karakter';

  @override
  String get validationPlateRequired => 'Nomor pelat polisi tidak boleh kosong';

  @override
  String get validationPlateMaxLength => 'Nomor pelat maksimal 15 karakter';

  @override
  String get validationOdometerNegative =>
      'Kilometer odometer tidak boleh negatif';

  @override
  String get validationOdometerTooHigh =>
      'Kilometer odometer melebihi batas wajar';

  @override
  String get validationOdometerLessThanPrevious =>
      'Odometer baru tidak boleh lebih kecil dari sebelumnya';

  @override
  String get validationCostNegative => 'Biaya tidak boleh bernilai negatif';

  @override
  String get validationFuelLitersPositive =>
      'Volume bahan bakar harus lebih dari 0 liter';

  @override
  String get validationFuelLitersTooHigh =>
      'Volume tangki melebihi kapasitas wajar';

  @override
  String get validationServiceNameRequired => 'Nama servis wajib diisi';

  @override
  String get validationDocNameRequired => 'Nama dokumen wajib diisi';

  @override
  String get appTitle => 'GarageGo';

  @override
  String get appTagline =>
      'Catat servis, oli, BBM & pajak kendaraan dalam satu garasi';

  @override
  String get loadingLabel => 'Memuat…';

  @override
  String get onbSkip => 'Lewati';

  @override
  String get onbNext => 'Lanjut';

  @override
  String get onbGetStarted => 'Mulai Sekarang';

  @override
  String get onbPrivacyHeadline => 'Privasi & Offline Terjamin';

  @override
  String get onbPrivacyDetail =>
      'Semua data kendaraan tersimpan aman di perangkat Anda tanpa pelacak.';

  @override
  String get onbSlide1Title => 'Garasi Anda';

  @override
  String get onbSlide1Sub => 'Mobil & motor dalam satu tempat';

  @override
  String get onbSlide1Badge => '100% Offline & Privat';

  @override
  String get onbSlide2Title => 'Perawatan';

  @override
  String get onbSlide2Sub => 'Servis, oli, dan pajak STNK';

  @override
  String get onbSlide2Badge => 'Pengingat Berkala';

  @override
  String get onbSlide3Title => 'BBM';

  @override
  String get onbSlide3Sub => 'Konsumsi km/L & biaya per km';

  @override
  String get onbSlide3Badge => 'Tanpa Iklan & Tanpa Akun';

  @override
  String get onbSlide4Title => 'Offline & Privat';

  @override
  String get onbSlide4Sub => 'Data tersimpan di perangkat Anda';

  @override
  String get onbSlide4Badge => 'Data Tersimpan di Perangkat';

  @override
  String get urgencySafe => 'Aman';

  @override
  String get urgencyDueSoon => 'Segera';

  @override
  String get urgencyOverdue => 'Terlewat';

  @override
  String get docTypeTax => 'Pajak PKB Tahunan';

  @override
  String get docTypePlate => 'Ganti Pelat & STNK 5 Th';

  @override
  String get docTypeInsurance => 'Asuransi Kendaraan';

  @override
  String get docTypeEmissions => 'Uji Emisi / KIR';

  @override
  String get docTypeLicense => 'SIM Pengemudi';

  @override
  String get docTypeTitle => 'BPKB Kendaraan';

  @override
  String get docTypeOther => 'Dokumen Lainnya';

  @override
  String get mtCatOilFluids => 'Oli & Pelumas';

  @override
  String get mtCatOilFilter => 'Oli & Filter';

  @override
  String get mtCatAirFilter => 'Filter & Udara';

  @override
  String get mtCatBrakes => 'Pengereman';

  @override
  String get mtCatTires => 'Ban & Suspensi';

  @override
  String get mtCatIgnition => 'Pengapian';

  @override
  String get mtCatTransmission => 'Transmisi & Penggerak';

  @override
  String get mtCatCvt => 'Transmisi CVT';

  @override
  String get mtCatElectrical => 'Kelistrikan & Aki';

  @override
  String get mtCatCoolant => 'Cairan & Radiator';

  @override
  String get mtCatGeneral => 'Perawatan Berkala';

  @override
  String get mtPresetCarOil => 'Ganti Oli Mesin Sintetik';

  @override
  String get mtPresetCarOilFilter => 'Ganti Filter Oli Mesin';

  @override
  String get mtPresetCarAirFilter => 'Filter Udara & AC Kabin';

  @override
  String get mtPresetCarBrakeFluid => 'Kuras Minyak Rem & Kampas';

  @override
  String get mtPresetCarTireRotation => 'Rotasi Ban & Spooring Balancing';

  @override
  String get mtPresetCarSparkPlugs => 'Ganti Busi Iridium';

  @override
  String get mtPresetMotoOil => 'Ganti Oli Mesin Matic/Manual';

  @override
  String get mtPresetMotoGearOil => 'Ganti Oli Gardan (Gear Oil)';

  @override
  String get mtPresetMotoCvt => 'Servis CVT, V-Belt & Roller';

  @override
  String get mtPresetMotoBrakes => 'Cek & Ganti Kampas Rem';

  @override
  String get mtPresetMotoSparkPlug => 'Ganti Busi Motor';

  @override
  String inspPreTripTitle(String type) {
    return 'Inspeksi Pra-Perjalanan ($type)';
  }

  @override
  String inspRoadworthiness(String passed, String total) {
    return 'Kelayakan: $passed dari $total Poin Lolos';
  }

  @override
  String inspPassedCount(String pct, String passed, String total) {
    return '$pct% Lolos ($passed/$total)';
  }

  @override
  String get inspCatEngine => 'Mesin & Cairan';

  @override
  String get inspCatWheelsBrakes => 'Roda & Pengereman';

  @override
  String get inspCatLights => 'Lampu & Kelistrikan';

  @override
  String get inspCatSafety => 'Keselamatan';

  @override
  String get inspCatDrivetrain => 'Transmisi & Penggerak';

  @override
  String get inspCatWheelsSteering => 'Roda & Kemudi';

  @override
  String get inspCatBrakes => 'Pengereman';

  @override
  String get inspCatElectrical => 'Kelistrikan';

  @override
  String get inspCatEquipment => 'Kelengkapan';

  @override
  String get inspCar1 => 'Level Dipstick & Kejernihan Oli Mesin';

  @override
  String get inspCar2 => 'Level Air Reservoir Radiator Coolant';

  @override
  String get inspCar3 => 'Level Minyak Rem & Minyak Kopling/Power Steering';

  @override
  String get inspCar4 => 'Tekanan Udara & Alur Ketebalan 4 Ban + Ban Serep';

  @override
  String get inspCar5 => 'Kondisi Kampas Rem & Daya Cengkeram Rem Tangan';

  @override
  String get inspCar6 => 'Lampu Utama, Lampu Rem, Sein & Lampu Hazard';

  @override
  String get inspCar7 => 'Kondisi Terminal & Tegangan Indikator Aki (12V)';

  @override
  String get inspCar8 => 'Karet Wiper & Air Tabung Washer Kaca Depan';

  @override
  String get inspCar9 => 'Dongkrak, Kunci Roda, Segitiga Pengaman & Kotak P3K';

  @override
  String get inspMoto1 => 'Ketinggian & Kualitas Oli Mesin';

  @override
  String get inspMoto2 => 'Kondisi Oli Gardan / Ketegangan Rantai Roda';

  @override
  String get inspMoto3 => 'Tekanan Angin Ban Depan & Belakang';

  @override
  String get inspMoto4 => 'Ketebalan Kampas Rem Depan & Belakang';

  @override
  String get inspMoto5 => 'Lampu Depan, Lampu Belakang & Lampu Sein';

  @override
  String get inspMoto6 => 'Fungsi Klakson & Starter Elektrik (Kondisi Aki)';

  @override
  String get inspMoto7 => 'Spion Kanan & Kiri serta Kunci Kelengkapan';

  @override
  String gamesLvl(String level) {
    return 'LVL $level';
  }

  @override
  String gamesProgress(String xp, String unlocked, String total) {
    return '$xp XP • $unlocked/$total Lencana Terbuka';
  }

  @override
  String gamesNextLevel(String next, String xp) {
    return 'Menuju $next ($xp XP)';
  }

  @override
  String get gamesMaxRank => 'Pangkat Maksimal';

  @override
  String get gamesBadgesTitle => 'Lencana Disiplin Garasi';

  @override
  String get gamesShare => 'Bagikan';

  @override
  String get gamesUnlocked => 'Terbuka (+100 XP)';

  @override
  String get gamesLocked => 'Belum Tercapai';

  @override
  String gamesBadgeUnlockedLine(String highlight) {
    return 'Lencana terbuka: $highlight';
  }

  @override
  String get gamesLvl1 => 'Pengendara Pemula';

  @override
  String get gamesLvl2 => 'Pemilik Peduli';

  @override
  String get gamesLvl3 => 'Penjaga Armada';

  @override
  String get gamesLvl4 => 'Spesialis Servis';

  @override
  String get gamesLvl5 => 'Master Garasi';

  @override
  String get badgeFirstRideTitle => 'Armada Pertama';

  @override
  String get badgeFirstRideDesc =>
      'Mendaftarkan kendaraan pertama ke dalam garasi digital.';

  @override
  String get badgeOilCareTitle => 'Disiplin Oli';

  @override
  String get badgeOilCareDesc =>
      'Mencatat riwayat ganti oli mesin tepat waktu.';

  @override
  String get badgeServiceVeteranTitle => 'Rutin Berkala';

  @override
  String get badgeServiceVeteranDesc =>
      'Mencatatkan minimal 3 log servis perawatan berkala.';

  @override
  String get badgeFuelWatcherTitle => 'Jejak Efisiensi';

  @override
  String get badgeFuelWatcherDesc =>
      'Mencatat minimal 3 pengisian BBM untuk memantau konsumsi.';

  @override
  String get badgeSafeVoyageTitle => 'Inspektur Teliti';

  @override
  String get badgeSafeVoyageDesc =>
      'Menyelesaikan checklist inspeksi keselamatan kendaraan.';

  @override
  String get badgeDocKeeperTitle => 'Tertib Dokumen';

  @override
  String get badgeDocKeeperDesc =>
      'Menyimpan dokumen legalitas (STNK/Pajak/SIM/Asuransi).';

  @override
  String get badgePrimeFleetTitle => 'Kondisi Prima';

  @override
  String get badgePrimeFleetDesc =>
      'Mencapai skor kesehatan kendaraan 90 atau lebih.';

  @override
  String get badgeRoadWarriorTitle => 'Jelajah 10.000 KM';

  @override
  String get badgeRoadWarriorDesc =>
      'Memantau kendaraan dengan odometer melampaui 10.000 km.';

  @override
  String healthOilOverdue(String km) {
    return 'Ganti oli mesin sudah terlewat $km km';
  }

  @override
  String healthOilDue(String km) {
    return 'Ganti oli mesin perlu dilakukan dalam $km km lagi';
  }

  @override
  String get healthOilOptimal => 'Interval oli mesin dalam kondisi prima';

  @override
  String get healthTaxOverdue => 'Pajak STNK tahunan telah lewat jatuh tempo';

  @override
  String healthTaxDue(String days) {
    return 'Pajak STNK tahunan jatuh tempo dalam $days hari';
  }

  @override
  String get healthTaxSafe => 'Pajak PKB tahunan aktif & aman';

  @override
  String get healthPlateExpired => 'Masa berlaku pelat 5 tahunan telah habis';

  @override
  String healthPlateDue(String days) {
    return 'Pelat 5 tahunan perlu diperpanjang dalam $days hari';
  }

  @override
  String healthScheduleOverdue(String title) {
    return '$title sudah terlewat';
  }

  @override
  String healthScheduleDueSoon(String title) {
    return '$title mendekati batas servis';
  }

  @override
  String get healthPrime => 'Sangat Prima';

  @override
  String get healthAttention => 'Perlu Perhatian';

  @override
  String get healthCritical => 'Kritis / Servis Segera';

  @override
  String get fuelEstTotalCost => 'Estimasi Total Biaya:';

  @override
  String get fuelTripDistance => 'Jarak Tempuh Trip:';

  @override
  String get fuelAvgConsumption => 'Konsumsi Rata-rata:';

  @override
  String get fuelOperatingCost => 'Biaya Operasional:';

  @override
  String get fuelFullTank => 'Tangki Penuh';

  @override
  String get fuelPartial => 'Sebagian';

  @override
  String fuelPricePerLiterLine(String price, String state) {
    return '@ $price / L • $state';
  }

  @override
  String fuelOdometerValue(String value) {
    return 'Odo: $value km';
  }

  @override
  String fuelKmL(String value) {
    return '$value km/L';
  }

  @override
  String get aboutApplication => 'Aplikasi';

  @override
  String get aboutVersion => 'Versi';

  @override
  String get aboutArchitecture => 'Arsitektur';

  @override
  String get aboutArchitectureValue =>
      '100% Offline-First (tanpa server, tanpa pelacakan)';

  @override
  String get aboutDomain => 'Domain';

  @override
  String get aboutPackageId => 'ID Paket';

  @override
  String settingsVehicleOdo(String plate, String value) {
    return '$plate • Odo: $value km';
  }

  @override
  String get backupInvalidFile =>
      'Berkas .grg tidak valid atau strukturnya rusak';

  @override
  String get filterAll => 'Semua';

  @override
  String get filterAttention => 'Perhatian';

  @override
  String get maintenanceScreenTitle => 'Perawatan & Servis';

  @override
  String get serviceTitleHint => 'Misal: Ganti Oli Mesin & Filter';

  @override
  String get workshopHint => 'Misal: Bengkel Resmi Astra';

  @override
  String get mustBePositive => 'Wajib lebih dari 0';

  @override
  String get editScheduleTitle => 'Ubah Jadwal Perawatan';

  @override
  String get scheduleUpdated => 'Jadwal berhasil diperbarui!';

  @override
  String get scheduleSaved => 'Jadwal perawatan berhasil disimpan!';

  @override
  String get updateSchedule => 'Perbarui Jadwal';

  @override
  String get saveSchedule => 'Simpan Jadwal Perawatan';

  @override
  String scheduleCompleted(String title) {
    return '$title berhasil diselesaikan!';
  }

  @override
  String kmOverdue(String km) {
    return 'Terlewat $km km';
  }

  @override
  String kmRemaining(String km) {
    return 'Sisa $km km lagi';
  }

  @override
  String kmOverdueShort(String km) {
    return 'Lewat $km km';
  }

  @override
  String kmRemainingShort(String km) {
    return 'Sisa $km km';
  }

  @override
  String daysOverdue(String days) {
    return 'Terlewat $days hari';
  }

  @override
  String daysLeft(String days) {
    return 'Sisa $days hari lagi';
  }

  @override
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  ) {
    return 'Setiap $km km atau $months bulan • Terakhir: $odo km ($date)';
  }

  @override
  String get shareVehiclePassport => 'Bagikan Paspor Kendaraan';

  @override
  String get shareVehiclePassportSubtitle =>
      'Bagikan kartu status, skor kesehatan & riwayat ke media sosial';

  @override
  String get garageEmptyBody =>
      'Tambahkan mobil atau motor keluarga pertama Anda untuk mulai memantau servis, oli, dan BBM.';

  @override
  String resetOilConfirm(String name, String odo) {
    return 'Counter penggantian oli untuk $name akan diatur ulang ke odometer saat ini ($odo km).';
  }

  @override
  String get resetOilServiceNote => 'Reset counter interval oli mesin';

  @override
  String oilIntervalEvery(String km) {
    return 'Interval: tiap $km km';
  }

  @override
  String garageYear(String year) {
    return 'Tahun $year';
  }

  @override
  String get shareDialogTitle => 'Bagikan Paspor Kendaraan';

  @override
  String get shareCopySummary => 'Salin Ringkasan';

  @override
  String get sharePreparing => 'Menyiapkan…';

  @override
  String get shareDownloadPassport => 'Unduh Paspor';

  @override
  String get shareSharePassport => 'Bagikan Paspor';

  @override
  String get shareImageFailed => 'Gagal membuat gambar paspor kendaraan';

  @override
  String get shareImageDownloaded => 'Paspor kendaraan berhasil diunduh';

  @override
  String get shareSummaryCopied =>
      'Ringkasan status kendaraan berhasil disalin';

  @override
  String get shareCardHealthHeader => 'STATUS KESEHATAN ARMADA';

  @override
  String shareCardCondition(String status) {
    return 'Kondisi $status';
  }

  @override
  String get shareCardOdometer => 'ODOMETER';

  @override
  String get shareCardOil => 'GANTI OLI';

  @override
  String get shareCardTax => 'PAJAK PKB';

  @override
  String get shareCardNeedService => 'Perlu Servis';

  @override
  String shareCardDaysShort(String days) {
    return '$days hr lagi';
  }

  @override
  String shareCardLogbook(String date) {
    return 'Logbook: $date';
  }

  @override
  String shareTextHeader(String name, String plate) {
    return '🚗 Paspor Perawatan Kendaraan — $name ($plate)';
  }

  @override
  String shareTextHealth(String score, String status) {
    return '🏆 Skor Kesehatan: $score/100 ($status)';
  }

  @override
  String shareTextOdometer(String odo) {
    return '⚡ Odometer: $odo km';
  }

  @override
  String shareTextOil(String km) {
    return '🛢️ Interval Ganti Oli: $km km lagi';
  }

  @override
  String get shareTextOilDue => '🛢️ Perlu Ganti Oli Segera';

  @override
  String shareTextTax(String days) {
    return '📋 Pajak PKB: $days hari lagi';
  }

  @override
  String get shareTextFooter =>
      'Kelola perawatan garasi lengkap & offline di GarageGo: https://garagego.faishal.id';

  @override
  String gloveboxHeader(String name) {
    return 'Glovebox Digital — $name';
  }

  @override
  String gloveboxDocCount(String plate, String count) {
    return '$plate • $count Dokumen Terdaftar';
  }

  @override
  String docExpiredAgo(String days) {
    return 'Kedaluwarsa $days hari lalu';
  }

  @override
  String docDueIn(String days) {
    return 'Jatuh tempo $days hari lagi';
  }

  @override
  String docDaysLeft(String days) {
    return '$days hari lagi';
  }

  @override
  String docValidUntil(String date) {
    return 'Masa Berlaku: $date';
  }

  @override
  String get docEditTitle => 'Ubah Dokumen';

  @override
  String get docAddTitle => 'Tambah Dokumen Garasi';

  @override
  String get docTitleHint => 'Misal: PKB Tahunan / Asuransi All Risk';

  @override
  String get docNumberHint => 'Misal: B 1234 CD / POL-88902';

  @override
  String get docCostHint => 'Misal: 3500000';

  @override
  String get docNotesLabel => 'Catatan & Petunjuk Perpanjangan';

  @override
  String get docNotesHint => 'Misal: Bayar online via Signal app';

  @override
  String get docUpdated => 'Dokumen berhasil diperbarui!';

  @override
  String get docAdded => 'Dokumen berhasil ditambahkan!';

  @override
  String get docUpdate => 'Perbarui Dokumen';

  @override
  String get docSave => 'Simpan Dokumen';

  @override
  String get vehicleNameHint => 'Misal: Honda HR-V / Yamaha NMAX';

  @override
  String get plateHint => 'B 1234 CD';

  @override
  String get invalidYear => 'Tahun tidak valid';

  @override
  String get taxDueLabel => 'Jatuh Tempo Pajak STNK';

  @override
  String scheduleDoneNote(String category) {
    return 'Selesai sesuai jadwal berkala ($category)';
  }

  @override
  String get backupErrEmpty => 'Data cadangan kosong.';

  @override
  String get backupErrRawJson =>
      'Format JSON mentah tidak didukung demi keamanan. Gunakan berkas cadangan resmi.';

  @override
  String get backupErrFormat =>
      'Format berkas cadangan tidak valid atau tidak dikenali.';

  @override
  String backupErrWrongApp(String other, String expected) {
    return 'Berkas cadangan milik aplikasi $other, tidak dapat dipulihkan ke $expected.';
  }

  @override
  String get backupErrCorrupt =>
      'Data cadangan rusak atau format encoding tidak sah.';

  @override
  String get backupErrIntegrity =>
      'Integritas data cadangan tidak valid: data telah dimodifikasi atau rusak.';

  @override
  String get backupErrNotObject =>
      'Isi data cadangan bukan objek data yang sah.';

  @override
  String get mtCatEngine => 'Mesin';

  @override
  String get mtCatOther => 'Lainnya';

  @override
  String get unitMonthsShort => 'bln';

  @override
  String get docNoteTax =>
      'Bayar via Samsat Digital Nasional (SIGNAL) atau Samsat terdekat';

  @override
  String get docNotePlate =>
      'Wajib cek fisik kendaraan langsung di Samsat Induk';

  @override
  String get docNoteInsurance =>
      'Nomor klaim darurat atau towing tersedia di polis';

  @override
  String gamesBadgeCount(String unlocked, String total) {
    return '$unlocked/$total Lencana Terbuka';
  }

  @override
  String get demoServiceTitle =>
      'Servis Berkala & Ganti Oli Mesin Sintetik 5W-30';

  @override
  String get demoServiceNotes =>
      'Ganti filter oli & filter AC kabin di bengkel resmi';

  @override
  String get demoRotationTitle => 'Rotasi Ban & Spooring Balancing';

  @override
  String get demoRotationNotes => 'Tekanan ban disetel 33 psi nitrogen';

  @override
  String get demoInspectionTitle => 'Inspeksi Lengkap Pra-Roadtrip';

  @override
  String get demoInspectionNotes =>
      'Kondisi kendaraan sangat prima, tekanan ban dan oli mesin dalam kondisi ideal.';
}
