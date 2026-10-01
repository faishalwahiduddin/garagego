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
      'Full backup data including garage vehicles, schedules, documents, and fuel logs can be copied below:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Backup all vehicles, service records, fuel logs, and schedules';

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
  String get eksporBackupJson => 'Export Backup JSON';

  @override
  String get eksporCsvRiwayatBbm => 'Export Fuel Logs CSV';

  @override
  String get eksporCsvRiwayatServis => 'Export Service Logs CSV';

  @override
  String get eksporCadanganJson => 'Export Backup JSON';

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
  String get imporPulihkanBackupJson => 'Import / Restore Backup JSON';

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
      'Restore data from a valid JSON backup file';

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
  String get pulihkanDariBackupJson => 'Restore from Backup JSON';

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
      'JSON backup successfully copied to Clipboard!';

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
  String get teksJsonTidakBolehKosong => 'JSON text cannot be empty!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Paste your previously exported JSON backup data here:';

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
}
