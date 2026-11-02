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
  String get exportBackup => '导出备份 (.grg)';

  @override
  String get importBackup => '恢复备份 (.grg)';

  @override
  String get exportCsv => '导出为 CSV';

  @override
  String get resetAllData => '重置所有数据';

  @override
  String get privacyNotice => '所有数据100%保存在本地设备上，无云端服务器。';

  @override
  String get aksiCepat => '快捷操作';

  @override
  String get aksiCepatGarasi => '车库快捷操作';

  @override
  String get aturUlangData => '重置数据';

  @override
  String get aturPengingatGantiOliFilterRem => '设置机油、滤清器、刹车片和配件的定期保养提醒。';

  @override
  String get audit10PoinKeselamatanJalanMud => '长途出行与日常通勤的10项安全检查';

  @override
  String get auditKelayakanJalanKeselamatan => '出行或日常驾驶前的安全与适航性检查。';

  @override
  String get bahasaAplikasi => '应用语言';

  @override
  String get batal => '取消';

  @override
  String get belumAdaCatatanBbm => '暂无加油记录';

  @override
  String get belumAdaDokumenTercatat => '暂无登记证件';

  @override
  String get belumAdaHasilCeklis => '暂无检查记录';

  @override
  String get belumAdaJadwalServis => '暂无保养计划';

  @override
  String get belumAdaRiwayatServis => '暂无保养记录';

  @override
  String get belumAdaCatatanServis => '尚未记录任何保养历史。';

  @override
  String get belumAdaJadwalPerawatanBerkala => '尚未设置定期保养计划。';

  @override
  String get biayaKm => '每公里费用';

  @override
  String get biayaTotalRp => '总费用 (Rp)';

  @override
  String get biayaPerKm => '每公里花费';

  @override
  String get bukaBrankas => '打开随车证件夹';

  @override
  String get cadanganLengkapSeluruhDataGara => '分享包含车库、日程、证件与油耗数据的 .grg 备份文件。';

  @override
  String get cadangkanSeluruhKendaraanServi => '将全部车辆、保养、油耗与日程分享为 .grg 文件';

  @override
  String get cariRiwayatServisAtauBengkel => '搜索保养记录或维修厂...';

  @override
  String get catatPengisianBbm => '记录加油';

  @override
  String get catatPengisianPertama => '记录首次加油';

  @override
  String get catatServisBaru => '记录新保养';

  @override
  String get catatServisPertama => '记录首次保养';

  @override
  String get catatStrukPengisianBensinUntuk => '记录加油票据，跟踪油耗(km/L)与每公里成本。';

  @override
  String get catatanOpsional => '备注 (可选)';

  @override
  String get catatanLokasiBerkasFisik => '备注 / 纸质文件存放位置';

  @override
  String get catatanBbmBerhasilDisimpan => '加油记录保存成功！';

  @override
  String get catatanPemeriksaOpsional => '检查员备注 (可选)';

  @override
  String get catatanSparepartPengerjaan => '配件 / 维修项目说明';

  @override
  String get catatanServisBerhasilDitambahk => '保养记录添加成功！';

  @override
  String get catatanTambahanKondisiKendaraa => '车辆状况补充备注...';

  @override
  String get ceklisKondisiKendaraan => '车辆状况检查表';

  @override
  String get checklistInspeksiKendaraan => '车辆安全检查表';

  @override
  String get counterOliBerhasilDiresetKeOdo => '机油计时计数器已重置为当前里程！';

  @override
  String get daftarKendaraanDiGarasi => '车库车辆列表';

  @override
  String get daftarMasaBerlakuDokumenLisens => '证件与驾照有效期列表';

  @override
  String get dataCsvBerhasilDisalinKeClipbo => 'CSV数据已复制到剪贴板！';

  @override
  String get dataCadanganBerhasilDipulihkan => '备份数据已成功恢复到车库！';

  @override
  String get dataFormatCsvSiapDieksporKeExc => '适用于Excel/电子表格的CSV格式数据：';

  @override
  String get dataGarasiBerhasilDiresetKeSta => '车库数据已重置为初始状态。';

  @override
  String get diperlukanUntukAkurasiKalkulas => '计算精准油耗(km/L)所需';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      '双重触发提醒：当里程(km)或时间(月)任意一项达到时发出提醒。';

  @override
  String get eksporBackupJson => '导出备份 (.grg)';

  @override
  String get eksporCsvRiwayatBbm => '导出加油记录CSV';

  @override
  String get eksporCsvRiwayatServis => '导出保养记录CSV';

  @override
  String get eksporCadanganJson => '导出备份 (.grg)';

  @override
  String get eksporFormatTabelSpreadsheetUn => '导出电子表格格式以备维修厂记录';

  @override
  String get eksporSeluruhPengisianBbmKeFor => '将所有加油记录导出为CSV表格格式';

  @override
  String get estimasiBiayaPremiRp => '预估费用 / 保费 (Rp)';

  @override
  String get gantiPelat5Th => '5年年审换牌';

  @override
  String get garasiMasihKosong => '车库暂无车辆';

  @override
  String get hargaSatuanRpLiter => '单价 (Rp/升)';

  @override
  String get hasilCeklisInspeksiBerhasilDis => '安全检查结果已保存！';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi => '计算油耗(km/L)及燃油花费';

  @override
  String get imporPulihkanBackupJson => '导入 / 恢复备份 (.grg)';

  @override
  String get intervalJarakKm => '里程间隔 (km)';

  @override
  String get intervalOliKm => '机油更换间隔 (km)';

  @override
  String get intervalWaktu => '时间间隔';

  @override
  String get isiTangkiPenuhFullTank => '是否加满油箱？';

  @override
  String get jadwalServisMendatang => '近期保养计划';

  @override
  String get jenisBahanBakar => '燃油类型';

  @override
  String get jenisDokumen => '证件类型';

  @override
  String get judulKeteranganDokumen => '证件名称 / 说明';

  @override
  String get kategori => '类别:';

  @override
  String get kembalikanDataDariBerkasCadang => '从有效的 .grg 备份文件恢复数据';

  @override
  String get kilometerOdometerKm => '仪表盘里程 (km)';

  @override
  String get konfirmasiReset => '确认重置';

  @override
  String get konsumsiBbm => '燃油消耗';

  @override
  String get lakukanInspeksi10PoinBanRemOli => '执行轮胎、刹车、机油、灯光及电池的10项安全检查。';

  @override
  String get lihatSemua => '查看全部';

  @override
  String get lisensiPamakean => '使用许可';

  @override
  String get lisensiPanganggo => '使用许可';

  @override
  String get lisensiPenggunaan => '使用许可';

  @override
  String get menghapusSemuaLogServisBbmDanR => '清空所有保养、加油及车库历史记录';

  @override
  String get mobil => '汽车';

  @override
  String get mobilAtauMotorKeluargaBaru => '添加新的家庭汽车或摩托车';

  @override
  String get modeTema => '主题模式';

  @override
  String get motor => '摩托车';

  @override
  String get mulaiCeklis => '开始检查';

  @override
  String get mulaiInspeksiPertama => '开始首次检查';

  @override
  String get namaModelKendaraan => '车辆名称 / 车型';

  @override
  String get namaBengkelToko => '维修厂 / 店铺名称';

  @override
  String get namaBengkelTokoOpsional => '维修厂 / 店铺名称 (可选)';

  @override
  String get namaPekerjaanKomponen => '项目名称 / 更换部件';

  @override
  String get namaSpbuLokasi => '加油站 / 位置';

  @override
  String get nomorDokumenNoPolisNoPolisi => '证件号 / 保单号 / 车牌号';

  @override
  String get nomorPelatPolisi => '车牌号码';

  @override
  String get odometerPengerjaanKm => '保养时里程 (km)';

  @override
  String get odometerSaatIniKm => '当前总里程 (km)';

  @override
  String get odometerTerakhirDikerjakanKm => '上次保养里程 (km)';

  @override
  String get opsiJadwal => '保养选项';

  @override
  String get pkbTahunan => '年度车船税';

  @override
  String get pajakStnk => '税务与年审';

  @override
  String get pajakPkbTahunan => '年度车辆税费';

  @override
  String get pekerjaanServis => '保养维修项目';

  @override
  String get pelat5Th => '5年车牌年审';

  @override
  String get pengaturanGarasi => '车库设置';

  @override
  String get penggantianOliMesinResetCounte => '更换发动机机油（重置计数器）';

  @override
  String get pilihBahasaSelectLanguage => '选择语言';

  @override
  String get pilihAtauBuatKendaraanTerlebih => '请先选择或添加一辆车。';

  @override
  String get pilihAtauTambahKendaraanTerleb => '请先选择或添加一辆车。';

  @override
  String get portabilitasCadanganData => '数据迁移与备份';

  @override
  String get pulihkanData => '恢复数据';

  @override
  String get pulihkanDariBackupJson => '从文件恢复 (.grg)';

  @override
  String get rataRataEfisiensi => '平均燃油经济性';

  @override
  String get rekorIritTerbaik => '最佳油耗纪录';

  @override
  String get resetCounterOliMesin => '重置机油计数器';

  @override
  String get resetDataGarasi => '重置车库数据';

  @override
  String get resetOli => '重置机油';

  @override
  String get resetSeluruhData => '确定重置所有数据？';

  @override
  String get rincianPartYangDiganti => '更换配件或维修项目详情...';

  @override
  String get riwayatLengkap => '完整历史';

  @override
  String get riwayatPengisianBahanBakar => '加油记录历史';

  @override
  String get salinCsv => '复制CSV';

  @override
  String get salinKeClipboard => '复制到剪贴板';

  @override
  String get salinanJsonBackupBerhasilDisal => '.grg 备份文件已准备好分享！';

  @override
  String get servisTerakhir => '最近保养';

  @override
  String get setPengingatBerkalaGantiPartKm => '按里程(km)或月份设置周期性保养提醒';

  @override
  String get simpan => '保存';

  @override
  String get simpanAuditInspeksi => '保存检查记录';

  @override
  String get simpanKeGarasi => '保存到车库';

  @override
  String get simpanRiwayatBengkelDanGantiOl => '保存维修厂记录及机油更换';

  @override
  String get simpanTanggalJatuhTempoStnkAsu => '记录车辆税费、年审及保险的到期日期。';

  @override
  String get statusOliMesin => '发动机机油状态';

  @override
  String get tahunPembuatan => '生产年份';

  @override
  String get tambahDokumen => '添加证件';

  @override
  String get tambahDokumenPertama => '添加第一份证件';

  @override
  String get tambahJadwalBaru => '添加新计划';

  @override
  String get tambahJadwalPerawatan => '添加保养计划';

  @override
  String get tambahKendaraan => '添加车辆';

  @override
  String get tambahKendaraanBaru => '添加新车辆';

  @override
  String get tampilanBahasa => '外观与语言';

  @override
  String get tandaiSelesai => '标记为已完成';

  @override
  String get tandaiSelesaiReset => '标记完成 / 重置';

  @override
  String get tandaiSelesaiAkanMeresetHitung => '标记完成后将重置周期计数器，并自动计入保养历史。';

  @override
  String get tanggalMasaBerlakuJatuhTempo => '有效期至 / 到期日';

  @override
  String get tanggalTerakhirDikerjakan => '上次执行日期';

  @override
  String get teksJsonTidakBolehKosong => '备份文件不能为空！';

  @override
  String get tempelkanTeksDataJsonCadanganY => '选择先前导出的 .grg 备份文件。';

  @override
  String get tentangAplikasiLisensi => '关于应用与许可';

  @override
  String get termasukGantiOli => '是否包含更换机油？';

  @override
  String get tindakanIniAkanMengosongkanSem => '此操作将清除所有记录并恢复初始演示车库数据。';

  @override
  String get totalBiayaRp => '总费用 (Rp)';

  @override
  String get totalBiayaTco => '总拥有成本 (TCO)';

  @override
  String get totalBiayaBengkel => '维修保养总费用';

  @override
  String get totalBiayaKepemilikanTco => '总拥有成本 (TCO)';

  @override
  String get totalPengeluaranBbm => '燃油总开支';

  @override
  String get tutup => '关闭';

  @override
  String get ubah => '修改';

  @override
  String get volumeLiterKwh => '容积 (升 / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return '恢复备份失败: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 => '例如：2026年度车辆税';

  @override
  String get hintPlatB1234 => '京A 12345';

  @override
  String get misalStnkDiDompet => '例如：行驶证在车内，登记证书在文件柜';

  @override
  String get misalKurasMinyakRem => '例如：更换DOT 4刹车油';

  @override
  String selesaikanJadwal(String title) {
    return '完成：$title';
  }

  @override
  String jadwalCount(String count) {
    return '保养计划 ($count)';
  }

  @override
  String riwayatCount(String count) {
    return '历史记录 ($count)';
  }

  @override
  String inspeksiCount(String count) {
    return '检查记录 ($count)';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return '已成功加载 $label 的出厂建议计划！';
  }

  @override
  String muatStandarPabrik(String label) {
    return '加载出厂标准计划 ($label)';
  }

  @override
  String odometerValue(String odo) {
    return '里程: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return '车辆 $name 已成功添加到车库！';
  }

  @override
  String get timezone => '时区';

  @override
  String get timezoneAuto => '自动（跟随设备）';

  @override
  String get licenseUsageTitle => '使用许可';

  @override
  String get licenseUsageNotice => '个人及非营利性用途免费使用。';

  @override
  String get licenseUsageBadgeText => '个人与非营利';

  @override
  String get validationVehicleNameRequired => '车辆名称不能为空';

  @override
  String get validationVehicleNameMinLength => '车辆名称至少需要2个字符';

  @override
  String get validationVehicleNameMaxLength => '车辆名称最多50个字符';

  @override
  String get validationPlateRequired => '车牌号码不能为空';

  @override
  String get validationPlateMaxLength => '车牌号码最多15个字符';

  @override
  String get validationOdometerNegative => '里程表读数不能为负数';

  @override
  String get validationOdometerTooHigh => '里程表读数超出合理范围';

  @override
  String get validationOdometerLessThanPrevious => '新里程不能小于此前的里程记录';

  @override
  String get validationCostNegative => '费用不能为负数';

  @override
  String get validationFuelLitersPositive => '加油量必须大于0升';

  @override
  String get validationFuelLitersTooHigh => '加油量超出油箱合理容量';

  @override
  String get validationServiceNameRequired => '保养服务名称不能为空';

  @override
  String get validationDocNameRequired => '文件名称不能为空';

  @override
  String get appTitle => 'GarageGo';

  @override
  String get appTagline => '保养、机油、燃油与车税，一处记全';

  @override
  String get loadingLabel => '加载中…';

  @override
  String get onbSkip => '跳过';

  @override
  String get onbNext => '下一步';

  @override
  String get onbGetStarted => '开始使用';

  @override
  String get onbPrivacyHeadline => '隐私保护，完全离线';

  @override
  String get onbPrivacyDetail => '所有车辆数据都保存在您的设备上，不含任何追踪。';

  @override
  String get onbSlide1Title => '您的车库';

  @override
  String get onbSlide1Sub => '汽车与摩托，集中管理';

  @override
  String get onbSlide1Badge => '100% 离线且私密';

  @override
  String get onbSlide2Title => '保养';

  @override
  String get onbSlide2Sub => '保养、机油与车税';

  @override
  String get onbSlide2Badge => '定期提醒';

  @override
  String get onbSlide3Title => '燃油';

  @override
  String get onbSlide3Sub => '百公里油耗与每公里花费';

  @override
  String get onbSlide3Badge => '无广告，无需账号';

  @override
  String get onbSlide4Title => '离线且私密';

  @override
  String get onbSlide4Sub => '数据保存在您的设备中';

  @override
  String get onbSlide4Badge => '数据保存在设备中';

  @override
  String get urgencySafe => '正常';

  @override
  String get urgencyDueSoon => '即将到期';

  @override
  String get urgencyOverdue => '已逾期';

  @override
  String get docTypeTax => '年度车辆税';

  @override
  String get docTypePlate => '五年牌照与行驶证换发';

  @override
  String get docTypeInsurance => '车辆保险';

  @override
  String get docTypeEmissions => '排放检测 / 年检';

  @override
  String get docTypeLicense => '驾驶证';

  @override
  String get docTypeTitle => '车辆所有权证';

  @override
  String get docTypeOther => '其他证件';

  @override
  String get mtCatOilFluids => '机油与油液';

  @override
  String get mtCatOilFilter => '机油与滤芯';

  @override
  String get mtCatAirFilter => '空气与空调滤芯';

  @override
  String get mtCatBrakes => '制动系统';

  @override
  String get mtCatTires => '轮胎与悬架';

  @override
  String get mtCatIgnition => '点火系统';

  @override
  String get mtCatTransmission => '变速与传动';

  @override
  String get mtCatCvt => 'CVT 变速箱';

  @override
  String get mtCatElectrical => '电气与电瓶';

  @override
  String get mtCatCoolant => '冷却液与水箱';

  @override
  String get mtCatGeneral => '定期保养';

  @override
  String get mtPresetCarOil => '更换合成机油';

  @override
  String get mtPresetCarOilFilter => '更换机油滤芯';

  @override
  String get mtPresetCarAirFilter => '空气滤芯与空调滤芯';

  @override
  String get mtPresetCarBrakeFluid => '更换刹车油与刹车片';

  @override
  String get mtPresetCarTireRotation => '轮胎换位与四轮定位';

  @override
  String get mtPresetCarSparkPlugs => '更换铱金火花塞';

  @override
  String get mtPresetMotoOil => '更换摩托机油';

  @override
  String get mtPresetMotoGearOil => '更换齿轮油';

  @override
  String get mtPresetMotoCvt => 'CVT 保养、皮带与滚珠';

  @override
  String get mtPresetMotoBrakes => '检查并更换刹车片';

  @override
  String get mtPresetMotoSparkPlug => '更换摩托火花塞';

  @override
  String inspPreTripTitle(String type) {
    return '出行前检查（$type）';
  }

  @override
  String inspRoadworthiness(String passed, String total) {
    return '合格项：$passed/$total 项通过';
  }

  @override
  String inspPassedCount(String pct, String passed, String total) {
    return '$pct% 通过（$passed/$total）';
  }

  @override
  String get inspCatEngine => '发动机与油液';

  @override
  String get inspCatWheelsBrakes => '车轮与制动';

  @override
  String get inspCatLights => '灯光与电气';

  @override
  String get inspCatSafety => '安全';

  @override
  String get inspCatDrivetrain => '传动系统';

  @override
  String get inspCatWheelsSteering => '车轮与转向';

  @override
  String get inspCatBrakes => '制动';

  @override
  String get inspCatElectrical => '电气';

  @override
  String get inspCatEquipment => '随车装备';

  @override
  String get inspCar1 => '机油尺液位与机油清洁度';

  @override
  String get inspCar2 => '水箱冷却液液位';

  @override
  String get inspCar3 => '刹车、离合与助力转向油位';

  @override
  String get inspCar4 => '四轮及备胎胎压与花纹深度';

  @override
  String get inspCar5 => '刹车片状态与手刹制动力';

  @override
  String get inspCar6 => '大灯、刹车灯、转向灯与双闪';

  @override
  String get inspCar7 => '电瓶接线柱与 12V 电压指示';

  @override
  String get inspCar8 => '雨刷胶条与玻璃水液位';

  @override
  String get inspCar9 => '千斤顶、轮胎扳手、警示三角与急救包';

  @override
  String get inspMoto1 => '机油液位与品质';

  @override
  String get inspMoto2 => '齿轮油状态 / 链条松紧度';

  @override
  String get inspMoto3 => '前后轮胎压';

  @override
  String get inspMoto4 => '前后刹车片厚度';

  @override
  String get inspMoto5 => '前灯、尾灯与转向灯';

  @override
  String get inspMoto6 => '喇叭与电启动（电瓶状态）';

  @override
  String get inspMoto7 => '左右后视镜与随车工具';

  @override
  String gamesLvl(String level) {
    return '等级 $level';
  }

  @override
  String gamesProgress(String xp, String unlocked, String total) {
    return '$xp XP • 已解锁 $unlocked/$total 枚徽章';
  }

  @override
  String gamesNextLevel(String next, String xp) {
    return '下一级：$next（$xp XP）';
  }

  @override
  String get gamesMaxRank => '已达最高等级';

  @override
  String get gamesBadgesTitle => '车库保养徽章';

  @override
  String get gamesShare => '分享';

  @override
  String get gamesUnlocked => '已解锁（+100 XP）';

  @override
  String get gamesLocked => '尚未解锁';

  @override
  String gamesBadgeUnlockedLine(String highlight) {
    return '已解锁徽章：$highlight';
  }

  @override
  String get gamesLvl1 => '新手车主';

  @override
  String get gamesLvl2 => '用心车主';

  @override
  String get gamesLvl3 => '车队守护者';

  @override
  String get gamesLvl4 => '保养专家';

  @override
  String get gamesLvl5 => '车库大师';

  @override
  String get badgeFirstRideTitle => '第一辆车';

  @override
  String get badgeFirstRideDesc => '在数字车库中登记第一辆车。';

  @override
  String get badgeOilCareTitle => '机油卫士';

  @override
  String get badgeOilCareDesc => '按时记录了更换机油。';

  @override
  String get badgeServiceVeteranTitle => '定期保养达人';

  @override
  String get badgeServiceVeteranDesc => '至少记录了 3 次定期保养。';

  @override
  String get badgeFuelWatcherTitle => '油耗追踪';

  @override
  String get badgeFuelWatcherDesc => '至少记录了 3 次加油以跟踪油耗。';

  @override
  String get badgeSafeVoyageTitle => '安全检验员';

  @override
  String get badgeSafeVoyageDesc => '完成了车辆安全检查清单。';

  @override
  String get badgeDocKeeperTitle => '证件管家';

  @override
  String get badgeDocKeeperDesc => '保存了车辆合法证件（行驶证、税单、驾照、保险）。';

  @override
  String get badgePrimeFleetTitle => '车况优良';

  @override
  String get badgePrimeFleetDesc => '车辆健康分达到 90 分以上。';

  @override
  String get badgeRoadWarriorTitle => '万里行者';

  @override
  String get badgeRoadWarriorDesc => '跟踪里程超过 10,000 公里的车辆。';

  @override
  String healthOilOverdue(String km) {
    return '机油已超期 $km 公里';
  }

  @override
  String healthOilDue(String km) {
    return '机油将在 $km 公里后需要更换';
  }

  @override
  String get healthOilOptimal => '机油更换周期正常';

  @override
  String get healthTaxOverdue => '年度车税已逾期';

  @override
  String healthTaxDue(String days) {
    return '年度车税将在 $days 天后到期';
  }

  @override
  String get healthTaxSafe => '年度车税在有效期内';

  @override
  String get healthPlateExpired => '五年牌照已过期';

  @override
  String healthPlateDue(String days) {
    return '五年牌照将在 $days 天后需要换发';
  }

  @override
  String healthScheduleOverdue(String title) {
    return '$title 已逾期';
  }

  @override
  String healthScheduleDueSoon(String title) {
    return '$title 即将到期';
  }

  @override
  String get healthPrime => '极佳';

  @override
  String get healthAttention => '需要留意';

  @override
  String get healthCritical => '严重 / 尽快保养';

  @override
  String get fuelEstTotalCost => '预计总费用：';

  @override
  String get fuelTripDistance => '本次行驶距离：';

  @override
  String get fuelAvgConsumption => '平均油耗：';

  @override
  String get fuelOperatingCost => '每公里成本：';

  @override
  String get fuelFullTank => '加满';

  @override
  String get fuelPartial => '部分加油';

  @override
  String fuelPricePerLiterLine(String price, String state) {
    return '@ $price/升 • $state';
  }

  @override
  String fuelOdometerValue(String value) {
    return '里程：$value km';
  }

  @override
  String fuelKmL(String value) {
    return '$value 公里/升';
  }

  @override
  String get aboutApplication => '应用';

  @override
  String get aboutVersion => '版本';

  @override
  String get aboutArchitecture => '架构';

  @override
  String get aboutArchitectureValue => '100% 离线优先（无服务器、无追踪）';

  @override
  String get aboutDomain => '域名';

  @override
  String get aboutPackageId => '包名';

  @override
  String settingsVehicleOdo(String plate, String value) {
    return '$plate • 里程：$value km';
  }

  @override
  String get backupInvalidFile => '.grg 文件无效或结构已损坏';

  @override
  String get filterAll => '全部';

  @override
  String get filterAttention => '需留意';

  @override
  String get maintenanceScreenTitle => '保养与服务';

  @override
  String get serviceTitleHint => '例如：更换机油与滤芯';

  @override
  String get workshopHint => '例如：授权经销商 / 修理厂';

  @override
  String get mustBePositive => '必须大于 0';

  @override
  String get editScheduleTitle => '修改保养计划';

  @override
  String get scheduleUpdated => '计划已更新！';

  @override
  String get scheduleSaved => '保养计划已保存！';

  @override
  String get updateSchedule => '更新计划';

  @override
  String get saveSchedule => '保存保养计划';

  @override
  String scheduleCompleted(String title) {
    return '$title 已完成！';
  }

  @override
  String kmOverdue(String km) {
    return '超出 $km 公里';
  }

  @override
  String kmRemaining(String km) {
    return '还剩 $km 公里';
  }

  @override
  String kmOverdueShort(String km) {
    return '超 $km km';
  }

  @override
  String kmRemainingShort(String km) {
    return '剩 $km km';
  }

  @override
  String daysOverdue(String days) {
    return '逾期 $days 天';
  }

  @override
  String daysLeft(String days) {
    return '还剩 $days 天';
  }

  @override
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  ) {
    return '每 $km 公里或 $months 个月 • 上次：$odo km（$date）';
  }

  @override
  String get shareVehiclePassport => '分享车辆护照';

  @override
  String get shareVehiclePassportSubtitle => '把状态卡、健康分与记录分享到社交媒体';

  @override
  String get garageEmptyBody => '添加家里的第一辆车或摩托，开始跟踪保养、机油与燃油。';

  @override
  String resetOilConfirm(String name, String odo) {
    return '$name 的换油计数将重置为当前里程（$odo km）。';
  }

  @override
  String get resetOilServiceNote => '重置机油周期计数';

  @override
  String oilIntervalEvery(String km) {
    return '周期：每 $km 公里';
  }

  @override
  String garageYear(String year) {
    return '$year 年款';
  }

  @override
  String get shareDialogTitle => '分享车辆护照';

  @override
  String get shareCopySummary => '复制摘要';

  @override
  String get sharePreparing => '正在生成…';

  @override
  String get shareDownloadPassport => '下载护照';

  @override
  String get shareSharePassport => '分享护照';

  @override
  String get shareImageFailed => '无法生成车辆护照图片';

  @override
  String get shareImageDownloaded => '车辆护照已下载';

  @override
  String get shareSummaryCopied => '车辆状态摘要已复制';

  @override
  String get shareCardHealthHeader => '车队健康状态';

  @override
  String shareCardCondition(String status) {
    return '车况：$status';
  }

  @override
  String get shareCardOdometer => '里程';

  @override
  String get shareCardOil => '换机油';

  @override
  String get shareCardTax => '车辆税';

  @override
  String get shareCardNeedService => '需要保养';

  @override
  String shareCardDaysShort(String days) {
    return '$days 天';
  }

  @override
  String shareCardLogbook(String date) {
    return '日志：$date';
  }

  @override
  String shareTextHeader(String name, String plate) {
    return '🚗 车辆保养护照 — $name（$plate）';
  }

  @override
  String shareTextHealth(String score, String status) {
    return '🏆 健康分：$score/100（$status）';
  }

  @override
  String shareTextOdometer(String odo) {
    return '⚡ 里程：$odo km';
  }

  @override
  String shareTextOil(String km) {
    return '🛢️ 距离换油还有 $km km';
  }

  @override
  String get shareTextOilDue => '🛢️ 需立即更换机油';

  @override
  String shareTextTax(String days) {
    return '📋 车辆税：还剩 $days 天';
  }

  @override
  String get shareTextFooter =>
      '在 GarageGo 离线管理完整车库保养：https://garagego.faishal.id';

  @override
  String gloveboxHeader(String name) {
    return '数字手套箱 — $name';
  }

  @override
  String gloveboxDocCount(String plate, String count) {
    return '$plate • 已登记 $count 份证件';
  }

  @override
  String docExpiredAgo(String days) {
    return '$days 天前已过期';
  }

  @override
  String docDueIn(String days) {
    return '$days 天后到期';
  }

  @override
  String docDaysLeft(String days) {
    return '还剩 $days 天';
  }

  @override
  String docValidUntil(String date) {
    return '有效期至：$date';
  }

  @override
  String get docEditTitle => '修改证件';

  @override
  String get docAddTitle => '添加车库证件';

  @override
  String get docTitleHint => '例如：年度车税 / 全险';

  @override
  String get docNumberHint => '例如：B 1234 CD / POL-88902';

  @override
  String get docCostHint => '例如：3500000';

  @override
  String get docNotesLabel => '备注与续期提示';

  @override
  String get docNotesHint => '例如：在线支付或到窗口办理';

  @override
  String get docUpdated => '证件已更新！';

  @override
  String get docAdded => '证件已添加！';

  @override
  String get docUpdate => '更新证件';

  @override
  String get docSave => '保存证件';

  @override
  String get vehicleNameHint => '例如：Honda HR-V / Yamaha NMAX';

  @override
  String get plateHint => 'B 1234 CD';

  @override
  String get invalidYear => '年份无效';

  @override
  String get taxDueLabel => '年度车税到期日';

  @override
  String scheduleDoneNote(String category) {
    return '已按定期计划完成（$category）';
  }

  @override
  String get backupErrEmpty => '备份数据为空。';

  @override
  String get backupErrRawJson => '出于安全考虑不支持原始 JSON，请使用官方备份文件。';

  @override
  String get backupErrFormat => '备份文件格式无效或无法识别。';

  @override
  String backupErrWrongApp(String other, String expected) {
    return '该备份属于 $other，无法恢复到 $expected。';
  }

  @override
  String get backupErrCorrupt => '备份数据已损坏或编码无效。';

  @override
  String get backupErrIntegrity => '备份完整性校验失败：数据已被修改或损坏。';

  @override
  String get backupErrNotObject => '备份内容不是有效的数据对象。';

  @override
  String get mtCatEngine => '发动机';

  @override
  String get mtCatOther => '其他';

  @override
  String get unitMonthsShort => '月';

  @override
  String get docNoteTax => '通过国家 Samsat Digital（SIGNAL）应用或就近的 Samsat 网点缴纳';

  @override
  String get docNotePlate => '需到 Samsat 主所进行车辆实车查验';

  @override
  String get docNoteInsurance => '保单内附紧急理赔与拖车电话';

  @override
  String gamesBadgeCount(String unlocked, String total) {
    return '已解锁 $unlocked/$total 枚徽章';
  }
}
