import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import 'add_vehicle_sheet.dart';

class GarageDashboardScreen extends ConsumerWidget {
  const GarageDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);
    final activeVehicle = ref.watch(activeVehicleProvider);
    final serviceLogs = ref.watch(activeServiceLogsProvider);
    final fuelLogs = ref.watch(activeFuelLogsProvider);

    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.garage_outlined, color: AppColors.primary, size: 24),
            SizedBox(width: 10),
            Text('GarageGo', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: AppColors.primaryLight),
            tooltip: 'Tambah Kendaraan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.bgCard,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => const AddVehicleSheet(),
              );
            },
          ),
        ],
      ),
      body: vehicles.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.directions_car_outlined, size: 50, color: Color(0xFF64748B)),
                  const SizedBox(height: 12),
                  const Text('Garasi Masih Kosong', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.bgCard,
                        builder: (_) => const AddVehicleSheet(),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah Kendaraan'),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Vehicle Switcher Chips
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: vehicles.length,
                          separatorBuilder: (ctx, i) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final v = vehicles[index];
                            final isSelected = v.id == activeVehicle?.id;
                            return ChoiceChip(
                              avatar: Icon(
                                v.type == VehicleType.car ? Icons.directions_car : Icons.two_wheeler,
                                size: 16,
                                color: isSelected ? Colors.white : AppColors.primaryLight,
                              ),
                              label: Text('${v.name} (${v.plateNumber})'),
                              selected: isSelected,
                              selectedColor: AppColors.primary,
                              onSelected: (_) {
                                ref.read(activeVehicleIdProvider.notifier).setActiveId(v.id);
                              },
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      if (activeVehicle != null) ...[
                        // Active Vehicle Hero Card
                        _buildHeroStatusCard(context, activeVehicle),
                        const SizedBox(height: 16),

                        // Stats Grid
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Total Biaya Servis',
                                value: currency.format(serviceLogs.fold<double>(0, (sum, l) => sum + l.cost)),
                                icon: Icons.build_circle_outlined,
                                iconColor: AppColors.accent,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Riwayat Servis',
                                value: '${serviceLogs.length} Kali',
                                icon: Icons.history,
                                iconColor: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Log Pengisian BBM',
                                value: '${fuelLogs.length} Transaksi',
                                icon: Icons.local_gas_station_outlined,
                                iconColor: AppColors.warning,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Total Liter BBM',
                                value: '${fuelLogs.fold<double>(0, (sum, f) => sum + f.liters).toStringAsFixed(1)} L',
                                icon: Icons.water_drop_outlined,
                                iconColor: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Recent Service List Preview
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Servis Terakhir', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                if (serviceLogs.isEmpty)
                                  const Text('Belum ada catatan servis.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13))
                                else
                                  ...serviceLogs.take(3).map((log) => Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary.withValues(alpha: 0.15),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: const Icon(Icons.build_outlined, size: 16, color: AppColors.primaryLight),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(log.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
                                                  Text('${log.odometer} km • ${log.date.day}/${log.date.month}/${log.date.year}', style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                                ],
                                              ),
                                            ),
                                            Text(currency.format(log.cost), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.accent)),
                                          ],
                                        ),
                                      )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildHeroStatusCard(BuildContext context, Vehicle v) {
    final remainingOilKm = v.kmUntilNextOilChange;
    final isOilOverdue = remainingOilKm < 0;
    final isTaxClose = v.daysUntilTaxDue <= 30;

    return Card(
      color: AppColors.bgSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: AppColors.border, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (v.type == VehicleType.car ? AppColors.carColor : AppColors.motoColor).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    v.type == VehicleType.car ? Icons.directions_car : Icons.two_wheeler,
                    color: v.type == VehicleType.car ? AppColors.carColor : AppColors.motoColor,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(v.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
                      Text('${v.plateNumber} • Tahun ${v.manufactureYear}', style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: (isTaxClose ? AppColors.danger : AppColors.success).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Pajak ${v.daysUntilTaxDue} hari lagi',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isTaxClose ? AppColors.danger : AppColors.success,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Odometer Display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.bgDark,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Odometer Terkini', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  Text(
                    '${NumberFormat('#,###', 'id_ID').format(v.currentOdometer)} km',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Oil Status Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jadwal Ganti Oli Mesin', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFCBD5E1))),
                Text(
                  isOilOverdue ? 'Jatuh Tempo Lewat ${-remainingOilKm} km' : 'Sisa $remainingOilKm km',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isOilOverdue ? AppColors.danger : AppColors.accent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: (1.0 - (remainingOilKm / v.oilIntervalKm)).clamp(0.0, 1.0),
              backgroundColor: AppColors.bgCard,
              color: isOilOverdue ? AppColors.danger : AppColors.primary,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
