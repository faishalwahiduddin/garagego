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
import '../../core/providers/timezone_provider.dart';
import '../../core/utils/app_timezone.dart';
import '../garage/add_vehicle_sheet.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final storage = ref.read(localStorageServiceProvider);
    final jsonStr = storage.exportBackupJson();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.cardBg,
        title: Row(
          children: [
            const Icon(Icons.file_download_outlined, color: AppColors.primary, size: 22),
            const SizedBox(width: 8),
            Text(
              l10n.eksporBackupJson,
              style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.cadanganLengkapSeluruhDataGara,
                style: TextStyle(color: context.textSecondary, fontSize: 12),
              ),
              const SizedBox(height: 12),
              Container(
                height: 180,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.surfaceBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.borderColor),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    jsonStr,
                    style: TextStyle(fontFamily: 'monospace', fontSize: 10, color: context.textPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.tutup, style: TextStyle(color: context.textSecondary)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: jsonStr));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.salinanJsonBackupBerhasilDisal)),
              );
            },
            icon: const Icon(Icons.copy, size: 16),
            label: Text(l10n.salinKeClipboard),
          ),
        ],
      ),
    );
  }

  void _showImportJsonDialog(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.cardBg,
        title: Row(
          children: [
            const Icon(Icons.file_upload_outlined, color: AppColors.accent, size: 22),
            const SizedBox(width: 8),
            Text(
              l10n.imporPulihkanBackupJson,
              style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.tempelkanTeksDataJsonCadanganY,
                style: TextStyle(color: context.textSecondary, fontSize: 12),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                maxLines: 8,
                style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: context.textPrimary),
                decoration: InputDecoration(
                  hintText: '{"version": 1, "exportedAt": ...}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: context.borderColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () async {
              final text = controller.text.trim();
              if (text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.teksJsonTidakBolehKosong)),
                );
                return;
              }

              final storage = ref.read(localStorageServiceProvider);
              final success = await storage.importBackupJson(text);
              if (context.mounted) {
                Navigator.pop(ctx);
                if (success) {
                  ref.invalidate(vehiclesProvider);
                  ref.invalidate(activeVehicleIdProvider);
                  ref.invalidate(serviceLogsProvider);
                  ref.invalidate(fuelLogsProvider);
                  ref.invalidate(maintenanceSchedulesProvider);
                  ref.invalidate(vehicleDocumentsProvider);
                  ref.invalidate(inspectionChecklistsProvider);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.dataCadanganBerhasilDipulihkan)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.gagalMemulihkanBackup(Localizations.localeOf(context).languageCode == 'id' ? 'Format JSON tidak valid atau struktur rusak' : 'Invalid JSON format'))),
                  );
                }
              }
            },
            child: Text(l10n.pulihkanData),
          ),
        ],
      ),
    );
  }

  void _showCsvExportDialog(BuildContext context, WidgetRef ref, String title, String csvData) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.cardBg,
        title: Text(title, style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.dataFormatCsvSiapDieksporKeExc,
                style: TextStyle(color: context.textSecondary, fontSize: 12),
              ),
              const SizedBox(height: 12),
              Container(
                height: 180,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.surfaceBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.borderColor),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    csvData,
                    style: TextStyle(fontFamily: 'monospace', fontSize: 10, color: context.textPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.tutup, style: TextStyle(color: context.textSecondary)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: csvData));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.dataCsvBerhasilDisalinKeClipbo)),
              );
            },
            icon: const Icon(Icons.copy, size: 16),
            label: Text(l10n.salinCsv),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final vehicles = ref.watch(vehiclesProvider);
    final active = ref.watch(activeVehicleProvider);
    final storage = ref.watch(localStorageServiceProvider);
    final currentLocale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final langCode = currentLocale.languageCode;
    final license = _licenseTexts[langCode] ?? _licenseTexts['en']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.pengaturanGarasi,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: context.textPrimary),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // 1. Vehicle Fleet Management
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.daftarKendaraanDiGarasi,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textSecondary),
              ),
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: context.cardBg,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (_) => const AddVehicleSheet(),
                  );
                },
                icon: const Icon(Icons.add_rounded, size: 16),
                label: Text(l10n.tambahKendaraan, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ...vehicles.map((v) {
            final isCar = v.type == VehicleType.car;
            final brandColor = isCar ? AppColors.carColor : AppColors.motoColor;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: brandColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      isCar ? Icons.directions_car : Icons.two_wheeler,
                      color: brandColor,
                      size: 22,
                    ),
                  ),
                  title: Text(
                    v.name,
                    style: TextStyle(fontWeight: FontWeight.w700, color: context.textPrimary, fontSize: 14),
                  ),
                  subtitle: Text(
                    '${v.plateNumber} • Odo: ${v.currentOdometer} km',
                    style: TextStyle(fontSize: 12, color: context.textSecondary),
                  ),
                  trailing: vehicles.length > 1
                      ? IconButton(
                          icon: const Icon(Icons.delete_outline, color: AppColors.danger, size: 20),
                          onPressed: () {
                            ref.read(vehiclesProvider.notifier).deleteVehicle(v.id);
                          },
                        )
                      : null,
                ),
              ),
            );
          }),
          const SizedBox(height: 20),

          // Tampilan & Bahasa
          Text(
            l10n.tampilanBahasa,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textSecondary),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.palette_outlined, color: AppColors.primary, size: 18),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          l10n.modeTema,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textPrimary),
                        ),
                      ),
                      SegmentedButton<ThemeMode>(
                        style: SegmentedButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          selectedBackgroundColor: AppColors.primary,
                          selectedForegroundColor: Colors.white,
                          foregroundColor: context.textSecondary,
                          backgroundColor: context.surfaceBg,
                        ),
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
                  Divider(color: context.borderColor, height: 24),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.translate, color: AppColors.accent, size: 18),
                    ),
                    title: Text(
                      l10n.bahasaAplikasi,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textPrimary),
                    ),
                    subtitle: Text(
                      '${_languages[langCode]?.nativeName ?? langCode} (${_languages[langCode]?.name ?? langCode})',
                      style: TextStyle(fontSize: 12, color: context.textSecondary),
                    ),
                    trailing: Icon(Icons.chevron_right, color: context.textMuted),
                    onTap: () => _showLanguageModal(context, ref, currentLocale),
                  ),
                  Divider(color: context.borderColor, height: 24),
                  Semantics(
                    button: true,
                    label: l10n.timezone,
                    child: ListTile(
                      key: const Key('btn-timezone'),
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.schedule, color: AppColors.primary, size: 18),
                      ),
                      title: Text(
                        l10n.timezone,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textPrimary),
                      ),
                      subtitle: Text(
                        _currentTimezoneLabel(ref, l10n),
                        style: TextStyle(fontSize: 12, color: context.textSecondary),
                      ),
                      trailing: Icon(Icons.chevron_right, color: context.textMuted),
                      onTap: () => _showTimezoneModal(context, ref),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 2. Data Portability & Backup
          Text(
            l10n.portabilitasCadanganData,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textSecondary),
          ),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.file_download_outlined, color: AppColors.primary, size: 20),
                  ),
                  title: Text(
                    l10n.eksporCadanganJson,
                    style: TextStyle(color: context.textPrimary, fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    l10n.cadangkanSeluruhKendaraanServi,
                    style: TextStyle(fontSize: 12, color: context.textSecondary),
                  ),
                  onTap: () => _showExportJsonDialog(context, ref),
                ),
                Divider(color: context.borderColor, height: 1),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.file_upload_outlined, color: AppColors.accent, size: 20),
                  ),
                  title: Text(
                    l10n.pulihkanDariBackupJson,
                    style: TextStyle(color: context.textPrimary, fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    l10n.kembalikanDataDariBerkasCadang,
                    style: TextStyle(fontSize: 12, color: context.textSecondary),
                  ),
                  onTap: () => _showImportJsonDialog(context, ref),
                ),
                Divider(color: context.borderColor, height: 1),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.table_chart_outlined, color: AppColors.success, size: 20),
                  ),
                  title: Text(
                    l10n.eksporCsvRiwayatServis,
                    style: TextStyle(color: context.textPrimary, fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    l10n.eksporFormatTabelSpreadsheetUn,
                    style: TextStyle(fontSize: 12, color: context.textSecondary),
                  ),
                  onTap: () {
                    final csv = storage.exportServiceLogsCsv(active?.id);
                    _showCsvExportDialog(context, ref, l10n.eksporCsvRiwayatServis, csv);
                  },
                ),
                Divider(color: context.borderColor, height: 1),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.receipt_long_outlined, color: AppColors.warning, size: 20),
                  ),
                  title: Text(
                    l10n.eksporCsvRiwayatBbm,
                    style: TextStyle(color: context.textPrimary, fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    l10n.eksporSeluruhPengisianBbmKeFor,
                    style: TextStyle(fontSize: 12, color: context.textSecondary),
                  ),
                  onTap: () {
                    final csv = storage.exportFuelLogsCsv(active?.id);
                    _showCsvExportDialog(context, ref, l10n.eksporCsvRiwayatBbm, csv);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 3. Reset Data
          Text(
            l10n.aturUlangData,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textSecondary),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.delete_sweep_outlined, color: AppColors.danger, size: 20),
              ),
              title: Text(
                l10n.resetDataGarasi,
                style: const TextStyle(color: AppColors.danger, fontSize: 14, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                l10n.menghapusSemuaLogServisBbmDanR,
                style: TextStyle(fontSize: 12, color: context.textSecondary),
              ),
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: context.cardBg,
                    title: Text(l10n.resetSeluruhData, style: TextStyle(color: context.textPrimary, fontWeight: FontWeight.w700)),
                    content: Text(
                      l10n.tindakanIniAkanMengosongkanSem,
                      style: TextStyle(color: context.textSecondary),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
                        child: Text(l10n.reset),
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
                      SnackBar(content: Text(l10n.dataGarasiBerhasilDiresetKeSta)),
                    );
                  }
                }
              },
            ),
          ),
          const SizedBox(height: 24),

          // 4. About App & License
          Text(
            l10n.tentangAplikasiLisensi,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: context.textSecondary),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAboutRow(context, langCode == 'id' ? 'Aplikasi' : 'Application', AppConstants.appName),
                  Divider(color: context.borderColor, height: 20),
                  _buildAboutRow(context, langCode == 'id' ? 'Versi' : 'Version', '${AppConstants.appVersion}+1'),
                  Divider(color: context.borderColor, height: 20),
                  _buildAboutRow(context, langCode == 'id' ? 'Arsitektur' : 'Architecture', '100% Offline-First (No Server/No Tracking)'),
                  Divider(color: context.borderColor, height: 20),
                  _buildAboutRow(context, langCode == 'id' ? 'Domain' : 'Domain', 'garagego.faishal.id'),
                  Divider(color: context.borderColor, height: 20),
                  _buildAboutRow(context, langCode == 'id' ? 'Identitas' : 'Package ID', 'id.faishal.garagego'),
                  Divider(color: context.borderColor, height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        license.title,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: context.textPrimary),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          license.badge,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    license.desc,
                    style: TextStyle(fontSize: 12, color: context.textSecondary, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  String _currentTimezoneLabel(WidgetRef ref, AppLocalizations l10n) {
    final now = AppTimeZone.nowUtc();
    final manual = ref.watch(timezoneProvider);
    if (manual != null) {
      return '$manual (${AppTimeZone.zoneShortLabel(manual, now)})';
    }
    final device = ref.watch(timezoneNameProvider);
    return '${l10n.timezoneAuto} · $device '
        '(${AppTimeZone.offsetLabel(device, now)})';
  }

  void _showTimezoneModal(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: context.cardBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        final now = AppTimeZone.nowUtc();
        final current = ref.read(timezoneProvider);
        final device = ref.read(timezoneNameProvider);
        final autoLabel = '${l10n.timezoneAuto} · $device '
            '(${AppTimeZone.offsetLabel(device, now)})';
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l10n.timezone,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: context.textPrimary),
                ),
              ),
              Divider(height: 1, color: context.borderColor),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Semantics(
                      button: true,
                      selected: current == null,
                      label: autoLabel,
                      child: ListTile(
                        key: const Key('timezone-option-auto'),
                        title: Text(
                          autoLabel,
                          style: TextStyle(
                            color: current == null ? AppColors.primary : context.textPrimary,
                            fontWeight: current == null ? FontWeight.w700 : FontWeight.w500,
                          ),
                        ),
                        trailing: current == null ? const Icon(Icons.check, color: AppColors.primary) : null,
                        onTap: () {
                          final zone = ref.read(timezoneProvider.notifier);
                          // §VAL: resetToAuto drops the key; no raw string stored.
                          zone.resetToAuto();
                          Navigator.pop(ctx);
                        },
                      ),
                    ),
                    for (final zone in kCuratedZones)
                      Semantics(
                        button: true,
                        selected: zone.iana == current,
                        label: zone.iana,
                        child: ListTile(
                          key: Key('timezone-option-${zone.iana}'),
                          title: Text(
                            zone.shortLabel == null
                                ? '${zone.iana} (${AppTimeZone.offsetLabel(zone.iana, now)})'
                                : '${zone.iana} (${zone.shortLabel}, ${AppTimeZone.offsetLabel(zone.iana, now)})',
                            style: TextStyle(
                              color: zone.iana == current ? AppColors.primary : context.textPrimary,
                              fontWeight: zone.iana == current ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                          trailing: zone.iana == current ? const Icon(Icons.check, color: AppColors.primary) : null,
                          onTap: () {
                            try {
                              ref.read(timezoneProvider.notifier).setZone(zone.iana);
                            } on ArgumentError {
                              // Unresolvable IANA name: keep the current choice.
                              return;
                            }
                            Navigator.pop(ctx);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageModal(BuildContext context, WidgetRef ref, Locale currentLocale) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: context.cardBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l10n.pilihBahasaSelectLanguage,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: context.textPrimary),
                ),
              ),
              Divider(height: 1, color: context.borderColor),
              Expanded(
                child: ListView(
                  children: _languages.entries.map((entry) {
                    final isSelected = entry.key == currentLocale.languageCode;
                    return ListTile(
                      title: Text(
                        entry.value.nativeName,
                        style: TextStyle(
                          color: isSelected ? AppColors.primary : context.textPrimary,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(entry.value.name, style: TextStyle(color: context.textSecondary, fontSize: 12)),
                      trailing: isSelected ? const Icon(Icons.check, color: AppColors.primary) : null,
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

  Widget _buildAboutRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: context.textSecondary)),
        Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: context.textPrimary)),
      ],
    );
  }
}
