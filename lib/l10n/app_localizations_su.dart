// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sundanese (`su`).
class AppLocalizationsSu extends AppLocalizations {
  AppLocalizationsSu([String locale = 'su']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => 'Manajer Garasi, Sérvis & BBM Tutumpakan';

  @override
  String get settings => 'Setélan';

  @override
  String get appearance => 'Pidangan';

  @override
  String get theme => 'Téma';

  @override
  String get language => 'Basa';

  @override
  String get themeLight => 'Caang';

  @override
  String get themeDark => 'Poék';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get selectTheme => 'Pilih Téma';

  @override
  String get selectLanguage => 'Pilih Basa';

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
  String get about => 'Ngeunaan';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpen';

  @override
  String get delete => 'Hapus';

  @override
  String get edit => 'Édit';

  @override
  String get add => 'Tambih';

  @override
  String get search => 'Milari';

  @override
  String get filter => 'Saring';

  @override
  String get reset => 'Reset';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get yes => 'Muhun';

  @override
  String get no => 'Henteu';

  @override
  String get close => 'Tutup';

  @override
  String get navGarage => 'Garasi';

  @override
  String get navMaintenance => 'Kaurus';

  @override
  String get navFuel => 'BBM';

  @override
  String get navGlovebox => 'Brankas';

  @override
  String get navSettings => 'Setélan';

  @override
  String get vehiclesTitle => 'Daptar Tutumpakan di Garasi';

  @override
  String get addVehicle => 'Tambih Tutumpakan';

  @override
  String get editVehicle => 'Édit Tutumpakan';

  @override
  String get vehicleName => 'Nami Tutumpakan';

  @override
  String get plateNumber => 'Plat Nomer';

  @override
  String get odometer => 'Odometer (km)';

  @override
  String get car => 'Mobil';

  @override
  String get motorcycle => 'Motor';

  @override
  String get vehicleType => 'Jinis Tutumpakan';

  @override
  String get brand => 'Merek / Pabrikan';

  @override
  String get modelYear => 'Taun Pabrik';

  @override
  String get fuelType => 'Jinis BBM';

  @override
  String get oilCapacity => 'Kapasitas Oli (L)';

  @override
  String get activeVehicle => 'Tutumpakan Aktip';

  @override
  String get setActive => 'Jadikeun Aktip';

  @override
  String get noVehicles => 'Teu acan aya tutumpakan di garasi';

  @override
  String get maintenanceTitle => 'Jadwal & Runtuyan Sérvis';

  @override
  String get addServiceLog => 'Catet Sérvis Énggal';

  @override
  String get serviceDate => 'Kaping Sérvis';

  @override
  String get serviceCost => 'Biaya Sérvis';

  @override
  String get workshop => 'Béngkél';

  @override
  String get notes => 'Catetan';

  @override
  String get isOilChange => 'Ganti Oli Mesin';

  @override
  String get serviceSchedule => 'Jadwal Sérvis Rutin';

  @override
  String get addSchedule => 'Tambih Jadwal';

  @override
  String get oilLifeRemaining => 'Sésa Umur Oli';

  @override
  String get oilResetSuccess => 'Itungan oli parantos di-reset!';

  @override
  String get noServiceLogs => 'Teu Acan Aya Runtuyan Sérvis';

  @override
  String get noSchedules => 'Teu Acan Aya Jadwal Sérvis';

  @override
  String get inspectionChecklist => 'Daptar Mariksa Tutumpakan';

  @override
  String get startInspection => 'Mimitian Mariksa';

  @override
  String get fuelTitle => 'Catetan Ngeusian BBM';

  @override
  String get addFuelLog => 'Catet Ngeusian BBM';

  @override
  String get liters => 'Volume (Liter)';

  @override
  String get totalCost => 'Jumlah Biaya';

  @override
  String get pricePerLiter => 'Pangaos per Liter';

  @override
  String get fullTank => 'Pinuh (Full Tank)';

  @override
  String get gasStation => 'SPBU';

  @override
  String get fuelEfficiency => 'Rata-rata Konsumsi BBM';

  @override
  String get costPerKm => 'Biaya per Kilométer';

  @override
  String get noFuelLogs => 'Teu Acan Aya Catetan BBM';

  @override
  String get gloveboxTitle => 'Brankas Dokumén & Pajeg';

  @override
  String get addDocument => 'Tambih Dokumén';

  @override
  String get stnkTaxExpiry => 'Jatuh Témpo Pajeg STNK';

  @override
  String get stnk5YearExpiry => 'Jatuh Témpo STNK 5 Taun';

  @override
  String get simExpiry => 'Mangsa Laku SIM';

  @override
  String get insuranceExpiry => 'Asuransi Tutumpakan';

  @override
  String daysRemaining(Object count) {
    return '$count dinten nyésa';
  }

  @override
  String get expired => 'Parantos Kadaluwarsa';

  @override
  String get noDocuments => 'Teu Acan Aya Dokumén Kacatet';

  @override
  String get dataManagement => 'Ngatur Data & Cadangan';

  @override
  String get exportBackup => 'Ékspor Cadangan (JSON)';

  @override
  String get importBackup => 'Pulihkeun Cadangan (JSON)';

  @override
  String get exportCsv => 'Ékspor ka CSV';

  @override
  String get resetAllData => 'Reset Sadaya Data';

  @override
  String get privacyNotice => 'Data 100% disimpen sacara lokal dina alat.';

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
      'Cadangan lengkap seluruh data Garasi, jadwal servis, dokumen, dan log BBM dapat disalin ke clipboard di bawah:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Cadangkan seluruh Kandaraan, servis, BBM, dan jadwal';

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
      'Catatan tambahan kondisi Kandaraan...';

  @override
  String get ceklisKondisiKendaraan => 'Ceklis Kondisi Kandaraan';

  @override
  String get checklistInspeksiKendaraan => 'Checklist Inspeksi Kandaraan';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'Counter oli berhasil direset ke odometer saat ini!';

  @override
  String get daftarKendaraanDiGarasi => 'Daftar Kandaraan di Garasi';

  @override
  String get daftarMasaBerlakuDokumenLisens =>
      'Daftar Masa Berlaku Dokumen & Lisensi';

  @override
  String get dataCsvBerhasilDisalinKeClipbo =>
      'Data CSV berhasil disalin ke Clipboard!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      'Data cadangan berhasil dipulihkan ke Garasi!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'Data format CSV siap diekspor ke Excel / Spreadsheet:';

  @override
  String get dataGarasiBerhasilDiresetKeSta =>
      'Data Garasi berhasil direset ke standar.';

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
      'Menghapus semua log servis, BBM, dan riwayat Garasi';

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
  String get namaModelKendaraan => 'Nama / Model Kandaraan';

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
      'Pilih atau buat Kandaraan terlebih dahulu.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Pilih atau Tambih Kandaraan terlebih dahulu.';

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
  String get simpan => 'Simpen';

  @override
  String get simpanAuditInspeksi => 'Simpen Audit Inspeksi';

  @override
  String get simpanKeGarasi => 'Simpen ke Garasi';

  @override
  String get simpanRiwayatBengkelDanGantiOl =>
      'Simpen riwayat bengkel dan ganti oli';

  @override
  String get simpanTanggalJatuhTempoStnkAsu =>
      'Simpen tanggal jatuh tempo STNK, asuransi, dan dokumen Kandaraan Anda.';

  @override
  String get statusOliMesin => 'Status Oli Mesin';

  @override
  String get tahunPembuatan => 'Tahun Pembuatan';

  @override
  String get tambahDokumen => 'Tambih Dokumen';

  @override
  String get tambahDokumenPertama => 'Tambih Dokumen Pertama';

  @override
  String get tambahJadwalBaru => 'Tambih Jadwal Baru';

  @override
  String get tambahJadwalPerawatan => 'Tambih Jadwal Perawatan';

  @override
  String get tambahKendaraan => 'Tambih Kandaraan';

  @override
  String get tambahKendaraanBaru => 'Tambih Kandaraan Baru';

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
      'Tindakan ini akan mengosongkan semua data dan mengembalikan contoh awal Garasi.';

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
    return 'Failed to restore backup: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 => 'E.g.: Annual Vehicle Tax 2026';

  @override
  String get hintPlatB1234 => 'B 1234 ABC';

  @override
  String get misalStnkDiDompet =>
      'E.g.: Registration in wallet, Title in cabinet';

  @override
  String get misalKurasMinyakRem => 'E.g.: Flush Brake Fluid DOT 4';

  @override
  String selesaikanJadwal(String title) {
    return 'Complete: $title';
  }

  @override
  String jadwalCount(String count) {
    return 'Schedules ($count)';
  }

  @override
  String riwayatCount(String count) {
    return 'History ($count)';
  }

  @override
  String inspeksiCount(String count) {
    return 'Inspections ($count)';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return 'Factory recommendation $label loaded!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'Load Factory Standard ($label)';
  }

  @override
  String odometerValue(String odo) {
    return 'Odometer: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return 'Vehicle $name successfully added to garage!';
  }
}
