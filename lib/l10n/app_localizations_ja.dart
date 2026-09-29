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

  @override
  String get aksiCepat => 'クイック操作';

  @override
  String get aksiCepatGarasi => 'ガレージ・クイック操作';

  @override
  String get aturUlangData => 'データのリセット';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'オイル、フィルター、ブレーキ、消耗品の定期交換リマインダーを設定します。';

  @override
  String get audit10PoinKeselamatanJalanMud => 'ロングドライブ＆日常点検の10項目安全点検';

  @override
  String get auditKelayakanJalanKeselamatan => '遠出や日々の運転前の安全運行基準チェック。';

  @override
  String get bahasaAplikasi => 'アプリの言語';

  @override
  String get batal => 'キャンセル';

  @override
  String get belumAdaCatatanBbm => '給油記録がありません';

  @override
  String get belumAdaDokumenTercatat => '書類が登録されていません';

  @override
  String get belumAdaHasilCeklis => '点検履歴がありません';

  @override
  String get belumAdaJadwalServis => '整備スケジュールがありません';

  @override
  String get belumAdaRiwayatServis => '整備履歴がありません';

  @override
  String get belumAdaCatatanServis => '記録された整備履歴はありません。';

  @override
  String get belumAdaJadwalPerawatanBerkala => '定期点検スケジュールはまだ設定されていません。';

  @override
  String get biayaKm => 'コスト / km';

  @override
  String get biayaTotalRp => '合計費用';

  @override
  String get biayaPerKm => 'kmあたりの費用';

  @override
  String get bukaBrankas => '書類箱を開く';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      '車両、点検、書類、給油を含む全データをクリップボードにコピーできます：';

  @override
  String get cadangkanSeluruhKendaraanServi => '全車両、整備、給油、スケジュールを一括バックアップ';

  @override
  String get cariRiwayatServisAtauBengkel => '整備履歴や整備工場を検索...';

  @override
  String get catatPengisianBbm => '給油を記録';

  @override
  String get catatPengisianPertama => '初回の給油を記録';

  @override
  String get catatServisBaru => '新規整備を記録';

  @override
  String get catatServisPertama => '初回の整備を記録';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'レシートを記録して燃費(km/L)と走行単価を把握しましょう。';

  @override
  String get catatanOpsional => 'メモ (任意)';

  @override
  String get catatanLokasiBerkasFisik => '備考 / 原本の保管場所';

  @override
  String get catatanBbmBerhasilDisimpan => '給油記録を保存しました！';

  @override
  String get catatanPemeriksaOpsional => '点検者メモ (任意)';

  @override
  String get catatanSparepartPengerjaan => '交換部品 / 作業内容';

  @override
  String get catatanServisBerhasilDitambahk => '整備記録を追加しました！';

  @override
  String get catatanTambahanKondisiKendaraa => '車両状態に関する追記メモ...';

  @override
  String get ceklisKondisiKendaraan => '車両状態チェックリスト';

  @override
  String get checklistInspeksiKendaraan => '車両安全点検チェックリスト';

  @override
  String get counterOliBerhasilDiresetKeOdo => 'オイルカウンターを現在の走行距離にリセットしました！';

  @override
  String get daftarKendaraanDiGarasi => 'ガレージの車両一覧';

  @override
  String get daftarMasaBerlakuDokumenLisens => '書類・免許証の有効期限一覧';

  @override
  String get dataCsvBerhasilDisalinKeClipbo => 'CSVデータをクリップボードにコピーしました！';

  @override
  String get dataCadanganBerhasilDipulihkan => 'バックアップからデータを正常に復元しました！';

  @override
  String get dataFormatCsvSiapDieksporKeExc => 'Excelや表計算ソフト用のCSVデータ：';

  @override
  String get dataGarasiBerhasilDiresetKeSta => 'ガレージデータを初期状態にリセットしました。';

  @override
  String get diperlukanUntukAkurasiKalkulas => '正確な燃費(km/L)計算のために必要です';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'デュアルトリガー通知: 走行距離(km)または期間(月)のどちらかに達すると通知されます。';

  @override
  String get eksporBackupJson => 'JSONバックアップ書き出し';

  @override
  String get eksporCsvRiwayatBbm => '給油履歴をCSV書き出し';

  @override
  String get eksporCsvRiwayatServis => '整備履歴をCSV書き出し';

  @override
  String get eksporCadanganJson => 'JSONバックアップ書き出し';

  @override
  String get eksporFormatTabelSpreadsheetUn => '整備工場記録用の表形式CSV書き出し';

  @override
  String get eksporSeluruhPengisianBbmKeFor => '全給油記録をCSVスプレッドシート形式で書き出し';

  @override
  String get estimasiBiayaPremiRp => '概算費用 / 保険料';

  @override
  String get gantiPelat5Th => '車検・ナンバー更新 (5年)';

  @override
  String get garasiMasihKosong => 'ガレージに車両がありません';

  @override
  String get hargaSatuanRpLiter => '給油単価 (/L)';

  @override
  String get hasilCeklisInspeksiBerhasilDis => '点検チェック結果を保存しました！';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi => '燃費(km/L)とガソリン代を自動計算';

  @override
  String get imporPulihkanBackupJson => 'JSONバックアップから復元';

  @override
  String get intervalJarakKm => '距離間隔 (km)';

  @override
  String get intervalOliKm => 'オイル交換間隔 (km)';

  @override
  String get intervalWaktu => '期間間隔';

  @override
  String get isiTangkiPenuhFullTank => '満タン給油ですか？';

  @override
  String get jadwalServisMendatang => '今後の整備予定';

  @override
  String get jenisBahanBakar => '燃料の種類';

  @override
  String get jenisDokumen => '書類の種別';

  @override
  String get judulKeteranganDokumen => '書類名 / 説明';

  @override
  String get kategori => 'カテゴリー:';

  @override
  String get kembalikanDataDariBerkasCadang => '有効なJSONバックアップファイルからデータを復元';

  @override
  String get kilometerOdometerKm => 'オドメーター走行距離 (km)';

  @override
  String get konfirmasiReset => 'リセットの確認';

  @override
  String get konsumsiBbm => '燃費管理';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'タイヤ、ブレーキ、オイル、灯火類、バッテリーの10項目を点検します。';

  @override
  String get lihatSemua => 'すべて表示';

  @override
  String get lisensiPamakean => '利用規約・ライセンス';

  @override
  String get lisensiPanganggo => '利用規約・ライセンス';

  @override
  String get lisensiPenggunaan => '利用規約・ライセンス';

  @override
  String get menghapusSemuaLogServisBbmDanR => 'すべての整備記録、給油記録、車両履歴を消去します';

  @override
  String get mobil => '四輪車';

  @override
  String get mobilAtauMotorKeluargaBaru => '新しいクルマやバイクを追加';

  @override
  String get modeTema => 'テーマ設定';

  @override
  String get motor => '二輪車';

  @override
  String get mulaiCeklis => '点検開始';

  @override
  String get mulaiInspeksiPertama => '初回の点検を開始';

  @override
  String get namaModelKendaraan => '車両名 / 車種';

  @override
  String get namaBengkelToko => '整備工場 / ディーラー名';

  @override
  String get namaBengkelTokoOpsional => '整備工場 / ショップ名 (任意)';

  @override
  String get namaPekerjaanKomponen => '整備内容 / 部品名';

  @override
  String get namaSpbuLokasi => '給油スタンド / 場所';

  @override
  String get nomorDokumenNoPolisNoPolisi => '書類番号 / 保険証券番号 / 車両番号';

  @override
  String get nomorPelatPolisi => 'ナンバープレート番号';

  @override
  String get odometerPengerjaanKm => '作業時の走行距離 (km)';

  @override
  String get odometerSaatIniKm => '現在の走行距離 (km)';

  @override
  String get odometerTerakhirDikerjakanKm => '前回整備時の走行距離 (km)';

  @override
  String get opsiJadwal => 'スケジュール設定';

  @override
  String get pkbTahunan => '年次自動車税';

  @override
  String get pajakStnk => '税金・車検証';

  @override
  String get pajakPkbTahunan => '自動車税種別割';

  @override
  String get pekerjaanServis => '整備・作業内容';

  @override
  String get pelat5Th => 'ナンバー5年更新';

  @override
  String get pengaturanGarasi => 'ガレージ設定';

  @override
  String get penggantianOliMesinResetCounte => 'エンジンオイル交換（カウンターリセット）';

  @override
  String get pilihBahasaSelectLanguage => '言語を選択';

  @override
  String get pilihAtauBuatKendaraanTerlebih => '初めに車両を選択または追加してください。';

  @override
  String get pilihAtauTambahKendaraanTerleb => '初めに車両を選択または追加してください。';

  @override
  String get portabilitasCadanganData => 'データの移行とバックアップ';

  @override
  String get pulihkanData => 'データを復元';

  @override
  String get pulihkanDariBackupJson => 'JSONバックアップから復元';

  @override
  String get rataRataEfisiensi => '平均燃費';

  @override
  String get rekorIritTerbaik => '最高燃費記録';

  @override
  String get resetCounterOliMesin => 'オイルカウンターをリセット';

  @override
  String get resetDataGarasi => 'ガレージデータを初期化';

  @override
  String get resetOli => 'オイルをリセット';

  @override
  String get resetSeluruhData => 'すべてのデータを初期化しますか？';

  @override
  String get rincianPartYangDiganti => '交換した部品や整備の詳細...';

  @override
  String get riwayatLengkap => '全履歴';

  @override
  String get riwayatPengisianBahanBakar => '給油履歴一覧';

  @override
  String get salinCsv => 'CSVをコピー';

  @override
  String get salinKeClipboard => 'クリップボードにコピー';

  @override
  String get salinanJsonBackupBerhasilDisal => 'JSONバックアップをクリップボードにコピーしました！';

  @override
  String get servisTerakhir => '直近の整備';

  @override
  String get setPengingatBerkalaGantiPartKm => '走行距離または月数で定期点検リマインダーを設定';

  @override
  String get simpan => '保存';

  @override
  String get simpanAuditInspeksi => '点検結果を保存';

  @override
  String get simpanKeGarasi => 'ガレージに保存';

  @override
  String get simpanRiwayatBengkelDanGantiOl => 'ショップ履歴とオイル交換を記録';

  @override
  String get simpanTanggalJatuhTempoStnkAsu => '車検、自動車税、保険の満期日を安全に保管します。';

  @override
  String get statusOliMesin => 'エンジンオイルの状態';

  @override
  String get tahunPembuatan => '年式（製造年）';

  @override
  String get tambahDokumen => '書類を追加';

  @override
  String get tambahDokumenPertama => '最初の書類を追加';

  @override
  String get tambahJadwalBaru => '新規スケジュールを追加';

  @override
  String get tambahJadwalPerawatan => '点検スケジュールを追加';

  @override
  String get tambahKendaraan => '車両を追加';

  @override
  String get tambahKendaraanBaru => '新規車両を追加';

  @override
  String get tampilanBahasa => '外観と言語';

  @override
  String get tandaiSelesai => '完了にする';

  @override
  String get tandaiSelesaiReset => '完了にしてリセット';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      '完了にするとインターバルカウンターがリセットされ、整備履歴に自動記録されます。';

  @override
  String get tanggalMasaBerlakuJatuhTempo => '有効期限 / 満了日';

  @override
  String get tanggalTerakhirDikerjakan => '前回実施日';

  @override
  String get teksJsonTidakBolehKosong => 'JSONテキストが空です！';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      '以前書き出したJSONバックアップデータをここに貼り付けてください：';

  @override
  String get tentangAplikasiLisensi => 'アプリについて & ライセンス';

  @override
  String get termasukGantiOli => 'オイル交換を含める';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'この操作を行うとすべての記録が消去され、初期サンプルデータに戻ります。';

  @override
  String get totalBiayaRp => '合計費用';

  @override
  String get totalBiayaTco => '総保有コスト (TCO)';

  @override
  String get totalBiayaBengkel => '整備費用合計';

  @override
  String get totalBiayaKepemilikanTco => '総保有コスト (TCO)';

  @override
  String get totalPengeluaranBbm => '給油代合計';

  @override
  String get tutup => '閉じる';

  @override
  String get ubah => '編集';

  @override
  String get volumeLiterKwh => '給油・充電量 (L / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'バックアップの復元に失敗しました: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 => '例: 2026年度 自動車税';

  @override
  String get hintPlatB1234 => '品川 500 あ 12-34';

  @override
  String get misalStnkDiDompet => '例: 車検証は車内、自賠責証明書はファイル保管';

  @override
  String get misalKurasMinyakRem => '例: ブレーキフルード DOT4 全量交換';

  @override
  String selesaikanJadwal(String title) {
    return '完了: $title';
  }

  @override
  String jadwalCount(String count) {
    return 'スケジュール ($count)';
  }

  @override
  String riwayatCount(String count) {
    return '履歴 ($count)';
  }

  @override
  String inspeksiCount(String count) {
    return '点検 ($count)';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return '$label の標準推奨プランを読み込みました！';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'メーカー標準プランを読み込む ($label)';
  }

  @override
  String odometerValue(String odo) {
    return '走行距離: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return '車両 $name をガレージに追加しました！';
  }
}
