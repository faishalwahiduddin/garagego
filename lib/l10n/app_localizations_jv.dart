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
}
