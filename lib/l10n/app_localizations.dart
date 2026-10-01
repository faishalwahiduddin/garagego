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

  /// No description provided for @aksiCepat.
  ///
  /// In id, this message translates to:
  /// **'Aksi Cepat'**
  String get aksiCepat;

  /// No description provided for @aksiCepatGarasi.
  ///
  /// In id, this message translates to:
  /// **'Aksi Cepat Garasi'**
  String get aksiCepatGarasi;

  /// No description provided for @aturUlangData.
  ///
  /// In id, this message translates to:
  /// **'Atur Ulang Data'**
  String get aturUlangData;

  /// No description provided for @aturPengingatGantiOliFilterRem.
  ///
  /// In id, this message translates to:
  /// **'Atur pengingat ganti oli, filter, rem, dan sparepart.'**
  String get aturPengingatGantiOliFilterRem;

  /// No description provided for @audit10PoinKeselamatanJalanMud.
  ///
  /// In id, this message translates to:
  /// **'Audit 10-poin keselamatan jalan & mudik'**
  String get audit10PoinKeselamatanJalanMud;

  /// No description provided for @auditKelayakanJalanKeselamatan.
  ///
  /// In id, this message translates to:
  /// **'Audit kelayakan jalan & keselamatan sebelum perjalanan mudik atau harian.'**
  String get auditKelayakanJalanKeselamatan;

  /// No description provided for @bahasaAplikasi.
  ///
  /// In id, this message translates to:
  /// **'Bahasa Aplikasi'**
  String get bahasaAplikasi;

  /// No description provided for @batal.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get batal;

  /// No description provided for @belumAdaCatatanBbm.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Catatan BBM'**
  String get belumAdaCatatanBbm;

  /// No description provided for @belumAdaDokumenTercatat.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Dokumen Tercatat'**
  String get belumAdaDokumenTercatat;

  /// No description provided for @belumAdaHasilCeklis.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Hasil Ceklis'**
  String get belumAdaHasilCeklis;

  /// No description provided for @belumAdaJadwalServis.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Jadwal Servis'**
  String get belumAdaJadwalServis;

  /// No description provided for @belumAdaRiwayatServis.
  ///
  /// In id, this message translates to:
  /// **'Belum Ada Riwayat Servis'**
  String get belumAdaRiwayatServis;

  /// No description provided for @belumAdaCatatanServis.
  ///
  /// In id, this message translates to:
  /// **'Belum ada catatan servis.'**
  String get belumAdaCatatanServis;

  /// No description provided for @belumAdaJadwalPerawatanBerkala.
  ///
  /// In id, this message translates to:
  /// **'Belum ada jadwal perawatan berkala.'**
  String get belumAdaJadwalPerawatanBerkala;

  /// No description provided for @biayaKm.
  ///
  /// In id, this message translates to:
  /// **'Biaya / KM'**
  String get biayaKm;

  /// No description provided for @biayaTotalRp.
  ///
  /// In id, this message translates to:
  /// **'Biaya Total (Rp)'**
  String get biayaTotalRp;

  /// No description provided for @biayaPerKm.
  ///
  /// In id, this message translates to:
  /// **'Biaya per KM'**
  String get biayaPerKm;

  /// No description provided for @bukaBrankas.
  ///
  /// In id, this message translates to:
  /// **'Buka Brankas'**
  String get bukaBrankas;

  /// No description provided for @cadanganLengkapSeluruhDataGara.
  ///
  /// In id, this message translates to:
  /// **'Cadangan lengkap seluruh data garasi, jadwal servis, dokumen, dan log BBM dapat disalin ke clipboard di bawah:'**
  String get cadanganLengkapSeluruhDataGara;

  /// No description provided for @cadangkanSeluruhKendaraanServi.
  ///
  /// In id, this message translates to:
  /// **'Cadangkan seluruh kendaraan, servis, BBM, dan jadwal'**
  String get cadangkanSeluruhKendaraanServi;

  /// No description provided for @cariRiwayatServisAtauBengkel.
  ///
  /// In id, this message translates to:
  /// **'Cari riwayat servis atau bengkel...'**
  String get cariRiwayatServisAtauBengkel;

  /// No description provided for @catatPengisianBbm.
  ///
  /// In id, this message translates to:
  /// **'Catat Pengisian BBM'**
  String get catatPengisianBbm;

  /// No description provided for @catatPengisianPertama.
  ///
  /// In id, this message translates to:
  /// **'Catat Pengisian Pertama'**
  String get catatPengisianPertama;

  /// No description provided for @catatServisBaru.
  ///
  /// In id, this message translates to:
  /// **'Catat Servis Baru'**
  String get catatServisBaru;

  /// No description provided for @catatServisPertama.
  ///
  /// In id, this message translates to:
  /// **'Catat Servis Pertama'**
  String get catatServisPertama;

  /// No description provided for @catatStrukPengisianBensinUntuk.
  ///
  /// In id, this message translates to:
  /// **'Catat struk pengisian bensin untuk memantau konsumsi km/L dan cost/km.'**
  String get catatStrukPengisianBensinUntuk;

  /// No description provided for @catatanOpsional.
  ///
  /// In id, this message translates to:
  /// **'Catatan (Opsional)'**
  String get catatanOpsional;

  /// No description provided for @catatanLokasiBerkasFisik.
  ///
  /// In id, this message translates to:
  /// **'Catatan / Lokasi Berkas Fisik'**
  String get catatanLokasiBerkasFisik;

  /// No description provided for @catatanBbmBerhasilDisimpan.
  ///
  /// In id, this message translates to:
  /// **'Catatan BBM berhasil disimpan!'**
  String get catatanBbmBerhasilDisimpan;

  /// No description provided for @catatanPemeriksaOpsional.
  ///
  /// In id, this message translates to:
  /// **'Catatan Pemeriksa (Opsional)'**
  String get catatanPemeriksaOpsional;

  /// No description provided for @catatanSparepartPengerjaan.
  ///
  /// In id, this message translates to:
  /// **'Catatan Sparepart / Pengerjaan'**
  String get catatanSparepartPengerjaan;

  /// No description provided for @catatanServisBerhasilDitambahk.
  ///
  /// In id, this message translates to:
  /// **'Catatan servis berhasil ditambahkan!'**
  String get catatanServisBerhasilDitambahk;

  /// No description provided for @catatanTambahanKondisiKendaraa.
  ///
  /// In id, this message translates to:
  /// **'Catatan tambahan kondisi kendaraan...'**
  String get catatanTambahanKondisiKendaraa;

  /// No description provided for @ceklisKondisiKendaraan.
  ///
  /// In id, this message translates to:
  /// **'Ceklis Kondisi Kendaraan'**
  String get ceklisKondisiKendaraan;

  /// No description provided for @checklistInspeksiKendaraan.
  ///
  /// In id, this message translates to:
  /// **'Checklist Inspeksi Kendaraan'**
  String get checklistInspeksiKendaraan;

  /// No description provided for @counterOliBerhasilDiresetKeOdo.
  ///
  /// In id, this message translates to:
  /// **'Counter oli berhasil direset ke odometer saat ini!'**
  String get counterOliBerhasilDiresetKeOdo;

  /// No description provided for @daftarKendaraanDiGarasi.
  ///
  /// In id, this message translates to:
  /// **'Daftar Kendaraan di Garasi'**
  String get daftarKendaraanDiGarasi;

  /// No description provided for @daftarMasaBerlakuDokumenLisens.
  ///
  /// In id, this message translates to:
  /// **'Daftar Masa Berlaku Dokumen & Lisensi'**
  String get daftarMasaBerlakuDokumenLisens;

  /// No description provided for @dataCsvBerhasilDisalinKeClipbo.
  ///
  /// In id, this message translates to:
  /// **'Data CSV berhasil disalin ke Clipboard!'**
  String get dataCsvBerhasilDisalinKeClipbo;

  /// No description provided for @dataCadanganBerhasilDipulihkan.
  ///
  /// In id, this message translates to:
  /// **'Data cadangan berhasil dipulihkan ke garasi!'**
  String get dataCadanganBerhasilDipulihkan;

  /// No description provided for @dataFormatCsvSiapDieksporKeExc.
  ///
  /// In id, this message translates to:
  /// **'Data format CSV siap diekspor ke Excel / Spreadsheet:'**
  String get dataFormatCsvSiapDieksporKeExc;

  /// No description provided for @dataGarasiBerhasilDiresetKeSta.
  ///
  /// In id, this message translates to:
  /// **'Data garasi berhasil direset ke standar.'**
  String get dataGarasiBerhasilDiresetKeSta;

  /// No description provided for @diperlukanUntukAkurasiKalkulas.
  ///
  /// In id, this message translates to:
  /// **'Diperlukan untuk akurasi kalkulasi km/L'**
  String get diperlukanUntukAkurasiKalkulas;

  /// No description provided for @dualTriggerReminderAlarmAkanAk.
  ///
  /// In id, this message translates to:
  /// **'Dual-Trigger Reminder: Alarm akan aktif jika jarak (km) ATAU waktu (bulan) tercapai.'**
  String get dualTriggerReminderAlarmAkanAk;

  /// No description provided for @eksporBackupJson.
  ///
  /// In id, this message translates to:
  /// **'Ekspor Backup JSON'**
  String get eksporBackupJson;

  /// No description provided for @eksporCsvRiwayatBbm.
  ///
  /// In id, this message translates to:
  /// **'Ekspor CSV Riwayat BBM'**
  String get eksporCsvRiwayatBbm;

  /// No description provided for @eksporCsvRiwayatServis.
  ///
  /// In id, this message translates to:
  /// **'Ekspor CSV Riwayat Servis'**
  String get eksporCsvRiwayatServis;

  /// No description provided for @eksporCadanganJson.
  ///
  /// In id, this message translates to:
  /// **'Ekspor Cadangan JSON'**
  String get eksporCadanganJson;

  /// No description provided for @eksporFormatTabelSpreadsheetUn.
  ///
  /// In id, this message translates to:
  /// **'Ekspor format tabel spreadsheet untuk pencatatan bengkel'**
  String get eksporFormatTabelSpreadsheetUn;

  /// No description provided for @eksporSeluruhPengisianBbmKeFor.
  ///
  /// In id, this message translates to:
  /// **'Ekspor seluruh pengisian BBM ke format CSV spreadsheet'**
  String get eksporSeluruhPengisianBbmKeFor;

  /// No description provided for @estimasiBiayaPremiRp.
  ///
  /// In id, this message translates to:
  /// **'Estimasi Biaya / Premi (Rp)'**
  String get estimasiBiayaPremiRp;

  /// No description provided for @gantiPelat5Th.
  ///
  /// In id, this message translates to:
  /// **'Ganti Pelat 5 Th'**
  String get gantiPelat5Th;

  /// No description provided for @garasiMasihKosong.
  ///
  /// In id, this message translates to:
  /// **'Garasi Masih Kosong'**
  String get garasiMasihKosong;

  /// No description provided for @hargaSatuanRpLiter.
  ///
  /// In id, this message translates to:
  /// **'Harga Satuan (Rp/Liter)'**
  String get hargaSatuanRpLiter;

  /// No description provided for @hasilCeklisInspeksiBerhasilDis.
  ///
  /// In id, this message translates to:
  /// **'Hasil ceklis inspeksi berhasil disimpan!'**
  String get hasilCeklisInspeksiBerhasilDis;

  /// No description provided for @hitungKonsumsiKmLDanBiayaBensi.
  ///
  /// In id, this message translates to:
  /// **'Hitung konsumsi km/L dan biaya bensin'**
  String get hitungKonsumsiKmLDanBiayaBensi;

  /// No description provided for @imporPulihkanBackupJson.
  ///
  /// In id, this message translates to:
  /// **'Impor / Pulihkan Backup JSON'**
  String get imporPulihkanBackupJson;

  /// No description provided for @intervalJarakKm.
  ///
  /// In id, this message translates to:
  /// **'Interval Jarak (km)'**
  String get intervalJarakKm;

  /// No description provided for @intervalOliKm.
  ///
  /// In id, this message translates to:
  /// **'Interval Oli (km)'**
  String get intervalOliKm;

  /// No description provided for @intervalWaktu.
  ///
  /// In id, this message translates to:
  /// **'Interval Waktu'**
  String get intervalWaktu;

  /// No description provided for @isiTangkiPenuhFullTank.
  ///
  /// In id, this message translates to:
  /// **'Isi Tangki Penuh (Full Tank)?'**
  String get isiTangkiPenuhFullTank;

  /// No description provided for @jadwalServisMendatang.
  ///
  /// In id, this message translates to:
  /// **'Jadwal Servis Mendatang'**
  String get jadwalServisMendatang;

  /// No description provided for @jenisBahanBakar.
  ///
  /// In id, this message translates to:
  /// **'Jenis Bahan Bakar'**
  String get jenisBahanBakar;

  /// No description provided for @jenisDokumen.
  ///
  /// In id, this message translates to:
  /// **'Jenis Dokumen'**
  String get jenisDokumen;

  /// No description provided for @judulKeteranganDokumen.
  ///
  /// In id, this message translates to:
  /// **'Judul / Keterangan Dokumen'**
  String get judulKeteranganDokumen;

  /// No description provided for @kategori.
  ///
  /// In id, this message translates to:
  /// **'Kategori:'**
  String get kategori;

  /// No description provided for @kembalikanDataDariBerkasCadang.
  ///
  /// In id, this message translates to:
  /// **'Kembalikan data dari berkas cadangan JSON yang valid'**
  String get kembalikanDataDariBerkasCadang;

  /// No description provided for @kilometerOdometerKm.
  ///
  /// In id, this message translates to:
  /// **'Kilometer Odometer (km)'**
  String get kilometerOdometerKm;

  /// No description provided for @konfirmasiReset.
  ///
  /// In id, this message translates to:
  /// **'Konfirmasi Reset'**
  String get konfirmasiReset;

  /// No description provided for @konsumsiBbm.
  ///
  /// In id, this message translates to:
  /// **'Konsumsi BBM'**
  String get konsumsiBbm;

  /// No description provided for @lakukanInspeksi10PoinBanRemOli.
  ///
  /// In id, this message translates to:
  /// **'Lakukan inspeksi 10 poin ban, rem, oli, lampu, dan aki.'**
  String get lakukanInspeksi10PoinBanRemOli;

  /// No description provided for @lihatSemua.
  ///
  /// In id, this message translates to:
  /// **'Lihat Semua'**
  String get lihatSemua;

  /// No description provided for @lisensiPamakean.
  ///
  /// In id, this message translates to:
  /// **'Lisensi Pamakean'**
  String get lisensiPamakean;

  /// No description provided for @lisensiPanganggo.
  ///
  /// In id, this message translates to:
  /// **'Lisensi Panganggo'**
  String get lisensiPanganggo;

  /// No description provided for @lisensiPenggunaan.
  ///
  /// In id, this message translates to:
  /// **'Lisensi Penggunaan'**
  String get lisensiPenggunaan;

  /// No description provided for @menghapusSemuaLogServisBbmDanR.
  ///
  /// In id, this message translates to:
  /// **'Menghapus semua log servis, BBM, dan riwayat garasi'**
  String get menghapusSemuaLogServisBbmDanR;

  /// No description provided for @mobil.
  ///
  /// In id, this message translates to:
  /// **'Mobil'**
  String get mobil;

  /// No description provided for @mobilAtauMotorKeluargaBaru.
  ///
  /// In id, this message translates to:
  /// **'Mobil atau motor keluarga baru'**
  String get mobilAtauMotorKeluargaBaru;

  /// No description provided for @modeTema.
  ///
  /// In id, this message translates to:
  /// **'Mode Tema'**
  String get modeTema;

  /// No description provided for @motor.
  ///
  /// In id, this message translates to:
  /// **'Motor'**
  String get motor;

  /// No description provided for @mulaiCeklis.
  ///
  /// In id, this message translates to:
  /// **'Mulai Ceklis'**
  String get mulaiCeklis;

  /// No description provided for @mulaiInspeksiPertama.
  ///
  /// In id, this message translates to:
  /// **'Mulai Inspeksi Pertama'**
  String get mulaiInspeksiPertama;

  /// No description provided for @namaModelKendaraan.
  ///
  /// In id, this message translates to:
  /// **'Nama / Model Kendaraan'**
  String get namaModelKendaraan;

  /// No description provided for @namaBengkelToko.
  ///
  /// In id, this message translates to:
  /// **'Nama Bengkel / Toko'**
  String get namaBengkelToko;

  /// No description provided for @namaBengkelTokoOpsional.
  ///
  /// In id, this message translates to:
  /// **'Nama Bengkel / Toko (Opsional)'**
  String get namaBengkelTokoOpsional;

  /// No description provided for @namaPekerjaanKomponen.
  ///
  /// In id, this message translates to:
  /// **'Nama Pekerjaan / Komponen'**
  String get namaPekerjaanKomponen;

  /// No description provided for @namaSpbuLokasi.
  ///
  /// In id, this message translates to:
  /// **'Nama SPBU / Lokasi'**
  String get namaSpbuLokasi;

  /// No description provided for @nomorDokumenNoPolisNoPolisi.
  ///
  /// In id, this message translates to:
  /// **'Nomor Dokumen / No. Polis / No. Polisi'**
  String get nomorDokumenNoPolisNoPolisi;

  /// No description provided for @nomorPelatPolisi.
  ///
  /// In id, this message translates to:
  /// **'Nomor Pelat Polisi'**
  String get nomorPelatPolisi;

  /// No description provided for @odometerPengerjaanKm.
  ///
  /// In id, this message translates to:
  /// **'Odometer Pengerjaan (km)'**
  String get odometerPengerjaanKm;

  /// No description provided for @odometerSaatIniKm.
  ///
  /// In id, this message translates to:
  /// **'Odometer Saat Ini (km)'**
  String get odometerSaatIniKm;

  /// No description provided for @odometerTerakhirDikerjakanKm.
  ///
  /// In id, this message translates to:
  /// **'Odometer Terakhir Dikerjakan (km)'**
  String get odometerTerakhirDikerjakanKm;

  /// No description provided for @opsiJadwal.
  ///
  /// In id, this message translates to:
  /// **'Opsi Jadwal'**
  String get opsiJadwal;

  /// No description provided for @pkbTahunan.
  ///
  /// In id, this message translates to:
  /// **'PKB Tahunan'**
  String get pkbTahunan;

  /// No description provided for @pajakStnk.
  ///
  /// In id, this message translates to:
  /// **'Pajak & STNK'**
  String get pajakStnk;

  /// No description provided for @pajakPkbTahunan.
  ///
  /// In id, this message translates to:
  /// **'Pajak PKB Tahunan'**
  String get pajakPkbTahunan;

  /// No description provided for @pekerjaanServis.
  ///
  /// In id, this message translates to:
  /// **'Pekerjaan / Servis'**
  String get pekerjaanServis;

  /// No description provided for @pelat5Th.
  ///
  /// In id, this message translates to:
  /// **'Pelat 5 Th'**
  String get pelat5Th;

  /// No description provided for @pengaturanGarasi.
  ///
  /// In id, this message translates to:
  /// **'Pengaturan Garasi'**
  String get pengaturanGarasi;

  /// No description provided for @penggantianOliMesinResetCounte.
  ///
  /// In id, this message translates to:
  /// **'Penggantian Oli Mesin (Reset Counter)'**
  String get penggantianOliMesinResetCounte;

  /// No description provided for @pilihBahasaSelectLanguage.
  ///
  /// In id, this message translates to:
  /// **'Pilih Bahasa / Select Language'**
  String get pilihBahasaSelectLanguage;

  /// No description provided for @pilihAtauBuatKendaraanTerlebih.
  ///
  /// In id, this message translates to:
  /// **'Pilih atau buat kendaraan terlebih dahulu.'**
  String get pilihAtauBuatKendaraanTerlebih;

  /// No description provided for @pilihAtauTambahKendaraanTerleb.
  ///
  /// In id, this message translates to:
  /// **'Pilih atau tambah kendaraan terlebih dahulu.'**
  String get pilihAtauTambahKendaraanTerleb;

  /// No description provided for @portabilitasCadanganData.
  ///
  /// In id, this message translates to:
  /// **'Portabilitas & Cadangan Data'**
  String get portabilitasCadanganData;

  /// No description provided for @pulihkanData.
  ///
  /// In id, this message translates to:
  /// **'Pulihkan Data'**
  String get pulihkanData;

  /// No description provided for @pulihkanDariBackupJson.
  ///
  /// In id, this message translates to:
  /// **'Pulihkan dari Backup JSON'**
  String get pulihkanDariBackupJson;

  /// No description provided for @rataRataEfisiensi.
  ///
  /// In id, this message translates to:
  /// **'Rata-Rata Efisiensi'**
  String get rataRataEfisiensi;

  /// No description provided for @rekorIritTerbaik.
  ///
  /// In id, this message translates to:
  /// **'Rekor Irit Terbaik'**
  String get rekorIritTerbaik;

  /// No description provided for @resetCounterOliMesin.
  ///
  /// In id, this message translates to:
  /// **'Reset Counter Oli Mesin'**
  String get resetCounterOliMesin;

  /// No description provided for @resetDataGarasi.
  ///
  /// In id, this message translates to:
  /// **'Reset Data Garasi'**
  String get resetDataGarasi;

  /// No description provided for @resetOli.
  ///
  /// In id, this message translates to:
  /// **'Reset Oli'**
  String get resetOli;

  /// No description provided for @resetSeluruhData.
  ///
  /// In id, this message translates to:
  /// **'Reset Seluruh Data?'**
  String get resetSeluruhData;

  /// No description provided for @rincianPartYangDiganti.
  ///
  /// In id, this message translates to:
  /// **'Rincian part yang diganti...'**
  String get rincianPartYangDiganti;

  /// No description provided for @riwayatLengkap.
  ///
  /// In id, this message translates to:
  /// **'Riwayat Lengkap'**
  String get riwayatLengkap;

  /// No description provided for @riwayatPengisianBahanBakar.
  ///
  /// In id, this message translates to:
  /// **'Riwayat Pengisian Bahan Bakar'**
  String get riwayatPengisianBahanBakar;

  /// No description provided for @salinCsv.
  ///
  /// In id, this message translates to:
  /// **'Salin CSV'**
  String get salinCsv;

  /// No description provided for @salinKeClipboard.
  ///
  /// In id, this message translates to:
  /// **'Salin ke Clipboard'**
  String get salinKeClipboard;

  /// No description provided for @salinanJsonBackupBerhasilDisal.
  ///
  /// In id, this message translates to:
  /// **'Salinan JSON backup berhasil disalin ke Clipboard!'**
  String get salinanJsonBackupBerhasilDisal;

  /// No description provided for @servisTerakhir.
  ///
  /// In id, this message translates to:
  /// **'Servis Terakhir'**
  String get servisTerakhir;

  /// No description provided for @setPengingatBerkalaGantiPartKm.
  ///
  /// In id, this message translates to:
  /// **'Set pengingat berkala ganti part km/bulan'**
  String get setPengingatBerkalaGantiPartKm;

  /// No description provided for @simpan.
  ///
  /// In id, this message translates to:
  /// **'Simpan'**
  String get simpan;

  /// No description provided for @simpanAuditInspeksi.
  ///
  /// In id, this message translates to:
  /// **'Simpan Audit Inspeksi'**
  String get simpanAuditInspeksi;

  /// No description provided for @simpanKeGarasi.
  ///
  /// In id, this message translates to:
  /// **'Simpan ke Garasi'**
  String get simpanKeGarasi;

  /// No description provided for @simpanRiwayatBengkelDanGantiOl.
  ///
  /// In id, this message translates to:
  /// **'Simpan riwayat bengkel dan ganti oli'**
  String get simpanRiwayatBengkelDanGantiOl;

  /// No description provided for @simpanTanggalJatuhTempoStnkAsu.
  ///
  /// In id, this message translates to:
  /// **'Simpan tanggal jatuh tempo STNK, asuransi, dan dokumen kendaraan Anda.'**
  String get simpanTanggalJatuhTempoStnkAsu;

  /// No description provided for @statusOliMesin.
  ///
  /// In id, this message translates to:
  /// **'Status Oli Mesin'**
  String get statusOliMesin;

  /// No description provided for @tahunPembuatan.
  ///
  /// In id, this message translates to:
  /// **'Tahun Pembuatan'**
  String get tahunPembuatan;

  /// No description provided for @tambahDokumen.
  ///
  /// In id, this message translates to:
  /// **'Tambah Dokumen'**
  String get tambahDokumen;

  /// No description provided for @tambahDokumenPertama.
  ///
  /// In id, this message translates to:
  /// **'Tambah Dokumen Pertama'**
  String get tambahDokumenPertama;

  /// No description provided for @tambahJadwalBaru.
  ///
  /// In id, this message translates to:
  /// **'Tambah Jadwal Baru'**
  String get tambahJadwalBaru;

  /// No description provided for @tambahJadwalPerawatan.
  ///
  /// In id, this message translates to:
  /// **'Tambah Jadwal Perawatan'**
  String get tambahJadwalPerawatan;

  /// No description provided for @tambahKendaraan.
  ///
  /// In id, this message translates to:
  /// **'Tambah Kendaraan'**
  String get tambahKendaraan;

  /// No description provided for @tambahKendaraanBaru.
  ///
  /// In id, this message translates to:
  /// **'Tambah Kendaraan Baru'**
  String get tambahKendaraanBaru;

  /// No description provided for @tampilanBahasa.
  ///
  /// In id, this message translates to:
  /// **'Tampilan & Bahasa'**
  String get tampilanBahasa;

  /// No description provided for @tandaiSelesai.
  ///
  /// In id, this message translates to:
  /// **'Tandai Selesai'**
  String get tandaiSelesai;

  /// No description provided for @tandaiSelesaiReset.
  ///
  /// In id, this message translates to:
  /// **'Tandai Selesai / Reset'**
  String get tandaiSelesaiReset;

  /// No description provided for @tandaiSelesaiAkanMeresetHitung.
  ///
  /// In id, this message translates to:
  /// **'Tandai selesai akan mereset hitungan interval dan otomatis mencatat ke Riwayat Servis.'**
  String get tandaiSelesaiAkanMeresetHitung;

  /// No description provided for @tanggalMasaBerlakuJatuhTempo.
  ///
  /// In id, this message translates to:
  /// **'Tanggal Masa Berlaku / Jatuh Tempo'**
  String get tanggalMasaBerlakuJatuhTempo;

  /// No description provided for @tanggalTerakhirDikerjakan.
  ///
  /// In id, this message translates to:
  /// **'Tanggal Terakhir Dikerjakan'**
  String get tanggalTerakhirDikerjakan;

  /// No description provided for @teksJsonTidakBolehKosong.
  ///
  /// In id, this message translates to:
  /// **'Teks JSON tidak boleh kosong!'**
  String get teksJsonTidakBolehKosong;

  /// No description provided for @tempelkanTeksDataJsonCadanganY.
  ///
  /// In id, this message translates to:
  /// **'Tempelkan teks data JSON cadangan yang pernah diekspor sebelumnya:'**
  String get tempelkanTeksDataJsonCadanganY;

  /// No description provided for @tentangAplikasiLisensi.
  ///
  /// In id, this message translates to:
  /// **'Tentang Aplikasi & Lisensi'**
  String get tentangAplikasiLisensi;

  /// No description provided for @termasukGantiOli.
  ///
  /// In id, this message translates to:
  /// **'Termasuk Ganti Oli?'**
  String get termasukGantiOli;

  /// No description provided for @tindakanIniAkanMengosongkanSem.
  ///
  /// In id, this message translates to:
  /// **'Tindakan ini akan mengosongkan semua data dan mengembalikan contoh awal garasi.'**
  String get tindakanIniAkanMengosongkanSem;

  /// No description provided for @totalBiayaRp.
  ///
  /// In id, this message translates to:
  /// **'Total Biaya (Rp)'**
  String get totalBiayaRp;

  /// No description provided for @totalBiayaTco.
  ///
  /// In id, this message translates to:
  /// **'Total Biaya (TCO)'**
  String get totalBiayaTco;

  /// No description provided for @totalBiayaBengkel.
  ///
  /// In id, this message translates to:
  /// **'Total Biaya Bengkel'**
  String get totalBiayaBengkel;

  /// No description provided for @totalBiayaKepemilikanTco.
  ///
  /// In id, this message translates to:
  /// **'Total Biaya Kepemilikan (TCO)'**
  String get totalBiayaKepemilikanTco;

  /// No description provided for @totalPengeluaranBbm.
  ///
  /// In id, this message translates to:
  /// **'Total Pengeluaran BBM'**
  String get totalPengeluaranBbm;

  /// No description provided for @tutup.
  ///
  /// In id, this message translates to:
  /// **'Tutup'**
  String get tutup;

  /// No description provided for @ubah.
  ///
  /// In id, this message translates to:
  /// **'Ubah'**
  String get ubah;

  /// No description provided for @volumeLiterKwh.
  ///
  /// In id, this message translates to:
  /// **'Volume (Liter / kWh)'**
  String get volumeLiterKwh;

  /// No description provided for @gagalMemulihkanBackup.
  ///
  /// In id, this message translates to:
  /// **'Gagal memulihkan backup: {error}'**
  String gagalMemulihkanBackup(String error);

  /// No description provided for @misalPajakPkbTahunanStnk2026.
  ///
  /// In id, this message translates to:
  /// **'Misal: Pajak PKB Tahunan STNK 2026'**
  String get misalPajakPkbTahunanStnk2026;

  /// No description provided for @hintPlatB1234.
  ///
  /// In id, this message translates to:
  /// **'B 1234 ABC'**
  String get hintPlatB1234;

  /// No description provided for @misalStnkDiDompet.
  ///
  /// In id, this message translates to:
  /// **'Misal: STNK di dompet, BPKB di lemari arsip'**
  String get misalStnkDiDompet;

  /// No description provided for @misalKurasMinyakRem.
  ///
  /// In id, this message translates to:
  /// **'Misal: Kuras Minyak Rem DOT 4'**
  String get misalKurasMinyakRem;

  /// No description provided for @selesaikanJadwal.
  ///
  /// In id, this message translates to:
  /// **'Selesaikan: {title}'**
  String selesaikanJadwal(String title);

  /// No description provided for @jadwalCount.
  ///
  /// In id, this message translates to:
  /// **'Jadwal ({count})'**
  String jadwalCount(String count);

  /// No description provided for @riwayatCount.
  ///
  /// In id, this message translates to:
  /// **'Riwayat ({count})'**
  String riwayatCount(String count);

  /// No description provided for @inspeksiCount.
  ///
  /// In id, this message translates to:
  /// **'Inspeksi ({count})'**
  String inspeksiCount(String count);

  /// No description provided for @rekomendasiPabrikBerhasilDimuat.
  ///
  /// In id, this message translates to:
  /// **'Rekomendasi pabrik {label} berhasil dimuat!'**
  String rekomendasiPabrikBerhasilDimuat(String label);

  /// No description provided for @muatStandarPabrik.
  ///
  /// In id, this message translates to:
  /// **'Muat Standar Pabrik ({label})'**
  String muatStandarPabrik(String label);

  /// No description provided for @odometerValue.
  ///
  /// In id, this message translates to:
  /// **'Odometer: {odo} km'**
  String odometerValue(String odo);

  /// No description provided for @kendaraanBerhasilDitambahkan.
  ///
  /// In id, this message translates to:
  /// **'Kendaraan {name} berhasil ditambahkan ke garasi!'**
  String kendaraanBerhasilDitambahkan(String name);

  /// No description provided for @timezone.
  ///
  /// In id, this message translates to:
  /// **'Zona Waktu'**
  String get timezone;

  /// No description provided for @timezoneAuto.
  ///
  /// In id, this message translates to:
  /// **'Otomatis (ikut perangkat)'**
  String get timezoneAuto;
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
