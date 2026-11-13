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
  String get exportBackup => 'バックアップを書き出し (.grg)';

  @override
  String get importBackup => 'バックアップを復元 (.grg)';

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
      '車両・予定・書類・燃料ログを含む .grg バックアップを共有します。';

  @override
  String get cadangkanSeluruhKendaraanServi => '車両・整備・燃料・予定を .grg ファイルとして共有';

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
  String get eksporBackupJson => 'バックアップを書き出し (.grg)';

  @override
  String get eksporCsvRiwayatBbm => '給油履歴をCSV書き出し';

  @override
  String get eksporCsvRiwayatServis => '整備履歴をCSV書き出し';

  @override
  String get eksporCadanganJson => 'バックアップを書き出し (.grg)';

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
  String get imporPulihkanBackupJson => 'バックアップを読み込み / 復元 (.grg)';

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
  String get kembalikanDataDariBerkasCadang => '有効な .grg バックアップからデータを復元';

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
  String get pulihkanDariBackupJson => 'ファイルから復元 (.grg)';

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
  String get salinanJsonBackupBerhasilDisal => '.grg バックアップを共有できます！';

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
  String get teksJsonTidakBolehKosong => 'バックアップファイルは空にできません！';

  @override
  String get tempelkanTeksDataJsonCadanganY => '以前書き出した .grg バックアップを選んでください。';

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

  @override
  String get timezone => 'タイムゾーン';

  @override
  String get timezoneAuto => '自動（デバイスに準拠）';

  @override
  String get licenseUsageTitle => '利用規約・ライセンス';

  @override
  String get licenseUsageNotice => '個人および非営利目的での利用は無料です。';

  @override
  String get licenseUsageBadgeText => '個人・非営利';

  @override
  String get validationVehicleNameRequired => '車両名を入力してください';

  @override
  String get validationVehicleNameMinLength => '車両名は2文字以上で入力してください';

  @override
  String get validationVehicleNameMaxLength => '車両名は50文字以内で入力してください';

  @override
  String get validationPlateRequired => 'ナンバープレート番号を入力してください';

  @override
  String get validationPlateMaxLength => 'ナンバープレートは15文字以内で入力してください';

  @override
  String get validationOdometerNegative => '走行距離は0以上で入力してください';

  @override
  String get validationOdometerTooHigh => '走行距離が一般的な上限を超えています';

  @override
  String get validationOdometerLessThanPrevious => '前回の走行距離より小さい値は登録できません';

  @override
  String get validationCostNegative => '費用は0以上で入力してください';

  @override
  String get validationFuelLitersPositive => '給油量は0Lより大きい値を入力してください';

  @override
  String get validationFuelLitersTooHigh => '給油量がタンク容量の妥当な上限を超えています';

  @override
  String get validationServiceNameRequired => 'サービス名を入力してください';

  @override
  String get validationDocNameRequired => '書類名を入力してください';

  @override
  String get appTitle => 'GarageGo';

  @override
  String get appTagline => '整備・オイル・給油・税金をひとつのガレージに';

  @override
  String get loadingLabel => '読み込み中…';

  @override
  String get onbSkip => 'スキップ';

  @override
  String get onbNext => '次へ';

  @override
  String get onbGetStarted => 'はじめる';

  @override
  String get onbPrivacyHeadline => 'プライバシー重視・オフライン';

  @override
  String get onbPrivacyDetail => '車両データはすべて端末内に保存され、トラッカーはありません。';

  @override
  String get onbSlide1Title => 'あなたのガレージ';

  @override
  String get onbSlide1Sub => 'クルマもバイクも一か所に';

  @override
  String get onbSlide1Badge => '100% オフライン・プライベート';

  @override
  String get onbSlide2Title => 'メンテナンス';

  @override
  String get onbSlide2Sub => '整備・オイル・自動車税';

  @override
  String get onbSlide2Badge => '定期リマインダー';

  @override
  String get onbSlide3Title => '給油';

  @override
  String get onbSlide3Sub => 'km/L 燃費と 1km あたりのコスト';

  @override
  String get onbSlide3Badge => '広告なし・アカウント不要';

  @override
  String get onbSlide4Title => 'オフラインでプライベート';

  @override
  String get onbSlide4Sub => 'データは端末内に保存';

  @override
  String get onbSlide4Badge => 'データは端末に保存';

  @override
  String get urgencySafe => '良好';

  @override
  String get urgencyDueSoon => 'まもなく';

  @override
  String get urgencyOverdue => '期限超過';

  @override
  String get docTypeTax => '自動車税（年額）';

  @override
  String get docTypePlate => '5年ごとのナンバー・車検証更新';

  @override
  String get docTypeInsurance => '任意保険';

  @override
  String get docTypeEmissions => '排出ガス検査・車検';

  @override
  String get docTypeLicense => '運転免許証';

  @override
  String get docTypeTitle => '車両所有権証明書';

  @override
  String get docTypeOther => 'その他の書類';

  @override
  String get mtCatOilFluids => 'オイル・油脂';

  @override
  String get mtCatOilFilter => 'オイル・フィルター';

  @override
  String get mtCatAirFilter => 'エアコン・エアフィルター';

  @override
  String get mtCatBrakes => 'ブレーキ';

  @override
  String get mtCatTires => 'タイヤ・サスペンション';

  @override
  String get mtCatIgnition => '点火系';

  @override
  String get mtCatTransmission => 'トランスミッション・駆動系';

  @override
  String get mtCatCvt => 'CVT トランスミッション';

  @override
  String get mtCatElectrical => '電装・バッテリー';

  @override
  String get mtCatCoolant => '冷却液・ラジエーター';

  @override
  String get mtCatGeneral => '定期整備';

  @override
  String get mtPresetCarOil => '合成エンジンオイル交換';

  @override
  String get mtPresetCarOilFilter => 'オイルフィルター交換';

  @override
  String get mtPresetCarAirFilter => 'エアフィルター・エアコンフィルター';

  @override
  String get mtPresetCarBrakeFluid => 'ブレーキフルード・パッド交換';

  @override
  String get mtPresetCarTireRotation => 'タイヤローテーション・アライメント';

  @override
  String get mtPresetCarSparkPlugs => 'イリジウムプラグ交換';

  @override
  String get mtPresetMotoOil => 'バイクのエンジンオイル交換';

  @override
  String get mtPresetMotoGearOil => 'ファイナルギアオイル交換';

  @override
  String get mtPresetMotoCvt => 'CVT 整備・Vベルト・ローラー';

  @override
  String get mtPresetMotoBrakes => 'ブレーキパッド点検・交換';

  @override
  String get mtPresetMotoSparkPlug => 'バイクのプラグ交換';

  @override
  String inspPreTripTitle(String type) {
    return '出発前点検（$type）';
  }

  @override
  String inspRoadworthiness(String passed, String total) {
    return '適合度：$total 項目中 $passed 項目合格';
  }

  @override
  String inspPassedCount(String pct, String passed, String total) {
    return '$pct% 合格（$passed/$total）';
  }

  @override
  String get inspCatEngine => 'エンジン・油脂';

  @override
  String get inspCatWheelsBrakes => 'ホイール・ブレーキ';

  @override
  String get inspCatLights => 'ライト・電装';

  @override
  String get inspCatSafety => '安全装備';

  @override
  String get inspCatDrivetrain => '駆動系';

  @override
  String get inspCatWheelsSteering => 'ホイール・ステアリング';

  @override
  String get inspCatBrakes => 'ブレーキ';

  @override
  String get inspCatElectrical => '電装';

  @override
  String get inspCatEquipment => '装備品';

  @override
  String get inspCar1 => 'オイルレベルゲージとオイルの清浄度';

  @override
  String get inspCar2 => 'ラジエーター冷却液の量';

  @override
  String get inspCar3 => 'ブレーキ・クラッチ・パワステオイルの量';

  @override
  String get inspCar4 => '4本＋スペアの空気圧と溝の深さ';

  @override
  String get inspCar5 => 'ブレーキパッドの状態とサイドブレーキの効き';

  @override
  String get inspCar6 => 'ヘッドライト・ブレーキランプ・ウインカー・ハザード';

  @override
  String get inspCar7 => 'バッテリー端子と 12V 電圧表示';

  @override
  String get inspCar8 => 'ワイパーゴムとウォッシャー液の量';

  @override
  String get inspCar9 => 'ジャッキ・ホイールレンチ・三角表示板・救急箱';

  @override
  String get inspMoto1 => 'エンジンオイルの量と状態';

  @override
  String get inspMoto2 => 'ファイナルギアオイル／チェーンの張り';

  @override
  String get inspMoto3 => '前後タイヤの空気圧';

  @override
  String get inspMoto4 => '前後ブレーキパッドの厚さ';

  @override
  String get inspMoto5 => 'ヘッドライト・テールランプ・ウインカー';

  @override
  String get inspMoto6 => 'ホーンとセルスターターの作動（バッテリー状態）';

  @override
  String get inspMoto7 => '左右のミラーと車載工具';

  @override
  String gamesLvl(String level) {
    return 'レベル$level';
  }

  @override
  String gamesProgress(String xp, String unlocked, String total) {
    return '$xp XP・バッジ $unlocked/$total 個解除';
  }

  @override
  String gamesNextLevel(String next, String xp) {
    return '次へ：$next（$xp XP）';
  }

  @override
  String get gamesMaxRank => '最高ランク到達';

  @override
  String get gamesBadgesTitle => 'ガレージ整備バッジ';

  @override
  String get gamesShare => '共有';

  @override
  String get gamesUnlocked => '解除済み（+100 XP）';

  @override
  String get gamesLocked => '未解除';

  @override
  String gamesBadgeUnlockedLine(String highlight) {
    return '解除したバッジ：$highlight';
  }

  @override
  String get gamesLvl1 => '駆け出しドライバー';

  @override
  String get gamesLvl2 => 'こまめなオーナー';

  @override
  String get gamesLvl3 => 'フリートの守護者';

  @override
  String get gamesLvl4 => '整備の専門家';

  @override
  String get gamesLvl5 => 'ガレージの達人';

  @override
  String get badgeFirstRideTitle => '記念すべき1台目';

  @override
  String get badgeFirstRideDesc => 'デジタルガレージに最初の車両を登録しました。';

  @override
  String get badgeOilCareTitle => 'オイル番';

  @override
  String get badgeOilCareDesc => 'エンジンオイル交換を期限内に記録しました。';

  @override
  String get badgeServiceVeteranTitle => '定期整備の常連';

  @override
  String get badgeServiceVeteranDesc => '定期整備を3回以上記録しました。';

  @override
  String get badgeFuelWatcherTitle => '燃費トラッカー';

  @override
  String get badgeFuelWatcherDesc => '給油を3回以上記録して燃費を把握しました。';

  @override
  String get badgeSafeVoyageTitle => '安全点検の達人';

  @override
  String get badgeSafeVoyageDesc => '車両の安全点検チェックリストを完了しました。';

  @override
  String get badgeDocKeeperTitle => '書類の管理人';

  @override
  String get badgeDocKeeperDesc => '車両の法定書類（車検証・税・免許・保険）を保存しました。';

  @override
  String get badgePrimeFleetTitle => '良好なコンディション';

  @override
  String get badgePrimeFleetDesc => '車両健康スコア 90 以上を達成しました。';

  @override
  String get badgeRoadWarriorTitle => 'ロードウォリアー';

  @override
  String get badgeRoadWarriorDesc => '走行距離 10,000km 超の車両を記録しました。';

  @override
  String healthOilOverdue(String km) {
    return 'オイル交換が $km km 超過しています';
  }

  @override
  String healthOilDue(String km) {
    return 'オイル交換まであと $km km';
  }

  @override
  String get healthOilOptimal => 'オイル交換時期は良好です';

  @override
  String get healthTaxOverdue => '自動車税が期限を過ぎています';

  @override
  String healthTaxDue(String days) {
    return '自動車税の期限まであと $days 日';
  }

  @override
  String get healthTaxSafe => '自動車税は有効期限内です';

  @override
  String get healthPlateExpired => '5年ナンバーの有効期限が切れています';

  @override
  String healthPlateDue(String days) {
    return '5年ナンバーの更新まであと $days 日';
  }

  @override
  String healthScheduleOverdue(String title) {
    return '$title が期限超過です';
  }

  @override
  String healthScheduleDueSoon(String title) {
    return '$title の時期が近づいています';
  }

  @override
  String get healthPrime => 'とても良好';

  @override
  String get healthAttention => '要注意';

  @override
  String get healthCritical => '深刻 / 早めの整備を';

  @override
  String get fuelEstTotalCost => '推定合計金額：';

  @override
  String get fuelTripDistance => '今回の走行距離：';

  @override
  String get fuelAvgConsumption => '平均燃費：';

  @override
  String get fuelOperatingCost => '運行コスト：';

  @override
  String get fuelFullTank => '満タン';

  @override
  String get fuelPartial => '一部給油';

  @override
  String fuelPricePerLiterLine(String price, String state) {
    return '@ $price/L・$state';
  }

  @override
  String fuelOdometerValue(String value) {
    return '走行距離：$value km';
  }

  @override
  String fuelKmL(String value) {
    return '$value km/ℓ';
  }

  @override
  String get aboutApplication => 'アプリ';

  @override
  String get aboutVersion => 'バージョン';

  @override
  String get aboutArchitecture => 'アーキテクチャ';

  @override
  String get aboutArchitectureValue => '100% オフラインファースト（サーバーなし・追跡なし）';

  @override
  String get aboutDomain => 'ドメイン';

  @override
  String get aboutPackageId => 'パッケージ ID';

  @override
  String settingsVehicleOdo(String plate, String value) {
    return '$plate・走行距離：$value km';
  }

  @override
  String get backupInvalidFile => '.grg ファイルが無効、または構造が壊れています';

  @override
  String get filterAll => 'すべて';

  @override
  String get filterAttention => '要注意';

  @override
  String get maintenanceScreenTitle => 'メンテナンス・整備';

  @override
  String get serviceTitleHint => '例：エンジンオイルとフィルター交換';

  @override
  String get workshopHint => '例：正規ディーラー／整備工場';

  @override
  String get mustBePositive => '0 より大きい値を入力してください';

  @override
  String get editScheduleTitle => '整備予定を編集';

  @override
  String get scheduleUpdated => '予定を更新しました';

  @override
  String get scheduleSaved => '整備予定を保存しました';

  @override
  String get updateSchedule => '予定を更新';

  @override
  String get saveSchedule => '整備予定を保存';

  @override
  String scheduleCompleted(String title) {
    return '$title を完了しました';
  }

  @override
  String kmOverdue(String km) {
    return '$km km 超過';
  }

  @override
  String kmRemaining(String km) {
    return '残り $km km';
  }

  @override
  String kmOverdueShort(String km) {
    return '$km km 超過';
  }

  @override
  String kmRemainingShort(String km) {
    return '残り $km km';
  }

  @override
  String daysOverdue(String days) {
    return '$days 日超過';
  }

  @override
  String daysLeft(String days) {
    return '残り $days 日';
  }

  @override
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  ) {
    return '$km km または $months か月ごと・前回：$odo km（$date）';
  }

  @override
  String get shareVehiclePassport => '車両パスポートを共有';

  @override
  String get shareVehiclePassportSubtitle => 'ステータスカード・健康スコア・履歴を SNS へ共有';

  @override
  String get garageEmptyBody => '家族の最初のクルマかバイクを追加して、整備・オイル・給油の記録を始めましょう。';

  @override
  String resetOilConfirm(String name, String odo) {
    return '$name のオイル交換カウンターを現在の走行距離（$odo km）にリセットします。';
  }

  @override
  String get resetOilServiceNote => 'オイル交換間隔カウンターをリセット';

  @override
  String oilIntervalEvery(String km) {
    return '交換間隔：$km km ごと';
  }

  @override
  String garageYear(String year) {
    return '$year 年式';
  }

  @override
  String get shareDialogTitle => '車両パスポートを共有';

  @override
  String get shareCopySummary => '要約をコピー';

  @override
  String get sharePreparing => '準備中…';

  @override
  String get shareDownloadPassport => 'パスポートを保存';

  @override
  String get shareSharePassport => 'パスポートを共有';

  @override
  String get shareImageFailed => '車両パスポート画像を作成できませんでした';

  @override
  String get shareImageDownloaded => '車両パスポートを保存しました';

  @override
  String get shareSummaryCopied => '車両ステータスの要約をコピーしました';

  @override
  String get shareCardHealthHeader => 'フリートの健康状態';

  @override
  String shareCardCondition(String status) {
    return '状態：$status';
  }

  @override
  String get shareCardOdometer => '走行距離';

  @override
  String get shareCardOil => 'オイル交換';

  @override
  String get shareCardTax => '自動車税';

  @override
  String get shareCardNeedService => '整備が必要';

  @override
  String shareCardDaysShort(String days) {
    return '$days 日';
  }

  @override
  String shareCardLogbook(String date) {
    return 'ログ：$date';
  }

  @override
  String shareTextHeader(String name, String plate) {
    return '🚗 車両メンテナンスパスポート — $name（$plate）';
  }

  @override
  String shareTextHealth(String score, String status) {
    return '🏆 健康スコア：$score/100（$status）';
  }

  @override
  String shareTextOdometer(String odo) {
    return '⚡ 走行距離：$odo km';
  }

  @override
  String shareTextOil(String km) {
    return '🛢️ オイル交換まで $km km';
  }

  @override
  String get shareTextOilDue => '🛢️ 至急オイル交換が必要です';

  @override
  String shareTextTax(String days) {
    return '📋 自動車税：残り $days 日';
  }

  @override
  String get shareTextFooter =>
      'GarageGo ならガレージ整備をオフラインで管理できます：https://garagego.faishal.id';

  @override
  String gloveboxHeader(String name) {
    return 'デジタル・グローブボックス — $name';
  }

  @override
  String gloveboxDocCount(String plate, String count) {
    return '$plate・書類 $count 件登録';
  }

  @override
  String docExpiredAgo(String days) {
    return '$days 日前に期限切れ';
  }

  @override
  String docDueIn(String days) {
    return 'あと $days 日で期限';
  }

  @override
  String docDaysLeft(String days) {
    return '残り $days 日';
  }

  @override
  String docValidUntil(String date) {
    return '有効期限：$date';
  }

  @override
  String get docEditTitle => '書類を編集';

  @override
  String get docAddTitle => 'ガレージ書類を追加';

  @override
  String get docTitleHint => '例：自動車税／オールリスク保険';

  @override
  String get docNumberHint => '例：B 1234 CD / POL-88902';

  @override
  String get docCostHint => '例：3500000';

  @override
  String get docNotesLabel => 'メモ・更新の手引き';

  @override
  String get docNotesHint => '例：オンライン決済、または窓口へ';

  @override
  String get docUpdated => '書類を更新しました';

  @override
  String get docAdded => '書類を追加しました';

  @override
  String get docUpdate => '書類を更新';

  @override
  String get docSave => '書類を保存';

  @override
  String get vehicleNameHint => '例：Honda HR-V／Yamaha NMAX';

  @override
  String get plateHint => 'B 1234 CD';

  @override
  String get invalidYear => '年式が正しくありません';

  @override
  String get taxDueLabel => '自動車税の納期限';

  @override
  String scheduleDoneNote(String category) {
    return '定期予定どおり完了（$category）';
  }

  @override
  String get backupErrEmpty => 'バックアップデータが空です。';

  @override
  String get backupErrRawJson => '安全のため生の JSON は使用できません。公式のバックアップファイルをご利用ください。';

  @override
  String get backupErrFormat => 'バックアップファイルの形式が無効、または認識できません。';

  @override
  String backupErrWrongApp(String other, String expected) {
    return 'このバックアップは $other のもので、$expected には復元できません。';
  }

  @override
  String get backupErrCorrupt => 'バックアップデータが破損しているか、エンコードが不正です。';

  @override
  String get backupErrIntegrity => 'バックアップの整合性チェックに失敗しました。データが改変または破損しています。';

  @override
  String get backupErrNotObject => 'バックアップの中身が有効なデータオブジェクトではありません。';

  @override
  String get mtCatEngine => 'エンジン';

  @override
  String get mtCatOther => 'その他';

  @override
  String get unitMonthsShort => 'か月';

  @override
  String get docNoteTax =>
      'Samsat Digital（SIGNAL）アプリ、または最寄りの Samsat 窓口で納付してください';

  @override
  String get docNotePlate => 'Samsat 本所での実車確認が必要です';

  @override
  String get docNoteInsurance => '緊急連絡先とロードサービス番号は保険証券に記載されています';

  @override
  String gamesBadgeCount(String unlocked, String total) {
    return 'バッジ $unlocked/$total 個解除';
  }

  @override
  String get demoServiceTitle => '定期点検と5W-30合成オイル交換';

  @override
  String get demoServiceNotes => '正規ワークショップでオイルフィルターとエアコンフィルターを交換';

  @override
  String get demoRotationTitle => 'タイヤローテーションとホイールアライメント';

  @override
  String get demoRotationNotes => 'タイヤ空気圧を窒素で33 psiに調整';

  @override
  String get demoInspectionTitle => 'ロードトリップ前の総合点検';

  @override
  String get demoInspectionNotes => '車両の状態は非常に良好で、タイヤ空気圧とエンジンオイルも理想的です。';
}
