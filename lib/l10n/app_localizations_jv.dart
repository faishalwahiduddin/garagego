// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Javanese (`jv`).
class AppLocalizationsJv extends AppLocalizations {
  AppLocalizationsJv([String locale = 'jv']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => 'Manajer Garasi, Servis & BBM Titihan';

  @override
  String get settings => 'Setelan';

  @override
  String get appearance => 'Sesawangan';

  @override
  String get theme => 'Tema';

  @override
  String get language => 'Basa';

  @override
  String get themeLight => 'Padhang';

  @override
  String get themeDark => 'Peteng';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get selectTheme => 'Pilih Tema';

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
  String get about => 'Babagan';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpen';

  @override
  String get delete => 'Busek';

  @override
  String get edit => 'Ubah';

  @override
  String get add => 'Tambah';

  @override
  String get search => 'Pados';

  @override
  String get filter => 'Saring';

  @override
  String get reset => 'Reset';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get yes => 'Inggih';

  @override
  String get no => 'Mboten';

  @override
  String get close => 'Tutup';

  @override
  String get navGarage => 'Garasi';

  @override
  String get navMaintenance => 'Pangrumat';

  @override
  String get navFuel => 'BBM';

  @override
  String get navGlovebox => 'Kothak Layang';

  @override
  String get navSettings => 'Setelan';

  @override
  String get vehiclesTitle => 'Daftar Titihan ing Garasi';

  @override
  String get addVehicle => 'Tambah Titihan';

  @override
  String get editVehicle => 'Ubah Titihan';

  @override
  String get vehicleName => 'Jeneng Titihan';

  @override
  String get plateNumber => 'Plat Nomer';

  @override
  String get odometer => 'Odometer (km)';

  @override
  String get car => 'Mobil';

  @override
  String get motorcycle => 'Motor';

  @override
  String get vehicleType => 'Jinis Titihan';

  @override
  String get brand => 'Merk / Pabrikan';

  @override
  String get modelYear => 'Taun Pambuate';

  @override
  String get fuelType => 'Jinis BBM';

  @override
  String get oilCapacity => 'Kapasitas Oli (L)';

  @override
  String get activeVehicle => 'Titihan Aktif';

  @override
  String get setActive => 'Dadosaken Aktif';

  @override
  String get noVehicles => 'Dereng wonten titihan ing garasi';

  @override
  String get maintenanceTitle => 'Jadwal & Riwayat Servis';

  @override
  String get addServiceLog => 'Cathet Servis Anyar';

  @override
  String get serviceDate => 'Tanggal Servis';

  @override
  String get serviceCost => 'Ragad Servis';

  @override
  String get workshop => 'Bengkel';

  @override
  String get notes => 'Cathetan';

  @override
  String get isOilChange => 'Gantos Oli Mesin';

  @override
  String get serviceSchedule => 'Jadwal Servis Berkala';

  @override
  String get addSchedule => 'Tambah Jadwal';

  @override
  String get oilLifeRemaining => 'Sisa Umur Oli';

  @override
  String get oilResetSuccess => 'Petangan oli kasil dipun-reset!';

  @override
  String get noServiceLogs => 'Dereng Wonten Riwayat Servis';

  @override
  String get noSchedules => 'Dereng Wonten Jadwal Servis';

  @override
  String get inspectionChecklist => 'Ceklis Inspeksi Titihan';

  @override
  String get startInspection => 'Miwiti Inspeksi';

  @override
  String get fuelTitle => 'Cathetan Pangisian BBM';

  @override
  String get addFuelLog => 'Cathet Pangisian BBM';

  @override
  String get liters => 'Volume (Liter)';

  @override
  String get totalCost => 'Gunggung Ragad';

  @override
  String get pricePerLiter => 'Rega saben Liter';

  @override
  String get fullTank => 'Kebak (Full Tank)';

  @override
  String get gasStation => 'SPBU';

  @override
  String get fuelEfficiency => 'Rata-rata Panganggo BBM';

  @override
  String get costPerKm => 'Ragad saben Kilometer';

  @override
  String get noFuelLogs => 'Dereng Wonten Cathetan BBM';

  @override
  String get gloveboxTitle => 'Kothak Surat & Pajeg';

  @override
  String get addDocument => 'Tambah Dokumen';

  @override
  String get stnkTaxExpiry => 'Jatuh Tempo Pajeg STNK';

  @override
  String get stnk5YearExpiry => 'Jatuh Tempo STNK 5 Taunan';

  @override
  String get simExpiry => 'Masa Berlaku SIM';

  @override
  String get insuranceExpiry => 'Asuransi Titihan';

  @override
  String daysRemaining(Object count) {
    return '$count dinten nyésa';
  }

  @override
  String get expired => 'Sampun Kadaluwarsa';

  @override
  String get noDocuments => 'Dereng Wonten Dokumen Kacathet';

  @override
  String get dataManagement => 'Pangreksan Data & Serep';

  @override
  String get exportBackup => 'Ekspor Serep (JSON)';

  @override
  String get importBackup => 'Pulihaken Serep (JSON)';

  @override
  String get exportCsv => 'Ekspor dhateng CSV';

  @override
  String get resetAllData => 'Reset Sedaya Data';

  @override
  String get privacyNotice => 'Data 100% kasimpen sacara lokal ing piranti.';

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
      'Cadangkan seluruh Tunggangan, servis, BBM, dan jadwal';

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
      'Catatan tambahan kondisi Tunggangan...';

  @override
  String get ceklisKondisiKendaraan => 'Ceklis Kondisi Tunggangan';

  @override
  String get checklistInspeksiKendaraan => 'Checklist Inspeksi Tunggangan';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'Counter oli berhasil direset ke odometer saat ini!';

  @override
  String get daftarKendaraanDiGarasi => 'Daftar Tunggangan di Garasi';

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
  String get namaModelKendaraan => 'Nama / Model Tunggangan';

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
      'Pilih atau buat Tunggangan terlebih dahulu.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Pilih atau Tambah Tunggangan terlebih dahulu.';

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
      'Simpen tanggal jatuh tempo STNK, asuransi, dan dokumen Tunggangan Anda.';

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
  String get tambahKendaraan => 'Tambah Tunggangan';

  @override
  String get tambahKendaraanBaru => 'Tambah Tunggangan Baru';

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
