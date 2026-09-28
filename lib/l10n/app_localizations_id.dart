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
}
