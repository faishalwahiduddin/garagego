import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.aksiCepatGarasi,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.build_outlined, color: AppColors.primaryLight),
              ),
              title: Text(AppLocalizations.of(context)!.catatServisBaru, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              subtitle: Text(AppLocalizations.of(context)!.simpanRiwayatBengkelDanGantiOl, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () {
                Navigator.pop(ctx);
                context.go('/maintenance');
              },
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.warning.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.local_gas_station_outlined, color: AppColors.warning),
              ),
              title: Text(AppLocalizations.of(context)!.catatPengisianBbm, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              subtitle: Text(AppLocalizations.of(context)!.hitungKonsumsiKmLDanBiayaBensi, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () {
                Navigator.pop(ctx);
                context.go('/fuel');
              },
            ),
            if (active != null)
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.accent.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.schedule, color: AppColors.accent),
                ),
                title: Text(AppLocalizations.of(context)!.tambahJadwalPerawatan, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                subtitle: Text(AppLocalizations.of(context)!.setPengingatBerkalaGantiPartKm, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
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
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.fact_check_outlined, color: AppColors.success),
                ),
                title: Text(AppLocalizations.of(context)!.checklistInspeksiKendaraan, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                subtitle: Text(AppLocalizations.of(context)!.audit10PoinKeselamatanJalanMud, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.carColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.directions_car, color: AppColors.carColor),
              ),
              title: Text(AppLocalizations.of(context)!.tambahKendaraanBaru, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              subtitle: Text(AppLocalizations.of(context)!.mobilAtauMotorKeluargaBaru, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              onTap: () {
                Navigator.pop(ctx);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.bgCard,
                  builder: (_) => AddVehicleSheet(),
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
        title: Text(AppLocalizations.of(context)!.resetCounterOliMesin, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        content: Text(
          'Counter penggantian oli untuk ${v.name} akan diatur ulang ke odometer saat ini (${NumberFormat('#,###', 'id_ID').format(v.currentOdometer)} km).',
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(AppLocalizations.of(context)!.batal)),
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
                title: AppLocalizations.of(context)!.penggantianOliMesinResetCounte,
                cost: 0,
                notes: 'Reset counter interval oli mesin',
                isOilChange: true,
                category: 'Ganti Oli & Filter',
              );
              await ref.read(serviceLogsProvider.notifier).addLog(log);

              if (context.mounted) {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context)!.counterOliBerhasilDiresetKeOdo)),
                );
              }
            },
            child: Text(AppLocalizations.of(context)!.konfirmasiReset),
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
        title: Row(
          children: [
            Icon(Icons.garage_outlined, color: AppColors.primary, size: 24),
            SizedBox(width: 10),
            Text('GarageGo', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: AppColors.primaryLight),
            tooltip: AppLocalizations.of(context)!.tambahKendaraan,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.bgCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => AddVehicleSheet(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: Icon(Icons.bolt, color: Colors.white),
        label: Text(AppLocalizations.of(context)!.aksiCepat, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
        onPressed: () => _showQuickActions(context, ref, activeVehicle),
      ),
      body: vehicles.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_car_outlined, size: 50, color: Color(0xFF64748B)),
                  SizedBox(height: 12),
                  Text(AppLocalizations.of(context)!.garasiMasihKosong, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.bgCard,
                        builder: (_) => AddVehicleSheet(),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text(AppLocalizations.of(context)!.tambahKendaraan),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Vehicle Switcher Chips
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: vehicles.length,
                          separatorBuilder: (ctx, i) => SizedBox(width: 8),
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
                      SizedBox(height: 16),

                      if (activeVehicle != null) ...[
                        // 1. Vehicle Health Score & Hero Card
                        _buildHealthHeroCard(context, ref, activeVehicle, healthResult),
                        SizedBox(height: 16),

                        // 2. High-Density Metric Row
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: AppLocalizations.of(context)!.odometer,
                                value: '${NumberFormat('#,###', 'id_ID').format(activeVehicle.currentOdometer)} km',
                                icon: Icons.speed,
                                iconColor: AppColors.accent,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                title: AppLocalizations.of(context)!.biayaKm,
                                value: fuelEfficiency.averageCostPerKm > 0
                                    ? 'Rp ${fuelEfficiency.averageCostPerKm.toStringAsFixed(0)}/km'
                                    : '—',
                                icon: Icons.route_outlined,
                                iconColor: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: AppLocalizations.of(context)!.konsumsiBbm,
                                value: fuelEfficiency.averageKmPerLiter > 0
                                    ? '${fuelEfficiency.averageKmPerLiter.toStringAsFixed(1)} km/L'
                                    : '— km/L',
                                icon: Icons.local_gas_station_outlined,
                                iconColor: AppColors.warning,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                title: AppLocalizations.of(context)!.totalBiayaTco,
                                value: currency.format(tco.totalCost),
                                icon: Icons.account_balance_wallet_outlined,
                                iconColor: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        // 3. Oil Status Card with Reset Oil Button
                        _buildOilStatusCard(context, ref, activeVehicle),
                        SizedBox(height: 16),

                        // 4. Tax & Document Expiry Card
                        _buildTaxReminderCard(context, activeVehicle),
                        SizedBox(height: 16),

                        // 5. Total Cost of Ownership (TCO) Breakdown
                        _buildTcoBreakdownCard(context, tco, currency),
                        SizedBox(height: 16),

                        // 6. Upcoming Maintenance Alerts
                        _buildUpcomingMaintenanceCard(context, activeVehicle, schedules),
                        SizedBox(height: 16),

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
        side: BorderSide(color: AppColors.border, width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                // Vehicle Icon
                Container(
                  padding: EdgeInsets.all(10),
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
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(v.name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
                      Text('${v.plateNumber} • Tahun ${v.manufactureYear}', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
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
                    SizedBox(height: 4),
                    Text(
                      health?.statusText ?? 'Prima',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color),
                    ),
                  ],
                ),
              ],
            ),
            if (health != null && health.warnings.isNotEmpty) ...[
              SizedBox(height: 14),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.danger.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, size: 18, color: AppColors.danger),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        health.warnings.first,
                        style: TextStyle(fontSize: 11, color: Color(0xFFFECACA), fontWeight: FontWeight.w600),
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.oil_barrel_outlined, size: 18, color: AppColors.accent),
                    SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.statusOliMesin, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
                TextButton.icon(
                  onPressed: () => _showResetOilDialog(context, ref, v),
                  icon: Icon(Icons.refresh, size: 15, color: AppColors.primaryLight),
                  label: Text(AppLocalizations.of(context)!.resetOli, style: TextStyle(fontSize: 12, color: AppColors.primaryLight, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Interval: tiap ${NumberFormat('#,###', 'id_ID').format(v.oilIntervalKm)} km',
                  style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
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
            SizedBox(height: 8),
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.badge_outlined, size: 18, color: AppColors.warning),
                SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.pajakStnk, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                Spacer(),
                TextButton(
                  onPressed: () => context.go('/glovebox'),
                  child: Text(AppLocalizations.of(context)!.bukaBrankas, style: TextStyle(fontSize: 12, color: AppColors.primaryLight)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.bgSurface, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.pkbTahunan, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                        SizedBox(height: 2),
                        Text(
                          '${v.daysUntilTaxDue} hari lagi',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: v.isTaxClose ? AppColors.danger : AppColors.success),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.bgSurface, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.pelat5Th, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                        SizedBox(height: 2),
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.pie_chart_outline, size: 18, color: AppColors.primaryLight),
                SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.totalBiayaKepemilikanTco, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
              ],
            ),
            SizedBox(height: 14),
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
            SizedBox(width: 6),
            Text(label, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
          ],
        ),
        SizedBox(height: 4),
        Text(amount, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Colors.white)),
      ],
    );
  }

  Widget _buildUpcomingMaintenanceCard(BuildContext context, Vehicle v, List<MaintenanceSchedule> schedules) {
    final nearest = schedules.take(3).toList();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.alarm, size: 18, color: AppColors.accent),
                    SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.jadwalServisMendatang, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
                TextButton(
                  onPressed: () => context.go('/maintenance'),
                  child: Text(AppLocalizations.of(context)!.lihatSemua, style: TextStyle(fontSize: 12, color: AppColors.primaryLight)),
                ),
              ],
            ),
            SizedBox(height: 8),
            if (nearest.isEmpty)
              Text(AppLocalizations.of(context)!.belumAdaJadwalPerawatanBerkala, style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12))
            else
              ...nearest.map((s) {
                final urgency = s.urgency(v.currentOdometer);
                final km = s.kmRemaining(v.currentOdometer);
                Color c = urgency == ScheduleUrgency.overdue ? AppColors.danger : (urgency == ScheduleUrgency.dueSoon ? AppColors.warning : AppColors.success);

                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(color: c.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(6)),
                        child: Icon(Icons.build_circle_outlined, size: 16, color: c),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(s.title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.history, size: 18, color: AppColors.primaryLight),
                    SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.servisTerakhir, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
                TextButton(
                  onPressed: () => context.go('/maintenance'),
                  child: Text(AppLocalizations.of(context)!.riwayatLengkap, style: TextStyle(fontSize: 12, color: AppColors.primaryLight)),
                ),
              ],
            ),
            SizedBox(height: 8),
            if (serviceLogs.isEmpty)
              Text(AppLocalizations.of(context)!.belumAdaCatatanServis, style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13))
            else
              ...serviceLogs.take(3).map((log) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.build_outlined, size: 16, color: AppColors.primaryLight),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(log.title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
                              Text('${NumberFormat('#,###', 'id_ID').format(log.odometer)} km • ${log.date.day}/${log.date.month}/${log.date.year}', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                            ],
                          ),
                        ),
                        Text(currency.format(log.cost), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.accent)),
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
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: iconColor),
                SizedBox(width: 6),
                Text(title, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
              ],
            ),
            SizedBox(height: 6),
            Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
