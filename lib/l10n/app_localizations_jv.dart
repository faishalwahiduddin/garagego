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
  String get appDescription => 'Manajer Garasi, Servis & BBM Tunggangan';

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
  String get isOilChange => 'Klebu Gantos Oli';

  @override
  String get serviceSchedule => 'Jadwal Servis';

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
  String get fuelTitle => 'Log Pangisian BBM';

  @override
  String get addFuelLog => 'Cathet BBM';

  @override
  String get liters => 'Liter';

  @override
  String get totalCost => 'Gunggung Ragad';

  @override
  String get pricePerLiter => 'Regi Saben Liter';

  @override
  String get fullTank => 'Isi Kebak';

  @override
  String get gasStation => 'SPBU';

  @override
  String get fuelEfficiency => 'Efisiensi BBM';

  @override
  String get costPerKm => 'Ragad saben KM';

  @override
  String get noFuelLogs => 'Dereng wonten cathetan BBM';

  @override
  String get gloveboxTitle => 'Kothak Layang & Dhokumen';

  @override
  String get addDocument => 'Tambah Dhokumen';

  @override
  String get stnkTaxExpiry => 'Jatuh Tempo Pajeg STNK';

  @override
  String get stnk5YearExpiry => 'Jatuh Tempo STNK 5 Taunan';

  @override
  String get simExpiry => 'Kadaluwarsa SIM';

  @override
  String get insuranceExpiry => 'Asuransi Titihan';

  @override
  String daysRemaining(Object count) {
    return '$count dina malih';
  }

  @override
  String get expired => 'Sampun Kasep';

  @override
  String get noDocuments => 'Dereng wonten dhokumen';

  @override
  String get dataManagement => 'Pangreksan Data & Serep';

  @override
  String get exportBackup => 'Ekspor Cadhangan (.grg)';

  @override
  String get importBackup => 'Pulihaken Cadhangan (.grg)';

  @override
  String get exportCsv => 'Ekspor dhateng CSV';

  @override
  String get resetAllData => 'Reset Sedaya Dhata';

  @override
  String get privacyNotice => 'Dhata 100% kasimpen sacara lokal ing piranti.';

  @override
  String get aksiCepat => 'Tumindak Cepet';

  @override
  String get aksiCepatGarasi => 'Tumindak Cepet Garasi';

  @override
  String get aturUlangData => 'Tata Ulang Dhata';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'Pasang pangeling-eling gantos oli, filter, rem, lan sparepart.';

  @override
  String get audit10PoinKeselamatanJalanMud =>
      'Audit 10-poin kaslametan dalan & mudik';

  @override
  String get auditKelayakanJalanKeselamatan =>
      'Audit kalayakan dalan & kaslametan sadhereke lelampahan mudik utawi padintenan.';

  @override
  String get bahasaAplikasi => 'Basa Aplikasi';

  @override
  String get batal => 'Batal';

  @override
  String get belumAdaCatatanBbm => 'Dereng Wonten Cathetan BBM';

  @override
  String get belumAdaDokumenTercatat => 'Dereng Wonten Dhokumen Kadhaptar';

  @override
  String get belumAdaHasilCeklis => 'Dereng Wonten Asil Ceklis';

  @override
  String get belumAdaJadwalServis => 'Dereng Wonten Jadwal Servis';

  @override
  String get belumAdaRiwayatServis => 'Dereng Wonten Riwayat Servis';

  @override
  String get belumAdaCatatanServis => 'Dereng wonten cathetan servis.';

  @override
  String get belumAdaJadwalPerawatanBerkala =>
      'Dereng wonten jadwal pangrumat ajeg.';

  @override
  String get biayaKm => 'Ragad / KM';

  @override
  String get biayaTotalRp => 'Ragad Gunggung (Rp)';

  @override
  String get biayaPerKm => 'Ragad saben KM';

  @override
  String get bukaBrankas => 'Bikak Kothak Dhokumen';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      'Bagikna berkas .grg isine kabeh data garasi, jadwal, dokumen, lan log BBM.';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Paro kabeh kendaraan, servis, BBM, lan jadwal minangka berkas .grg';

  @override
  String get cariRiwayatServisAtauBengkel =>
      'Padosi riwayat servis utawi bengkel...';

  @override
  String get catatPengisianBbm => 'Cathet Pangisian BBM';

  @override
  String get catatPengisianPertama => 'Cathet Pangisian Kaping Pisan';

  @override
  String get catatServisBaru => 'Cathet Servis Anyar';

  @override
  String get catatServisPertama => 'Cathet Servis Kaping Pisan';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'Cathet struk pangisian bensin kangge mirsani konsumsi km/L lan ragad/km.';

  @override
  String get catatanOpsional => 'Cathetan (Pilihan)';

  @override
  String get catatanLokasiBerkasFisik => 'Cathetan / Papan Berkas Fisik';

  @override
  String get catatanBbmBerhasilDisimpan => 'Cathetan BBM kasil kasimpen!';

  @override
  String get catatanPemeriksaOpsional => 'Cathetan Pamriksa (Pilihan)';

  @override
  String get catatanSparepartPengerjaan => 'Cathetan Sparepart / Panggirapan';

  @override
  String get catatanServisBerhasilDitambahk =>
      'Cathetan servis kasil katambahaken!';

  @override
  String get catatanTambahanKondisiKendaraa =>
      'Cathetan wuwuhan kahanan titihan...';

  @override
  String get ceklisKondisiKendaraan => 'Ceklis Kahanan Titihan';

  @override
  String get checklistInspeksiKendaraan => 'Ceklis Pamriksan Titihan';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'Petungan oli kasil direset dhateng odometer wekdal punika!';

  @override
  String get daftarKendaraanDiGarasi => 'Dhaptar Titihan ing Garasi';

  @override
  String get daftarMasaBerlakuDokumenLisens =>
      'Dhaptar Mangsa Dhokumen & Layang Idin';

  @override
  String get dataCsvBerhasilDisalinKeClipbo =>
      'Dhata CSV kasil kasalin dhateng Clipboard!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      'Dhata cadhangan kasil kapulihaken dhateng Garasi!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'Dhata format CSV cumepak diekspor dhateng Excel / Spreadsheet:';

  @override
  String get dataGarasiBerhasilDiresetKeSta =>
      'Dhata Garasi kasil direset dhateng standar.';

  @override
  String get diperlukanUntukAkurasiKalkulas =>
      'Dibutuhaken kangge ketelitian petungan km/L';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'Pangeling-eling Dual-Trigger: Weker badhe muni menawi jarak (km) UTAWI wekdal (wulan) sampun kecandhak.';

  @override
  String get eksporBackupJson => 'Ekspor Cadhangan (.grg)';

  @override
  String get eksporCsvRiwayatBbm => 'Ekspor CSV Riwayat BBM';

  @override
  String get eksporCsvRiwayatServis => 'Ekspor CSV Riwayat Servis';

  @override
  String get eksporCadanganJson => 'Ekspor Cadhangan (.grg)';

  @override
  String get eksporFormatTabelSpreadsheetUn =>
      'Ekspor format tabel spreadsheet kangge cathetan bengkel';

  @override
  String get eksporSeluruhPengisianBbmKeFor =>
      'Ekspor sedaya pangisian BBM dhateng format CSV spreadsheet';

  @override
  String get estimasiBiayaPremiRp => 'Prakiran Ragad / Premi (Rp)';

  @override
  String get gantiPelat5Th => 'Gantos Plat 5 Taun';

  @override
  String get garasiMasihKosong => 'Garasi Taksih Suwung';

  @override
  String get hargaSatuanRpLiter => 'Regi Saben Liter (Rp/Liter)';

  @override
  String get hasilCeklisInspeksiBerhasilDis =>
      'Asil ceklis pamriksan kasil kasimpen!';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi =>
      'Etang konsumsi km/L lan ragad bensin';

  @override
  String get imporPulihkanBackupJson => 'Impor / Pulihaken Cadhangan (.grg)';

  @override
  String get intervalJarakKm => 'Rentang Jarak (km)';

  @override
  String get intervalOliKm => 'Rentang Oli (km)';

  @override
  String get intervalWaktu => 'Rentang Wekdal';

  @override
  String get isiTangkiPenuhFullTank => 'Isi Tangki Kebak (Full Tank)?';

  @override
  String get jadwalServisMendatang => 'Jadwal Servis Bakal Rawuh';

  @override
  String get jenisBahanBakar => 'Jinis Bahan Bakar';

  @override
  String get jenisDokumen => 'Jinis Dhokumen';

  @override
  String get judulKeteranganDokumen => 'Irah-irahan / Katrangan Dhokumen';

  @override
  String get kategori => 'Kategori';

  @override
  String get kembalikanDataDariBerkasCadang =>
      'Balekaken dhata saking berkas cadhangan .grg ingkang trep';

  @override
  String get kilometerOdometerKm => 'Kilometer Odometer (km)';

  @override
  String get konfirmasiReset => 'Konfirmasi Reset';

  @override
  String get konsumsiBbm => 'Konsumsi BBM';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'Tindakaken pamriksan 10 poin ban, rem, oli, lampu, lan aki.';

  @override
  String get lihatSemua => 'Tingali Sedaya';

  @override
  String get lisensiPamakean => 'Lisensi Pangangge';

  @override
  String get lisensiPanganggo => 'Lisensi Panganggo';

  @override
  String get lisensiPenggunaan => 'Lisensi Panganggo';

  @override
  String get menghapusSemuaLogServisBbmDanR =>
      'Menghapus semua log servis, BBM, dan riwayat Garasi';

  @override
  String get mobil => 'Mobil';

  @override
  String get mobilAtauMotorKeluargaBaru => 'Mobil utawi motor kulawarga anyar';

  @override
  String get modeTema => 'Mode Tema';

  @override
  String get motor => 'Motor';

  @override
  String get mulaiCeklis => 'Wiwiti Ceklis';

  @override
  String get mulaiInspeksiPertama => 'Wiwiti Pamriksan Kaping Pisan';

  @override
  String get namaModelKendaraan => 'Nama / Model Tunggangan';

  @override
  String get namaBengkelToko => 'Jeneng Bengkel / Toko';

  @override
  String get namaBengkelTokoOpsional => 'Jeneng Bengkel / Toko (Pilihan)';

  @override
  String get namaPekerjaanKomponen => 'Jeneng Panggirapan / Komponen';

  @override
  String get namaSpbuLokasi => 'Jeneng SPBU / Papan';

  @override
  String get nomorDokumenNoPolisNoPolisi =>
      'Nomer Dhokumen / No. Polis / Nomer Plat';

  @override
  String get nomorPelatPolisi => 'Nomer Plat Titihan';

  @override
  String get odometerPengerjaanKm => 'Odometer Panggirapan (km)';

  @override
  String get odometerSaatIniKm => 'Odometer Wekdal Punika (km)';

  @override
  String get odometerTerakhirDikerjakanKm => 'Odometer Pungkasan Digarap (km)';

  @override
  String get opsiJadwal => 'Pilihan Jadwal';

  @override
  String get pkbTahunan => 'PKB Tahunan';

  @override
  String get pajakStnk => 'Pajek STNK';

  @override
  String get pajakPkbTahunan => 'Pajek PKB Tahunan';

  @override
  String get pekerjaanServis => 'Panggirapan / Servis';

  @override
  String get pelat5Th => 'Plat 5 Taun';

  @override
  String get pengaturanGarasi => 'Setelan Garasi';

  @override
  String get penggantianOliMesinResetCounte =>
      'Gantos Oli Mesin (Reset Petungan)';

  @override
  String get pilihBahasaSelectLanguage => 'Pilih Basa';

  @override
  String get pilihAtauBuatKendaraanTerlebih =>
      'Pilih atau buat Tunggangan terlebih dahulu.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Pilih atau Tambah Tunggangan terlebih dahulu.';

  @override
  String get portabilitasCadanganData => 'Portabilitas & Cadhangan Dhata';

  @override
  String get pulihkanData => 'Pulihaken Dhata';

  @override
  String get pulihkanDariBackupJson => 'Pulihaken saking berkas (.grg)';

  @override
  String get rataRataEfisiensi => 'Rata-Rata Efisiensi';

  @override
  String get rekorIritTerbaik => 'Cathetan Paling Irit';

  @override
  String get resetCounterOliMesin => 'Reset Petungan Oli Mesin';

  @override
  String get resetDataGarasi => 'Reset Dhata Garasi';

  @override
  String get resetOli => 'Reset Oli';

  @override
  String get resetSeluruhData => 'Reset Sedaya Dhata?';

  @override
  String get rincianPartYangDiganti =>
      'Rincian sparepart ingkang dipungantos...';

  @override
  String get riwayatLengkap => 'Riwayat Pepak';

  @override
  String get riwayatPengisianBahanBakar => 'Riwayat Pangisian BBM';

  @override
  String get salinCsv => 'Salin CSV';

  @override
  String get salinKeClipboard => 'Salin dhateng Clipboard';

  @override
  String get salinanJsonBackupBerhasilDisal =>
      'Berkas cadhangan .grg siap diparo!';

  @override
  String get servisTerakhir => 'Servis Pungkasan';

  @override
  String get setPengingatBerkalaGantiPartKm =>
      'Pasang pangeling-eling gantos sparepart km/wulan';

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
  String get statusOliMesin => 'Kahanan Oli Mesin';

  @override
  String get tahunPembuatan => 'Taun Pambuate';

  @override
  String get tambahDokumen => 'Tambah Dhokumen';

  @override
  String get tambahDokumenPertama => 'Tambah Dhokumen Kaping Pisan';

  @override
  String get tambahJadwalBaru => 'Tambah Jadwal Anyar';

  @override
  String get tambahJadwalPerawatan => 'Tambah Jadwal Pangrumat';

  @override
  String get tambahKendaraan => 'Tambah Titihan';

  @override
  String get tambahKendaraanBaru => 'Tambah Titihan Anyar';

  @override
  String get tampilanBahasa => 'Sesawangan & Basa';

  @override
  String get tandaiSelesai => 'Tandhani Rampung';

  @override
  String get tandaiSelesaiReset => 'Tandhani Rampung / Reset';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      'Nandhani rampung badhe ngreset petungan rentang lan otomatis kacathet dhateng Riwayat Servis.';

  @override
  String get tanggalMasaBerlakuJatuhTempo =>
      'Tanggal Mangsa Lumaku / Tiba Mangsa';

  @override
  String get tanggalTerakhirDikerjakan => 'Tanggal Pungkasan Digarap';

  @override
  String get teksJsonTidakBolehKosong =>
      'Berkas cadhangan mboten pareng suwung!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Pilih berkas cadhangan .grg ingkang nate diekspor.';

  @override
  String get tentangAplikasiLisensi => 'Babagan Aplikasi & Lisensi';

  @override
  String get termasukGantiOli => 'Klebu Gantos Oli?';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'Tindakan ini akan mengosongkan semua data dan mengembalikan contoh awal Garasi.';

  @override
  String get totalBiayaRp => 'Gunggung Ragad (Rp)';

  @override
  String get totalBiayaTco => 'Gunggung Ragad (TCO)';

  @override
  String get totalBiayaBengkel => 'Gunggung Ragad Bengkel';

  @override
  String get totalBiayaKepemilikanTco => 'Gunggung Ragad Kepemilikan (TCO)';

  @override
  String get totalPengeluaranBbm => 'Gunggung Pangetokan BBM';

  @override
  String get tutup => 'Tutup';

  @override
  String get ubah => 'Ubah';

  @override
  String get volumeLiterKwh => 'Volume (Liter / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'Gagal mulihaken serep: $error';
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
    return 'Rampungaken: $title?';
  }

  @override
  String jadwalCount(String count) {
    return '$count Jadwal';
  }

  @override
  String riwayatCount(String count) {
    return '$count Riwayat';
  }

  @override
  String inspeksiCount(String count) {
    return '$count Pamriksan';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return 'Rekomendasi pabrik kangge $label kasil kaunggah!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'Unggah Standar $label';
  }

  @override
  String odometerValue(String odo) {
    return '$odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return 'Titihan \"$name\" kasil katambahaken!';
  }

  @override
  String get timezone => 'Zona Wektu';

  @override
  String get timezoneAuto => 'Otomatis (melu piranti)';

  @override
  String get licenseUsageTitle => 'Lisensi Panganggo';

  @override
  String get licenseUsageNotice =>
      'Bebas dienggo kanggo kaperluan pribadi lan non-profit.';

  @override
  String get licenseUsageBadgeText => 'Pribadi & Non-Profit';

  @override
  String get validationVehicleNameRequired =>
      'Jeneng kendaraan ora kena kosong';

  @override
  String get validationVehicleNameMinLength =>
      'Jeneng kendaraan minimal 2 aksara';

  @override
  String get validationVehicleNameMaxLength =>
      'Jeneng kendaraan maksimal 50 aksara';

  @override
  String get validationPlateRequired => 'Nomer plat ora kena kosong';

  @override
  String get validationPlateMaxLength => 'Nomer plat maksimal 15 aksara';

  @override
  String get validationOdometerNegative =>
      'Kilometer odometer ora kena negatif';

  @override
  String get validationOdometerTooHigh =>
      'Kilometer odometer ngluwihi wates wajar';

  @override
  String get validationOdometerLessThanPrevious =>
      'Odometer anyar ora kena luwih cilik tinimbang sadurunge';

  @override
  String get validationCostNegative => 'Biaya ora kena bernilai negatif';

  @override
  String get validationFuelLitersPositive =>
      'Volume bensin kudu luwih saka 0 liter';

  @override
  String get validationFuelLitersTooHigh =>
      'Volume bensin ngluwihi kapasitas tangki';

  @override
  String get validationServiceNameRequired => 'Jeneng servis kudu diisi';

  @override
  String get validationDocNameRequired => 'Jeneng dokumen kudu diisi';

  @override
  String get appTitle => 'GarageGo';

  @override
  String get appTagline =>
      'Nyathet servis, oli, BBM & pajak tunggangan ing sak garasi';

  @override
  String get loadingLabel => 'Ngamot…';

  @override
  String get onbSkip => 'Lewati';

  @override
  String get onbNext => 'Lanjut';

  @override
  String get onbGetStarted => 'Wiwiti Saiki';

  @override
  String get onbPrivacyHeadline => 'Privasi & Offline Wis Aman';

  @override
  String get onbPrivacyDetail =>
      'Kabèh data tunggangan kasimpen aman ing piranti Panjenengan tanpa pelacak.';

  @override
  String get onbSlide1Title => 'Garasi Panjenengan';

  @override
  String get onbSlide1Sub => 'Mobil & motor ing sak panggonan';

  @override
  String get onbSlide1Badge => '100% Offline & Pribadi';

  @override
  String get onbSlide2Title => 'Pangopènan';

  @override
  String get onbSlide2Sub => 'Servis, oli, lan pajak STNK';

  @override
  String get onbSlide2Badge => 'Pangélingan Berkala';

  @override
  String get onbSlide3Title => 'BBM';

  @override
  String get onbSlide3Sub => 'Konsumsi km/L & biaya per km';

  @override
  String get onbSlide3Badge => 'Ora Ana Iklan & Ora Ana Akun';

  @override
  String get onbSlide4Title => 'Offline & Pribadi';

  @override
  String get onbSlide4Sub => 'Data kasimpen ing piranti Panjenengan';

  @override
  String get onbSlide4Badge => 'Data Kasimpen ing Piranti';

  @override
  String get urgencySafe => 'Aman';

  @override
  String get urgencyDueSoon => 'Enggal';

  @override
  String get urgencyOverdue => 'Kliwat';

  @override
  String get docTypeTax => 'Pajak PKB Taunan';

  @override
  String get docTypePlate => 'Ganti Pelat & STNK 5 Taun';

  @override
  String get docTypeInsurance => 'Asuransi Tunggangan';

  @override
  String get docTypeEmissions => 'Uji Emisi / KIR';

  @override
  String get docTypeLicense => 'SIM Pengemudi';

  @override
  String get docTypeTitle => 'BPKB Tunggangan';

  @override
  String get docTypeOther => 'Dokumen Liyané';

  @override
  String get mtCatOilFluids => 'Oli & Pelumas';

  @override
  String get mtCatOilFilter => 'Oli & Filter';

  @override
  String get mtCatAirFilter => 'Filter & Udhara';

  @override
  String get mtCatBrakes => 'Rém';

  @override
  String get mtCatTires => 'Ban & Suspensi';

  @override
  String get mtCatIgnition => 'Pengapian';

  @override
  String get mtCatTransmission => 'Transmisi & Panggèrèk';

  @override
  String get mtCatCvt => 'Transmisi CVT';

  @override
  String get mtCatElectrical => 'Kelistrikan & Aki';

  @override
  String get mtCatCoolant => 'Cairan & Radiator';

  @override
  String get mtCatGeneral => 'Pangopènan Berkala';

  @override
  String get mtPresetCarOil => 'Ganti Oli Mesin Sintetik';

  @override
  String get mtPresetCarOilFilter => 'Ganti Filter Oli Mesin';

  @override
  String get mtPresetCarAirFilter => 'Filter Udhara & AC Kabin';

  @override
  String get mtPresetCarBrakeFluid => 'Kuras Minyak Rém & Kampas';

  @override
  String get mtPresetCarTireRotation => 'Rotasi Ban & Spooring Balancing';

  @override
  String get mtPresetCarSparkPlugs => 'Ganti Busi Iridium';

  @override
  String get mtPresetMotoOil => 'Ganti Oli Mesin Matic/Manual';

  @override
  String get mtPresetMotoGearOil => 'Ganti Oli Gardan (Gear Oil)';

  @override
  String get mtPresetMotoCvt => 'Servis CVT, V-Belt & Roller';

  @override
  String get mtPresetMotoBrakes => 'Cek & Ganti Kampas Rém';

  @override
  String get mtPresetMotoSparkPlug => 'Ganti Busi Motor';

  @override
  String inspPreTripTitle(String type) {
    return 'Inspeksi Pra-Perjalanan ($type)';
  }

  @override
  String inspRoadworthiness(String passed, String total) {
    return 'Kelayakan: $passed saka $total Poin Lolos';
  }

  @override
  String inspPassedCount(String pct, String passed, String total) {
    return '$pct% Lolos ($passed/$total)';
  }

  @override
  String get inspCatEngine => 'Mesin & Cairan';

  @override
  String get inspCatWheelsBrakes => 'Roda & Rém';

  @override
  String get inspCatLights => 'Lampu & Kelistrikan';

  @override
  String get inspCatSafety => 'Kaslametan';

  @override
  String get inspCatDrivetrain => 'Transmisi & Panggèrèk';

  @override
  String get inspCatWheelsSteering => 'Roda & Setir';

  @override
  String get inspCatBrakes => 'Rém';

  @override
  String get inspCatElectrical => 'Kelistrikan';

  @override
  String get inspCatEquipment => 'Kelengkapan';

  @override
  String get inspCar1 => 'Level Dipstick & Kejernihan Oli Mesin';

  @override
  String get inspCar2 => 'Level Banyu Reservoir Radiator Coolant';

  @override
  String get inspCar3 => 'Level Minyak Rém & Minyak Kopling/Power Steering';

  @override
  String get inspCar4 => 'Tekanan Angin & Alur Ketebalan 4 Ban + Ban Serep';

  @override
  String get inspCar5 => 'Kondisi Kampas Rém & Daya Cengkeram Rém Tangan';

  @override
  String get inspCar6 => 'Lampu Utama, Lampu Rém, Sein & Lampu Hazard';

  @override
  String get inspCar7 => 'Kondisi Terminal & Tegangan Indikator Aki (12V)';

  @override
  String get inspCar8 => 'Karet Wiper & Banyu Tabung Washer Kaca Ngarep';

  @override
  String get inspCar9 => 'Dongkrak, Kunci Roda, Segitiga Pengaman & Kotak P3K';

  @override
  String get inspMoto1 => 'Dhuwur & Kualitas Oli Mesin';

  @override
  String get inspMoto2 => 'Kondisi Oli Gardan / Ketegangan Rantai Roda';

  @override
  String get inspMoto3 => 'Tekanan Angin Ban Ngarep & Mburi';

  @override
  String get inspMoto4 => 'Ketebalan Kampas Rém Ngarep & Mburi';

  @override
  String get inspMoto5 => 'Lampu Ngarep, Lampu Mburi & Lampu Sein';

  @override
  String get inspMoto6 => 'Fungsi Klakson & Starter Elektrik (Kondisi Aki)';

  @override
  String get inspMoto7 => 'Spion Tengen & Kiwa sarta Kunci Kelengkapan';

  @override
  String gamesLvl(String level) {
    return 'Tingkat $level';
  }

  @override
  String gamesProgress(String xp, String unlocked, String total) {
    return '$xp XP • $unlocked/$total Lencana Kabuka';
  }

  @override
  String gamesNextLevel(String next, String xp) {
    return 'Menyang $next ($xp XP)';
  }

  @override
  String get gamesMaxRank => 'Pangkat Pungkasan';

  @override
  String get gamesBadgesTitle => 'Lencana Disiplin Garasi';

  @override
  String get gamesShare => 'Bagikan';

  @override
  String get gamesUnlocked => 'Kabuka (+100 XP)';

  @override
  String get gamesLocked => 'Durung Kecandhak';

  @override
  String gamesBadgeUnlockedLine(String highlight) {
    return 'Lencana kabuka: $highlight';
  }

  @override
  String get gamesLvl1 => 'Pengendara Anyaran';

  @override
  String get gamesLvl2 => 'Sing Duwe Mligi';

  @override
  String get gamesLvl3 => 'Penjaga Armada';

  @override
  String get gamesLvl4 => 'Spesialis Servis';

  @override
  String get gamesLvl5 => 'Master Garasi';

  @override
  String get badgeFirstRideTitle => 'Armada Pisanan';

  @override
  String get badgeFirstRideDesc =>
      'Ndhaptarakeun tunggangan pisanan ing garasi digital.';

  @override
  String get badgeOilCareTitle => 'Disiplin Oli';

  @override
  String get badgeOilCareDesc => 'Nyathet riwayat ganti oli mesin pas wektuné.';

  @override
  String get badgeServiceVeteranTitle => 'Rutin Berkala';

  @override
  String get badgeServiceVeteranDesc =>
      'Nyathet paling sethithik 3 log servis pangopènan berkala.';

  @override
  String get badgeFuelWatcherTitle => 'Jejak Efisiensi';

  @override
  String get badgeFuelWatcherDesc =>
      'Nyathet paling sethithik 3 isi BBM kanggo ngawasi konsumsi.';

  @override
  String get badgeSafeVoyageTitle => 'Inspektur Teliti';

  @override
  String get badgeSafeVoyageDesc =>
      'Rampung checklist inspeksi kaslametan tunggangan.';

  @override
  String get badgeDocKeeperTitle => 'Tertib Dokumen';

  @override
  String get badgeDocKeeperDesc =>
      'Nyimpen dokumen legalitas (STNK/Pajak/SIM/Asuransi).';

  @override
  String get badgePrimeFleetTitle => 'Kondisi Prima';

  @override
  String get badgePrimeFleetDesc =>
      'Nggayuh skor kesehatan tunggangan 90 utawa luwih.';

  @override
  String get badgeRoadWarriorTitle => 'Jelajah 10.000 KM';

  @override
  String get badgeRoadWarriorDesc =>
      'Ngawasi tunggangan kanthi odometer ngluwihi 10.000 km.';

  @override
  String healthOilOverdue(String km) {
    return 'Ganti oli mesin wis kliwat $km km';
  }

  @override
  String healthOilDue(String km) {
    return 'Ganti oli mesin kudu ditindakake ing $km km manèh';
  }

  @override
  String get healthOilOptimal => 'Interval oli mesin ing kondisi prima';

  @override
  String get healthTaxOverdue => 'Pajak STNK taunan wis kliwat jatuh tempo';

  @override
  String healthTaxDue(String days) {
    return 'Pajak STNK taunan jatuh tempo ing $days dina';
  }

  @override
  String get healthTaxSafe => 'Pajak PKB taunan aktif & aman';

  @override
  String get healthPlateExpired => 'Masa berlaku pelat 5 taunan wis entèk';

  @override
  String healthPlateDue(String days) {
    return 'Pelat 5 taunan kudu dianyari ing $days dina';
  }

  @override
  String healthScheduleOverdue(String title) {
    return '$title wis kliwat';
  }

  @override
  String healthScheduleDueSoon(String title) {
    return '$title mèh tekan wates servis';
  }

  @override
  String get healthPrime => 'Prima Banget';

  @override
  String get healthAttention => 'Mbutuhake Kawigatèn';

  @override
  String get healthCritical => 'Kritis / Servis Enggal';

  @override
  String get fuelEstTotalCost => 'Estimasi Total Biaya:';

  @override
  String get fuelTripDistance => 'Jarak Tempuh Trip:';

  @override
  String get fuelAvgConsumption => 'Konsumsi Rata-rata:';

  @override
  String get fuelOperatingCost => 'Biaya Operasional:';

  @override
  String get fuelFullTank => 'Tangki Kebak';

  @override
  String get fuelPartial => 'Sapérangan';

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
  String get aboutApplication => 'Aplikasi';

  @override
  String get aboutVersion => 'Versi';

  @override
  String get aboutArchitecture => 'Arsitektur';

  @override
  String get aboutArchitectureValue =>
      '100% Offline-First (tanpa server, tanpa pelacakan)';

  @override
  String get aboutDomain => 'Domain';

  @override
  String get aboutPackageId => 'ID Paket';

  @override
  String settingsVehicleOdo(String plate, String value) {
    return '$plate • Odo: $value km';
  }

  @override
  String get backupInvalidFile => 'Berkas .grg ora valid utawa strukture rusak';

  @override
  String get filterAll => 'Kabèh';

  @override
  String get filterAttention => 'Kawigatèn';

  @override
  String get maintenanceScreenTitle => 'Pangopènan & Servis';

  @override
  String get serviceTitleHint => 'Upamane: Ganti Oli Mesin & Filter';

  @override
  String get workshopHint => 'Upamane: Bengkel Resmi Astra';

  @override
  String get mustBePositive => 'Kudu luwih saka 0';

  @override
  String get editScheduleTitle => 'Owahi Jadwal Pangopènan';

  @override
  String get scheduleUpdated => 'Jadwal kasil dianyari!';

  @override
  String get scheduleSaved => 'Jadwal pangopènan kasil disimpen!';

  @override
  String get updateSchedule => 'Anyari Jadwal';

  @override
  String get saveSchedule => 'Simpen Jadwal Pangopènan';

  @override
  String scheduleCompleted(String title) {
    return '$title kasil dirampungake!';
  }

  @override
  String kmOverdue(String km) {
    return 'Kliwat $km km';
  }

  @override
  String kmRemaining(String km) {
    return 'Sisa $km km manèh';
  }

  @override
  String kmOverdueShort(String km) {
    return 'Kliwat $km km';
  }

  @override
  String kmRemainingShort(String km) {
    return 'Sisa $km km';
  }

  @override
  String daysOverdue(String days) {
    return 'Kliwat $days dina';
  }

  @override
  String daysLeft(String days) {
    return 'Sisa $days dina manèh';
  }

  @override
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  ) {
    return 'Saben $km km utawa $months sasi • Pungkasan: $odo km ($date)';
  }

  @override
  String get shareVehiclePassport => 'Bagikna Paspor Tunggangan';

  @override
  String get shareVehiclePassportSubtitle =>
      'Bagikna kertu status, skor kesehatan & riwayat ing médhia sosial';

  @override
  String get garageEmptyBody =>
      'Tambahna mobil utawa motor kulawarga pisanan Panjenengan kanggo miwiti ngawasi servis, oli, lan BBM.';

  @override
  String resetOilConfirm(String name, String odo) {
    return 'Counter ganti oli kanggo $name bakal diatur ulang menyang odometer saiki ($odo km).';
  }

  @override
  String get resetOilServiceNote => 'Reset counter interval oli mesin';

  @override
  String oilIntervalEvery(String km) {
    return 'Interval: saben $km km';
  }

  @override
  String garageYear(String year) {
    return 'Taun $year';
  }

  @override
  String get shareDialogTitle => 'Bagikna Paspor Tunggangan';

  @override
  String get shareCopySummary => 'Salin Ringkesan';

  @override
  String get sharePreparing => 'Nyiapake…';

  @override
  String get shareDownloadPassport => 'Undhuh Paspor';

  @override
  String get shareSharePassport => 'Bagikna Paspor';

  @override
  String get shareImageFailed => 'Gagal gawé gambar paspor tunggangan';

  @override
  String get shareImageDownloaded => 'Paspor tunggangan kasil diundhuh';

  @override
  String get shareSummaryCopied => 'Ringkesan status tunggangan kasil disalin';

  @override
  String get shareCardHealthHeader => 'STATUS KESEHATAN ARMADA';

  @override
  String shareCardCondition(String status) {
    return 'Kondisi $status';
  }

  @override
  String get shareCardOdometer => 'ODOMETER';

  @override
  String get shareCardOil => 'GANTI OLI';

  @override
  String get shareCardTax => 'PAJAK PKB';

  @override
  String get shareCardNeedService => 'Kudu Servis';

  @override
  String shareCardDaysShort(String days) {
    return '$days dina';
  }

  @override
  String shareCardLogbook(String date) {
    return 'Logbook: $date';
  }

  @override
  String shareTextHeader(String name, String plate) {
    return '🚗 Paspor Pangopènan Tunggangan — $name ($plate)';
  }

  @override
  String shareTextHealth(String score, String status) {
    return '🏆 Skor Kesehatan: $score/100 ($status)';
  }

  @override
  String shareTextOdometer(String odo) {
    return '⚡ Odometer: $odo km';
  }

  @override
  String shareTextOil(String km) {
    return '🛢️ Interval Ganti Oli: $km km manèh';
  }

  @override
  String get shareTextOilDue => '🛢️ Kudu Ganti Oli Enggal';

  @override
  String shareTextTax(String days) {
    return '📋 Pajak PKB: $days dina manèh';
  }

  @override
  String get shareTextFooter =>
      'Ngatur pangopènan garasi lengkap & offline ing GarageGo: https://garagego.faishal.id';

  @override
  String gloveboxHeader(String name) {
    return 'Glovebox Digital — $name';
  }

  @override
  String gloveboxDocCount(String plate, String count) {
    return '$plate • $count Dokumen Kadhaftar';
  }

  @override
  String docExpiredAgo(String days) {
    return 'Kadaluwarsa $days dina kepungkur';
  }

  @override
  String docDueIn(String days) {
    return 'Jatuh tempo $days dina manèh';
  }

  @override
  String docDaysLeft(String days) {
    return '$days dina manèh';
  }

  @override
  String docValidUntil(String date) {
    return 'Masa Berlaku: $date';
  }

  @override
  String get docEditTitle => 'Owahi Dokumen';

  @override
  String get docAddTitle => 'Tambah Dokumen Garasi';

  @override
  String get docTitleHint => 'Upamane: PKB Taunan / Asuransi All Risk';

  @override
  String get docNumberHint => 'Upamane: B 1234 CD / POL-88902';

  @override
  String get docCostHint => 'Upamane: 3500000';

  @override
  String get docNotesLabel => 'Cathetan & Petunjuk Anyaran';

  @override
  String get docNotesHint => 'Upamane: Bayar online liwat Signal';

  @override
  String get docUpdated => 'Dokumen kasil dianyari!';

  @override
  String get docAdded => 'Dokumen kasil ditambahake!';

  @override
  String get docUpdate => 'Anyari Dokumen';

  @override
  String get docSave => 'Simpen Dokumen';

  @override
  String get vehicleNameHint => 'Upamane: Honda HR-V / Yamaha NMAX';

  @override
  String get plateHint => 'B 1234 CD';

  @override
  String get invalidYear => 'Taun ora valid';

  @override
  String get taxDueLabel => 'Jatuh Tempo Pajak STNK';

  @override
  String scheduleDoneNote(String category) {
    return 'Rampung miturut jadwal berkala ($category)';
  }

  @override
  String get backupErrEmpty => 'Data cadhangan kosong.';

  @override
  String get backupErrRawJson =>
      'Format JSON mentah ora didhukung demi keamanan. Gunakna berkas cadhangan resmi.';

  @override
  String get backupErrFormat =>
      'Format berkas cadhangan ora valid utawa ora dingerteni.';

  @override
  String backupErrWrongApp(String other, String expected) {
    return 'Berkas cadhangan duwèké aplikasi $other, ora bisa dibalèkaké menyang $expected.';
  }

  @override
  String get backupErrCorrupt =>
      'Data cadhangan rusak utawa format encoding ora sah.';

  @override
  String get backupErrIntegrity =>
      'Integritas data cadhangan ora valid: data wis diowahi utawa rusak.';

  @override
  String get backupErrNotObject =>
      'Isi data cadhangan dudu objek data sing sah.';

  @override
  String get mtCatEngine => 'Mesin';

  @override
  String get mtCatOther => 'Liyané';

  @override
  String get unitMonthsShort => 'sasi';

  @override
  String get docNoteTax =>
      'Bayar liwat Samsat Digital Nasional (SIGNAL) utawa Samsat paling cedhak';

  @override
  String get docNotePlate =>
      'Kudu cek fisik tunggangan langsung ing Samsat Induk';

  @override
  String get docNoteInsurance =>
      'Nomer klaim darurat utawa towing ana ing polis';

  @override
  String gamesBadgeCount(String unlocked, String total) {
    return '$unlocked/$total Lencana Kabuka';
  }

  @override
  String get demoServiceTitle =>
      'Servis Berkala & Ganti Oli Mesin Sintetik 5W-30';

  @override
  String get demoServiceNotes =>
      'Ganti filter oli & filter AC kabin di bengkel resmi';

  @override
  String get demoRotationTitle => 'Rotasi Ban & Spooring Balancing';

  @override
  String get demoRotationNotes => 'Tekanan ban disetel 33 psi nitrogen';

  @override
  String get demoInspectionTitle => 'Inspeksi Lengkap Pra-Roadtrip';

  @override
  String get demoInspectionNotes =>
      'Kondisi kendaraan sangat prima, tekanan ban dan oli mesin dalam kondisi ideal.';
}
