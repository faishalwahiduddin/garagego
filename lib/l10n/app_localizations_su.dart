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
}
