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
  String get exportBackup => 'تصدير نسخة احتياطية (.grg)';

  @override
  String get importBackup => 'استعادة النسخة (.grg)';

  @override
  String get exportCsv => 'تصدير إلى CSV';

  @override
  String get resetAllData => 'إعادة تعيين جميع البيانات';

  @override
  String get privacyNotice =>
      'البيانات مخزنة محلياً بنسبة 100% دون خوادم سحابية.';

  @override
  String get aksiCepat => 'إجراءات سريعة';

  @override
  String get aksiCepatGarasi => 'إجراءات الكراج السريعة';

  @override
  String get aturUlangData => 'إعادة ضبط البيانات';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'ضبط تذكيرات دورية لتغيير الزيت والفلاتر والفرامل وقطع الغيار.';

  @override
  String get audit10PoinKeselamatanJalanMud =>
      'فحص أمان من 10 نقاط للرحلات الطويلة والقيادة اليومية';

  @override
  String get auditKelayakanJalanKeselamatan =>
      'فحص السلامة وصلاحية السير قبل السفر أو الاستخدام اليومي.';

  @override
  String get bahasaAplikasi => 'لغة التطبيق';

  @override
  String get batal => 'إلغاء';

  @override
  String get belumAdaCatatanBbm => 'لا توجد سجلات وقود بعد';

  @override
  String get belumAdaDokumenTercatat => 'لا توجد مستندات مسجلة بعد';

  @override
  String get belumAdaHasilCeklis => 'لا توجد سجلات فحص بعد';

  @override
  String get belumAdaJadwalServis => 'لا توجد جداول صيانة بعد';

  @override
  String get belumAdaRiwayatServis => 'لا يوجد سجل صيانة بعد';

  @override
  String get belumAdaCatatanServis => 'لم يتم تسجيل أي سجلات صيانة حتى الآن.';

  @override
  String get belumAdaJadwalPerawatanBerkala =>
      'لم يتم إنشاء جداول صيانة دورية بعد.';

  @override
  String get biayaKm => 'التكلفة / كم';

  @override
  String get biayaTotalRp => 'التكلفة الإجمالية (Rp)';

  @override
  String get biayaPerKm => 'التكلفة لكل كم';

  @override
  String get bukaBrankas => 'فتح درج المستندات';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      'شارك ملف .grg يحتوي على بيانات المرآب والجداول والمستندات والوقود.';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'شارك المركبات والصيانة والوقود والجداول كملف .grg';

  @override
  String get cariRiwayatServisAtauBengkel =>
      'البحث في سجل الصيانة أو الورشة...';

  @override
  String get catatPengisianBbm => 'تسجيل تعبئة وقود';

  @override
  String get catatPengisianPertama => 'تسجيل أول تعبئة وقود';

  @override
  String get catatServisBaru => 'تسجيل صيانة جديدة';

  @override
  String get catatServisPertama => 'تسجيل أول صيانة';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'سجل إيصالات الوقود لمتابعة استهلاك الوقود (كم/لتر) وتكلفة الكيلومتر.';

  @override
  String get catatanOpsional => 'ملاحظات (اختياري)';

  @override
  String get catatanLokasiBerkasFisik => 'ملاحظات / مكان الوثيقة الأصلية';

  @override
  String get catatanBbmBerhasilDisimpan => 'تم حفظ سجل الوقود بنجاح!';

  @override
  String get catatanPemeriksaOpsional => 'ملاحظات الفاحص (اختياري)';

  @override
  String get catatanSparepartPengerjaan => 'ملاحظات قطع الغيار / العمل المنفذ';

  @override
  String get catatanServisBerhasilDitambahk => 'تمت إضافة سجل الصيانة بنجاح!';

  @override
  String get catatanTambahanKondisiKendaraa =>
      'ملاحظات إضافية حول حالة المركبة...';

  @override
  String get ceklisKondisiKendaraan => 'قائمة فحص حالة المركبة';

  @override
  String get checklistInspeksiKendaraan => 'قائمة الفحص الدوري للمركبة';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'تمت إعادة ضبط عداد الزيت إلى قراءة العداد الحالية بنجاح!';

  @override
  String get daftarKendaraanDiGarasi => 'المركبات في الكراج';

  @override
  String get daftarMasaBerlakuDokumenLisens => 'صلاحية المستندات والتراخيص';

  @override
  String get dataCsvBerhasilDisalinKeClipbo =>
      'تم نسخ بيانات CSV إلى الحافظة بنجاح!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      'تمت استعادة البيانات الاحتياطية بنجاح!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'بيانات بتنسيق CSV جاهزة للتصدير إلى Excel / جداول البيانات:';

  @override
  String get dataGarasiBerhasilDiresetKeSta =>
      'تمت إعادة تعيين بيانات الكراج إلى الإعدادات الافتراضية.';

  @override
  String get diperlukanUntukAkurasiKalkulas =>
      'مطلوب لحساب استهلاك الوقود (كم/لتر) بدقة';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'تذكير مزدوج: يتم التنبيه عند بلوغ المسافة (كم) أو المدة (أشهر).';

  @override
  String get eksporBackupJson => 'تصدير نسخة احتياطية (.grg)';

  @override
  String get eksporCsvRiwayatBbm => 'تصدير سجلات الوقود CSV';

  @override
  String get eksporCsvRiwayatServis => 'تصدير سجلات الصيانة CSV';

  @override
  String get eksporCadanganJson => 'تصدير نسخة احتياطية (.grg)';

  @override
  String get eksporFormatTabelSpreadsheetUn =>
      'تصدير جدول بيانات لسجلات الورشة';

  @override
  String get eksporSeluruhPengisianBbmKeFor =>
      'تصدير جميع سجلات تعبئة الوقود بتنسيق CSV';

  @override
  String get estimasiBiayaPremiRp => 'التكلفة / القسط التقديري (Rp)';

  @override
  String get gantiPelat5Th => 'تجديد اللوحة / الفحص (5 سنوات)';

  @override
  String get garasiMasihKosong => 'الكراج فارغ حالياً';

  @override
  String get hargaSatuanRpLiter => 'سعر الوحدة (Rp/لتر)';

  @override
  String get hasilCeklisInspeksiBerhasilDis => 'تم حفظ نتائج الفحص بنجاح!';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi =>
      'حساب استهلاك الوقود وتكلفة البنزين';

  @override
  String get imporPulihkanBackupJson => 'استيراد / استعادة النسخة (.grg)';

  @override
  String get intervalJarakKm => 'فاصل المسافة (كم)';

  @override
  String get intervalOliKm => 'فاصل تغيير الزيت (كم)';

  @override
  String get intervalWaktu => 'الفاصل الزمني';

  @override
  String get isiTangkiPenuhFullTank => 'هل تم ملء الخزان بالكامل؟';

  @override
  String get jadwalServisMendatang => 'مواعيد الصيانة القادمة';

  @override
  String get jenisBahanBakar => 'نوع الوقود';

  @override
  String get jenisDokumen => 'نوع المستند';

  @override
  String get judulKeteranganDokumen => 'عنوان / وصف المستند';

  @override
  String get kategori => 'الفئة:';

  @override
  String get kembalikanDataDariBerkasCadang =>
      'استعد البيانات من ملف .grg صالح';

  @override
  String get kilometerOdometerKm => 'قراءة العداد (كم)';

  @override
  String get konfirmasiReset => 'تأكيد إعادة الضبط';

  @override
  String get konsumsiBbm => 'استهلاك الوقود';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'إجراء فحص من 10 نقاط: الإطارات، الفرامل، الزيت، الإضاءة، والبطارية.';

  @override
  String get lihatSemua => 'عرض الكل';

  @override
  String get lisensiPamakean => 'ترخيص الاستخدام';

  @override
  String get lisensiPanganggo => 'ترخيص الاستخدام';

  @override
  String get lisensiPenggunaan => 'ترخيص الاستخدام';

  @override
  String get menghapusSemuaLogServisBbmDanR =>
      'حذف جميع سجلات الصيانة والوقود وبيانات الكراج';

  @override
  String get mobil => 'سيارة';

  @override
  String get mobilAtauMotorKeluargaBaru => 'إضافة سيارة أو دراجة نارية جديدة';

  @override
  String get modeTema => 'نمط المظهر';

  @override
  String get motor => 'دراجة نارية';

  @override
  String get mulaiCeklis => 'بدء الفحص';

  @override
  String get mulaiInspeksiPertama => 'بدء أول فحص';

  @override
  String get namaModelKendaraan => 'اسم / طراز المركبة';

  @override
  String get namaBengkelToko => 'اسم الورشة / المحل';

  @override
  String get namaBengkelTokoOpsional => 'اسم الورشة / المحل (اختياري)';

  @override
  String get namaPekerjaanKomponen => 'اسم الخدمة / القطعة';

  @override
  String get namaSpbuLokasi => 'محطة الوقود / الموقع';

  @override
  String get nomorDokumenNoPolisNoPolisi =>
      'رقم الوثيقة / رقم البوليصة / رقم اللوحة';

  @override
  String get nomorPelatPolisi => 'رقم لوحة المركبة';

  @override
  String get odometerPengerjaanKm => 'قراءة العداد عند الصيانة (كم)';

  @override
  String get odometerSaatIniKm => 'قراءة العداد الحالية (كم)';

  @override
  String get odometerTerakhirDikerjakanKm => 'قراءة العداد عند آخر صيانة (كم)';

  @override
  String get opsiJadwal => 'خيارات الجدول';

  @override
  String get pkbTahunan => 'الضريبة السنوية';

  @override
  String get pajakStnk => 'الرسوم ورخصة السير';

  @override
  String get pajakPkbTahunan => 'ضريبة المركبات السنوية';

  @override
  String get pekerjaanServis => 'الصيانة / العمل المنفذ';

  @override
  String get pelat5Th => 'تجديد اللوحة 5 سنوات';

  @override
  String get pengaturanGarasi => 'إعدادات الكراج';

  @override
  String get penggantianOliMesinResetCounte =>
      'تغيير زيت المحرك (إعادة ضبط العداد)';

  @override
  String get pilihBahasaSelectLanguage => 'اختيار اللغة';

  @override
  String get pilihAtauBuatKendaraanTerlebih =>
      'يرجى اختيار أو إضافة مركبة أولاً.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'يرجى اختيار أو إضافة مركبة أولاً.';

  @override
  String get portabilitasCadanganData => 'إدارة البيانات والنسخ الاحتياطي';

  @override
  String get pulihkanData => 'استعادة البيانات';

  @override
  String get pulihkanDariBackupJson => 'استعادة من ملف (.grg)';

  @override
  String get rataRataEfisiensi => 'متوسط استهلاك الوقود';

  @override
  String get rekorIritTerbaik => 'أفضل استهلاك للوقود';

  @override
  String get resetCounterOliMesin => 'إعادة ضبط عداد الزيت';

  @override
  String get resetDataGarasi => 'إعادة ضبط بيانات الكراج';

  @override
  String get resetOli => 'إعادة ضبط الزيت';

  @override
  String get resetSeluruhData => 'هل تريد إعادة ضبط جميع البيانات؟';

  @override
  String get rincianPartYangDiganti => 'تفاصيل القطع المستبدلة أو الإصلاحات...';

  @override
  String get riwayatLengkap => 'السجل الكامل';

  @override
  String get riwayatPengisianBahanBakar => 'سجل تعبئة الوقود';

  @override
  String get salinCsv => 'نسخ CSV';

  @override
  String get salinKeClipboard => 'نسخ إلى الحافظة';

  @override
  String get salinanJsonBackupBerhasilDisal => 'ملف النسخة .grg جاهز للمشاركة!';

  @override
  String get servisTerakhir => 'آخر صيانة';

  @override
  String get setPengingatBerkalaGantiPartKm =>
      'ضبط تذكيرات دورية حسب الكيلومتر أو الأشهر';

  @override
  String get simpan => 'حفظ';

  @override
  String get simpanAuditInspeksi => 'حفظ تقرير الفحص';

  @override
  String get simpanKeGarasi => 'حفظ في الكراج';

  @override
  String get simpanRiwayatBengkelDanGantiOl => 'حفظ سجلات الورش وتغييرات الزيت';

  @override
  String get simpanTanggalJatuhTempoStnkAsu =>
      'حفظ تواريخ انتهاء الضرائب والتراخيص والتأمين لمركبتك.';

  @override
  String get statusOliMesin => 'حالة زيت المحرك';

  @override
  String get tahunPembuatan => 'سنة الصنع';

  @override
  String get tambahDokumen => 'إضافة مستند';

  @override
  String get tambahDokumenPertama => 'إضافة أول مستند';

  @override
  String get tambahJadwalBaru => 'إضافة جدول جديد';

  @override
  String get tambahJadwalPerawatan => 'إضافة جدول صيانة';

  @override
  String get tambahKendaraan => 'إضافة مركبة';

  @override
  String get tambahKendaraanBaru => 'إضافة مركبة جديدة';

  @override
  String get tampilanBahasa => 'المظهر واللغة';

  @override
  String get tandaiSelesai => 'تحديد كمكتمل';

  @override
  String get tandaiSelesaiReset => 'تحديد كمكتمل / إعادة ضبط';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      'تحديد كمكتمل سيعيد ضبط عداد الفاصل ويسجل العملية في سجل الصيانة.';

  @override
  String get tanggalMasaBerlakuJatuhTempo => 'تاريخ الانتهاء / الاستحقاق';

  @override
  String get tanggalTerakhirDikerjakan => 'تاريخ آخر صيانة';

  @override
  String get teksJsonTidakBolehKosong => 'يجب ألا يكون ملف النسخة فارغًا!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'اختر ملف نسخة .grg تم تصديره سابقًا.';

  @override
  String get tentangAplikasiLisensi => 'عن التطبيق والترخيص';

  @override
  String get termasukGantiOli => 'هل تشمل تغيير الزيت؟';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'هذا الإجراء سيحذف كافة السجلات ويعيد البيانات النموذجية الأولية.';

  @override
  String get totalBiayaRp => 'التكلفة الإجمالية (Rp)';

  @override
  String get totalBiayaTco => 'التكلفة الإجمالية للملكية (TCO)';

  @override
  String get totalBiayaBengkel => 'إجمالي تكاليف الورشة';

  @override
  String get totalBiayaKepemilikanTco => 'التكلفة الإجمالية للملكية (TCO)';

  @override
  String get totalPengeluaranBbm => 'إجمالي مصاريف الوقود';

  @override
  String get tutup => 'إغلاق';

  @override
  String get ubah => 'تعديل';

  @override
  String get volumeLiterKwh => 'الحجم (لتر / كيلوواط ساعة)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'فشل استعادة النسخة الاحتياطية: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 => 'مثال: ضريبة المركبة السنوية 2026';

  @override
  String get hintPlatB1234 => 'B 1234 ABC';

  @override
  String get misalStnkDiDompet =>
      'مثال: الاستمارة في المحفظة، الوثيقة في الدرج';

  @override
  String get misalKurasMinyakRem => 'مثال: تغيير سائل الفرامل DOT 4';

  @override
  String selesaikanJadwal(String title) {
    return 'إكمال: $title';
  }

  @override
  String jadwalCount(String count) {
    return 'الجداول ($count)';
  }

  @override
  String riwayatCount(String count) {
    return 'السجل ($count)';
  }

  @override
  String inspeksiCount(String count) {
    return 'الفحوصات ($count)';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return 'تم تحميل توصيات المصنع لـ $label بنجاح!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'تحميل المعايير المصنعية ($label)';
  }

  @override
  String odometerValue(String odo) {
    return 'العداد: $odo كم';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return 'تمت إضافة المركبة $name إلى الكراج بنجاح!';
  }

  @override
  String get timezone => 'المنطقة الزمنية';

  @override
  String get timezoneAuto => 'تلقائي (حسب الجهاز)';

  @override
  String get licenseUsageTitle => 'ترخيص الاستخدام';

  @override
  String get licenseUsageNotice => 'مجاني للاستخدام الشخصي وغير الربحي.';

  @override
  String get licenseUsageBadgeText => 'شخصي وغير ربحي';

  @override
  String get validationVehicleNameRequired => 'اسم المركبة مطلوب';

  @override
  String get validationVehicleNameMinLength =>
      'يجب أن يتكون اسم المركبة من حرفين على الأقل';

  @override
  String get validationVehicleNameMaxLength =>
      'لا يمكن أن يتجاوز اسم المركبة 50 حرفًا';

  @override
  String get validationPlateRequired => 'رقم لوحة المركبة مطلوب';

  @override
  String get validationPlateMaxLength =>
      'لا يمكن أن تتجاوز لوحة المركبة 15 حرفًا';

  @override
  String get validationOdometerNegative => 'لا يمكن أن تكون قراءة العداد سالبة';

  @override
  String get validationOdometerTooHigh => 'قراءة العداد تتجاوز الحد المعقول';

  @override
  String get validationOdometerLessThanPrevious =>
      'لا يمكن أن تكون القراءة الجديدة أقل من السابقة';

  @override
  String get validationCostNegative => 'لا يمكن أن تكون التكلفة سالبة';

  @override
  String get validationFuelLitersPositive =>
      'يجب أن يكون حجم الوقود أكبر من 0 لتر';

  @override
  String get validationFuelLitersTooHigh => 'حجم الوقود يتجاوز سعة الخزان';

  @override
  String get validationServiceNameRequired => 'اسم الخدمة مطلوب';

  @override
  String get validationDocNameRequired => 'اسم المستند مطلوب';

  @override
  String get appTitle => 'GarageGo';

  @override
  String get appTagline =>
      'تابع الصيانة والزيت والوقود ورسوم المركبة في مكان واحد';

  @override
  String get loadingLabel => 'جارٍ التحميل…';

  @override
  String get onbSkip => 'تخطي';

  @override
  String get onbNext => 'التالي';

  @override
  String get onbGetStarted => 'ابدأ الآن';

  @override
  String get onbPrivacyHeadline => 'خصوصية كاملة وعمل دون اتصال';

  @override
  String get onbPrivacyDetail =>
      'جميع بيانات مركباتك محفوظة على جهازك، دون أي متتبعات.';

  @override
  String get onbSlide1Title => 'مرآبك';

  @override
  String get onbSlide1Sub => 'السيارات والدراجات في مكان واحد';

  @override
  String get onbSlide1Badge => 'يعمل دون اتصال وخاص';

  @override
  String get onbSlide2Title => 'الصيانة';

  @override
  String get onbSlide2Sub => 'الصيانة والزيت ورسوم الطريق';

  @override
  String get onbSlide2Badge => 'تذكيرات دورية';

  @override
  String get onbSlide3Title => 'الوقود';

  @override
  String get onbSlide3Sub => 'استهلاك كم/لتر والتكلفة لكل كم';

  @override
  String get onbSlide3Badge => 'بلا إعلانات وبلا حساب';

  @override
  String get onbSlide4Title => 'دون اتصال وبخصوصية';

  @override
  String get onbSlide4Sub => 'بياناتك تبقى على جهازك';

  @override
  String get onbSlide4Badge => 'بياناتك محفوظة على جهازك';

  @override
  String get urgencySafe => 'آمن';

  @override
  String get urgencyDueSoon => 'قريب';

  @override
  String get urgencyOverdue => 'متأخر';

  @override
  String get docTypeTax => 'ضريبة المركبة السنوية';

  @override
  String get docTypePlate => 'تجديد اللوحة والترخيص (5 سنوات)';

  @override
  String get docTypeInsurance => 'تأمين المركبة';

  @override
  String get docTypeEmissions => 'فحص الانبعاثات / الفحص الفني';

  @override
  String get docTypeLicense => 'رخصة القيادة';

  @override
  String get docTypeTitle => 'سند ملكية المركبة';

  @override
  String get docTypeOther => 'مستند آخر';

  @override
  String get mtCatOilFluids => 'الزيت والسوائل';

  @override
  String get mtCatOilFilter => 'الزيت والفلاتر';

  @override
  String get mtCatAirFilter => 'فلاتر الهواء';

  @override
  String get mtCatBrakes => 'الفرامل';

  @override
  String get mtCatTires => 'الإطارات ونظام التعليق';

  @override
  String get mtCatIgnition => 'الإشعال';

  @override
  String get mtCatTransmission => 'الناقل والدفع';

  @override
  String get mtCatCvt => 'ناقل CVT';

  @override
  String get mtCatElectrical => 'الكهرباء والبطارية';

  @override
  String get mtCatCoolant => 'سائل التبريد والرادياتير';

  @override
  String get mtCatGeneral => 'صيانة دورية';

  @override
  String get mtPresetCarOil => 'تغيير زيت المحرك الصناعي';

  @override
  String get mtPresetCarOilFilter => 'تغيير فلتر الزيت';

  @override
  String get mtPresetCarAirFilter => 'فلتر الهواء وفلتر المكيف';

  @override
  String get mtPresetCarBrakeFluid => 'تغيير زيت الفرامل وتيل الفرامل';

  @override
  String get mtPresetCarTireRotation => 'تدوير الإطارات وضبط الزوايا';

  @override
  String get mtPresetCarSparkPlugs => 'شمعة إشعال إيريديوم';

  @override
  String get mtPresetMotoOil => 'تغيير زيت محرك الدراجة';

  @override
  String get mtPresetMotoGearOil => 'زيت ناقل الحركة النهائي';

  @override
  String get mtPresetMotoCvt => 'صيانة CVT والحزام والبكرات';

  @override
  String get mtPresetMotoBrakes => 'فحص وتغيير تيل الفرامل';

  @override
  String get mtPresetMotoSparkPlug => 'شمعة إشعال الدراجة';

  @override
  String inspPreTripTitle(String type) {
    return 'فحص قبل الرحلة ($type)';
  }

  @override
  String inspRoadworthiness(String passed, String total) {
    return 'الصلاحية: $passed من $total نقطة ناجحة';
  }

  @override
  String inspPassedCount(String pct, String passed, String total) {
    return '$pct% ناجح ($passed/$total)';
  }

  @override
  String get inspCatEngine => 'المحرك والسوائل';

  @override
  String get inspCatWheelsBrakes => 'العجلات والفرامل';

  @override
  String get inspCatLights => 'الإضاءة والكهرباء';

  @override
  String get inspCatSafety => 'السلامة';

  @override
  String get inspCatDrivetrain => 'نظام الدفع';

  @override
  String get inspCatWheelsSteering => 'العجلات والتوجيه';

  @override
  String get inspCatBrakes => 'الفرامل';

  @override
  String get inspCatElectrical => 'الكهرباء';

  @override
  String get inspCatEquipment => 'المعدات';

  @override
  String get inspCar1 => 'مستوى عصا القياس وصفاء زيت المحرك';

  @override
  String get inspCar2 => 'مستوى سائل التبريد في الرادياتير';

  @override
  String get inspCar3 => 'مستوى زيت الفرامل والدبرياج والدركسون';

  @override
  String get inspCar4 => 'ضغط الهواء وعمق نقشات الإطارات الأربعة والاحتياطي';

  @override
  String get inspCar5 => 'حالة تيل الفرامل وقوة فرامل اليد';

  @override
  String get inspCar6 => 'المصابيح الأمامية والفرامل والإشارات والتحذير';

  @override
  String get inspCar7 => 'أطراف البطارية ومؤشر الجهد 12 فولت';

  @override
  String get inspCar8 => 'مساحات الزجاج وسائل الغسيل';

  @override
  String get inspCar9 =>
      'الرافعة ومفتاح العجلات والمثلث التحذيري وحقيبة الإسعافات';

  @override
  String get inspMoto1 => 'مستوى زيت المحرك وحالته';

  @override
  String get inspMoto2 => 'زيت ناقل الحركة النهائي / شد السلسلة';

  @override
  String get inspMoto3 => 'ضغط إطاري الأمام والخلف';

  @override
  String get inspMoto4 => 'سماكة تيل الفرامل الأمامي والخلفي';

  @override
  String get inspMoto5 => 'المصباح الأمامي والخلفي والإشارات';

  @override
  String get inspMoto6 => 'عمل البوق والمشغّل الكهربائي (حالة البطارية)';

  @override
  String get inspMoto7 => 'المرايا الجانبية وحقيبة العدة';

  @override
  String gamesLvl(String level) {
    return 'مستوى $level';
  }

  @override
  String gamesProgress(String xp, String unlocked, String total) {
    return '$xp نقطة خبرة • $unlocked/$total شارة مفتوحة';
  }

  @override
  String gamesNextLevel(String next, String xp) {
    return 'التالي: $next ($xp نقطة)';
  }

  @override
  String get gamesMaxRank => 'أعلى رتبة';

  @override
  String get gamesBadgesTitle => 'شارات انتظام الصيانة';

  @override
  String get gamesShare => 'مشاركة';

  @override
  String get gamesUnlocked => 'مفتوحة (+100 نقطة)';

  @override
  String get gamesLocked => 'لم تُفتح بعد';

  @override
  String gamesBadgeUnlockedLine(String highlight) {
    return 'شارة مفتوحة: $highlight';
  }

  @override
  String get gamesLvl1 => 'سائق مبتدئ';

  @override
  String get gamesLvl2 => 'مالك حريص';

  @override
  String get gamesLvl3 => 'حارس الأسطول';

  @override
  String get gamesLvl4 => 'أخصائي صيانة';

  @override
  String get gamesLvl5 => 'سيد المرآب';

  @override
  String get badgeFirstRideTitle => 'أول مركبة';

  @override
  String get badgeFirstRideDesc => 'سجّلت أول مركبة في المرآب الرقمي.';

  @override
  String get badgeOilCareTitle => 'حارس الزيت';

  @override
  String get badgeOilCareDesc => 'سجّلت تغيير زيت المحرك في موعده.';

  @override
  String get badgeServiceVeteranTitle => 'منتظم في الصيانة';

  @override
  String get badgeServiceVeteranDesc => 'سجّلت 3 عمليات صيانة دورية على الأقل.';

  @override
  String get badgeFuelWatcherTitle => 'متتبع الوقود';

  @override
  String get badgeFuelWatcherDesc =>
      'سجّلت 3 عمليات تعبئة وقود على الأقل لمتابعة الاستهلاك.';

  @override
  String get badgeSafeVoyageTitle => 'مفتش السلامة';

  @override
  String get badgeSafeVoyageDesc => 'أتممت قائمة فحص سلامة المركبة.';

  @override
  String get badgeDocKeeperTitle => 'حافظ المستندات';

  @override
  String get badgeDocKeeperDesc =>
      'حفظت المستندات القانونية للمركبة (الضريبة والرخصة والتأمين).';

  @override
  String get badgePrimeFleetTitle => 'حالة ممتازة';

  @override
  String get badgePrimeFleetDesc => 'وصلت درجة صحة المركبة إلى 90 أو أكثر.';

  @override
  String get badgeRoadWarriorTitle => 'محارب الطريق';

  @override
  String get badgeRoadWarriorDesc => 'تتابع مركبة تجاوز عدّادها 10.000 كم.';

  @override
  String healthOilOverdue(String km) {
    return 'تغيير زيت المحرك متأخر بـ $km كم';
  }

  @override
  String healthOilDue(String km) {
    return 'تغيير زيت المحرك بعد $km كم';
  }

  @override
  String get healthOilOptimal => 'فترة تغيير الزيت مثالية';

  @override
  String get healthTaxOverdue => 'ضريبة المركبة السنوية متأخرة';

  @override
  String healthTaxDue(String days) {
    return 'ضريبة المركبة السنوية مستحقة خلال $days يوماً';
  }

  @override
  String get healthTaxSafe => 'ضريبة المركبة السنوية سارية وآمنة';

  @override
  String get healthPlateExpired => 'انتهت صلاحية اللوحة الخمسية';

  @override
  String healthPlateDue(String days) {
    return 'تجديد اللوحة الخمسية خلال $days يوماً';
  }

  @override
  String healthScheduleOverdue(String title) {
    return '$title متأخر';
  }

  @override
  String healthScheduleDueSoon(String title) {
    return '$title يقترب من موعد الصيانة';
  }

  @override
  String get healthPrime => 'ممتازة';

  @override
  String get healthAttention => 'تحتاج إلى انتباه';

  @override
  String get healthCritical => 'حرجة / صيانة عاجلة';

  @override
  String get fuelEstTotalCost => 'إجمالي التكلفة التقديري:';

  @override
  String get fuelTripDistance => 'مسافة الرحلة:';

  @override
  String get fuelAvgConsumption => 'متوسط الاستهلاك:';

  @override
  String get fuelOperatingCost => 'تكلفة التشغيل:';

  @override
  String get fuelFullTank => 'خزان ممتلئ';

  @override
  String get fuelPartial => 'جزئي';

  @override
  String fuelPricePerLiterLine(String price, String state) {
    return '@ $price / لتر • $state';
  }

  @override
  String fuelOdometerValue(String value) {
    return 'العداد: $value كم';
  }

  @override
  String fuelKmL(String value) {
    return '$value كم/لتر';
  }

  @override
  String get aboutApplication => 'التطبيق';

  @override
  String get aboutVersion => 'الإصدار';

  @override
  String get aboutArchitecture => 'البنية';

  @override
  String get aboutArchitectureValue =>
      'يعمل دون اتصال 100% (بلا خادم ولا تتبع)';

  @override
  String get aboutDomain => 'النطاق';

  @override
  String get aboutPackageId => 'معرّف الحزمة';

  @override
  String settingsVehicleOdo(String plate, String value) {
    return '$plate • العداد: $value كم';
  }

  @override
  String get backupInvalidFile => 'ملف ‎.grg غير صالح أو تالف';

  @override
  String get filterAll => 'الكل';

  @override
  String get filterAttention => 'تحتاج انتباه';

  @override
  String get maintenanceScreenTitle => 'الصيانة والخدمات';

  @override
  String get serviceTitleHint => 'مثال: تغيير زيت المحرك والفلتر';

  @override
  String get workshopHint => 'مثال: وكيل معتمد أو ورشة';

  @override
  String get mustBePositive => 'يجب أن يكون أكبر من 0';

  @override
  String get editScheduleTitle => 'تعديل جدول الصيانة';

  @override
  String get scheduleUpdated => 'تم تحديث الجدول بنجاح!';

  @override
  String get scheduleSaved => 'تم حفظ جدول الصيانة بنجاح!';

  @override
  String get updateSchedule => 'تحديث الجدول';

  @override
  String get saveSchedule => 'حفظ جدول الصيانة';

  @override
  String scheduleCompleted(String title) {
    return 'تم إنجاز $title بنجاح!';
  }

  @override
  String kmOverdue(String km) {
    return 'متأخر $km كم';
  }

  @override
  String kmRemaining(String km) {
    return 'باقٍ $km كم';
  }

  @override
  String kmOverdueShort(String km) {
    return 'متأخر $km كم';
  }

  @override
  String kmRemainingShort(String km) {
    return 'باقٍ $km كم';
  }

  @override
  String daysOverdue(String days) {
    return 'متأخر $days يوماً';
  }

  @override
  String daysLeft(String days) {
    return 'باقٍ $days يوماً';
  }

  @override
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  ) {
    return 'كل $km كم أو $months شهراً • آخر مرة: $odo كم ($date)';
  }

  @override
  String get shareVehiclePassport => 'مشاركة جواز المركبة';

  @override
  String get shareVehiclePassportSubtitle =>
      'شارك بطاقة الحالة ودرجة الصحة والسجل على وسائل التواصل';

  @override
  String get garageEmptyBody =>
      'أضف أول سيارة أو دراجة لعائلتك لبدء متابعة الصيانة والزيت والوقود.';

  @override
  String resetOilConfirm(String name, String odo) {
    return 'سيُعاد ضبط عدّاد تغيير الزيت لـ $name على العداد الحالي ($odo كم).';
  }

  @override
  String get resetOilServiceNote => 'إعادة ضبط عدّاد فترة زيت المحرك';

  @override
  String oilIntervalEvery(String km) {
    return 'الفترة: كل $km كم';
  }

  @override
  String garageYear(String year) {
    return 'سنة الصنع $year';
  }

  @override
  String get shareDialogTitle => 'مشاركة جواز المركبة';

  @override
  String get shareCopySummary => 'نسخ الملخص';

  @override
  String get sharePreparing => 'جارٍ التحضير…';

  @override
  String get shareDownloadPassport => 'تنزيل الجواز';

  @override
  String get shareSharePassport => 'مشاركة الجواز';

  @override
  String get shareImageFailed => 'تعذّر إنشاء صورة جواز المركبة';

  @override
  String get shareImageDownloaded => 'تم تنزيل جواز المركبة';

  @override
  String get shareSummaryCopied => 'تم نسخ ملخص حالة المركبة';

  @override
  String get shareCardHealthHeader => 'حالة صحة الأسطول';

  @override
  String shareCardCondition(String status) {
    return 'الحالة $status';
  }

  @override
  String get shareCardOdometer => 'العداد';

  @override
  String get shareCardOil => 'تغيير الزيت';

  @override
  String get shareCardTax => 'ضريبة المركبة';

  @override
  String get shareCardNeedService => 'يحتاج صيانة';

  @override
  String shareCardDaysShort(String days) {
    return 'باقٍ $days يوم';
  }

  @override
  String shareCardLogbook(String date) {
    return 'السجل: $date';
  }

  @override
  String shareTextHeader(String name, String plate) {
    return '🚗 جواز صيانة المركبة — $name ($plate)';
  }

  @override
  String shareTextHealth(String score, String status) {
    return '🏆 درجة الصحة: $score/100 ($status)';
  }

  @override
  String shareTextOdometer(String odo) {
    return '⚡ العداد: $odo كم';
  }

  @override
  String shareTextOil(String km) {
    return '🛢️ تغيير الزيت بعد $km كم';
  }

  @override
  String get shareTextOilDue => '🛢️ تغيير الزيت مطلوب الآن';

  @override
  String shareTextTax(String days) {
    return '📋 ضريبة المركبة: باقٍ $days يوماً';
  }

  @override
  String get shareTextFooter =>
      'أدر صيانة مرآبك كاملةً دون اتصال في GarageGo: https://garagego.faishal.id';

  @override
  String gloveboxHeader(String name) {
    return 'صندوق المستندات الرقمي — $name';
  }

  @override
  String gloveboxDocCount(String plate, String count) {
    return '$plate • $count مستند مسجل';
  }

  @override
  String docExpiredAgo(String days) {
    return 'انتهت الصلاحية منذ $days يوماً';
  }

  @override
  String docDueIn(String days) {
    return 'مستحق خلال $days يوماً';
  }

  @override
  String docDaysLeft(String days) {
    return 'باقٍ $days يوماً';
  }

  @override
  String docValidUntil(String date) {
    return 'صالح حتى: $date';
  }

  @override
  String get docEditTitle => 'تعديل المستند';

  @override
  String get docAddTitle => 'إضافة مستند للمرآب';

  @override
  String get docTitleHint => 'مثال: الضريبة السنوية / تأمين شامل';

  @override
  String get docNumberHint => 'مثال: B 1234 CD / POL-88902';

  @override
  String get docCostHint => 'مثال: 3500000';

  @override
  String get docNotesLabel => 'ملاحظات وتعليمات التجديد';

  @override
  String get docNotesHint => 'مثال: الدفع إلكترونياً أو زيارة المكتب';

  @override
  String get docUpdated => 'تم تحديث المستند بنجاح!';

  @override
  String get docAdded => 'تمت إضافة المستند بنجاح!';

  @override
  String get docUpdate => 'تحديث المستند';

  @override
  String get docSave => 'حفظ المستند';

  @override
  String get vehicleNameHint => 'مثال: Honda HR-V / Yamaha NMAX';

  @override
  String get plateHint => 'B 1234 CD';

  @override
  String get invalidYear => 'سنة غير صالحة';

  @override
  String get taxDueLabel => 'تاريخ استحقاق الضريبة السنوية';

  @override
  String scheduleDoneNote(String category) {
    return 'أُنجز وفق الجدول الدوري ($category)';
  }

  @override
  String get backupErrEmpty => 'بيانات النسخة الاحتياطية فارغة.';

  @override
  String get backupErrRawJson =>
      'لا يُقبل JSON الخام لأسباب أمنية. استخدم ملف نسخة احتياطية رسمياً.';

  @override
  String get backupErrFormat =>
      'صيغة ملف النسخة الاحتياطية غير صالحة أو غير معروفة.';

  @override
  String backupErrWrongApp(String other, String expected) {
    return 'هذه النسخة تخص تطبيق $other ولا يمكن استعادتها إلى $expected.';
  }

  @override
  String get backupErrCorrupt =>
      'بيانات النسخة الاحتياطية تالفة أو مشفّرة بشكل غير صالح.';

  @override
  String get backupErrIntegrity =>
      'فشل التحقق من سلامة النسخة: البيانات عُدّلت أو تلفت.';

  @override
  String get backupErrNotObject => 'محتوى النسخة ليس كائن بيانات صالحاً.';

  @override
  String get mtCatEngine => 'المحرك';

  @override
  String get mtCatOther => 'أخرى';

  @override
  String get unitMonthsShort => 'شهر';

  @override
  String get docNoteTax =>
      'ادفع عبر تطبيق سامسات الرقمي الوطني (SIGNAL) أو أقرب مكتب سامسات';

  @override
  String get docNotePlate => 'يلزم فحص المركبة ميدانياً في مكتب سامسات الرئيسي';

  @override
  String get docNoteInsurance =>
      'أرقام المطالبات الطارئة أو السحب موجودة في الوثيقة';

  @override
  String gamesBadgeCount(String unlocked, String total) {
    return '$unlocked/$total شارة مفتوحة';
  }
}
