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
}
