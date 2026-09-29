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
    return 'Dinten malih';
  }

  @override
  String get expired => 'Sampun Kasep';

  @override
  String get noDocuments => 'Dereng wonten dhokumen';

  @override
  String get dataManagement => 'Pangreksan Data & Serep';

  @override
  String get exportBackup => 'Ekspor Cadhangan (JSON)';

  @override
  String get importBackup => 'Pulihaken Cadhangan (JSON)';

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
      'Cadhangan pepak sedaya dhata Garasi, jadwal servis, dhokumen, lan log BBM saged dipunsalin dhateng clipboard ing ngandhap:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Cadhangaken sedaya titihan, servis, BBM, lan jadwal';

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
  String get eksporBackupJson => 'Ekspor Cadhangan JSON';

  @override
  String get eksporCsvRiwayatBbm => 'Ekspor CSV Riwayat BBM';

  @override
  String get eksporCsvRiwayatServis => 'Ekspor CSV Riwayat Servis';

  @override
  String get eksporCadanganJson => 'Ekspor Cadhangan JSON';

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
  String get imporPulihkanBackupJson => 'Impor / Pulihaken Cadhangan JSON';

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
      'Balekaken dhata saking berkas cadhangan JSON ingkang trep';

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
  String get pulihkanDariBackupJson => 'Pulihaken saking Cadhangan JSON';

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
      'Salinan JSON cadhangan kasil kasalin dhateng Clipboard!';

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
  String get teksJsonTidakBolehKosong => 'Seratan JSON mboten pareng suwung!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Tèmpèlaken seratan dhata JSON cadhangan ingkang nate diekspor:';

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
}
