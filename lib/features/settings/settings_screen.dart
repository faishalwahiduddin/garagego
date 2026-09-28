import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

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

          // 4. About App
          const Text('Tentang Aplikasi & Privasi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildAboutRow('Aplikasi', AppConstants.appName),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Versi', '${AppConstants.appVersion}+1'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Arsitektur', '100% Offline-First (No Server/No Tracking)'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Domain', 'garagego.faishal.id'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Ekosistem', 'faishal.id Lifestyle Utility Fleet'),
                ],
              ),
            ),
          ),
        ],
      ),
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
