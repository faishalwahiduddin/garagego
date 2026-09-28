// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => '车辆车库、保养与燃油管理';

  @override
  String get settings => '设置';

  @override
  String get appearance => '外观';

  @override
  String get theme => '主题';

  @override
  String get language => '语言';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get selectTheme => '选择主题';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get localeIndonesian => '印度尼西亚语';

  @override
  String get localeEnglish => '英语';

  @override
  String get localeArabic => '阿拉伯语';

  @override
  String get localeJavanese => '爪哇语';

  @override
  String get localeSundanese => '巽他语';

  @override
  String get localeChinese => '中文';

  @override
  String get localeJapanese => '日语';

  @override
  String get localeSpanish => '西班牙语';

  @override
  String get about => '关于';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get edit => '编辑';

  @override
  String get add => '添加';

  @override
  String get search => '搜索';

  @override
  String get filter => '筛选';

  @override
  String get reset => '重置';

  @override
  String get confirm => '确认';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get close => '关闭';

  @override
  String get navGarage => '车库';

  @override
  String get navMaintenance => '保养';

  @override
  String get navFuel => '燃油';

  @override
  String get navGlovebox => '手套箱';

  @override
  String get navSettings => '设置';

  @override
  String get vehiclesTitle => '车库中的车辆';

  @override
  String get addVehicle => '添加车辆';

  @override
  String get editVehicle => '编辑车辆';

  @override
  String get vehicleName => '车辆名称';

  @override
  String get plateNumber => '车牌号';

  @override
  String get odometer => '里程表 (km)';

  @override
  String get car => '汽车';

  @override
  String get motorcycle => '摩托车';

  @override
  String get vehicleType => '车辆类型';

  @override
  String get brand => '品牌 / 制造商';

  @override
  String get modelYear => '出厂年份';

  @override
  String get fuelType => '燃油类型';

  @override
  String get oilCapacity => '机油容量 (L)';

  @override
  String get activeVehicle => '当前活跃车辆';

  @override
  String get setActive => '设为当前';

  @override
  String get noVehicles => '车库中暂无车辆';

  @override
  String get maintenanceTitle => '保养记录与计划';

  @override
  String get addServiceLog => '添加保养记录';

  @override
  String get serviceDate => '保养日期';

  @override
  String get serviceCost => '保养费用';

  @override
  String get workshop => '维修厂 / 4S店';

  @override
  String get notes => '备注';

  @override
  String get isOilChange => '更换发动机机油';

  @override
  String get serviceSchedule => '定期保养计划';

  @override
  String get addSchedule => '添加计划';

  @override
  String get oilLifeRemaining => '剩余机油寿命';

  @override
  String get oilResetSuccess => '机油里程已重置为当前里程！';

  @override
  String get noServiceLogs => '暂无保养记录';

  @override
  String get noSchedules => '暂无定期保养计划';

  @override
  String get inspectionChecklist => '车辆检查清单';

  @override
  String get startInspection => '开始检查';

  @override
  String get fuelTitle => '加油记录';

  @override
  String get addFuelLog => '记录加油';

  @override
  String get liters => '加油量 (升)';

  @override
  String get totalCost => '总费用';

  @override
  String get pricePerLiter => '每升单价';

  @override
  String get fullTank => '加满';

  @override
  String get gasStation => '加油站';

  @override
  String get fuelEfficiency => '平均百公里油耗';

  @override
  String get costPerKm => '每公里成本';

  @override
  String get noFuelLogs => '暂无加油记录';

  @override
  String get gloveboxTitle => '证件手套箱与保险';

  @override
  String get addDocument => '添加证件';

  @override
  String get stnkTaxExpiry => '年检税费到期日';

  @override
  String get stnk5YearExpiry => '车牌五年换发到期日';

  @override
  String get simExpiry => '驾驶证到期日';

  @override
  String get insuranceExpiry => '车辆保险到期日';

  @override
  String daysRemaining(Object count) {
    return '剩余 $count 天';
  }

  @override
  String get expired => '已过期';

  @override
  String get noDocuments => '暂无登记证件';

  @override
  String get dataManagement => '数据与备份管理';

  @override
  String get exportBackup => '导出备份 (JSON)';

  @override
  String get importBackup => '恢复备份 (JSON)';

  @override
  String get exportCsv => '导出为 CSV';

  @override
  String get resetAllData => '重置所有数据';

  @override
  String get privacyNotice => '所有数据100%保存在本地设备上，无云端服务器。';
}
