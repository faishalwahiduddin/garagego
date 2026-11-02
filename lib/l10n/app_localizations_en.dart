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
  String get modelYear => 'Manufacture Year';

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
  String get workshop => 'Workshop / Shop';

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
  String get exportBackup => 'Export Backup (.grg)';

  @override
  String get importBackup => 'Restore Backup (.grg)';

  @override
  String get exportCsv => 'Export to CSV';

  @override
  String get resetAllData => 'Reset All Data';

  @override
  String get privacyNotice =>
      'Data is 100% stored locally on your device without cloud servers.';

  @override
  String get aksiCepat => 'Quick Actions';

  @override
  String get aksiCepatGarasi => 'Garage Quick Actions';

  @override
  String get aturUlangData => 'Reset Data';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'Set recurring reminders for oil changes, filters, brakes, and parts.';

  @override
  String get audit10PoinKeselamatanJalanMud =>
      '10-point road safety audit for road trips & daily commutes';

  @override
  String get auditKelayakanJalanKeselamatan =>
      'Safety & roadworthiness audit before road trips or daily commutes.';

  @override
  String get bahasaAplikasi => 'App Language';

  @override
  String get batal => 'Cancel';

  @override
  String get belumAdaCatatanBbm => 'No Fuel Logs Yet';

  @override
  String get belumAdaDokumenTercatat => 'No Documents Recorded Yet';

  @override
  String get belumAdaHasilCeklis => 'No Inspection History Yet';

  @override
  String get belumAdaJadwalServis => 'No Service Schedules Yet';

  @override
  String get belumAdaRiwayatServis => 'No Service History Yet';

  @override
  String get belumAdaCatatanServis => 'No service history recorded yet.';

  @override
  String get belumAdaJadwalPerawatanBerkala =>
      'No maintenance schedules created yet.';

  @override
  String get biayaKm => 'Cost / KM';

  @override
  String get biayaTotalRp => 'Total Cost (Rp)';

  @override
  String get biayaPerKm => 'Cost per KM';

  @override
  String get bukaBrankas => 'Open Glovebox';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      'Share a .grg backup file with all garage vehicles, schedules, documents, and fuel logs.';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Share all vehicles, service, fuel, and schedules as a .grg file';

  @override
  String get cariRiwayatServisAtauBengkel =>
      'Search service history or workshop...';

  @override
  String get catatPengisianBbm => 'Log Fuel Fill-Up';

  @override
  String get catatPengisianPertama => 'Log First Fill-Up';

  @override
  String get catatServisBaru => 'Log New Service';

  @override
  String get catatServisPertama => 'Log First Service';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'Record fuel receipts to track mileage efficiency (km/L) and cost per km.';

  @override
  String get catatanOpsional => 'Notes (Optional)';

  @override
  String get catatanLokasiBerkasFisik => 'Notes / Physical Document Location';

  @override
  String get catatanBbmBerhasilDisimpan => 'Fuel log saved successfully!';

  @override
  String get catatanPemeriksaOpsional => 'Inspector Notes (Optional)';

  @override
  String get catatanSparepartPengerjaan => 'Parts / Service Notes';

  @override
  String get catatanServisBerhasilDitambahk =>
      'Service log added successfully!';

  @override
  String get catatanTambahanKondisiKendaraa =>
      'Additional vehicle condition notes...';

  @override
  String get ceklisKondisiKendaraan => 'Vehicle Condition Checklist';

  @override
  String get checklistInspeksiKendaraan => 'Vehicle Inspection Checklist';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'Oil counter successfully reset to current odometer!';

  @override
  String get daftarKendaraanDiGarasi => 'Vehicles in Garage';

  @override
  String get daftarMasaBerlakuDokumenLisens => 'Document & License Expirations';

  @override
  String get dataCsvBerhasilDisalinKeClipbo => 'CSV data copied to clipboard!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      'Backup data successfully restored to garage!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'CSV formatted data ready to export to Excel / Spreadsheet:';

  @override
  String get dataGarasiBerhasilDiresetKeSta => 'Garage data reset to defaults.';

  @override
  String get diperlukanUntukAkurasiKalkulas =>
      'Required for accurate km/L calculation';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'Dual-Trigger Reminder: Alarm triggers when mileage (km) OR duration (months) is reached.';

  @override
  String get eksporBackupJson => 'Export Backup (.grg)';

  @override
  String get eksporCsvRiwayatBbm => 'Export Fuel Logs CSV';

  @override
  String get eksporCsvRiwayatServis => 'Export Service Logs CSV';

  @override
  String get eksporCadanganJson => 'Export Backup (.grg)';

  @override
  String get eksporFormatTabelSpreadsheetUn =>
      'Export tabular spreadsheet format for garage logs';

  @override
  String get eksporSeluruhPengisianBbmKeFor =>
      'Export all fuel fill-up logs to CSV spreadsheet format';

  @override
  String get estimasiBiayaPremiRp => 'Estimated Cost / Premium (Rp)';

  @override
  String get gantiPelat5Th => '5-Year Plate Renewal';

  @override
  String get garasiMasihKosong => 'Garage is Empty';

  @override
  String get hargaSatuanRpLiter => 'Unit Price (Rp/Liter)';

  @override
  String get hasilCeklisInspeksiBerhasilDis =>
      'Inspection checklist results saved successfully!';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi =>
      'Calculate km/L fuel economy and gasoline costs';

  @override
  String get imporPulihkanBackupJson => 'Import / Restore Backup (.grg)';

  @override
  String get intervalJarakKm => 'Distance Interval (km)';

  @override
  String get intervalOliKm => 'Oil Interval (km)';

  @override
  String get intervalWaktu => 'Time Interval';

  @override
  String get isiTangkiPenuhFullTank => 'Full Tank Fill-Up?';

  @override
  String get jadwalServisMendatang => 'Upcoming Service Schedules';

  @override
  String get jenisBahanBakar => 'Fuel Type';

  @override
  String get jenisDokumen => 'Document Type';

  @override
  String get judulKeteranganDokumen => 'Title / Document Description';

  @override
  String get kategori => 'Category:';

  @override
  String get kembalikanDataDariBerkasCadang =>
      'Restore data from a valid .grg backup file';

  @override
  String get kilometerOdometerKm => 'Odometer Mileage (km)';

  @override
  String get konfirmasiReset => 'Confirm Reset';

  @override
  String get konsumsiBbm => 'Fuel Economy';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'Perform 10-point inspection: tires, brakes, oil, lights, battery.';

  @override
  String get lihatSemua => 'View All';

  @override
  String get lisensiPamakean => 'Usage License';

  @override
  String get lisensiPanganggo => 'Usage License';

  @override
  String get lisensiPenggunaan => 'Usage License';

  @override
  String get menghapusSemuaLogServisBbmDanR =>
      'Deletes all service logs, fuel records, and garage history';

  @override
  String get mobil => 'Car';

  @override
  String get mobilAtauMotorKeluargaBaru => 'Add a new family car or motorcycle';

  @override
  String get modeTema => 'Theme Mode';

  @override
  String get motor => 'Motorcycle';

  @override
  String get mulaiCeklis => 'Start Checklist';

  @override
  String get mulaiInspeksiPertama => 'Start First Inspection';

  @override
  String get namaModelKendaraan => 'Vehicle Name / Model';

  @override
  String get namaBengkelToko => 'Workshop / Shop Name';

  @override
  String get namaBengkelTokoOpsional => 'Workshop / Shop Name (Optional)';

  @override
  String get namaPekerjaanKomponen => 'Service / Component Name';

  @override
  String get namaSpbuLokasi => 'Gas Station / Location';

  @override
  String get nomorDokumenNoPolisNoPolisi =>
      'Document No. / Policy No. / License Plate';

  @override
  String get nomorPelatPolisi => 'License Plate Number';

  @override
  String get odometerPengerjaanKm => 'Service Odometer (km)';

  @override
  String get odometerSaatIniKm => 'Current Odometer (km)';

  @override
  String get odometerTerakhirDikerjakanKm => 'Last Service Odometer (km)';

  @override
  String get opsiJadwal => 'Schedule Options';

  @override
  String get pkbTahunan => 'Annual Tax';

  @override
  String get pajakStnk => 'Tax & Registration';

  @override
  String get pajakPkbTahunan => 'Annual Vehicle Tax';

  @override
  String get pekerjaanServis => 'Work / Service Performed';

  @override
  String get pelat5Th => '5-Year Plate';

  @override
  String get pengaturanGarasi => 'Garage Settings';

  @override
  String get penggantianOliMesinResetCounte =>
      'Engine Oil Change (Reset Counter)';

  @override
  String get pilihBahasaSelectLanguage => 'Select Language';

  @override
  String get pilihAtauBuatKendaraanTerlebih =>
      'Please select or add a vehicle first.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Please select or add a vehicle first.';

  @override
  String get portabilitasCadanganData => 'Data Portability & Backup';

  @override
  String get pulihkanData => 'Restore Data';

  @override
  String get pulihkanDariBackupJson => 'Restore from file (.grg)';

  @override
  String get rataRataEfisiensi => 'Average Fuel Economy';

  @override
  String get rekorIritTerbaik => 'Best Fuel Economy';

  @override
  String get resetCounterOliMesin => 'Reset Engine Oil Counter';

  @override
  String get resetDataGarasi => 'Reset Garage Data';

  @override
  String get resetOli => 'Reset Oil Counter';

  @override
  String get resetSeluruhData => 'Reset All Data?';

  @override
  String get rincianPartYangDiganti =>
      'Details of replaced parts or repairs...';

  @override
  String get riwayatLengkap => 'Full History';

  @override
  String get riwayatPengisianBahanBakar => 'Fuel Fill-Up History';

  @override
  String get salinCsv => 'Copy CSV';

  @override
  String get salinKeClipboard => 'Copy to Clipboard';

  @override
  String get salinanJsonBackupBerhasilDisal =>
      '.grg backup file is ready to share!';

  @override
  String get servisTerakhir => 'Recent Service';

  @override
  String get setPengingatBerkalaGantiPartKm =>
      'Set recurring maintenance reminders by km / months';

  @override
  String get simpan => 'Save';

  @override
  String get simpanAuditInspeksi => 'Save Inspection Audit';

  @override
  String get simpanKeGarasi => 'Save to Garage';

  @override
  String get simpanRiwayatBengkelDanGantiOl =>
      'Save workshop history and oil changes';

  @override
  String get simpanTanggalJatuhTempoStnkAsu =>
      'Store expiration dates for vehicle taxes, registration, and insurance.';

  @override
  String get statusOliMesin => 'Engine Oil Status';

  @override
  String get tahunPembuatan => 'Manufacture Year';

  @override
  String get tambahDokumen => 'Add Document';

  @override
  String get tambahDokumenPertama => 'Add First Document';

  @override
  String get tambahJadwalBaru => 'Add New Schedule';

  @override
  String get tambahJadwalPerawatan => 'Add Maintenance Schedule';

  @override
  String get tambahKendaraan => 'Add Vehicle';

  @override
  String get tambahKendaraanBaru => 'Add New Vehicle';

  @override
  String get tampilanBahasa => 'Appearance & Language';

  @override
  String get tandaiSelesai => 'Mark Done';

  @override
  String get tandaiSelesaiReset => 'Mark Done / Reset';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      'Marking done will reset the interval counter and record to Service History.';

  @override
  String get tanggalMasaBerlakuJatuhTempo => 'Expiration / Due Date';

  @override
  String get tanggalTerakhirDikerjakan => 'Date Last Performed';

  @override
  String get teksJsonTidakBolehKosong => 'Backup file must not be empty!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Choose a previously exported .grg backup file.';

  @override
  String get tentangAplikasiLisensi => 'About App & License';

  @override
  String get termasukGantiOli => 'Includes Oil Change?';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'This action will clear all records and restore initial sample garage data.';

  @override
  String get totalBiayaRp => 'Total Cost (Rp)';

  @override
  String get totalBiayaTco => 'Total Cost of Ownership (TCO)';

  @override
  String get totalBiayaBengkel => 'Total Workshop Costs';

  @override
  String get totalBiayaKepemilikanTco => 'Total Cost of Ownership (TCO)';

  @override
  String get totalPengeluaranBbm => 'Total Fuel Spending';

  @override
  String get tutup => 'Close';

  @override
  String get ubah => 'Edit';

  @override
  String get volumeLiterKwh => 'Volume (Liters / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 => 'e.g. Annual Vehicle Tax 2026';

  @override
  String get hintPlatB1234 => 'B 1234 ABC';

  @override
  String get misalStnkDiDompet =>
      'e.g. Registration in wallet, title in drawer';

  @override
  String get misalKurasMinyakRem => 'e.g. Flush DOT 4 Brake Fluid';

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
    return 'Factory preset for $label successfully loaded!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'Load Factory Presets ($label)';
  }

  @override
  String odometerValue(String odo) {
    return 'Odometer: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return 'Vehicle $name successfully added to garage!';
  }

  @override
  String get timezone => 'Time Zone';

  @override
  String get timezoneAuto => 'Automatic (follow device)';

  @override
  String get licenseUsageTitle => 'Usage License';

  @override
  String get licenseUsageNotice =>
      'Free to use for personal and non-profit use.';

  @override
  String get licenseUsageBadgeText => 'Personal & Non-Profit';

  @override
  String get validationVehicleNameRequired => 'Vehicle name is required';

  @override
  String get validationVehicleNameMinLength =>
      'Vehicle name must be at least 2 characters';

  @override
  String get validationVehicleNameMaxLength =>
      'Vehicle name cannot exceed 50 characters';

  @override
  String get validationPlateRequired => 'License plate number is required';

  @override
  String get validationPlateMaxLength =>
      'License plate cannot exceed 15 characters';

  @override
  String get validationOdometerNegative =>
      'Odometer reading cannot be negative';

  @override
  String get validationOdometerTooHigh =>
      'Odometer reading exceeds reasonable limit';

  @override
  String get validationOdometerLessThanPrevious =>
      'New odometer cannot be less than previous reading';

  @override
  String get validationCostNegative => 'Cost cannot be negative';

  @override
  String get validationFuelLitersPositive =>
      'Fuel volume must be greater than 0 liters';

  @override
  String get validationFuelLitersTooHigh =>
      'Fuel volume exceeds tank capacity limit';

  @override
  String get validationServiceNameRequired => 'Service name is required';

  @override
  String get validationDocNameRequired => 'Document name is required';

  @override
  String get appTitle => 'GarageGo';

  @override
  String get appTagline =>
      'Track service, oil, fuel and vehicle tax in one garage';

  @override
  String get loadingLabel => 'Loading…';

  @override
  String get onbSkip => 'Skip';

  @override
  String get onbNext => 'Next';

  @override
  String get onbGetStarted => 'Get Started';

  @override
  String get onbPrivacyHeadline => 'Private & Offline';

  @override
  String get onbPrivacyDetail =>
      'All vehicle data stays on this device. No trackers.';

  @override
  String get onbSlide1Title => 'Your garage';

  @override
  String get onbSlide1Sub => 'Cars and motorcycles in one place';

  @override
  String get onbSlide1Badge => '100% Offline & Private';

  @override
  String get onbSlide2Title => 'Maintenance';

  @override
  String get onbSlide2Sub => 'Service, oil and road tax';

  @override
  String get onbSlide2Badge => 'Scheduled Reminders';

  @override
  String get onbSlide3Title => 'Fuel';

  @override
  String get onbSlide3Sub => 'km/L economy and cost per km';

  @override
  String get onbSlide3Badge => 'No Ads, No Account';

  @override
  String get onbSlide4Title => 'Offline & private';

  @override
  String get onbSlide4Sub => 'Data stays on your device';

  @override
  String get onbSlide4Badge => 'Data Stays on Your Device';

  @override
  String get urgencySafe => 'Safe';

  @override
  String get urgencyDueSoon => 'Due Soon';

  @override
  String get urgencyOverdue => 'Overdue';

  @override
  String get docTypeTax => 'Annual Vehicle Tax';

  @override
  String get docTypePlate => '5-Year Plate & Registration';

  @override
  String get docTypeInsurance => 'Vehicle Insurance';

  @override
  String get docTypeEmissions => 'Emissions Test / Inspection';

  @override
  String get docTypeLicense => 'Driver\'s Licence';

  @override
  String get docTypeTitle => 'Vehicle Title (BPKB)';

  @override
  String get docTypeOther => 'Other Document';

  @override
  String get mtCatOilFluids => 'Oil & Fluids';

  @override
  String get mtCatOilFilter => 'Oil & Filter';

  @override
  String get mtCatAirFilter => 'Air & Cabin Filters';

  @override
  String get mtCatBrakes => 'Brakes';

  @override
  String get mtCatTires => 'Tyres & Suspension';

  @override
  String get mtCatIgnition => 'Ignition';

  @override
  String get mtCatTransmission => 'Transmission & Drivetrain';

  @override
  String get mtCatCvt => 'CVT Transmission';

  @override
  String get mtCatElectrical => 'Electrical & Battery';

  @override
  String get mtCatCoolant => 'Coolant & Radiator';

  @override
  String get mtCatGeneral => 'Periodic Service';

  @override
  String get mtPresetCarOil => 'Synthetic Engine Oil Change';

  @override
  String get mtPresetCarOilFilter => 'Engine Oil Filter Replacement';

  @override
  String get mtPresetCarAirFilter => 'Air Filter & Cabin AC Filter';

  @override
  String get mtPresetCarBrakeFluid => 'Brake Fluid Flush & Brake Pads';

  @override
  String get mtPresetCarTireRotation => 'Tyre Rotation & Wheel Alignment';

  @override
  String get mtPresetCarSparkPlugs => 'Iridium Spark Plugs';

  @override
  String get mtPresetMotoOil => 'Motorcycle Engine Oil Change';

  @override
  String get mtPresetMotoGearOil => 'Final Drive Gear Oil';

  @override
  String get mtPresetMotoCvt => 'CVT Service, V-Belt & Rollers';

  @override
  String get mtPresetMotoBrakes => 'Front & Rear Brake Pads Inspection';

  @override
  String get mtPresetMotoSparkPlug => 'Motorcycle Spark Plug';

  @override
  String inspPreTripTitle(String type) {
    return 'Pre-Trip Inspection ($type)';
  }

  @override
  String inspRoadworthiness(String passed, String total) {
    return 'Roadworthiness: $passed of $total Points Passed';
  }

  @override
  String inspPassedCount(String pct, String passed, String total) {
    return '$pct% Passed ($passed/$total)';
  }

  @override
  String get inspCatEngine => 'Engine & Fluids';

  @override
  String get inspCatWheelsBrakes => 'Wheels & Brakes';

  @override
  String get inspCatLights => 'Lights & Electrical';

  @override
  String get inspCatSafety => 'Safety';

  @override
  String get inspCatDrivetrain => 'Drivetrain';

  @override
  String get inspCatWheelsSteering => 'Wheels & Steering';

  @override
  String get inspCatBrakes => 'Brakes';

  @override
  String get inspCatElectrical => 'Electrical';

  @override
  String get inspCatEquipment => 'Equipment';

  @override
  String get inspCar1 => 'Dipstick Level & Engine Oil Clarity';

  @override
  String get inspCar2 => 'Radiator Coolant Reservoir Level';

  @override
  String get inspCar3 => 'Brake & Clutch / Power Steering Fluid Level';

  @override
  String get inspCar4 => 'Tyre Pressure & Tread Depth (4 Tyres + Spare)';

  @override
  String get inspCar5 => 'Brake Pads Condition & Handbrake Grip';

  @override
  String get inspCar6 => 'Headlights, Brake Lights, Turn Signals & Hazard';

  @override
  String get inspCar7 => 'Battery Terminals & 12V Voltage Indicator';

  @override
  String get inspCar8 => 'Windshield Wipers & Washer Fluid Level';

  @override
  String get inspCar9 => 'Jack, Lug Wrench, Warning Triangle & First Aid Kit';

  @override
  String get inspMoto1 => 'Engine Oil Level & Condition';

  @override
  String get inspMoto2 => 'Final Drive Oil / Drive Chain Slack';

  @override
  String get inspMoto3 => 'Front & Rear Tyre Pressures';

  @override
  String get inspMoto4 => 'Front & Rear Brake Pads Thickness';

  @override
  String get inspMoto5 => 'Headlight, Taillight & Turn Signals';

  @override
  String get inspMoto6 => 'Horn & Electric Starter Operation';

  @override
  String get inspMoto7 => 'Rearview Mirrors & Toolkit';

  @override
  String gamesLvl(String level) {
    return 'LVL $level';
  }

  @override
  String gamesProgress(String xp, String unlocked, String total) {
    return '$xp XP • $unlocked/$total Badges Unlocked';
  }

  @override
  String gamesNextLevel(String next, String xp) {
    return 'Next: $next ($xp XP)';
  }

  @override
  String get gamesMaxRank => 'Max Rank Reached';

  @override
  String get gamesBadgesTitle => 'Garage Maintenance Badges';

  @override
  String get gamesShare => 'Share';

  @override
  String get gamesUnlocked => 'Unlocked (+100 XP)';

  @override
  String get gamesLocked => 'Not Unlocked Yet';

  @override
  String gamesBadgeUnlockedLine(String highlight) {
    return 'Badge unlocked: $highlight';
  }

  @override
  String get gamesLvl1 => 'Novice Driver';

  @override
  String get gamesLvl2 => 'Diligent Owner';

  @override
  String get gamesLvl3 => 'Fleet Guardian';

  @override
  String get gamesLvl4 => 'Maintenance Specialist';

  @override
  String get gamesLvl5 => 'Master Custodian';

  @override
  String get badgeFirstRideTitle => 'First Vehicle';

  @override
  String get badgeFirstRideDesc =>
      'Registered your first vehicle in the digital garage.';

  @override
  String get badgeOilCareTitle => 'Oil Sentinel';

  @override
  String get badgeOilCareDesc => 'Logged an on-time engine oil change.';

  @override
  String get badgeServiceVeteranTitle => 'Service Regular';

  @override
  String get badgeServiceVeteranDesc =>
      'Recorded at least 3 maintenance service logs.';

  @override
  String get badgeFuelWatcherTitle => 'Fuel Tracker';

  @override
  String get badgeFuelWatcherDesc =>
      'Logged at least 3 fuel fill-ups to monitor efficiency.';

  @override
  String get badgeSafeVoyageTitle => 'Safety Inspector';

  @override
  String get badgeSafeVoyageDesc =>
      'Completed a vehicle safety inspection checklist.';

  @override
  String get badgeDocKeeperTitle => 'Document Guard';

  @override
  String get badgeDocKeeperDesc =>
      'Saved vehicle legal documents (tax, licence, insurance).';

  @override
  String get badgePrimeFleetTitle => 'Prime Health';

  @override
  String get badgePrimeFleetDesc =>
      'Achieved vehicle health score of 90 or above.';

  @override
  String get badgeRoadWarriorTitle => 'Road Warrior';

  @override
  String get badgeRoadWarriorDesc =>
      'Tracking a vehicle with odometer exceeding 10,000 km.';

  @override
  String healthOilOverdue(String km) {
    return 'Engine oil change is overdue by $km km';
  }

  @override
  String healthOilDue(String km) {
    return 'Engine oil change due in $km km';
  }

  @override
  String get healthOilOptimal => 'Engine oil interval is optimal';

  @override
  String get healthTaxOverdue => 'Annual vehicle tax is overdue';

  @override
  String healthTaxDue(String days) {
    return 'Annual vehicle tax due in $days days';
  }

  @override
  String get healthTaxSafe => 'Annual vehicle tax is active and safe';

  @override
  String get healthPlateExpired => '5-year licence plate has expired';

  @override
  String healthPlateDue(String days) {
    return '5-year licence plate renewal due in $days days';
  }

  @override
  String healthScheduleOverdue(String title) {
    return '$title is overdue';
  }

  @override
  String healthScheduleDueSoon(String title) {
    return '$title is due soon';
  }

  @override
  String get healthPrime => 'Prime';

  @override
  String get healthAttention => 'Needs Attention';

  @override
  String get healthCritical => 'Critical / Service Soon';

  @override
  String get fuelEstTotalCost => 'Estimated total cost:';

  @override
  String get fuelTripDistance => 'Trip distance:';

  @override
  String get fuelAvgConsumption => 'Average consumption:';

  @override
  String get fuelOperatingCost => 'Running cost:';

  @override
  String get fuelFullTank => 'Full Tank';

  @override
  String get fuelPartial => 'Partial';

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
  String get aboutApplication => 'Application';

  @override
  String get aboutVersion => 'Version';

  @override
  String get aboutArchitecture => 'Architecture';

  @override
  String get aboutArchitectureValue =>
      '100% Offline-First (no server, no tracking)';

  @override
  String get aboutDomain => 'Domain';

  @override
  String get aboutPackageId => 'Package ID';

  @override
  String settingsVehicleOdo(String plate, String value) {
    return '$plate • Odo: $value km';
  }

  @override
  String get backupInvalidFile => 'The .grg file is invalid or corrupted';

  @override
  String get filterAll => 'All';

  @override
  String get filterAttention => 'Attention';

  @override
  String get maintenanceScreenTitle => 'Maintenance & Services';

  @override
  String get serviceTitleHint => 'e.g. Engine Oil & Filter Change';

  @override
  String get workshopHint => 'e.g. Authorized Dealership / Workshop';

  @override
  String get mustBePositive => 'Must be greater than 0';

  @override
  String get editScheduleTitle => 'Edit Maintenance Schedule';

  @override
  String get scheduleUpdated => 'Schedule updated successfully!';

  @override
  String get scheduleSaved => 'Maintenance schedule saved successfully!';

  @override
  String get updateSchedule => 'Update Schedule';

  @override
  String get saveSchedule => 'Save Maintenance Schedule';

  @override
  String scheduleCompleted(String title) {
    return '$title completed successfully!';
  }

  @override
  String kmOverdue(String km) {
    return 'Overdue by $km km';
  }

  @override
  String kmRemaining(String km) {
    return '$km km remaining';
  }

  @override
  String kmOverdueShort(String km) {
    return 'Overdue $km km';
  }

  @override
  String kmRemainingShort(String km) {
    return '$km km left';
  }

  @override
  String daysOverdue(String days) {
    return 'Overdue by $days days';
  }

  @override
  String daysLeft(String days) {
    return '$days days left';
  }

  @override
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  ) {
    return 'Every $km km or $months months • Last: $odo km ($date)';
  }

  @override
  String get shareVehiclePassport => 'Share Vehicle Passport';

  @override
  String get shareVehiclePassportSubtitle =>
      'Share the status card, health score and history to social media';

  @override
  String get garageEmptyBody =>
      'Add your family\'s first car or motorcycle to start tracking services, oil changes and fuel.';

  @override
  String resetOilConfirm(String name, String odo) {
    return 'The oil change counter for $name will be reset to the current odometer ($odo km).';
  }

  @override
  String get resetOilServiceNote => 'Engine oil interval counter reset';

  @override
  String oilIntervalEvery(String km) {
    return 'Interval: every $km km';
  }

  @override
  String garageYear(String year) {
    return 'Year $year';
  }

  @override
  String get shareDialogTitle => 'Share Vehicle Passport';

  @override
  String get shareCopySummary => 'Copy Summary';

  @override
  String get sharePreparing => 'Preparing…';

  @override
  String get shareDownloadPassport => 'Download Passport';

  @override
  String get shareSharePassport => 'Share Passport';

  @override
  String get shareImageFailed =>
      'Could not generate the vehicle passport image';

  @override
  String get shareImageDownloaded => 'Vehicle passport downloaded';

  @override
  String get shareSummaryCopied => 'Vehicle status summary copied';

  @override
  String get shareCardHealthHeader => 'FLEET HEALTH STATUS';

  @override
  String shareCardCondition(String status) {
    return 'Condition: $status';
  }

  @override
  String get shareCardOdometer => 'ODOMETER';

  @override
  String get shareCardOil => 'OIL CHANGE';

  @override
  String get shareCardTax => 'ROAD TAX';

  @override
  String get shareCardNeedService => 'Service Now';

  @override
  String shareCardDaysShort(String days) {
    return '$days days';
  }

  @override
  String shareCardLogbook(String date) {
    return 'Logbook: $date';
  }

  @override
  String shareTextHeader(String name, String plate) {
    return '🚗 Vehicle Care Passport — $name ($plate)';
  }

  @override
  String shareTextHealth(String score, String status) {
    return '🏆 Health score: $score/100 ($status)';
  }

  @override
  String shareTextOdometer(String odo) {
    return '⚡ Odometer: $odo km';
  }

  @override
  String shareTextOil(String km) {
    return '🛢️ Oil change due in $km km';
  }

  @override
  String get shareTextOilDue => '🛢️ Oil change needed now';

  @override
  String shareTextTax(String days) {
    return '📋 Road tax: $days days left';
  }

  @override
  String get shareTextFooter =>
      'Manage your whole garage offline in GarageGo: https://garagego.faishal.id';

  @override
  String gloveboxHeader(String name) {
    return 'Digital Glovebox — $name';
  }

  @override
  String gloveboxDocCount(String plate, String count) {
    return '$plate • $count Registered Documents';
  }

  @override
  String docExpiredAgo(String days) {
    return 'Expired $days days ago';
  }

  @override
  String docDueIn(String days) {
    return 'Due in $days days';
  }

  @override
  String docDaysLeft(String days) {
    return '$days days remaining';
  }

  @override
  String docValidUntil(String date) {
    return 'Valid until: $date';
  }

  @override
  String get docEditTitle => 'Edit Document';

  @override
  String get docAddTitle => 'Add Garage Document';

  @override
  String get docTitleHint => 'e.g. Annual tax / All-risk insurance';

  @override
  String get docNumberHint => 'e.g. B 1234 CD / POL-88902';

  @override
  String get docCostHint => 'e.g. 3500000';

  @override
  String get docNotesLabel => 'Notes & Renewal Instructions';

  @override
  String get docNotesHint => 'e.g. Pay online or visit the office';

  @override
  String get docUpdated => 'Document updated successfully!';

  @override
  String get docAdded => 'Document added successfully!';

  @override
  String get docUpdate => 'Update Document';

  @override
  String get docSave => 'Save Document';

  @override
  String get vehicleNameHint => 'e.g. Honda HR-V / Yamaha NMAX';

  @override
  String get plateHint => 'B 1234 CD';

  @override
  String get invalidYear => 'Invalid year';

  @override
  String get taxDueLabel => 'Annual Tax Due Date';

  @override
  String scheduleDoneNote(String category) {
    return 'Completed on the periodic schedule ($category)';
  }

  @override
  String get backupErrEmpty => 'The backup data is empty.';

  @override
  String get backupErrRawJson =>
      'Raw JSON is not accepted for security reasons. Use an official backup file.';

  @override
  String get backupErrFormat =>
      'The backup file format is invalid or unrecognised.';

  @override
  String backupErrWrongApp(String other, String expected) {
    return 'This backup belongs to $other and cannot be restored into $expected.';
  }

  @override
  String get backupErrCorrupt =>
      'The backup data is corrupted or badly encoded.';

  @override
  String get backupErrIntegrity =>
      'The backup integrity check failed: the data was modified or corrupted.';

  @override
  String get backupErrNotObject =>
      'The backup content is not a valid data object.';

  @override
  String get mtCatEngine => 'Engine';

  @override
  String get mtCatOther => 'Other';

  @override
  String get unitMonthsShort => 'mo';

  @override
  String get docNoteTax =>
      'Pay via the national Samsat Digital (SIGNAL) app or your nearest Samsat office';

  @override
  String get docNotePlate =>
      'The vehicle must pass a physical check at the main Samsat office';

  @override
  String get docNoteInsurance =>
      'The emergency claim and towing numbers are listed on the policy';

  @override
  String gamesBadgeCount(String unlocked, String total) {
    return '$unlocked/$total badges unlocked';
  }
}
