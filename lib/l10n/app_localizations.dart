import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_jv.dart';
import 'app_localizations_su.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('id'),
    Locale('ja'),
    Locale('jv'),
    Locale('su'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In id, this message translates to:
  /// **'GarageGo'**
  String get appName;

  /// No description provided for @appDescription.
  ///
  /// In id, this message translates to:
  /// **'Manajer Garasi, Servis & BBM Kendaraan'**
  String get appDescription;

  /// No description provided for @settings.
  ///
  /// In id, this message translates to:
  /// **'Pengaturan'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In id, this message translates to:
  /// **'Tampilan'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In id, this message translates to:
  /// **'Tema'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In id, this message translates to:
  /// **'Bahasa'**
  String get language;

  /// No description provided for @themeLight.
  ///
  /// In id, this message translates to:
  /// **'Terang'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In id, this message translates to:
  /// **'Gelap'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In id, this message translates to:
  /// **'Sistem'**
  String get themeSystem;

  /// No description provided for @selectTheme.
  ///
  /// In id, this message translates to:
  /// **'Pilih Tema'**
  String get selectTheme;

  /// No description provided for @selectLanguage.
  ///
  /// In id, this message translates to:
  /// **'Pilih Bahasa'**
  String get selectLanguage;

  /// No description provided for @localeIndonesian.
  ///
  /// In id, this message translates to:
  /// **'Bahasa Indonesia'**
  String get localeIndonesian;

  /// No description provided for @localeEnglish.
  ///
  /// In id, this message translates to:
  /// **'English'**
  String get localeEnglish;

  /// No description provided for @localeArabic.
  ///
  /// In id, this message translates to:
  /// **'العربية'**
  String get localeArabic;

  /// No description provided for @localeJavanese.
  ///
  /// In id, this message translates to:
  /// **'Basa Jawa'**
  String get localeJavanese;

  /// No description provided for @localeSundanese.
  ///
  /// In id, this message translates to:
  /// **'Basa Sunda'**
  String get localeSundanese;

  /// No description provided for @localeChinese.
  ///
  /// In id, this message translates to:
  /// **'中文'**
  String get localeChinese;

  /// No description provided for @localeJapanese.
  ///
  /// In id, this message translates to:
  /// **'日本語'**
  String get localeJapanese;

  /// No description provided for @localeSpanish.
  ///
  /// In id, this message translates to:
  /// **'Español'**
  String get localeSpanish;

  /// No description provided for @about.
  ///
  /// In id, this message translates to:
  /// **'Tentang'**
  String get about;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In id, this message translates to:
  /// **'Simpan'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In id, this message translates to:
  /// **'Hapus'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In id, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In id, this message translates to:
  /// **'Tambah'**
  String get add;

  /// No description provided for @search.
  ///
  /// In id, this message translates to:
  /// **'Cari'**
  String get search;

  /// No description provided for @filter.
  ///
  /// In id, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @reset.
  ///
  /// In id, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @confirm.
  ///
  /// In id, this message translates to:
  /// **'Konfirmasi'**
  String get confirm;

  /// No description provided for @yes.
  ///
  /// In id, this message translates to:
  /// **'Ya'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In id, this message translates to:
  /// **'Tidak'**
  String get no;

  /// No description provided for @close.
  ///
  /// In id, this message translates to:
  /// **'Tutup'**
  String get close;

  /// No description provided for @navGarage.
  ///
  /// In id, this message translates to:
  /// **'Garasi'**
  String get navGarage;

  /// No description provided for @navMaintenance.
  ///
  /// In id, this message translates to:
  /// **'Perawatan'**
  String get navMaintenance;

  /// No description provided for @navFuel.
  ///
  /// In id, this message translates to:
  /// **'BBM'**
  String get navFuel;

  /// No description provided for @navGlovebox.
  ///
  /// In id, this message translates to:
  /// **'Brankas'**
  String get navGlovebox;

  /// No description provided for @navSettings.
  ///
  /// In id, this message translates to:
  /// **'Pengaturan'**
  String get navSettings;

  /// No description provided for @vehiclesTitle.
  ///
  /// In id, this message translates to:
  /// **'Daftar Kendaraan di Garasi'**
  String get vehiclesTitle;

  /// No description provided for @addVehicle.
  ///
  /// In id, this message translates to:
  /// **'Tambah Kendaraan'**
  String get addVehicle;

  /// No description provided for @editVehicle.
  ///
  /// In id, this message translates to:
  /// **'Edit Kendaraan'**
  String get editVehicle;

  /// No description provided for @vehicleName.
  ///
  /// In id, this message translates to:
  /// **'Nama Kendaraan'**
  String get vehicleName;

  /// No description provided for @plateNumber.
  ///
  /// In id, this message translates to:
  /// **'Plat Nomor'**
  String get plateNumber;

  /// No description provided for @odometer.
  ///
  /// In id, this message translates to:
  /// **'Odometer (km)'**
  String get odometer;

  /// No description provided for @car.
  ///
  /// In id, this message translates to:
  /// **'Mobil'**
  String get car;

  /// No description provided for @motorcycle.
  ///
  /// In id, this message translates to:
  /// **'Motor'**
  String get motorcycle;

  /// No description provided for @vehicleType.
  ///
  /// In id, this message translates to:
  /// **'Tipe Kendaraan'**
  String get vehicleType;

  /// No description provided for @brand.
  ///
  /// In id, this message translates to:
  /// **'Merk / Pabrikan'**
  String get brand;

  /// No description provided for @modelYear.
  ///
  /// In id, this message translates to:
  /// **'Tahun Pembuatan'**
  String get modelYear;

  /// No description provided for @fuelType.
  ///
  /// In id, this message translates to:
  /// **'Jenis BBM'**
  String get fuelType;

  /// No description provided for @oilCapacity.
  ///
  /// In id, this message translates to:
  /// **'Kapasitas Oli (L)'**
  String get oilCapacity;

  /// No description provided for @activeVehicle.
  ///
  /// In id, this message translates to:
  /// **'Kendaraan Aktif'**
  String get activeVehicle;

  /// No description provided for @setActive.
  ///
  /// In id, this message translates to:
  /// **'Jadikan Aktif'**
  String get setActive;

  /// No description provided for @noVehicles.
  ///
  /// In id, this message translates to:
  /// **'Belum ada kendaraan di garasi'**
  String get noVehicles;

  /// No description provided for @maintenanceTitle.
  ///
  /// In id, this message translates to:
  /// **'Jadwal & Riwayat Servis'**
  String get maintenanceTitle;

  /// No description provided for @addServiceLog.
  ///
  /// In id, this message translates to:
  /// **'Catat Servis Baru'**
  String get addServiceLog;

  /// No description provided for @serviceDate.
  ///
  /// In id, this message translates to:
  /// **'Tanggal Servis'**
  String get serviceDate;

  /// No description provided for @serviceCost.
  ///
  /// In id, this message translates to:
  /// **'Biaya Servis'**
  String get serviceCost;

  /// No description provided for @workshop.
  ///
  /// In id, this message translates to:
  /// **'Bengkel'**
  String get workshop;

  /// No description provided for @notes.
  ///
  /// In id, this message translates to:
  /// **'Catatan'**
  String get notes;

  /// No description provided for @isOilChange.
  ///
  /// In id, this message translates to:
  /// **'Ganti Oli Mesin'**
  String get isOilChange;

  /// No description provided for @serviceSchedule.
  ///
  /// In id, this message translates to:
  /// **'Jadwal Servis Berkala'**
  String get serviceSchedule;

  /// No description provided for @addSchedule.
  ///
  /// In id, this message translates to:
  /// **'Tambah Jadwal'**
  String get addSchedule;

  /// No description provided for @oilLifeRemaining.
  ///
  /// In id, this message translates to:
  /// **'Sisa Masa Pakai Oli'**
  String get oilLifeRemaining;

  /// No description provided for @oilResetSuccess.
  ///
  /// In id, this message translates to:
  /// **'Counter oli berhasil direset ke odometer saat ini!'**
  String get oilResetSuccess;

  /// No description provided for @noServiceLogs.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Riwayat Servis'**
  String get noServiceLogs;

  /// No description provided for @noSchedules.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Jadwal Servis'**
  String get noSchedules;

  /// No description provided for @inspectionChecklist.
  ///
  /// In id, this message translates to:
  /// **'Checklist Inspeksi Kendaraan'**
  String get inspectionChecklist;

  /// No description provided for @startInspection.
  ///
  /// In id, this message translates to:
  /// **'Mulai Inspeksi'**
  String get startInspection;

  /// No description provided for @fuelTitle.
  ///
  /// In id, this message translates to:
  /// **'Catatan Pengisian BBM'**
  String get fuelTitle;

  /// No description provided for @addFuelLog.
  ///
  /// In id, this message translates to:
  /// **'Catat Pengisian BBM'**
  String get addFuelLog;

  /// No description provided for @liters.
  ///
  /// In id, this message translates to:
  /// **'Volume (Liter)'**
  String get liters;

  /// No description provided for @totalCost.
  ///
  /// In id, this message translates to:
  /// **'Total Biaya'**
  String get totalCost;

  /// No description provided for @pricePerLiter.
  ///
  /// In id, this message translates to:
  /// **'Harga per Liter'**
  String get pricePerLiter;

  /// No description provided for @fullTank.
  ///
  /// In id, this message translates to:
  /// **'Isi Penuh (Full Tank)'**
  String get fullTank;

  /// No description provided for @gasStation.
  ///
  /// In id, this message translates to:
  /// **'SPBU'**
  String get gasStation;

  /// No description provided for @fuelEfficiency.
  ///
  /// In id, this message translates to:
  /// **'Konsumsi BBM Rata-rata'**
  String get fuelEfficiency;

  /// No description provided for @costPerKm.
  ///
  /// In id, this message translates to:
  /// **'Biaya per Kilometer'**
  String get costPerKm;

  /// No description provided for @noFuelLogs.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Catatan BBM'**
  String get noFuelLogs;

  /// No description provided for @gloveboxTitle.
  ///
  /// In id, this message translates to:
  /// **'Brankas Dokumen & Pajak'**
  String get gloveboxTitle;

  /// No description provided for @addDocument.
  ///
  /// In id, this message translates to:
  /// **'Tambah Dokumen'**
  String get addDocument;

  /// No description provided for @stnkTaxExpiry.
  ///
  /// In id, this message translates to:
  /// **'Jatuh Tempo Pajak Tahunan STNK'**
  String get stnkTaxExpiry;

  /// No description provided for @stnk5YearExpiry.
  ///
  /// In id, this message translates to:
  /// **'Jatuh Tempo STNK 5 Tahunan (Ganti Plat)'**
  String get stnk5YearExpiry;

  /// No description provided for @simExpiry.
  ///
  /// In id, this message translates to:
  /// **'Masa Berlaku SIM'**
  String get simExpiry;

  /// No description provided for @insuranceExpiry.
  ///
  /// In id, this message translates to:
  /// **'Asuransi Kendaraan'**
  String get insuranceExpiry;

  /// No description provided for @daysRemaining.
  ///
  /// In id, this message translates to:
  /// **'{count} hari tersisa'**
  String daysRemaining(Object count);

  /// No description provided for @expired.
  ///
  /// In id, this message translates to:
  /// **'Sudah Kadaluarsa'**
  String get expired;

  /// No description provided for @noDocuments.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Dokumen Tercatat'**
  String get noDocuments;

  /// No description provided for @dataManagement.
  ///
  /// In id, this message translates to:
  /// **'Manajemen Data & Cadangan'**
  String get dataManagement;

  /// No description provided for @exportBackup.
  ///
  /// In id, this message translates to:
  /// **'Ekspor Cadangan (JSON)'**
  String get exportBackup;

  /// No description provided for @importBackup.
  ///
  /// In id, this message translates to:
  /// **'Pulihkan Cadangan (JSON)'**
  String get importBackup;

  /// No description provided for @exportCsv.
  ///
  /// In id, this message translates to:
  /// **'Ekspor ke CSV'**
  String get exportCsv;

  /// No description provided for @resetAllData.
  ///
  /// In id, this message translates to:
  /// **'Atur Ulang Data'**
  String get resetAllData;

  /// No description provided for @privacyNotice.
  ///
  /// In id, this message translates to:
  /// **'Data 100% tersimpan lokal di perangkat tanpa cloud eksternal.'**
  String get privacyNotice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'en',
    'es',
    'id',
    'ja',
    'jv',
    'su',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
    case 'jv':
      return AppLocalizationsJv();
    case 'su':
      return AppLocalizationsSu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
