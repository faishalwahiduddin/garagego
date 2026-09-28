import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Garasi'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
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

          const Text('Manajemen Data', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
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
                  final storage = ref.read(localStorageServiceProvider);
                  await storage.clearAllData();
                  storage.seedInitialIfEmpty();
                  ref.invalidate(vehiclesProvider);
                  ref.invalidate(serviceLogsProvider);
                  ref.invalidate(fuelLogsProvider);
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

          const Text('Tentang Aplikasi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8))),
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
                  _buildAboutRow('Domain', 'garagego.faishal.id'),
                  const Divider(color: AppColors.border, height: 24),
                  _buildAboutRow('Penyedia', 'Armada faishal.id'),
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
