// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => 'Vehicle Garage, Service & Fuel Manager';

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get selectTheme => 'Select Theme';

  @override
  String get selectLanguage => 'Select Language';

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
  String get about => 'About';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get search => 'Search';

  @override
  String get filter => 'Filter';

  @override
  String get reset => 'Reset';

  @override
  String get confirm => 'Confirm';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get close => 'Close';

  @override
  String get navGarage => 'Garage';

  @override
  String get navMaintenance => 'Service';

  @override
  String get navFuel => 'Fuel';

  @override
  String get navGlovebox => 'Glovebox';

  @override
  String get navSettings => 'Settings';

  @override
  String get vehiclesTitle => 'Vehicles in Garage';

  @override
  String get addVehicle => 'Add Vehicle';

  @override
  String get editVehicle => 'Edit Vehicle';

  @override
  String get vehicleName => 'Vehicle Name';

  @override
  String get plateNumber => 'License Plate';

  @override
  String get odometer => 'Odometer (km)';

  @override
  String get car => 'Car';

  @override
  String get motorcycle => 'Motorcycle';

  @override
  String get vehicleType => 'Vehicle Type';

  @override
  String get brand => 'Make / Brand';

  @override
  String get modelYear => 'Year';

  @override
  String get fuelType => 'Fuel Type';

  @override
  String get oilCapacity => 'Oil Capacity (L)';

  @override
  String get activeVehicle => 'Active Vehicle';

  @override
  String get setActive => 'Set as Active';

  @override
  String get noVehicles => 'No vehicles in garage yet';

  @override
  String get maintenanceTitle => 'Service Logs & Schedules';

  @override
  String get addServiceLog => 'Add Service Log';

  @override
  String get serviceDate => 'Service Date';

  @override
  String get serviceCost => 'Service Cost';

  @override
  String get workshop => 'Workshop';

  @override
  String get notes => 'Notes';

  @override
  String get isOilChange => 'Engine Oil Change';

  @override
  String get serviceSchedule => 'Maintenance Schedule';

  @override
  String get addSchedule => 'Add Schedule';

  @override
  String get oilLifeRemaining => 'Oil Life Remaining';

  @override
  String get oilResetSuccess => 'Oil counter reset to current odometer!';

  @override
  String get noServiceLogs => 'No Service Logs Yet';

  @override
  String get noSchedules => 'No Maintenance Schedules Yet';

  @override
  String get inspectionChecklist => 'Vehicle Inspection Checklist';

  @override
  String get startInspection => 'Start Inspection';

  @override
  String get fuelTitle => 'Fuel Logs';

  @override
  String get addFuelLog => 'Add Fuel Log';

  @override
  String get liters => 'Volume (Liters)';

  @override
  String get totalCost => 'Total Cost';

  @override
  String get pricePerLiter => 'Price per Liter';

  @override
  String get fullTank => 'Full Tank';

  @override
  String get gasStation => 'Gas Station';

  @override
  String get fuelEfficiency => 'Average Fuel Economy';

  @override
  String get costPerKm => 'Cost per Kilometer';

  @override
  String get noFuelLogs => 'No Fuel Logs Yet';

  @override
  String get gloveboxTitle => 'Glovebox & Documents';

  @override
  String get addDocument => 'Add Document';

  @override
  String get stnkTaxExpiry => 'Annual Tax Expiration';

  @override
  String get stnk5YearExpiry => '5-Year Registration Expiration';

  @override
  String get simExpiry => 'Driver License Expiration';

  @override
  String get insuranceExpiry => 'Vehicle Insurance Expiration';

  @override
  String daysRemaining(Object count) {
    return '$count days remaining';
  }

  @override
  String get expired => 'Expired';

  @override
  String get noDocuments => 'No Documents Recorded';

  @override
  String get dataManagement => 'Data & Backup Management';

  @override
  String get exportBackup => 'Export Backup (JSON)';

  @override
  String get importBackup => 'Restore Backup (JSON)';

  @override
  String get exportCsv => 'Export to CSV';

  @override
  String get resetAllData => 'Reset All Data';

  @override
  String get privacyNotice =>
      'Data is 100% stored locally on your device without cloud servers.';
}
