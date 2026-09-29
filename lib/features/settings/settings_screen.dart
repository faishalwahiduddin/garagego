import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/locale_provider.dart';
import '../../core/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const Map<String, ({String name, String nativeName})> _languages = {
    'id': (name: 'Indonesian', nativeName: 'Bahasa Indonesia'),
    'en': (name: 'English', nativeName: 'English'),
    'ar': (name: 'Arabic', nativeName: 'العربية'),
    'jv': (name: 'Javanese', nativeName: 'Basa Jawa'),
    'su': (name: 'Sundanese', nativeName: 'Basa Sunda'),
    'zh': (name: 'Chinese', nativeName: '中文 (简体)'),
    'ja': (name: 'Japanese', nativeName: '日本語'),
    'es': (name: 'Spanish', nativeName: 'Español'),
  };

  static const Map<String, ({String title, String desc, String badge})> _licenseTexts = {
    'id': (
      title: 'Lisensi Penggunaan',
      desc: 'Bebas digunakan untuk keperluan personal dan non-profit.',
      badge: 'Personal & Non-Profit',
    ),
    'en': (
      title: 'Usage License',
      desc: 'Free to use for personal and non-profit use.',
      badge: 'Personal & Non-Profit',
    ),
    'ar': (
      title: 'ترخيص الاستخدام',
      desc: 'مجاني للاستخدام الشخصي وغير الربحي.',
      badge: 'شخصي وغير ربحي',
    ),
    'jv': (
      title: 'Lisensi Panganggo',
      desc: 'Bebas dienggo kanggo kaperluan pribadi lan non-profit.',
      badge: 'Pribadi & Non-Profit',
    ),
    'su': (
      title: 'Lisensi Pamakean',
      desc: 'Bebas dianggo pikeun kaperluan pribadi jeung non-profit.',
      badge: 'Pribadi & Non-Profit',
    ),
    'zh': (
      title: '使用许可',
      desc: '个人及非营利性用途免费使用。',
      badge: '个人与非营利',
    ),
    'ja': (
      title: '利用規約・ライセンス',
      desc: '個人および非営利目的での利用は無料です。',
      badge: '個人・非営利',
    ),
    'es': (
      title: 'Licencia de Uso',
      desc: 'Gratis para uso personal y sin fines de lucro.',
      badge: 'Personal y Sin Fines de Lucro',
    ),
  };

  void _showExportJsonDialog(BuildContext context, WidgetRef ref) {
    final storage = ref.read(localStorageServiceProvider);
    final jsonStr = storage.exportBackupJson();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgSurface,
        title: Row(
          children: [
            Icon(Icons.file_download_outlined, color: AppColors.primaryLight, size: 22),
            SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.eksporBackupJson, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.cadanganLengkapSeluruhDataGara,
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              SizedBox(height: 12),
              Container(
                height: 180,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    jsonStr,
                    style: TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFFCBD5E1)),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(AppLocalizations.of(context)!.tutup)),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: jsonStr));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context)!.salinanJsonBackupBerhasilDisal)),
              );
            },
            icon: Icon(Icons.copy, size: 16),
            label: Text(AppLocalizations.of(context)!.salinKeClipboard),
          ),
        ],
      ),
    );
  }

  void _showImportJsonDialog(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgSurface,
        title: Row(
          children: [
            Icon(Icons.file_upload_outlined, color: AppColors.accent, size: 22),
            SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.imporPulihkanBackupJson, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.tempelkanTeksDataJsonCadanganY,
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              SizedBox(height: 12),
              TextField(
                controller: textController,
                maxLines: 8,
                style: TextStyle(fontFamily: 'monospace', fontSize: 11),
                decoration: InputDecoration(
                  hintText: 'FSBK1#GARAGEGO#...',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(AppLocalizations.of(context)!.batal)),
          ElevatedButton(
            onPressed: () async {
              final raw = textController.text.trim();
              if (raw.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context)!.teksJsonTidakBolehKosong)),
                );
                return;
              }

              try {
                final storage = ref.read(localStorageServiceProvider);
                await storage.importBackupJson(raw);

                ref.invalidate(vehiclesProvider);
                ref.invalidate(activeVehicleIdProvider);
                ref.invalidate(serviceLogsProvider);
                ref.invalidate(fuelLogsProvider);
                ref.invalidate(maintenanceSchedulesProvider);
                ref.invalidate(vehicleDocumentsProvider);
                ref.invalidate(inspectionChecklistsProvider);

                if (context.mounted) {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocalizations.of(context)!.dataCadanganBerhasilDipulihkan)),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocalizations.of(context)!.gagalMemulihkanBackup(e.toString()))),
                  );
                }
              }
            },
            child: Text(AppLocalizations.of(context)!.pulihkanData),
          ),
        ],
      ),
    );
  }

  void _showCsvExportDialog(BuildContext context, WidgetRef ref, String title, String csvData) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgSurface,
        title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.dataFormatCsvSiapDieksporKeExc,
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              SizedBox(height: 12),
              Container(
                height: 180,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    csvData,
                    style: TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFFCBD5E1)),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(AppLocalizations.of(context)!.tutup)),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: csvData));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context)!.dataCsvBerhasilDisalinKeClipbo)),
              );
            },
            icon: Icon(Icons.copy, size: 16),
            label: Text(AppLocalizations.of(context)!.salinCsv),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);
    final active = ref.watch(activeVehicleProvider);
    final storage = ref.watch(localStorageServiceProvider);
    final currentLocale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final langCode = currentLocale.languageCode;
    final license = _licenseTexts[langCode] ?? _licenseTexts['en']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pengaturanGarasi),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          // 1. Vehicle Fleet Management
          Text(AppLocalizations.of(context)!.daftarKendaraanDiGarasi, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          SizedBox(height: 10),
          ...vehicles.map((v) => Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      v.type == VehicleType.car ? Icons.directions_car : Icons.two_wheeler,
                      color: v.type == VehicleType.car ? AppColors.carColor : AppColors.motoColor,
                    ),
                    title: Text(v.name, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 14)),
                    subtitle: Text('${v.plateNumber} • Odo: ${v.currentOdometer} km', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                    trailing: vehicles.length > 1
                        ? IconButton(
                            icon: Icon(Icons.delete_outline, color: AppColors.danger, size: 20),
                            onPressed: () {
                              ref.read(vehiclesProvider.notifier).deleteVehicle(v.id);
                            },
                          )
                        : null,
                  ),
                ),
              )),
          SizedBox(height: 20),

          // Tampilan & Bahasa
          Text(AppLocalizations.of(context)!.tampilanBahasa, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          SizedBox(height: 10),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.palette_outlined, color: AppColors.primaryLight, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(AppLocalizations.of(context)!.modeTema,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      SegmentedButton<ThemeMode>(
                        segments: const [
                          ButtonSegment(
                            value: ThemeMode.system,
                            icon: Icon(Icons.brightness_auto, size: 16),
                          ),
                          ButtonSegment(
                            value: ThemeMode.light,
                            icon: Icon(Icons.light_mode, size: 16),
                          ),
                          ButtonSegment(
                            value: ThemeMode.dark,
                            icon: Icon(Icons.dark_mode, size: 16),
                          ),
                        ],
                        selected: {themeMode},
                        onSelectionChanged: (selected) {
                          ref.read(themeModeProvider.notifier).setThemeMode(selected.first);
                        },
                      ),
                    ],
                  ),
                  Divider(color: AppColors.border, height: 24),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.translate, color: AppColors.primaryLight, size: 20),
                    title: Text(AppLocalizations.of(context)!.bahasaAplikasi, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                    subtitle: Text(
                      '${_languages[langCode]?.nativeName ?? langCode} (${_languages[langCode]?.name ?? langCode})',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
                    onTap: () => _showLanguageModal(context, ref, currentLocale),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // 2. Data Portability & Backup
          Text(AppLocalizations.of(context)!.portabilitasCadanganData, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.file_download_outlined, color: AppColors.primaryLight),
                  title: Text(AppLocalizations.of(context)!.eksporCadanganJson, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text(AppLocalizations.of(context)!.cadangkanSeluruhKendaraanServi, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () => _showExportJsonDialog(context, ref),
                ),
                Divider(color: AppColors.border, height: 1),
                ListTile(
                  leading: Icon(Icons.file_upload_outlined, color: AppColors.accent),
                  title: Text(AppLocalizations.of(context)!.pulihkanDariBackupJson, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text(AppLocalizations.of(context)!.kembalikanDataDariBerkasCadang, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () => _showImportJsonDialog(context, ref),
                ),
                Divider(color: AppColors.border, height: 1),
                ListTile(
                  leading: Icon(Icons.table_chart_outlined, color: AppColors.success),
                  title: Text(AppLocalizations.of(context)!.eksporCsvRiwayatServis, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text(AppLocalizations.of(context)!.eksporFormatTabelSpreadsheetUn, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () {
                    final csv = storage.exportServiceLogsCsv(active?.id);
                    _showCsvExportDialog(context, ref, 'Ekspor CSV Riwayat Servis', csv);
                  },
                ),
                Divider(color: AppColors.border, height: 1),
                ListTile(
                  leading: Icon(Icons.receipt_long_outlined, color: AppColors.warning),
                  title: Text(AppLocalizations.of(context)!.eksporCsvRiwayatBbm, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text(AppLocalizations.of(context)!.eksporSeluruhPengisianBbmKeFor, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () {
                    final csv = storage.exportFuelLogsCsv(active?.id);
                    _showCsvExportDialog(context, ref, 'Ekspor CSV Riwayat BBM', csv);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // 3. Reset Data
          Text(AppLocalizations.of(context)!.aturUlangData, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.delete_sweep_outlined, color: AppColors.danger),
              title: Text(AppLocalizations.of(context)!.resetDataGarasi, style: TextStyle(color: Colors.white, fontSize: 14)),
              subtitle: Text(AppLocalizations.of(context)!.menghapusSemuaLogServisBbmDanR, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: AppColors.bgSurface,
                    title: Text(AppLocalizations.of(context)!.resetSeluruhData, style: TextStyle(color: Colors.white)),
                    content: Text(AppLocalizations.of(context)!.tindakanIniAkanMengosongkanSem,
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(AppLocalizations.of(context)!.batal)),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
                        child: Text(AppLocalizations.of(context)!.reset),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  final s = ref.read(localStorageServiceProvider);
                  await s.clearAllData();
                  s.seedInitialIfEmpty();
                  ref.invalidate(vehiclesProvider);
                  ref.invalidate(activeVehicleIdProvider);
                  ref.invalidate(serviceLogsProvider);
                  ref.invalidate(fuelLogsProvider);
                  ref.invalidate(maintenanceSchedulesProvider);
                  ref.invalidate(vehicleDocumentsProvider);
                  ref.invalidate(inspectionChecklistsProvider);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppLocalizations.of(context)!.dataGarasiBerhasilDiresetKeSta)),
                    );
                  }
                }
              },
            ),
          ),
          SizedBox(height: 24),

          // 4. About App & License
          Text(AppLocalizations.of(context)!.tentangAplikasiLisensi, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          SizedBox(height: 10),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAboutRow('Aplikasi', AppConstants.appName),
                  Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Versi', '${AppConstants.appVersion}+1'),
                  Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Arsitektur', '100% Offline-First (No Server/No Tracking)'),
                  Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Domain', 'garagego.faishal.id'),
                  Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Identitas', 'id.faishal.garagego'),
                  Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Ekosistem', 'Lifestyle Utility Fleet'),
                  Divider(color: AppColors.border, height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        license.title,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          license.badge,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    license.desc,
                    style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8), height: 1.4),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showLanguageModal(BuildContext context, WidgetRef ref, Locale currentLocale) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(AppLocalizations.of(context)!.pilihBahasaSelectLanguage,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: 1),
              Expanded(
                child: ListView(
                  children: _languages.entries.map((entry) {
                    final isSelected = entry.key == currentLocale.languageCode;
                    return ListTile(
                      title: Text(entry.value.nativeName),
                      subtitle: Text(entry.value.name),
                      trailing: isSelected ? Icon(Icons.check, color: AppColors.primaryLight) : null,
                      onTap: () {
                        ref.read(localeProvider.notifier).setLocale(Locale(entry.key));
                        Navigator.pop(ctx);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAboutRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8))),
        Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
      ],
    );
  }
}
