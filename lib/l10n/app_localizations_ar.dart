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
      'يمكن نسخ النسخة الاحتياطية الكاملة لبيانات الكراج والمركبات والجداول أدناه:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'نسخ احتياطي لجميع المركبات وسجلات الصيانة والوقود والجداول';

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
  String get eksporBackupJson => 'تصدير نسخة احتياطية JSON';

  @override
  String get eksporCsvRiwayatBbm => 'تصدير سجلات الوقود CSV';

  @override
  String get eksporCsvRiwayatServis => 'تصدير سجلات الصيانة CSV';

  @override
  String get eksporCadanganJson => 'تصدير نسخة احتياطية JSON';

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
  String get imporPulihkanBackupJson => 'استيراد / استعادة نسخة JSON';

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
      'استعادة البيانات من ملف نسخة احتياطية JSON صالح';

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
  String get pulihkanDariBackupJson => 'استعادة من نسخة JSON';

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
  String get salinanJsonBackupBerhasilDisal =>
      'تم نسخ النسخة الاحتياطية JSON إلى الحافظة بنجاح!';

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
  String get teksJsonTidakBolehKosong => 'نص JSON لا يمكن أن يكون فارغاً!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'الصق نص بيانات النسخة الاحتياطية JSON هنا:';

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
}
