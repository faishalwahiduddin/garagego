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
  String get cadanganLengkapSeluruhDataGara => '包含车辆、保养计划、证件及加油记录的完整备份可在此复制：';

  @override
  String get cadangkanSeluruhKendaraanServi => '备份所有车辆、保养、加油及计划数据';

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
  String get eksporBackupJson => '导出JSON备份';

  @override
  String get eksporCsvRiwayatBbm => '导出加油记录CSV';

  @override
  String get eksporCsvRiwayatServis => '导出保养记录CSV';

  @override
  String get eksporCadanganJson => '导出JSON备份';

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
  String get imporPulihkanBackupJson => '导入 / 恢复JSON备份';

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
  String get kembalikanDataDariBerkasCadang => '从有效的JSON备份文件中恢复数据';

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
  String get pulihkanDariBackupJson => '从JSON备份恢复';

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
  String get salinanJsonBackupBerhasilDisal => 'JSON备份已成功复制到剪贴板！';

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
  String get teksJsonTidakBolehKosong => 'JSON文本不能为空！';

  @override
  String get tempelkanTeksDataJsonCadanganY => '在此粘贴先前导出的JSON备份数据：';

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
}
