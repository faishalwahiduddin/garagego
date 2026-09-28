import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/services/analytics_service.dart';
import '../maintenance/add_schedule_sheet.dart';
import '../maintenance/inspection_sheet.dart';
import 'add_vehicle_sheet.dart';

class GarageDashboardScreen extends ConsumerWidget {
  const GarageDashboardScreen({super.key});

  void _showQuickActions(BuildContext context, WidgetRef ref, Vehicle? active) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Aksi Cepat Garasi',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.build_outlined, color: AppColors.primaryLight),
              ),
              title: const Text('Catat Servis Baru', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              subtitle: const Text('Simpan riwayat bengkel dan ganti oli', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () {
                Navigator.pop(ctx);
                context.go('/maintenance');
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.warning.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.local_gas_station_outlined, color: AppColors.warning),
              ),
              title: const Text('Catat Pengisian BBM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              subtitle: const Text('Hitung konsumsi km/L dan biaya bensin', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () {
                Navigator.pop(ctx);
                context.go('/fuel');
              },
            ),
            if (active != null)
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.accent.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.schedule, color: AppColors.accent),
                ),
                title: const Text('Tambah Jadwal Perawatan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                subtitle: const Text('Set pengingat berkala ganti part km/bulan', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                onTap: () {
                  Navigator.pop(ctx);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.bgCard,
                    builder: (_) => AddScheduleSheet(vehicle: active),
                  );
                },
              ),
            if (active != null)
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.fact_check_outlined, color: AppColors.success),
                ),
                title: const Text('Checklist Inspeksi Kendaraan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                subtitle: const Text('Audit 10-poin keselamatan jalan & mudik', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                onTap: () {
                  Navigator.pop(ctx);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.bgCard,
                    builder: (_) => InspectionSheet(vehicle: active),
                  );
                },
              ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.carColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.directions_car, color: AppColors.carColor),
              ),
              title: const Text('Tambah Kendaraan Baru', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              subtitle: const Text('Mobil atau motor keluarga baru', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () {
                Navigator.pop(ctx);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.bgCard,
                  builder: (_) => const AddVehicleSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showResetOilDialog(BuildContext context, WidgetRef ref, Vehicle v) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgSurface,
        title: const Text('Reset Counter Oli Mesin', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        content: Text(
          'Counter penggantian oli untuk ${v.name} akan diatur ulang ke odometer saat ini (${NumberFormat('#,###', 'id_ID').format(v.currentOdometer)} km).',
          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () async {
              final updated = v.copyWith(lastOilOdometer: v.currentOdometer);
              await ref.read(vehiclesProvider.notifier).updateVehicle(updated);

              // Record service log
              final log = ServiceLog(
                id: 'serv_${DateTime.now().millisecondsSinceEpoch}',
                vehicleId: v.id,
                date: DateTime.now(),
                odometer: v.currentOdometer,
                title: 'Penggantian Oli Mesin (Reset Counter)',
                cost: 0,
                notes: 'Reset counter interval oli mesin',
                isOilChange: true,
                category: 'Ganti Oli & Filter',
              );
              await ref.read(serviceLogsProvider.notifier).addLog(log);

              if (context.mounted) {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Counter oli berhasil direset ke odometer saat ini!')),
                );
              }
            },
            child: const Text('Konfirmasi Reset'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);
    final activeVehicle = ref.watch(activeVehicleProvider);
    final healthResult = ref.watch(vehicleHealthScoreProvider);
    final tco = ref.watch(activeTCOProvider);
    final fuelEfficiency = ref.watch(activeFuelEfficiencyProvider);
    final schedules = ref.watch(activeMaintenanceSchedulesProvider);
    final serviceLogs = ref.watch(activeServiceLogsProvider);

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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.bolt, color: Colors.white),
        label: const Text('Aksi Cepat', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
        onPressed: () => _showQuickActions(context, ref, activeVehicle),
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
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
                        // 1. Vehicle Health Score & Hero Card
                        _buildHealthHeroCard(context, ref, activeVehicle, healthResult),
                        const SizedBox(height: 16),

                        // 2. High-Density Metric Row
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Odometer',
                                value: '${NumberFormat('#,###', 'id_ID').format(activeVehicle.currentOdometer)} km',
                                icon: Icons.speed,
                                iconColor: AppColors.accent,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Biaya / KM',
                                value: fuelEfficiency.averageCostPerKm > 0
                                    ? 'Rp ${fuelEfficiency.averageCostPerKm.toStringAsFixed(0)}/km'
                                    : '—',
                                icon: Icons.route_outlined,
                                iconColor: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Konsumsi BBM',
                                value: fuelEfficiency.averageKmPerLiter > 0
                                    ? '${fuelEfficiency.averageKmPerLiter.toStringAsFixed(1)} km/L'
                                    : '— km/L',
                                icon: Icons.local_gas_station_outlined,
                                iconColor: AppColors.warning,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Total Biaya (TCO)',
                                value: currency.format(tco.totalCost),
                                icon: Icons.account_balance_wallet_outlined,
                                iconColor: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // 3. Oil Status Card with Reset Oil Button
                        _buildOilStatusCard(context, ref, activeVehicle),
                        const SizedBox(height: 16),

                        // 4. Tax & Document Expiry Card
                        _buildTaxReminderCard(context, activeVehicle),
                        const SizedBox(height: 16),

                        // 5. Total Cost of Ownership (TCO) Breakdown
                        _buildTcoBreakdownCard(context, tco, currency),
                        const SizedBox(height: 16),

                        // 6. Upcoming Maintenance Alerts
                        _buildUpcomingMaintenanceCard(context, activeVehicle, schedules),
                        const SizedBox(height: 16),

                        // 7. Recent Service List Preview
                        _buildRecentServicesCard(context, serviceLogs, currency),
                      ],
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildHealthHeroCard(
    BuildContext context,
    WidgetRef ref,
    Vehicle v,
    VehicleHealthResult? health,
  ) {
    final score = health?.score ?? 100;
    final color = Color(health?.statusColor ?? 0xFF10B981);

    return Card(
      color: AppColors.bgSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: AppColors.border, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                // Vehicle Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (v.type == VehicleType.car ? AppColors.carColor : AppColors.motoColor).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    v.type == VehicleType.car ? Icons.directions_car : Icons.two_wheeler,
                    color: v.type == VehicleType.car ? AppColors.carColor : AppColors.motoColor,
                    size: 28,
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
                // Health Score Circular Badge
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 52,
                          height: 52,
                          child: CircularProgressIndicator(
                            value: score / 100,
                            backgroundColor: AppColors.bgDark,
                            color: color,
                            strokeWidth: 5,
                          ),
                        ),
                        Text(
                          '$score',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: color),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      health?.statusText ?? 'Prima',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color),
                    ),
                  ],
                ),
              ],
            ),
            if (health != null && health.warnings.isNotEmpty) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.danger.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 18, color: AppColors.danger),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        health.warnings.first,
                        style: const TextStyle(fontSize: 11, color: Color(0xFFFECACA), fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOilStatusCard(BuildContext context, WidgetRef ref, Vehicle v) {
    final remainingOilKm = v.kmUntilNextOilChange;
    final isOilOverdue = remainingOilKm < 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.oil_barrel_outlined, size: 18, color: AppColors.accent),
                    SizedBox(width: 8),
                    Text('Status Oli Mesin', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
                TextButton.icon(
                  onPressed: () => _showResetOilDialog(context, ref, v),
                  icon: const Icon(Icons.refresh, size: 15, color: AppColors.primaryLight),
                  label: const Text('Reset Oli', style: TextStyle(fontSize: 12, color: AppColors.primaryLight, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Interval: tiap ${NumberFormat('#,###', 'id_ID').format(v.oilIntervalKm)} km',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                ),
                Text(
                  isOilOverdue ? 'Terlewat ${-remainingOilKm} km' : 'Sisa $remainingOilKm km lagi',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: isOilOverdue ? AppColors.danger : AppColors.accent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (1.0 - (remainingOilKm / v.oilIntervalKm)).clamp(0.0, 1.0),
              backgroundColor: AppColors.bgDark,
              color: isOilOverdue ? AppColors.danger : AppColors.accent,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaxReminderCard(BuildContext context, Vehicle v) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.badge_outlined, size: 18, color: AppColors.warning),
                const SizedBox(width: 8),
                const Text('Pajak & STNK', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                const Spacer(),
                TextButton(
                  onPressed: () => context.go('/glovebox'),
                  child: const Text('Buka Brankas', style: TextStyle(fontSize: 12, color: AppColors.primaryLight)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.bgSurface, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('PKB Tahunan', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                        const SizedBox(height: 2),
                        Text(
                          '${v.daysUntilTaxDue} hari lagi',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: v.isTaxClose ? AppColors.danger : AppColors.success),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.bgSurface, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pelat 5 Th', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                        const SizedBox(height: 2),
                        Text(
                          '${v.daysUntilPlateDue} hari lagi',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: v.isPlateClose ? AppColors.warning : Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTcoBreakdownCard(BuildContext context, TCOResult tco, NumberFormat currency) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.pie_chart_outline, size: 18, color: AppColors.primaryLight),
                SizedBox(width: 8),
                Text('Total Biaya Kepemilikan (TCO)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTcoItem('BBM', currency.format(tco.fuelCost), AppColors.warning),
                _buildTcoItem('Servis', currency.format(tco.serviceCost), AppColors.accent),
                _buildTcoItem('Pajak/Surat', currency.format(tco.documentCost), AppColors.primaryLight),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTcoItem(String label, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
          ],
        ),
        const SizedBox(height: 4),
        Text(amount, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Colors.white)),
      ],
    );
  }

  Widget _buildUpcomingMaintenanceCard(BuildContext context, Vehicle v, List<MaintenanceSchedule> schedules) {
    final nearest = schedules.take(3).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.alarm, size: 18, color: AppColors.accent),
                    SizedBox(width: 8),
                    Text('Jadwal Servis Mendatang', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
                TextButton(
                  onPressed: () => context.go('/maintenance'),
                  child: const Text('Lihat Semua', style: TextStyle(fontSize: 12, color: AppColors.primaryLight)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (nearest.isEmpty)
              const Text('Belum ada jadwal perawatan berkala.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12))
            else
              ...nearest.map((s) {
                final urgency = s.urgency(v.currentOdometer);
                final km = s.kmRemaining(v.currentOdometer);
                Color c = urgency == ScheduleUrgency.overdue ? AppColors.danger : (urgency == ScheduleUrgency.dueSoon ? AppColors.warning : AppColors.success);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: c.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(6)),
                        child: Icon(Icons.build_circle_outlined, size: 16, color: c),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(s.title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                      Text(
                        km < 0 ? 'Lewat ${-km} km' : 'Sisa $km km',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: c),
                      ),
                    ],
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentServicesCard(BuildContext context, List<ServiceLog> serviceLogs, NumberFormat currency) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.history, size: 18, color: AppColors.primaryLight),
                    SizedBox(width: 8),
                    Text('Servis Terakhir', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
                TextButton(
                  onPressed: () => context.go('/maintenance'),
                  child: const Text('Riwayat Lengkap', style: TextStyle(fontSize: 12, color: AppColors.primaryLight)),
                ),
              ],
            ),
            const SizedBox(height: 8),
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
                              Text('${NumberFormat('#,###', 'id_ID').format(log.odometer)} km • ${log.date.day}/${log.date.month}/${log.date.year}', style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
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
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: iconColor),
                const SizedBox(width: 6),
                Text(title, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
              ],
            ),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
