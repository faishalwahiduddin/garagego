// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => '車両ガレージ・整備・給油マネージャー';

  @override
  String get settings => '設定';

  @override
  String get appearance => '外観';

  @override
  String get theme => 'テーマ';

  @override
  String get language => '言語';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeSystem => 'システム準拠';

  @override
  String get selectTheme => 'テーマを選択';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get localeIndonesian => 'インドネシア語';

  @override
  String get localeEnglish => '英語';

  @override
  String get localeArabic => 'アラビア語';

  @override
  String get localeJavanese => 'ジャワ語';

  @override
  String get localeSundanese => 'スンダ語';

  @override
  String get localeChinese => '中国語';

  @override
  String get localeJapanese => '日本語';

  @override
  String get localeSpanish => 'スペイン語';

  @override
  String get about => 'アプリについて';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get add => '追加';

  @override
  String get search => '検索';

  @override
  String get filter => 'フィルター';

  @override
  String get reset => 'リセット';

  @override
  String get confirm => '確認';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get close => '閉じる';

  @override
  String get navGarage => 'ガレージ';

  @override
  String get navMaintenance => '整備';

  @override
  String get navFuel => '給油';

  @override
  String get navGlovebox => '書類入れ';

  @override
  String get navSettings => '設定';

  @override
  String get vehiclesTitle => 'ガレージの車両一覧';

  @override
  String get addVehicle => '車両を追加';

  @override
  String get editVehicle => '車両を編集';

  @override
  String get vehicleName => '車両名';

  @override
  String get plateNumber => 'ナンバープレート';

  @override
  String get odometer => '走行距離 (km)';

  @override
  String get car => '自動車';

  @override
  String get motorcycle => 'バイク';

  @override
  String get vehicleType => '車両タイプ';

  @override
  String get brand => 'メーカー / ブランド';

  @override
  String get modelYear => '年式';

  @override
  String get fuelType => '燃料タイプ';

  @override
  String get oilCapacity => 'オイル容量 (L)';

  @override
  String get activeVehicle => '選択中の車両';

  @override
  String get setActive => 'メインに設定';

  @override
  String get noVehicles => 'ガレージに車両が登録されていません';

  @override
  String get maintenanceTitle => '整備記録と予定';

  @override
  String get addServiceLog => '整備記録を追加';

  @override
  String get serviceDate => '整備日';

  @override
  String get serviceCost => '整備費用';

  @override
  String get workshop => '整備工場 / ディーラー';

  @override
  String get notes => 'メモ';

  @override
  String get isOilChange => 'エンジンオイル交換';

  @override
  String get serviceSchedule => '定期点検スケジュール';

  @override
  String get addSchedule => '予定を追加';

  @override
  String get oilLifeRemaining => 'オイル残寿命';

  @override
  String get oilResetSuccess => 'オイル交換メーターを現在の走行距離にリセットしました！';

  @override
  String get noServiceLogs => '整備記録がありません';

  @override
  String get noSchedules => '定期点検予定がありません';

  @override
  String get inspectionChecklist => '運行前点検チェックリスト';

  @override
  String get startInspection => '点検を開始';

  @override
  String get fuelTitle => '給油記録';

  @override
  String get addFuelLog => '給油を記録';

  @override
  String get liters => '給油量 (L)';

  @override
  String get totalCost => '合計金額';

  @override
  String get pricePerLiter => 'リッター単価';

  @override
  String get fullTank => '満タン';

  @override
  String get gasStation => 'ガソリンスタンド';

  @override
  String get fuelEfficiency => '平均燃費';

  @override
  String get costPerKm => '走行キロあたりコスト';

  @override
  String get noFuelLogs => '給油記録がありません';

  @override
  String get gloveboxTitle => '車検証・保険書類';

  @override
  String get addDocument => '書類を追加';

  @override
  String get stnkTaxExpiry => '自動車税納期限';

  @override
  String get stnk5YearExpiry => '車検満了日';

  @override
  String get simExpiry => '運転免許証有効期限';

  @override
  String get insuranceExpiry => '任意保険満了日';

  @override
  String daysRemaining(Object count) {
    return '残り $count 日';
  }

  @override
  String get expired => '期限切れ';

  @override
  String get noDocuments => '登録された書類はありません';

  @override
  String get dataManagement => 'データ・バックアップ管理';

  @override
  String get exportBackup => 'バックアップを出力 (JSON)';

  @override
  String get importBackup => 'バックアップを復元 (JSON)';

  @override
  String get exportCsv => 'CSV形式で出力';

  @override
  String get resetAllData => 'すべてのデータをリセット';

  @override
  String get privacyNotice => 'データはお使いのデバイスに100%安全にローカル保存されます。';
}
