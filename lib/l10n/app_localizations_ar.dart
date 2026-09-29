// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => 'إدارة مرآب السيارات والصيانة والوقود';

  @override
  String get settings => 'الإعدادات';

  @override
  String get appearance => 'المظهر';

  @override
  String get theme => 'السمة';

  @override
  String get language => 'اللغة';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeSystem => 'النظام';

  @override
  String get selectTheme => 'اختر السمة';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get localeIndonesian => 'الإندونيسية';

  @override
  String get localeEnglish => 'الإنجليزية';

  @override
  String get localeArabic => 'العربية';

  @override
  String get localeJavanese => 'الجاوية';

  @override
  String get localeSundanese => 'السوندية';

  @override
  String get localeChinese => 'الصينية';

  @override
  String get localeJapanese => 'اليابانية';

  @override
  String get localeSpanish => 'الإسبانية';

  @override
  String get about => 'حول';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get delete => 'حذف';

  @override
  String get edit => 'تعديل';

  @override
  String get add => 'إضافة';

  @override
  String get search => 'بحث';

  @override
  String get filter => 'تصفية';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get confirm => 'تأكيد';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get close => 'إغلاق';

  @override
  String get navGarage => 'المرآب';

  @override
  String get navMaintenance => 'الصيانة';

  @override
  String get navFuel => 'الوقود';

  @override
  String get navGlovebox => 'المستندات';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get vehiclesTitle => 'قائمة المركبات في المرآب';

  @override
  String get addVehicle => 'إضافة مركبة';

  @override
  String get editVehicle => 'تعديل مركبة';

  @override
  String get vehicleName => 'اسم المركبة';

  @override
  String get plateNumber => 'رقم اللوحة';

  @override
  String get odometer => 'عداد المسافات (كم)';

  @override
  String get car => 'سيارة';

  @override
  String get motorcycle => 'دراجة نارية';

  @override
  String get vehicleType => 'نوع المركبة';

  @override
  String get brand => 'العلامة التجارية';

  @override
  String get modelYear => 'سنة الصنع';

  @override
  String get fuelType => 'نوع الوقود';

  @override
  String get oilCapacity => 'سعة الزيت (لتر)';

  @override
  String get activeVehicle => 'المركبة النشطة';

  @override
  String get setActive => 'تعيين كنشط';

  @override
  String get noVehicles => 'لا توجد مركبات في المرآب بعد';

  @override
  String get maintenanceTitle => 'سجلات وجداول الصيانة';

  @override
  String get addServiceLog => 'تسجيل صيانة جديدة';

  @override
  String get serviceDate => 'تاريخ الصيانة';

  @override
  String get serviceCost => 'تكلفة الصيانة';

  @override
  String get workshop => 'ورشة العمل';

  @override
  String get notes => 'ملاحظات';

  @override
  String get isOilChange => 'تغيير زيت المحرك';

  @override
  String get serviceSchedule => 'جدول الصيانة الدورية';

  @override
  String get addSchedule => 'إضافة جدول';

  @override
  String get oilLifeRemaining => 'عمر الزيت المتبقي';

  @override
  String get oilResetSuccess => 'تمت إعادة ضبط عداد الزيت!';

  @override
  String get noServiceLogs => 'لا توجد سجلات صيانة بعد';

  @override
  String get noSchedules => 'لا توجد جداول صيانة بعد';

  @override
  String get inspectionChecklist => 'قائمة فحص المركبة';

  @override
  String get startInspection => 'بدء الفحص';

  @override
  String get fuelTitle => 'سجلات تعبئة الوقود';

  @override
  String get addFuelLog => 'تسجيل تعبئة وقود';

  @override
  String get liters => 'الحجم (لتر)';

  @override
  String get totalCost => 'التكلفة الإجمالية';

  @override
  String get pricePerLiter => 'السعر لكل لتر';

  @override
  String get fullTank => 'خزان ممتلئ';

  @override
  String get gasStation => 'محطة الوقود';

  @override
  String get fuelEfficiency => 'معدل استهلاك الوقود';

  @override
  String get costPerKm => 'التكلفة لكل كيلومتر';

  @override
  String get noFuelLogs => 'لا توجد سجلات وقود بعد';

  @override
  String get gloveboxTitle => 'المستندات والتراخيص';

  @override
  String get addDocument => 'إضافة مستند';

  @override
  String get stnkTaxExpiry => 'تاريخ انتهاء ضريبة المركبة';

  @override
  String get stnk5YearExpiry => 'تاريخ تجديد رخصة السير';

  @override
  String get simExpiry => 'تاريخ انتهاء رخصة القيادة';

  @override
  String get insuranceExpiry => 'تأمين المركبة';

  @override
  String daysRemaining(Object count) {
    return 'باقٍ $count يوماً';
  }

  @override
  String get expired => 'منتهي الصلاحية';

  @override
  String get noDocuments => 'لا توجد مستندات مسجلة';

  @override
  String get dataManagement => 'إدارة البيانات والنسخ الاحتياطي';

  @override
  String get exportBackup => 'تصدير نسخة احتياطية (JSON)';

  @override
  String get importBackup => 'استعادة نسخة احتياطية (JSON)';

  @override
  String get exportCsv => 'تصدير إلى CSV';

  @override
  String get resetAllData => 'إعادة تعيين جميع البيانات';

  @override
  String get privacyNotice =>
      'البيانات مخزنة محلياً بنسبة 100% دون خوادم سحابية.';

  @override
  String get aksiCepat => 'Aksi Cepat';

  @override
  String get aksiCepatGarasi => 'Aksi Cepat كراج';

  @override
  String get aturUlangData => 'Atur Ulang Data';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'Atur pengingat ganti oli, filter, rem, dan sparepart.';

  @override
  String get audit10PoinKeselamatanJalanMud =>
      'Audit 10-poin keselamatan jalan & mudik';

  @override
  String get auditKelayakanJalanKeselamatan =>
      'Audit kelayakan jalan & keselamatan sebelum perjalanan mudik atau harian.';

  @override
  String get bahasaAplikasi => 'Bahasa Aplikasi';

  @override
  String get batal => 'إلغاء';

  @override
  String get belumAdaCatatanBbm => 'Belum Ada Catatan BBM';

  @override
  String get belumAdaDokumenTercatat => 'Belum Ada Dokumen Tercatat';

  @override
  String get belumAdaHasilCeklis => 'Belum Ada Hasil Ceklis';

  @override
  String get belumAdaJadwalServis => 'Belum Ada Jadwal Servis';

  @override
  String get belumAdaRiwayatServis => 'Belum Ada Riwayat Servis';

  @override
  String get belumAdaCatatanServis => 'Belum ada catatan servis.';

  @override
  String get belumAdaJadwalPerawatanBerkala =>
      'Belum ada jadwal perawatan berkala.';

  @override
  String get biayaKm => 'Biaya / KM';

  @override
  String get biayaTotalRp => 'Biaya Total (Rp)';

  @override
  String get biayaPerKm => 'Biaya per KM';

  @override
  String get bukaBrankas => 'Buka Brankas';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      'Cadangan lengkap seluruh data كراج, jadwal servis, dokumen, dan log BBM dapat disalin ke clipboard di bawah:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Cadangkan seluruh مركبة, servis, BBM, dan jadwal';

  @override
  String get cariRiwayatServisAtauBengkel =>
      'Cari riwayat servis atau bengkel...';

  @override
  String get catatPengisianBbm => 'Catat Pengisian BBM';

  @override
  String get catatPengisianPertama => 'Catat Pengisian Pertama';

  @override
  String get catatServisBaru => 'Catat Servis Baru';

  @override
  String get catatServisPertama => 'Catat Servis Pertama';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'Catat struk pengisian bensin untuk memantau konsumsi km/L dan cost/km.';

  @override
  String get catatanOpsional => 'Catatan (Opsional)';

  @override
  String get catatanLokasiBerkasFisik => 'Catatan / Lokasi Berkas Fisik';

  @override
  String get catatanBbmBerhasilDisimpan => 'Catatan BBM berhasil disimpan!';

  @override
  String get catatanPemeriksaOpsional => 'Catatan Pemeriksa (Opsional)';

  @override
  String get catatanSparepartPengerjaan => 'Catatan Sparepart / Pengerjaan';

  @override
  String get catatanServisBerhasilDitambahk =>
      'Catatan servis berhasil ditambahkan!';

  @override
  String get catatanTambahanKondisiKendaraa =>
      'Catatan tambahan kondisi مركبة...';

  @override
  String get ceklisKondisiKendaraan => 'Ceklis Kondisi مركبة';

  @override
  String get checklistInspeksiKendaraan => 'Checklist Inspeksi مركبة';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'Counter oli berhasil direset ke odometer saat ini!';

  @override
  String get daftarKendaraanDiGarasi => 'Daftar مركبة di كراج';

  @override
  String get daftarMasaBerlakuDokumenLisens =>
      'Daftar Masa Berlaku Dokumen & Lisensi';

  @override
  String get dataCsvBerhasilDisalinKeClipbo =>
      'Data CSV berhasil disalin ke Clipboard!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      'Data cadangan berhasil dipulihkan ke كراج!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'Data format CSV siap diekspor ke Excel / Spreadsheet:';

  @override
  String get dataGarasiBerhasilDiresetKeSta =>
      'Data كراج berhasil direset ke standar.';

  @override
  String get diperlukanUntukAkurasiKalkulas =>
      'Diperlukan untuk akurasi kalkulasi km/L';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'Dual-Trigger Reminder: Alarm akan aktif jika jarak (km) ATAU waktu (bulan) tercapai.';

  @override
  String get eksporBackupJson => 'Ekspor Backup JSON';

  @override
  String get eksporCsvRiwayatBbm => 'Ekspor CSV Riwayat BBM';

  @override
  String get eksporCsvRiwayatServis => 'Ekspor CSV Riwayat Servis';

  @override
  String get eksporCadanganJson => 'Ekspor Cadangan JSON';

  @override
  String get eksporFormatTabelSpreadsheetUn =>
      'Ekspor format tabel spreadsheet untuk pencatatan bengkel';

  @override
  String get eksporSeluruhPengisianBbmKeFor =>
      'Ekspor seluruh pengisian BBM ke format CSV spreadsheet';

  @override
  String get estimasiBiayaPremiRp => 'Estimasi Biaya / Premi (Rp)';

  @override
  String get gantiPelat5Th => 'Ganti Pelat 5 Th';

  @override
  String get garasiMasihKosong => 'كراج Masih Kosong';

  @override
  String get hargaSatuanRpLiter => 'Harga Satuan (Rp/Liter)';

  @override
  String get hasilCeklisInspeksiBerhasilDis =>
      'Hasil ceklis inspeksi berhasil disimpan!';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi =>
      'Hitung konsumsi km/L dan biaya bensin';

  @override
  String get imporPulihkanBackupJson => 'Impor / Pulihkan Backup JSON';

  @override
  String get intervalJarakKm => 'Interval Jarak (km)';

  @override
  String get intervalOliKm => 'Interval Oli (km)';

  @override
  String get intervalWaktu => 'Interval Waktu';

  @override
  String get isiTangkiPenuhFullTank => 'Isi Tangki Penuh (Full Tank)?';

  @override
  String get jadwalServisMendatang => 'Jadwal Servis Mendatang';

  @override
  String get jenisBahanBakar => 'Jenis Bahan Bakar';

  @override
  String get jenisDokumen => 'Jenis Dokumen';

  @override
  String get judulKeteranganDokumen => 'Judul / Keterangan Dokumen';

  @override
  String get kategori => 'Kategori:';

  @override
  String get kembalikanDataDariBerkasCadang =>
      'Kembalikan data dari berkas cadangan JSON yang valid';

  @override
  String get kilometerOdometerKm => 'Kilometer Odometer (km)';

  @override
  String get konfirmasiReset => 'Konfirmasi Reset';

  @override
  String get konsumsiBbm => 'Konsumsi BBM';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'Lakukan inspeksi 10 poin ban, rem, oli, lampu, dan aki.';

  @override
  String get lihatSemua => 'Lihat Semua';

  @override
  String get lisensiPamakean => 'Lisensi Pamakean';

  @override
  String get lisensiPanganggo => 'Lisensi Panganggo';

  @override
  String get lisensiPenggunaan => 'Lisensi Penggunaan';

  @override
  String get menghapusSemuaLogServisBbmDanR =>
      'Menghapus semua log servis, BBM, dan riwayat كراج';

  @override
  String get mobil => 'Mobil';

  @override
  String get mobilAtauMotorKeluargaBaru => 'Mobil atau motor keluarga baru';

  @override
  String get modeTema => 'Mode Tema';

  @override
  String get motor => 'Motor';

  @override
  String get mulaiCeklis => 'Mulai Ceklis';

  @override
  String get mulaiInspeksiPertama => 'Mulai Inspeksi Pertama';

  @override
  String get namaModelKendaraan => 'Nama / Model مركبة';

  @override
  String get namaBengkelToko => 'Nama Bengkel / Toko';

  @override
  String get namaBengkelTokoOpsional => 'Nama Bengkel / Toko (Opsional)';

  @override
  String get namaPekerjaanKomponen => 'Nama Pekerjaan / Komponen';

  @override
  String get namaSpbuLokasi => 'Nama SPBU / Lokasi';

  @override
  String get nomorDokumenNoPolisNoPolisi =>
      'Nomor Dokumen / No. Polis / No. Polisi';

  @override
  String get nomorPelatPolisi => 'Nomor Pelat Polisi';

  @override
  String get odometerPengerjaanKm => 'Odometer Pengerjaan (km)';

  @override
  String get odometerSaatIniKm => 'Odometer Saat Ini (km)';

  @override
  String get odometerTerakhirDikerjakanKm =>
      'Odometer Terakhir Dikerjakan (km)';

  @override
  String get opsiJadwal => 'Opsi Jadwal';

  @override
  String get pkbTahunan => 'PKB Tahunan';

  @override
  String get pajakStnk => 'Pajak & STNK';

  @override
  String get pajakPkbTahunan => 'Pajak PKB Tahunan';

  @override
  String get pekerjaanServis => 'Pekerjaan / Servis';

  @override
  String get pelat5Th => 'Pelat 5 Th';

  @override
  String get pengaturanGarasi => 'Pengaturan كراج';

  @override
  String get penggantianOliMesinResetCounte =>
      'Penggantian Oli Mesin (Reset Counter)';

  @override
  String get pilihBahasaSelectLanguage => 'Pilih Bahasa / Select Language';

  @override
  String get pilihAtauBuatKendaraanTerlebih =>
      'Pilih atau buat مركبة terlebih dahulu.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Pilih atau إضافة مركبة terlebih dahulu.';

  @override
  String get portabilitasCadanganData => 'Portabilitas & Cadangan Data';

  @override
  String get pulihkanData => 'Pulihkan Data';

  @override
  String get pulihkanDariBackupJson => 'Pulihkan dari Backup JSON';

  @override
  String get rataRataEfisiensi => 'Rata-Rata Efisiensi';

  @override
  String get rekorIritTerbaik => 'Rekor Irit Terbaik';

  @override
  String get resetCounterOliMesin => 'Reset Counter Oli Mesin';

  @override
  String get resetDataGarasi => 'Reset Data كراج';

  @override
  String get resetOli => 'Reset Oli';

  @override
  String get resetSeluruhData => 'Reset Seluruh Data?';

  @override
  String get rincianPartYangDiganti => 'Rincian part yang diganti...';

  @override
  String get riwayatLengkap => 'Riwayat Lengkap';

  @override
  String get riwayatPengisianBahanBakar => 'Riwayat Pengisian Bahan Bakar';

  @override
  String get salinCsv => 'Salin CSV';

  @override
  String get salinKeClipboard => 'Salin ke Clipboard';

  @override
  String get salinanJsonBackupBerhasilDisal =>
      'Salinan JSON backup berhasil disalin ke Clipboard!';

  @override
  String get servisTerakhir => 'Servis Terakhir';

  @override
  String get setPengingatBerkalaGantiPartKm =>
      'Set pengingat berkala ganti part km/bulan';

  @override
  String get simpan => 'حفظ';

  @override
  String get simpanAuditInspeksi => 'حفظ Audit Inspeksi';

  @override
  String get simpanKeGarasi => 'حفظ ke كراج';

  @override
  String get simpanRiwayatBengkelDanGantiOl =>
      'حفظ riwayat bengkel dan ganti oli';

  @override
  String get simpanTanggalJatuhTempoStnkAsu =>
      'حفظ tanggal jatuh tempo STNK, asuransi, dan dokumen مركبة Anda.';

  @override
  String get statusOliMesin => 'Status Oli Mesin';

  @override
  String get tahunPembuatan => 'Tahun Pembuatan';

  @override
  String get tambahDokumen => 'إضافة Dokumen';

  @override
  String get tambahDokumenPertama => 'إضافة Dokumen Pertama';

  @override
  String get tambahJadwalBaru => 'إضافة Jadwal Baru';

  @override
  String get tambahJadwalPerawatan => 'إضافة Jadwal Perawatan';

  @override
  String get tambahKendaraan => 'إضافة مركبة';

  @override
  String get tambahKendaraanBaru => 'إضافة مركبة Baru';

  @override
  String get tampilanBahasa => 'Tampilan & Bahasa';

  @override
  String get tandaiSelesai => 'Tandai Selesai';

  @override
  String get tandaiSelesaiReset => 'Tandai Selesai / Reset';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      'Tandai selesai akan mereset hitungan interval dan otomatis mencatat ke Riwayat Servis.';

  @override
  String get tanggalMasaBerlakuJatuhTempo =>
      'Tanggal Masa Berlaku / Jatuh Tempo';

  @override
  String get tanggalTerakhirDikerjakan => 'Tanggal Terakhir Dikerjakan';

  @override
  String get teksJsonTidakBolehKosong => 'Teks JSON tidak boleh kosong!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Tempelkan teks data JSON cadangan yang pernah diekspor sebelumnya:';

  @override
  String get tentangAplikasiLisensi => 'Tentang Aplikasi & Lisensi';

  @override
  String get termasukGantiOli => 'Termasuk Ganti Oli?';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'Tindakan ini akan mengosongkan semua data dan mengembalikan contoh awal كراج.';

  @override
  String get totalBiayaRp => 'Total Biaya (Rp)';

  @override
  String get totalBiayaTco => 'Total Biaya (TCO)';

  @override
  String get totalBiayaBengkel => 'Total Biaya Bengkel';

  @override
  String get totalBiayaKepemilikanTco => 'Total Biaya Kepemilikan (TCO)';

  @override
  String get totalPengeluaranBbm => 'Total Pengeluaran BBM';

  @override
  String get tutup => 'إغلاق';

  @override
  String get ubah => 'Ubah';

  @override
  String get volumeLiterKwh => 'Volume (Liter / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'Failed to restore backup: $error';
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
    return 'Factory recommendation $label loaded!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'Load Factory Standard ($label)';
  }

  @override
  String odometerValue(String odo) {
    return 'Odometer: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return 'Vehicle $name successfully added to garage!';
  }
}
