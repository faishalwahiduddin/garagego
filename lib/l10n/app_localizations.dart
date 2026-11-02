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
  /// **'Ekspor Cadangan (.grg)'**
  String get exportBackup;

  /// No description provided for @importBackup.
  ///
  /// In id, this message translates to:
  /// **'Pulihkan Cadangan (.grg)'**
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
  /// **'Bagikan berkas cadangan .grg berisi seluruh data garasi, jadwal servis, dokumen, dan log BBM.'**
  String get cadanganLengkapSeluruhDataGara;

  /// No description provided for @cadangkanSeluruhKendaraanServi.
  ///
  /// In id, this message translates to:
  /// **'Bagikan seluruh kendaraan, servis, BBM, dan jadwal sebagai berkas .grg'**
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
  /// **'Ekspor Cadangan (.grg)'**
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
  /// **'Ekspor Cadangan (.grg)'**
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
  /// **'Impor / Pulihkan Cadangan (.grg)'**
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
  /// **'Kembalikan data dari berkas cadangan .grg yang valid'**
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
  /// **'Lisensi Penggunaan'**
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
  /// **'Pulihkan dari berkas (.grg)'**
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
  /// **'Berkas cadangan .grg siap dibagikan!'**
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
  /// **'Berkas cadangan tidak boleh kosong!'**
  String get teksJsonTidakBolehKosong;

  /// No description provided for @tempelkanTeksDataJsonCadanganY.
  ///
  /// In id, this message translates to:
  /// **'Pilih berkas cadangan .grg yang pernah diekspor sebelumnya.'**
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

  /// No description provided for @licenseUsageTitle.
  ///
  /// In id, this message translates to:
  /// **'Lisensi Penggunaan'**
  String get licenseUsageTitle;

  /// No description provided for @licenseUsageNotice.
  ///
  /// In id, this message translates to:
  /// **'Bebas digunakan untuk keperluan personal dan non-profit.'**
  String get licenseUsageNotice;

  /// No description provided for @licenseUsageBadgeText.
  ///
  /// In id, this message translates to:
  /// **'Personal & Non-Profit'**
  String get licenseUsageBadgeText;

  /// No description provided for @validationVehicleNameRequired.
  ///
  /// In id, this message translates to:
  /// **'Nama kendaraan tidak boleh kosong'**
  String get validationVehicleNameRequired;

  /// No description provided for @validationVehicleNameMinLength.
  ///
  /// In id, this message translates to:
  /// **'Nama kendaraan minimal 2 karakter'**
  String get validationVehicleNameMinLength;

  /// No description provided for @validationVehicleNameMaxLength.
  ///
  /// In id, this message translates to:
  /// **'Nama kendaraan maksimal 50 karakter'**
  String get validationVehicleNameMaxLength;

  /// No description provided for @validationPlateRequired.
  ///
  /// In id, this message translates to:
  /// **'Nomor pelat polisi tidak boleh kosong'**
  String get validationPlateRequired;

  /// No description provided for @validationPlateMaxLength.
  ///
  /// In id, this message translates to:
  /// **'Nomor pelat maksimal 15 karakter'**
  String get validationPlateMaxLength;

  /// No description provided for @validationOdometerNegative.
  ///
  /// In id, this message translates to:
  /// **'Kilometer odometer tidak boleh negatif'**
  String get validationOdometerNegative;

  /// No description provided for @validationOdometerTooHigh.
  ///
  /// In id, this message translates to:
  /// **'Kilometer odometer melebihi batas wajar'**
  String get validationOdometerTooHigh;

  /// No description provided for @validationOdometerLessThanPrevious.
  ///
  /// In id, this message translates to:
  /// **'Odometer baru tidak boleh lebih kecil dari sebelumnya'**
  String get validationOdometerLessThanPrevious;

  /// No description provided for @validationCostNegative.
  ///
  /// In id, this message translates to:
  /// **'Biaya tidak boleh bernilai negatif'**
  String get validationCostNegative;

  /// No description provided for @validationFuelLitersPositive.
  ///
  /// In id, this message translates to:
  /// **'Volume bahan bakar harus lebih dari 0 liter'**
  String get validationFuelLitersPositive;

  /// No description provided for @validationFuelLitersTooHigh.
  ///
  /// In id, this message translates to:
  /// **'Volume tangki melebihi kapasitas wajar'**
  String get validationFuelLitersTooHigh;

  /// No description provided for @validationServiceNameRequired.
  ///
  /// In id, this message translates to:
  /// **'Nama servis wajib diisi'**
  String get validationServiceNameRequired;

  /// No description provided for @validationDocNameRequired.
  ///
  /// In id, this message translates to:
  /// **'Nama dokumen wajib diisi'**
  String get validationDocNameRequired;

  /// App title used by the window title, splash and onboarding chrome.
  ///
  /// In id, this message translates to:
  /// **'GarageGo'**
  String get appTitle;

  /// One-line product tagline shown on the splash screen.
  ///
  /// In id, this message translates to:
  /// **'Catat servis, oli, BBM & pajak kendaraan dalam satu garasi'**
  String get appTagline;

  /// Accessible label shown while content is loading.
  ///
  /// In id, this message translates to:
  /// **'Memuat…'**
  String get loadingLabel;

  /// Onboarding: skip button.
  ///
  /// In id, this message translates to:
  /// **'Lewati'**
  String get onbSkip;

  /// Onboarding: next slide button.
  ///
  /// In id, this message translates to:
  /// **'Lanjut'**
  String get onbNext;

  /// Onboarding: finish button on the last slide.
  ///
  /// In id, this message translates to:
  /// **'Mulai Sekarang'**
  String get onbGetStarted;

  /// Onboarding last slide: short privacy reassurance.
  ///
  /// In id, this message translates to:
  /// **'Privasi & Offline Terjamin'**
  String get onbPrivacyHeadline;

  /// Onboarding: longer privacy line (used by the consent/reference copy).
  ///
  /// In id, this message translates to:
  /// **'Semua data kendaraan tersimpan aman di perangkat Anda tanpa pelacak.'**
  String get onbPrivacyDetail;

  /// Onboarding slide 1 headline.
  ///
  /// In id, this message translates to:
  /// **'Garasi Anda'**
  String get onbSlide1Title;

  /// Onboarding slide 1 subtext.
  ///
  /// In id, this message translates to:
  /// **'Mobil & motor dalam satu tempat'**
  String get onbSlide1Sub;

  /// Onboarding slide 1 badge.
  ///
  /// In id, this message translates to:
  /// **'100% Offline & Privat'**
  String get onbSlide1Badge;

  /// Onboarding slide 2 headline.
  ///
  /// In id, this message translates to:
  /// **'Perawatan'**
  String get onbSlide2Title;

  /// Onboarding slide 2 subtext.
  ///
  /// In id, this message translates to:
  /// **'Servis, oli, dan pajak STNK'**
  String get onbSlide2Sub;

  /// Onboarding slide 2 badge.
  ///
  /// In id, this message translates to:
  /// **'Pengingat Berkala'**
  String get onbSlide2Badge;

  /// Onboarding slide 3 headline.
  ///
  /// In id, this message translates to:
  /// **'BBM'**
  String get onbSlide3Title;

  /// Onboarding slide 3 subtext.
  ///
  /// In id, this message translates to:
  /// **'Konsumsi km/L & biaya per km'**
  String get onbSlide3Sub;

  /// Onboarding slide 3 badge.
  ///
  /// In id, this message translates to:
  /// **'Tanpa Iklan & Tanpa Akun'**
  String get onbSlide3Badge;

  /// Onboarding slide 4 headline.
  ///
  /// In id, this message translates to:
  /// **'Offline & Privat'**
  String get onbSlide4Title;

  /// Onboarding slide 4 subtext.
  ///
  /// In id, this message translates to:
  /// **'Data tersimpan di perangkat Anda'**
  String get onbSlide4Sub;

  /// Onboarding slide 4 badge.
  ///
  /// In id, this message translates to:
  /// **'Data Tersimpan di Perangkat'**
  String get onbSlide4Badge;

  /// Schedule urgency: everything is fine.
  ///
  /// In id, this message translates to:
  /// **'Aman'**
  String get urgencySafe;

  /// Schedule urgency: due soon.
  ///
  /// In id, this message translates to:
  /// **'Segera'**
  String get urgencyDueSoon;

  /// Schedule urgency: overdue.
  ///
  /// In id, this message translates to:
  /// **'Terlewat'**
  String get urgencyOverdue;

  /// Document type: annual vehicle tax.
  ///
  /// In id, this message translates to:
  /// **'Pajak PKB Tahunan'**
  String get docTypeTax;

  /// Document type: 5-year plate and registration renewal.
  ///
  /// In id, this message translates to:
  /// **'Ganti Pelat & STNK 5 Th'**
  String get docTypePlate;

  /// Document type: vehicle insurance.
  ///
  /// In id, this message translates to:
  /// **'Asuransi Kendaraan'**
  String get docTypeInsurance;

  /// Document type: emissions test / roadworthiness inspection.
  ///
  /// In id, this message translates to:
  /// **'Uji Emisi / KIR'**
  String get docTypeEmissions;

  /// Document type: driver licence.
  ///
  /// In id, this message translates to:
  /// **'SIM Pengemudi'**
  String get docTypeLicense;

  /// Document type: vehicle ownership title (BPKB).
  ///
  /// In id, this message translates to:
  /// **'BPKB Kendaraan'**
  String get docTypeTitle;

  /// Document type: any other document.
  ///
  /// In id, this message translates to:
  /// **'Dokumen Lainnya'**
  String get docTypeOther;

  /// Maintenance category: oil and fluids.
  ///
  /// In id, this message translates to:
  /// **'Oli & Pelumas'**
  String get mtCatOilFluids;

  /// Maintenance category: oil and filters.
  ///
  /// In id, this message translates to:
  /// **'Oli & Filter'**
  String get mtCatOilFilter;

  /// Maintenance category: air and cabin filters.
  ///
  /// In id, this message translates to:
  /// **'Filter & Udara'**
  String get mtCatAirFilter;

  /// Maintenance category: braking system.
  ///
  /// In id, this message translates to:
  /// **'Pengereman'**
  String get mtCatBrakes;

  /// Maintenance category: tyres and suspension.
  ///
  /// In id, this message translates to:
  /// **'Ban & Suspensi'**
  String get mtCatTires;

  /// Maintenance category: ignition system.
  ///
  /// In id, this message translates to:
  /// **'Pengapian'**
  String get mtCatIgnition;

  /// Maintenance category: transmission and drivetrain.
  ///
  /// In id, this message translates to:
  /// **'Transmisi & Penggerak'**
  String get mtCatTransmission;

  /// Maintenance category: CVT transmission.
  ///
  /// In id, this message translates to:
  /// **'Transmisi CVT'**
  String get mtCatCvt;

  /// Maintenance category: electrical system and battery.
  ///
  /// In id, this message translates to:
  /// **'Kelistrikan & Aki'**
  String get mtCatElectrical;

  /// Maintenance category: coolant and radiator.
  ///
  /// In id, this message translates to:
  /// **'Cairan & Radiator'**
  String get mtCatCoolant;

  /// Maintenance category: periodic servicing.
  ///
  /// In id, this message translates to:
  /// **'Perawatan Berkala'**
  String get mtCatGeneral;

  /// Preset schedule (car): engine oil.
  ///
  /// In id, this message translates to:
  /// **'Ganti Oli Mesin Sintetik'**
  String get mtPresetCarOil;

  /// Preset schedule (car): oil filter.
  ///
  /// In id, this message translates to:
  /// **'Ganti Filter Oli Mesin'**
  String get mtPresetCarOilFilter;

  /// Preset schedule (car): air and cabin filter.
  ///
  /// In id, this message translates to:
  /// **'Filter Udara & AC Kabin'**
  String get mtPresetCarAirFilter;

  /// Preset schedule (car): brake fluid and pads.
  ///
  /// In id, this message translates to:
  /// **'Kuras Minyak Rem & Kampas'**
  String get mtPresetCarBrakeFluid;

  /// Preset schedule (car): tyre rotation and alignment.
  ///
  /// In id, this message translates to:
  /// **'Rotasi Ban & Spooring Balancing'**
  String get mtPresetCarTireRotation;

  /// Preset schedule (car): spark plugs.
  ///
  /// In id, this message translates to:
  /// **'Ganti Busi Iridium'**
  String get mtPresetCarSparkPlugs;

  /// Preset schedule (motorcycle): engine oil.
  ///
  /// In id, this message translates to:
  /// **'Ganti Oli Mesin Matic/Manual'**
  String get mtPresetMotoOil;

  /// Preset schedule (motorcycle): final drive gear oil.
  ///
  /// In id, this message translates to:
  /// **'Ganti Oli Gardan (Gear Oil)'**
  String get mtPresetMotoGearOil;

  /// Preset schedule (motorcycle): CVT service.
  ///
  /// In id, this message translates to:
  /// **'Servis CVT, V-Belt & Roller'**
  String get mtPresetMotoCvt;

  /// Preset schedule (motorcycle): brake pads.
  ///
  /// In id, this message translates to:
  /// **'Cek & Ganti Kampas Rem'**
  String get mtPresetMotoBrakes;

  /// Preset schedule (motorcycle): spark plug.
  ///
  /// In id, this message translates to:
  /// **'Ganti Busi Motor'**
  String get mtPresetMotoSparkPlug;

  /// Title of a generated pre-trip inspection checklist.
  ///
  /// In id, this message translates to:
  /// **'Inspeksi Pra-Perjalanan ({type})'**
  String inspPreTripTitle(String type);

  /// Inspection progress: how many of the checkpoints passed.
  ///
  /// In id, this message translates to:
  /// **'Kelayakan: {passed} dari {total} Poin Lolos'**
  String inspRoadworthiness(String passed, String total);

  /// Inspection list badge: percentage and passed/total count.
  ///
  /// In id, this message translates to:
  /// **'{pct}% Lolos ({passed}/{total})'**
  String inspPassedCount(String pct, String passed, String total);

  /// Inspection category: engine and fluids.
  ///
  /// In id, this message translates to:
  /// **'Mesin & Cairan'**
  String get inspCatEngine;

  /// Inspection category: wheels and brakes.
  ///
  /// In id, this message translates to:
  /// **'Roda & Pengereman'**
  String get inspCatWheelsBrakes;

  /// Inspection category: lights and electrical.
  ///
  /// In id, this message translates to:
  /// **'Lampu & Kelistrikan'**
  String get inspCatLights;

  /// Inspection category: safety equipment.
  ///
  /// In id, this message translates to:
  /// **'Keselamatan'**
  String get inspCatSafety;

  /// Inspection category: drivetrain.
  ///
  /// In id, this message translates to:
  /// **'Transmisi & Penggerak'**
  String get inspCatDrivetrain;

  /// Inspection category: wheels and steering.
  ///
  /// In id, this message translates to:
  /// **'Roda & Kemudi'**
  String get inspCatWheelsSteering;

  /// Inspection category: brakes.
  ///
  /// In id, this message translates to:
  /// **'Pengereman'**
  String get inspCatBrakes;

  /// Inspection category: electrical.
  ///
  /// In id, this message translates to:
  /// **'Kelistrikan'**
  String get inspCatElectrical;

  /// Inspection category: equipment.
  ///
  /// In id, this message translates to:
  /// **'Kelengkapan'**
  String get inspCatEquipment;

  /// Inspection checkpoint (car): engine oil dipstick.
  ///
  /// In id, this message translates to:
  /// **'Level Dipstick & Kejernihan Oli Mesin'**
  String get inspCar1;

  /// Inspection checkpoint (car): radiator coolant reservoir.
  ///
  /// In id, this message translates to:
  /// **'Level Air Reservoir Radiator Coolant'**
  String get inspCar2;

  /// Inspection checkpoint (car): brake, clutch and power steering fluid.
  ///
  /// In id, this message translates to:
  /// **'Level Minyak Rem & Minyak Kopling/Power Steering'**
  String get inspCar3;

  /// Inspection checkpoint (car): tyre pressure and tread.
  ///
  /// In id, this message translates to:
  /// **'Tekanan Udara & Alur Ketebalan 4 Ban + Ban Serep'**
  String get inspCar4;

  /// Inspection checkpoint (car): brake pads and handbrake.
  ///
  /// In id, this message translates to:
  /// **'Kondisi Kampas Rem & Daya Cengkeram Rem Tangan'**
  String get inspCar5;

  /// Inspection checkpoint (car): lights.
  ///
  /// In id, this message translates to:
  /// **'Lampu Utama, Lampu Rem, Sein & Lampu Hazard'**
  String get inspCar6;

  /// Inspection checkpoint (car): battery terminals and voltage.
  ///
  /// In id, this message translates to:
  /// **'Kondisi Terminal & Tegangan Indikator Aki (12V)'**
  String get inspCar7;

  /// Inspection checkpoint (car): wipers and washer fluid.
  ///
  /// In id, this message translates to:
  /// **'Karet Wiper & Air Tabung Washer Kaca Depan'**
  String get inspCar8;

  /// Inspection checkpoint (car): emergency equipment.
  ///
  /// In id, this message translates to:
  /// **'Dongkrak, Kunci Roda, Segitiga Pengaman & Kotak P3K'**
  String get inspCar9;

  /// Inspection checkpoint (motorcycle): engine oil.
  ///
  /// In id, this message translates to:
  /// **'Ketinggian & Kualitas Oli Mesin'**
  String get inspMoto1;

  /// Inspection checkpoint (motorcycle): final drive oil or chain slack.
  ///
  /// In id, this message translates to:
  /// **'Kondisi Oli Gardan / Ketegangan Rantai Roda'**
  String get inspMoto2;

  /// Inspection checkpoint (motorcycle): tyre pressures.
  ///
  /// In id, this message translates to:
  /// **'Tekanan Angin Ban Depan & Belakang'**
  String get inspMoto3;

  /// Inspection checkpoint (motorcycle): brake pad thickness.
  ///
  /// In id, this message translates to:
  /// **'Ketebalan Kampas Rem Depan & Belakang'**
  String get inspMoto4;

  /// Inspection checkpoint (motorcycle): lights.
  ///
  /// In id, this message translates to:
  /// **'Lampu Depan, Lampu Belakang & Lampu Sein'**
  String get inspMoto5;

  /// Inspection checkpoint (motorcycle): horn and electric starter.
  ///
  /// In id, this message translates to:
  /// **'Fungsi Klakson & Starter Elektrik (Kondisi Aki)'**
  String get inspMoto6;

  /// Inspection checkpoint (motorcycle): mirrors and toolkit.
  ///
  /// In id, this message translates to:
  /// **'Spion Kanan & Kiri serta Kunci Kelengkapan'**
  String get inspMoto7;

  /// Level chip prefix.
  ///
  /// In id, this message translates to:
  /// **'LVL {level}'**
  String gamesLvl(String level);

  /// Gamification header: total XP and unlocked badge count.
  ///
  /// In id, this message translates to:
  /// **'{xp} XP • {unlocked}/{total} Lencana Terbuka'**
  String gamesProgress(String xp, String unlocked, String total);

  /// Progress hint towards the next level.
  ///
  /// In id, this message translates to:
  /// **'Menuju {next} ({xp} XP)'**
  String gamesNextLevel(String next, String xp);

  /// Shown when the highest level is reached.
  ///
  /// In id, this message translates to:
  /// **'Pangkat Maksimal'**
  String get gamesMaxRank;

  /// Section header above the badge grid.
  ///
  /// In id, this message translates to:
  /// **'Lencana Disiplin Garasi'**
  String get gamesBadgesTitle;

  /// Tooltip/label for the share action.
  ///
  /// In id, this message translates to:
  /// **'Bagikan'**
  String get gamesShare;

  /// Badge detail: unlocked state with XP reward.
  ///
  /// In id, this message translates to:
  /// **'Terbuka (+100 XP)'**
  String get gamesUnlocked;

  /// Badge detail: not yet unlocked.
  ///
  /// In id, this message translates to:
  /// **'Belum Tercapai'**
  String get gamesLocked;

  /// Badge share line: which badge was unlocked.
  ///
  /// In id, this message translates to:
  /// **'Lencana terbuka: {highlight}'**
  String gamesBadgeUnlockedLine(String highlight);

  /// Level 1 title.
  ///
  /// In id, this message translates to:
  /// **'Pengendara Pemula'**
  String get gamesLvl1;

  /// Level 2 title.
  ///
  /// In id, this message translates to:
  /// **'Pemilik Peduli'**
  String get gamesLvl2;

  /// Level 3 title.
  ///
  /// In id, this message translates to:
  /// **'Penjaga Armada'**
  String get gamesLvl3;

  /// Level 4 title.
  ///
  /// In id, this message translates to:
  /// **'Spesialis Servis'**
  String get gamesLvl4;

  /// Level 5 title.
  ///
  /// In id, this message translates to:
  /// **'Master Garasi'**
  String get gamesLvl5;

  /// Badge: first vehicle.
  ///
  /// In id, this message translates to:
  /// **'Armada Pertama'**
  String get badgeFirstRideTitle;

  /// Badge description: first vehicle.
  ///
  /// In id, this message translates to:
  /// **'Mendaftarkan kendaraan pertama ke dalam garasi digital.'**
  String get badgeFirstRideDesc;

  /// Badge: on-time oil change.
  ///
  /// In id, this message translates to:
  /// **'Disiplin Oli'**
  String get badgeOilCareTitle;

  /// Badge description: on-time oil change.
  ///
  /// In id, this message translates to:
  /// **'Mencatat riwayat ganti oli mesin tepat waktu.'**
  String get badgeOilCareDesc;

  /// Badge: repeated periodic service.
  ///
  /// In id, this message translates to:
  /// **'Rutin Berkala'**
  String get badgeServiceVeteranTitle;

  /// Badge description: repeated periodic service.
  ///
  /// In id, this message translates to:
  /// **'Mencatatkan minimal 3 log servis perawatan berkala.'**
  String get badgeServiceVeteranDesc;

  /// Badge: fuel logging.
  ///
  /// In id, this message translates to:
  /// **'Jejak Efisiensi'**
  String get badgeFuelWatcherTitle;

  /// Badge description: fuel logging.
  ///
  /// In id, this message translates to:
  /// **'Mencatat minimal 3 pengisian BBM untuk memantau konsumsi.'**
  String get badgeFuelWatcherDesc;

  /// Badge: safety inspection.
  ///
  /// In id, this message translates to:
  /// **'Inspektur Teliti'**
  String get badgeSafeVoyageTitle;

  /// Badge description: safety inspection.
  ///
  /// In id, this message translates to:
  /// **'Menyelesaikan checklist inspeksi keselamatan kendaraan.'**
  String get badgeSafeVoyageDesc;

  /// Badge: documents stored.
  ///
  /// In id, this message translates to:
  /// **'Tertib Dokumen'**
  String get badgeDocKeeperTitle;

  /// Badge description: documents stored.
  ///
  /// In id, this message translates to:
  /// **'Menyimpan dokumen legalitas (STNK/Pajak/SIM/Asuransi).'**
  String get badgeDocKeeperDesc;

  /// Badge: high health score.
  ///
  /// In id, this message translates to:
  /// **'Kondisi Prima'**
  String get badgePrimeFleetTitle;

  /// Badge description: high health score.
  ///
  /// In id, this message translates to:
  /// **'Mencapai skor kesehatan kendaraan 90 atau lebih.'**
  String get badgePrimeFleetDesc;

  /// Badge: long distance.
  ///
  /// In id, this message translates to:
  /// **'Jelajah 10.000 KM'**
  String get badgeRoadWarriorTitle;

  /// Badge description: long distance.
  ///
  /// In id, this message translates to:
  /// **'Memantau kendaraan dengan odometer melampaui 10.000 km.'**
  String get badgeRoadWarriorDesc;

  /// Health warning: oil change overdue.
  ///
  /// In id, this message translates to:
  /// **'Ganti oli mesin sudah terlewat {km} km'**
  String healthOilOverdue(String km);

  /// Health warning: oil change due soon.
  ///
  /// In id, this message translates to:
  /// **'Ganti oli mesin perlu dilakukan dalam {km} km lagi'**
  String healthOilDue(String km);

  /// Health good point: oil interval fine.
  ///
  /// In id, this message translates to:
  /// **'Interval oli mesin dalam kondisi prima'**
  String get healthOilOptimal;

  /// Health warning: tax overdue.
  ///
  /// In id, this message translates to:
  /// **'Pajak STNK tahunan telah lewat jatuh tempo'**
  String get healthTaxOverdue;

  /// Health warning: tax due soon.
  ///
  /// In id, this message translates to:
  /// **'Pajak STNK tahunan jatuh tempo dalam {days} hari'**
  String healthTaxDue(String days);

  /// Health good point: tax is fine.
  ///
  /// In id, this message translates to:
  /// **'Pajak PKB tahunan aktif & aman'**
  String get healthTaxSafe;

  /// Health warning: 5-year plate expired.
  ///
  /// In id, this message translates to:
  /// **'Masa berlaku pelat 5 tahunan telah habis'**
  String get healthPlateExpired;

  /// Health warning: 5-year plate due soon.
  ///
  /// In id, this message translates to:
  /// **'Pelat 5 tahunan perlu diperpanjang dalam {days} hari'**
  String healthPlateDue(String days);

  /// Health warning: a named schedule is overdue.
  ///
  /// In id, this message translates to:
  /// **'{title} sudah terlewat'**
  String healthScheduleOverdue(String title);

  /// Health warning: a named schedule is due soon.
  ///
  /// In id, this message translates to:
  /// **'{title} mendekati batas servis'**
  String healthScheduleDueSoon(String title);

  /// Vehicle health status: excellent.
  ///
  /// In id, this message translates to:
  /// **'Sangat Prima'**
  String get healthPrime;

  /// Vehicle health status: needs attention.
  ///
  /// In id, this message translates to:
  /// **'Perlu Perhatian'**
  String get healthAttention;

  /// Vehicle health status: critical.
  ///
  /// In id, this message translates to:
  /// **'Kritis / Servis Segera'**
  String get healthCritical;

  /// Live fuel form preview: estimated total cost.
  ///
  /// In id, this message translates to:
  /// **'Estimasi Total Biaya:'**
  String get fuelEstTotalCost;

  /// Live fuel form preview: trip distance.
  ///
  /// In id, this message translates to:
  /// **'Jarak Tempuh Trip:'**
  String get fuelTripDistance;

  /// Live fuel form preview: average consumption.
  ///
  /// In id, this message translates to:
  /// **'Konsumsi Rata-rata:'**
  String get fuelAvgConsumption;

  /// Live fuel form preview: running cost per km.
  ///
  /// In id, this message translates to:
  /// **'Biaya Operasional:'**
  String get fuelOperatingCost;

  /// Fuel log: tank was filled completely.
  ///
  /// In id, this message translates to:
  /// **'Tangki Penuh'**
  String get fuelFullTank;

  /// Fuel log: partial fill.
  ///
  /// In id, this message translates to:
  /// **'Sebagian'**
  String get fuelPartial;

  /// Fuel log line: unit price and fill type.
  ///
  /// In id, this message translates to:
  /// **'@ {price} / L • {state}'**
  String fuelPricePerLiterLine(String price, String state);

  /// Fuel log line: odometer reading.
  ///
  /// In id, this message translates to:
  /// **'Odo: {value} km'**
  String fuelOdometerValue(String value);

  /// Fuel economy unit value.
  ///
  /// In id, this message translates to:
  /// **'{value} km/L'**
  String fuelKmL(String value);

  /// About row label: application name.
  ///
  /// In id, this message translates to:
  /// **'Aplikasi'**
  String get aboutApplication;

  /// About row label: version.
  ///
  /// In id, this message translates to:
  /// **'Versi'**
  String get aboutVersion;

  /// About row label: architecture.
  ///
  /// In id, this message translates to:
  /// **'Arsitektur'**
  String get aboutArchitecture;

  /// About row value: offline-first architecture.
  ///
  /// In id, this message translates to:
  /// **'100% Offline-First (tanpa server, tanpa pelacakan)'**
  String get aboutArchitectureValue;

  /// About row label: domain.
  ///
  /// In id, this message translates to:
  /// **'Domain'**
  String get aboutDomain;

  /// About row label: package identifier.
  ///
  /// In id, this message translates to:
  /// **'ID Paket'**
  String get aboutPackageId;

  /// Settings vehicle row subtitle: plate and odometer.
  ///
  /// In id, this message translates to:
  /// **'{plate} • Odo: {value} km'**
  String settingsVehicleOdo(String plate, String value);

  /// Backup import failed: the file is not a valid GarageGo backup.
  ///
  /// In id, this message translates to:
  /// **'Berkas .grg tidak valid atau strukturnya rusak'**
  String get backupInvalidFile;

  /// Schedule filter: everything.
  ///
  /// In id, this message translates to:
  /// **'Semua'**
  String get filterAll;

  /// Schedule filter: needs attention.
  ///
  /// In id, this message translates to:
  /// **'Perhatian'**
  String get filterAttention;

  /// Maintenance screen title when no vehicle is selected.
  ///
  /// In id, this message translates to:
  /// **'Perawatan & Servis'**
  String get maintenanceScreenTitle;

  /// Service log form: example title.
  ///
  /// In id, this message translates to:
  /// **'Misal: Ganti Oli Mesin & Filter'**
  String get serviceTitleHint;

  /// Service log form: example workshop.
  ///
  /// In id, this message translates to:
  /// **'Misal: Bengkel Resmi Astra'**
  String get workshopHint;

  /// Validation: the value must be greater than zero.
  ///
  /// In id, this message translates to:
  /// **'Wajib lebih dari 0'**
  String get mustBePositive;

  /// Sheet title: edit an existing maintenance schedule.
  ///
  /// In id, this message translates to:
  /// **'Ubah Jadwal Perawatan'**
  String get editScheduleTitle;

  /// Snackbar: schedule updated.
  ///
  /// In id, this message translates to:
  /// **'Jadwal berhasil diperbarui!'**
  String get scheduleUpdated;

  /// Snackbar: schedule created.
  ///
  /// In id, this message translates to:
  /// **'Jadwal perawatan berhasil disimpan!'**
  String get scheduleSaved;

  /// Button: save changes to a schedule.
  ///
  /// In id, this message translates to:
  /// **'Perbarui Jadwal'**
  String get updateSchedule;

  /// Button: create a maintenance schedule.
  ///
  /// In id, this message translates to:
  /// **'Simpan Jadwal Perawatan'**
  String get saveSchedule;

  /// Snackbar: a named schedule was marked done.
  ///
  /// In id, this message translates to:
  /// **'{title} berhasil diselesaikan!'**
  String scheduleCompleted(String title);

  /// Schedule badge: kilometres overdue.
  ///
  /// In id, this message translates to:
  /// **'Terlewat {km} km'**
  String kmOverdue(String km);

  /// Schedule badge: kilometres remaining.
  ///
  /// In id, this message translates to:
  /// **'Sisa {km} km lagi'**
  String kmRemaining(String km);

  /// Compact schedule badge: kilometres overdue.
  ///
  /// In id, this message translates to:
  /// **'Lewat {km} km'**
  String kmOverdueShort(String km);

  /// Compact schedule badge: kilometres left.
  ///
  /// In id, this message translates to:
  /// **'Sisa {km} km'**
  String kmRemainingShort(String km);

  /// Schedule badge: days overdue.
  ///
  /// In id, this message translates to:
  /// **'Terlewat {days} hari'**
  String daysOverdue(String days);

  /// Schedule badge: days left.
  ///
  /// In id, this message translates to:
  /// **'Sisa {days} hari lagi'**
  String daysLeft(String days);

  /// Schedule card: interval, last odometer and last date.
  ///
  /// In id, this message translates to:
  /// **'Setiap {km} km atau {months} bulan • Terakhir: {odo} km ({date})'**
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  );

  /// Action: share the vehicle status card.
  ///
  /// In id, this message translates to:
  /// **'Bagikan Paspor Kendaraan'**
  String get shareVehiclePassport;

  /// Quick action subtitle for the share card.
  ///
  /// In id, this message translates to:
  /// **'Bagikan kartu status, skor kesehatan & riwayat ke media sosial'**
  String get shareVehiclePassportSubtitle;

  /// Empty garage explanation.
  ///
  /// In id, this message translates to:
  /// **'Tambahkan mobil atau motor keluarga pertama Anda untuk mulai memantau servis, oli, dan BBM.'**
  String get garageEmptyBody;

  /// Oil reset dialog body.
  ///
  /// In id, this message translates to:
  /// **'Counter penggantian oli untuk {name} akan diatur ulang ke odometer saat ini ({odo} km).'**
  String resetOilConfirm(String name, String odo);

  /// Service log note created by the oil reset action.
  ///
  /// In id, this message translates to:
  /// **'Reset counter interval oli mesin'**
  String get resetOilServiceNote;

  /// Oil card: interval in kilometres.
  ///
  /// In id, this message translates to:
  /// **'Interval: tiap {km} km'**
  String oilIntervalEvery(String km);

  /// Vehicle subtitle: manufacture year.
  ///
  /// In id, this message translates to:
  /// **'Tahun {year}'**
  String garageYear(String year);

  /// Share dialog header.
  ///
  /// In id, this message translates to:
  /// **'Bagikan Paspor Kendaraan'**
  String get shareDialogTitle;

  /// Button: copy the summary text.
  ///
  /// In id, this message translates to:
  /// **'Salin Ringkasan'**
  String get shareCopySummary;

  /// Button label while the image is being generated.
  ///
  /// In id, this message translates to:
  /// **'Menyiapkan…'**
  String get sharePreparing;

  /// Web button: download the image.
  ///
  /// In id, this message translates to:
  /// **'Unduh Paspor'**
  String get shareDownloadPassport;

  /// Button: share the image.
  ///
  /// In id, this message translates to:
  /// **'Bagikan Paspor'**
  String get shareSharePassport;

  /// Snackbar: image generation failed.
  ///
  /// In id, this message translates to:
  /// **'Gagal membuat gambar paspor kendaraan'**
  String get shareImageFailed;

  /// Snackbar: image downloaded.
  ///
  /// In id, this message translates to:
  /// **'Paspor kendaraan berhasil diunduh'**
  String get shareImageDownloaded;

  /// Snackbar: summary copied to clipboard.
  ///
  /// In id, this message translates to:
  /// **'Ringkasan status kendaraan berhasil disalin'**
  String get shareSummaryCopied;

  /// Share card: health section label.
  ///
  /// In id, this message translates to:
  /// **'STATUS KESEHATAN ARMADA'**
  String get shareCardHealthHeader;

  /// Share card: condition line.
  ///
  /// In id, this message translates to:
  /// **'Kondisi {status}'**
  String shareCardCondition(String status);

  /// Share card metric label: odometer.
  ///
  /// In id, this message translates to:
  /// **'ODOMETER'**
  String get shareCardOdometer;

  /// Share card metric label: oil change.
  ///
  /// In id, this message translates to:
  /// **'GANTI OLI'**
  String get shareCardOil;

  /// Share card metric label: road tax.
  ///
  /// In id, this message translates to:
  /// **'PAJAK PKB'**
  String get shareCardTax;

  /// Share card: oil change needed now.
  ///
  /// In id, this message translates to:
  /// **'Perlu Servis'**
  String get shareCardNeedService;

  /// Share card: days remaining in short form.
  ///
  /// In id, this message translates to:
  /// **'{days} hr lagi'**
  String shareCardDaysShort(String days);

  /// Share card footer: logbook date.
  ///
  /// In id, this message translates to:
  /// **'Logbook: {date}'**
  String shareCardLogbook(String date);

  /// Share text line 1: vehicle name and plate.
  ///
  /// In id, this message translates to:
  /// **'🚗 Paspor Perawatan Kendaraan — {name} ({plate})'**
  String shareTextHeader(String name, String plate);

  /// Share text line 2: health score.
  ///
  /// In id, this message translates to:
  /// **'🏆 Skor Kesehatan: {score}/100 ({status})'**
  String shareTextHealth(String score, String status);

  /// Share text line 3: odometer.
  ///
  /// In id, this message translates to:
  /// **'⚡ Odometer: {odo} km'**
  String shareTextOdometer(String odo);

  /// Share text line 4: oil change countdown.
  ///
  /// In id, this message translates to:
  /// **'🛢️ Interval Ganti Oli: {km} km lagi'**
  String shareTextOil(String km);

  /// Share text line 4 when an oil change is needed now.
  ///
  /// In id, this message translates to:
  /// **'🛢️ Perlu Ganti Oli Segera'**
  String get shareTextOilDue;

  /// Share text line 5: road tax remaining days.
  ///
  /// In id, this message translates to:
  /// **'📋 Pajak PKB: {days} hari lagi'**
  String shareTextTax(String days);

  /// Share text last line: call to action.
  ///
  /// In id, this message translates to:
  /// **'Kelola perawatan garasi lengkap & offline di GarageGo: https://garagego.faishal.id'**
  String get shareTextFooter;

  /// Glovebox header card title with the vehicle name.
  ///
  /// In id, this message translates to:
  /// **'Glovebox Digital — {name}'**
  String gloveboxHeader(String name);

  /// Glovebox header: plate and number of documents.
  ///
  /// In id, this message translates to:
  /// **'{plate} • {count} Dokumen Terdaftar'**
  String gloveboxDocCount(String plate, String count);

  /// Document status: expired N days ago.
  ///
  /// In id, this message translates to:
  /// **'Kedaluwarsa {days} hari lalu'**
  String docExpiredAgo(String days);

  /// Document status: due in N days.
  ///
  /// In id, this message translates to:
  /// **'Jatuh tempo {days} hari lagi'**
  String docDueIn(String days);

  /// Document status: N days remaining.
  ///
  /// In id, this message translates to:
  /// **'{days} hari lagi'**
  String docDaysLeft(String days);

  /// Document card: expiry date line.
  ///
  /// In id, this message translates to:
  /// **'Masa Berlaku: {date}'**
  String docValidUntil(String date);

  /// Sheet title: edit a document.
  ///
  /// In id, this message translates to:
  /// **'Ubah Dokumen'**
  String get docEditTitle;

  /// Sheet title: add a document.
  ///
  /// In id, this message translates to:
  /// **'Tambah Dokumen Garasi'**
  String get docAddTitle;

  /// Document form: title hint.
  ///
  /// In id, this message translates to:
  /// **'Misal: PKB Tahunan / Asuransi All Risk'**
  String get docTitleHint;

  /// Document form: document number hint.
  ///
  /// In id, this message translates to:
  /// **'Misal: B 1234 CD / POL-88902'**
  String get docNumberHint;

  /// Document form: cost hint.
  ///
  /// In id, this message translates to:
  /// **'Misal: 3500000'**
  String get docCostHint;

  /// Document form: notes label.
  ///
  /// In id, this message translates to:
  /// **'Catatan & Petunjuk Perpanjangan'**
  String get docNotesLabel;

  /// Document form: notes hint.
  ///
  /// In id, this message translates to:
  /// **'Misal: Bayar online via Signal app'**
  String get docNotesHint;

  /// Snackbar: document updated.
  ///
  /// In id, this message translates to:
  /// **'Dokumen berhasil diperbarui!'**
  String get docUpdated;

  /// Snackbar: document added.
  ///
  /// In id, this message translates to:
  /// **'Dokumen berhasil ditambahkan!'**
  String get docAdded;

  /// Button: save document changes.
  ///
  /// In id, this message translates to:
  /// **'Perbarui Dokumen'**
  String get docUpdate;

  /// Button: save a new document.
  ///
  /// In id, this message translates to:
  /// **'Simpan Dokumen'**
  String get docSave;

  /// Vehicle form: name hint.
  ///
  /// In id, this message translates to:
  /// **'Misal: Honda HR-V / Yamaha NMAX'**
  String get vehicleNameHint;

  /// Vehicle form: plate number hint.
  ///
  /// In id, this message translates to:
  /// **'B 1234 CD'**
  String get plateHint;

  /// Validation: manufacture year out of range.
  ///
  /// In id, this message translates to:
  /// **'Tahun tidak valid'**
  String get invalidYear;

  /// Vehicle form: annual tax due date label.
  ///
  /// In id, this message translates to:
  /// **'Jatuh Tempo Pajak STNK'**
  String get taxDueLabel;

  /// Service log note written when a schedule is completed.
  ///
  /// In id, this message translates to:
  /// **'Selesai sesuai jadwal berkala ({category})'**
  String scheduleDoneNote(String category);

  /// Backup error: empty payload.
  ///
  /// In id, this message translates to:
  /// **'Data cadangan kosong.'**
  String get backupErrEmpty;

  /// Backup error: raw JSON is not accepted.
  ///
  /// In id, this message translates to:
  /// **'Format JSON mentah tidak didukung demi keamanan. Gunakan berkas cadangan resmi.'**
  String get backupErrRawJson;

  /// Backup error: unrecognised file format.
  ///
  /// In id, this message translates to:
  /// **'Format berkas cadangan tidak valid atau tidak dikenali.'**
  String get backupErrFormat;

  /// Backup error: backup belongs to another app.
  ///
  /// In id, this message translates to:
  /// **'Berkas cadangan milik aplikasi {other}, tidak dapat dipulihkan ke {expected}.'**
  String backupErrWrongApp(String other, String expected);

  /// Backup error: undecodable payload.
  ///
  /// In id, this message translates to:
  /// **'Data cadangan rusak atau format encoding tidak sah.'**
  String get backupErrCorrupt;

  /// Backup error: checksum mismatch.
  ///
  /// In id, this message translates to:
  /// **'Integritas data cadangan tidak valid: data telah dimodifikasi atau rusak.'**
  String get backupErrIntegrity;

  /// Backup error: payload is not a data object.
  ///
  /// In id, this message translates to:
  /// **'Isi data cadangan bukan objek data yang sah.'**
  String get backupErrNotObject;

  /// Maintenance category: engine.
  ///
  /// In id, this message translates to:
  /// **'Mesin'**
  String get mtCatEngine;

  /// Maintenance category: anything else.
  ///
  /// In id, this message translates to:
  /// **'Lainnya'**
  String get mtCatOther;

  /// Short month unit used as an input field suffix.
  ///
  /// In id, this message translates to:
  /// **'bln'**
  String get unitMonthsShort;

  /// Renewal note on a generated tax document.
  ///
  /// In id, this message translates to:
  /// **'Bayar via Samsat Digital Nasional (SIGNAL) atau Samsat terdekat'**
  String get docNoteTax;

  /// Renewal note on a generated 5-year plate document.
  ///
  /// In id, this message translates to:
  /// **'Wajib cek fisik kendaraan langsung di Samsat Induk'**
  String get docNotePlate;

  /// Renewal note on a generated insurance document.
  ///
  /// In id, this message translates to:
  /// **'Nomor klaim darurat atau towing tersedia di polis'**
  String get docNoteInsurance;

  /// Share text: unlocked badge count.
  ///
  /// In id, this message translates to:
  /// **'{unlocked}/{total} Lencana Terbuka'**
  String gamesBadgeCount(String unlocked, String total);
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
