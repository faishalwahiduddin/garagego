import 'package:flutter/material.dart';
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
        title: const Row(
          children: [
            Icon(Icons.file_download_outlined, color: AppColors.primaryLight, size: 22),
            SizedBox(width: 8),
            Text('Ekspor Backup JSON', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Cadangan lengkap seluruh data garasi, jadwal servis, dokumen, dan log BBM dapat disalin ke clipboard di bawah:',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              const SizedBox(height: 12),
              Container(
                height: 180,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    jsonStr,
                    style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFFCBD5E1)),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Tutup')),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: jsonStr));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Salinan JSON backup berhasil disalin ke Clipboard!')),
              );
            },
            icon: const Icon(Icons.copy, size: 16),
            label: const Text('Salin ke Clipboard'),
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
        title: const Row(
          children: [
            Icon(Icons.file_upload_outlined, color: AppColors.accent, size: 22),
            SizedBox(width: 8),
            Text('Impor / Pulihkan Backup JSON', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tempelkan teks data JSON cadangan yang pernah diekspor sebelumnya:',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: textController,
                maxLines: 8,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 11),
                decoration: const InputDecoration(
                  hintText: '{\n  "version": "1.1.0",\n  "vehicles": [...]\n}',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () async {
              final raw = textController.text.trim();
              if (raw.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Teks JSON tidak boleh kosong!')),
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
                    const SnackBar(content: Text('Data cadangan berhasil dipulihkan ke garasi!')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gagal memulihkan backup: ${e.toString()}')),
                  );
                }
              }
            },
            child: const Text('Pulihkan Data'),
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
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Data format CSV siap diekspor ke Excel / Spreadsheet:',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              const SizedBox(height: 12),
              Container(
                height: 180,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    csvData,
                    style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFFCBD5E1)),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Tutup')),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: csvData));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data CSV berhasil disalin ke Clipboard!')),
              );
            },
            icon: const Icon(Icons.copy, size: 16),
            label: const Text('Salin CSV'),
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
        title: const Text('Pengaturan Garasi'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          // 1. Vehicle Fleet Management
          const Text('Daftar Kendaraan di Garasi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          const SizedBox(height: 10),
          ...vehicles.map((v) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      v.type == VehicleType.car ? Icons.directions_car : Icons.two_wheeler,
                      color: v.type == VehicleType.car ? AppColors.carColor : AppColors.motoColor,
                    ),
                    title: Text(v.name, style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 14)),
                    subtitle: Text('${v.plateNumber} • Odo: ${v.currentOdometer} km', style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
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
              )),
          const SizedBox(height: 20),

          // Tampilan & Bahasa
          const Text('Tampilan & Bahasa', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.palette_outlined, color: AppColors.primaryLight, size: 20),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Mode Tema',
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
                  const Divider(color: AppColors.border, height: 24),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.translate, color: AppColors.primaryLight, size: 20),
                    title: const Text('Bahasa Aplikasi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                    subtitle: Text(
                      '${_languages[langCode]?.nativeName ?? langCode} (${_languages[langCode]?.name ?? langCode})',
                      style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                    ),
                    trailing: const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
                    onTap: () => _showLanguageModal(context, ref, currentLocale),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 2. Data Portability & Backup
          const Text('Portabilitas & Cadangan Data', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.file_download_outlined, color: AppColors.primaryLight),
                  title: const Text('Ekspor Cadangan JSON', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: const Text('Cadangkan seluruh kendaraan, servis, BBM, dan jadwal', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () => _showExportJsonDialog(context, ref),
                ),
                const Divider(color: AppColors.border, height: 1),
                ListTile(
                  leading: const Icon(Icons.file_upload_outlined, color: AppColors.accent),
                  title: const Text('Pulihkan dari Backup JSON', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: const Text('Kembalikan data dari berkas cadangan JSON yang valid', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () => _showImportJsonDialog(context, ref),
                ),
                const Divider(color: AppColors.border, height: 1),
                ListTile(
                  leading: const Icon(Icons.table_chart_outlined, color: AppColors.success),
                  title: const Text('Ekspor CSV Riwayat Servis', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: const Text('Ekspor format tabel spreadsheet untuk pencatatan bengkel', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () {
                    final csv = storage.exportServiceLogsCsv(active?.id);
                    _showCsvExportDialog(context, ref, 'Ekspor CSV Riwayat Servis', csv);
                  },
                ),
                const Divider(color: AppColors.border, height: 1),
                ListTile(
                  leading: const Icon(Icons.receipt_long_outlined, color: AppColors.warning),
                  title: const Text('Ekspor CSV Riwayat BBM', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: const Text('Ekspor seluruh pengisian BBM ke format CSV spreadsheet', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  onTap: () {
                    final csv = storage.exportFuelLogsCsv(active?.id);
                    _showCsvExportDialog(context, ref, 'Ekspor CSV Riwayat BBM', csv);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 3. Reset Data
          const Text('Atur Ulang Data', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.delete_sweep_outlined, color: AppColors.danger),
              title: const Text('Reset Data Garasi', style: TextStyle(color: Colors.white, fontSize: 14)),
              subtitle: const Text('Menghapus semua log servis, BBM, dan riwayat garasi', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: AppColors.bgSurface,
                    title: const Text('Reset Seluruh Data?', style: TextStyle(color: Colors.white)),
                    content: const Text(
                      'Tindakan ini akan mengosongkan semua data dan mengembalikan contoh awal garasi.',
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Batal')),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
                        child: const Text('Reset'),
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
                      const SnackBar(content: Text('Data garasi berhasil direset ke standar.')),
                    );
                  }
                }
              },
            ),
          ),
          const SizedBox(height: 24),

          // 4. About App & License
          const Text('Tentang Aplikasi & Lisensi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAboutRow('Aplikasi', AppConstants.appName),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Versi', '${AppConstants.appVersion}+1'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Arsitektur', '100% Offline-First (No Server/No Tracking)'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Domain', 'garagego.faishal.id'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Identitas', 'id.faishal.garagego'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Ekosistem', 'Lifestyle Utility Fleet'),
                  const Divider(color: AppColors.border, height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        license.title,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          license.badge,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    license.desc,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), height: 1.4),
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

  void _showLanguageModal(BuildContext context, WidgetRef ref, Locale currentLocale) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Pilih Bahasa / Select Language',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  children: _languages.entries.map((entry) {
                    final isSelected = entry.key == currentLocale.languageCode;
                    return ListTile(
                      title: Text(entry.value.nativeName),
                      subtitle: Text(entry.value.name),
                      trailing: isSelected ? const Icon(Icons.check, color: AppColors.primaryLight) : null,
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
        Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8))),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
      ],
    );
  }
}
