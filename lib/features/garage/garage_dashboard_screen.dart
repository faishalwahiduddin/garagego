import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/timezone_provider.dart';
import '../../core/services/analytics_service.dart';
import '../../core/utils/app_timezone.dart';
import '../gamification/presentation/widgets/garage_achievements_card.dart';
import '../maintenance/add_schedule_sheet.dart';
import '../maintenance/inspection_sheet.dart';
import 'add_vehicle_sheet.dart';
import 'widgets/garage_share_dialog.dart';

class GarageDashboardScreen extends ConsumerWidget {
  const GarageDashboardScreen({super.key});

  void _showQuickActions(BuildContext context, WidgetRef ref, Vehicle? active) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.cardBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.aksiCepatGarasi,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: context.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 16),
              _buildQuickActionTile(
                context: context,
                icon: Icons.build_outlined,
                iconColor: AppColors.primary,
                title: l10n.catatServisBaru,
                subtitle: l10n.simpanRiwayatBengkelDanGantiOl,
                onTap: () {
                  Navigator.pop(ctx);
                  context.go('/maintenance');
                },
              ),
              _buildQuickActionTile(
                context: context,
                icon: Icons.local_gas_station_outlined,
                iconColor: AppColors.warning,
                title: l10n.catatPengisianBbm,
                subtitle: l10n.hitungKonsumsiKmLDanBiayaBensi,
                onTap: () {
                  Navigator.pop(ctx);
                  context.go('/fuel');
                },
              ),
              if (active != null)
                _buildQuickActionTile(
                  context: context,
                  icon: Icons.alarm_outlined,
                  iconColor: AppColors.accent,
                  title: l10n.tambahJadwalPerawatan,
                  subtitle: l10n.setPengingatBerkalaGantiPartKm,
                  onTap: () {
                    Navigator.pop(ctx);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: context.cardBg,
                      builder: (_) => AddScheduleSheet(vehicle: active),
                    );
                  },
                ),
              if (active != null)
                _buildQuickActionTile(
                  context: context,
                  icon: Icons.fact_check_outlined,
                  iconColor: AppColors.success,
                  title: l10n.checklistInspeksiKendaraan,
                  subtitle: l10n.audit10PoinKeselamatanJalanMud,
                  onTap: () {
                    Navigator.pop(ctx);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: context.cardBg,
                      builder: (_) => InspectionSheet(vehicle: active),
                    );
                  },
                ),
              if (active != null)
                _buildQuickActionTile(
                  context: context,
                  icon: Icons.share_rounded,
                  iconColor: AppColors.primary,
                  title: 'Bagikan Paspor Kendaraan',
                  subtitle: 'Bagikan kartu status, skor kesehatan, & riwayat ke sosmed',
                  onTap: () {
                    Navigator.pop(ctx);
                    GarageShareDialog.show(
                      context,
                      vehicle: active,
                      health: ref.read(vehicleHealthScoreProvider),
                    );
                  },
                ),
              _buildQuickActionTile(
                context: context,
                icon: Icons.add_circle_outline,
                iconColor: AppColors.carColor,
                title: l10n.tambahKendaraanBaru,
                subtitle: l10n.mobilAtauMotorKeluargaBaru,
                onTap: () {
                  Navigator.pop(ctx);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: context.cardBg,
                    builder: (_) => const AddVehicleSheet(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildQuickActionTile({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: context.textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: context.textSecondary),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(Icons.chevron_right, size: 20, color: context.textMuted),
      onTap: onTap,
    );
  }

  void _showResetOilDialog(BuildContext context, WidgetRef ref, Vehicle v) {
    final l10n = AppLocalizations.of(context)!;
    final formattedOdo = NumberFormat('#,###', 'id_ID').format(v.currentOdometer);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.cardBg,
        title: Text(
          l10n.resetCounterOliMesin,
          style: TextStyle(
            color: context.textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          Localizations.localeOf(context).languageCode == 'id'
              ? 'Counter penggantian oli untuk ${v.name} akan diatur ulang ke odometer saat ini ($formattedOdo km).'
              : 'Oil change counter for ${v.name} will be reset to current odometer ($formattedOdo km).',
          style: TextStyle(color: context.textSecondary, fontSize: 13, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () async {
              final updated = v.copyWith(lastOilOdometer: v.currentOdometer);
              await ref.read(vehiclesProvider.notifier).updateVehicle(updated);

              final log = ServiceLog(
                id: 'serv_${DateTime.now().millisecondsSinceEpoch}',
                vehicleId: v.id,
                date: DateTime.now(),
                odometer: v.currentOdometer,
                title: l10n.penggantianOliMesinResetCounte,
                cost: 0,
                notes: 'Reset counter interval oli mesin',
                isOilChange: true,
                category: 'Ganti Oli & Filter',
              );
              await ref.read(serviceLogsProvider.notifier).addLog(log);

              if (context.mounted) {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.counterOliBerhasilDiresetKeOdo)),
                );
              }
            },
            child: Text(l10n.konfirmasiReset),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
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
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.garage, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 10),
            Text(
              'GarageGo',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 19,
                color: context.textPrimary,
                letterSpacing: -0.4,
              ),
            ),
          ],
        ),
        actions: [
          if (activeVehicle != null)
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.share_rounded, color: AppColors.primary, size: 18),
              ),
              tooltip: 'Bagikan Paspor Kendaraan',
              onPressed: () => GarageShareDialog.show(
                context,
                vehicle: activeVehicle,
                health: healthResult,
              ),
            ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: AppColors.primary, size: 18),
            ),
            tooltip: l10n.tambahKendaraan,
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
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        elevation: 3,
        highlightElevation: 5,
        icon: const Icon(Icons.bolt, color: Colors.white, size: 20),
        label: Text(
          l10n.aksiCepat,
          style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 13),
        ),
        onPressed: () => _showQuickActions(context, ref, activeVehicle),
      ),
      body: vehicles.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.directions_car_outlined, size: 40, color: AppColors.primary),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.garasiMasihKosong,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: context.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Localizations.localeOf(context).languageCode == 'id'
                          ? 'Tambahkan mobil atau motor keluarga pertama Anda untuk mulai memantau servis, oli, dan BBM.'
                          : 'Add your family\'s first car or motorcycle to start tracking services, oil changes, and fuel economy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: context.textSecondary),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: context.cardBg,
                          builder: (_) => const AddVehicleSheet(),
                        );
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: Text(l10n.tambahKendaraan),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 88),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Vehicle Switcher Chips
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: vehicles.length,
                          separatorBuilder: (ctx, i) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final v = vehicles[index];
                            final isSelected = v.id == activeVehicle?.id;
                            final isCar = v.type == VehicleType.car;
                            final brandColor = isCar ? AppColors.carColor : AppColors.motoColor;

                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  ref.read(activeVehicleIdProvider.notifier).setActiveId(v.id);
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primary
                                        : context.surfaceBg,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected ? AppColors.primary : context.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        isCar ? Icons.directions_car : Icons.two_wheeler,
                                        size: 16,
                                        color: isSelected ? Colors.white : brandColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        v.name,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                                          color: isSelected ? Colors.white : context.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.white.withValues(alpha: 0.2)
                                              : context.cardBg,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          v.plateNumber,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: isSelected ? Colors.white : context.textSecondary,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 14),

                      if (activeVehicle != null) ...[
                        // 1. Vehicle Health Score & Hero Card
                        _buildHealthHeroCard(context, ref, activeVehicle, healthResult),
                        const SizedBox(height: 14),

                        // Gamification: Maintenance Rank & Discipline Badges
                        const GarageAchievementsCard(),
                        const SizedBox(height: 14),

                        // 2. High-Density Metric Grid
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                context: context,
                                title: l10n.odometer,
                                value: '${NumberFormat('#,###', 'id_ID').format(activeVehicle.currentOdometer)} km',
                                icon: Icons.speed,
                                iconColor: AppColors.accent,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                context: context,
                                title: l10n.biayaKm,
                                value: fuelEfficiency.averageCostPerKm > 0
                                    ? 'Rp ${fuelEfficiency.averageCostPerKm.toStringAsFixed(0)}/km'
                                    : '—',
                                icon: Icons.route_outlined,
                                iconColor: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                context: context,
                                title: l10n.konsumsiBbm,
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
                                context: context,
                                title: l10n.totalBiayaTco,
                                value: currency.format(tco.totalCost),
                                icon: Icons.account_balance_wallet_outlined,
                                iconColor: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // 3. Oil Status Card with Reset Oil Button
                        _buildOilStatusCard(context, ref, activeVehicle),
                        const SizedBox(height: 14),

                        // 4. Tax & Document Expiry Card
                        _buildTaxReminderCard(context, activeVehicle),
                        const SizedBox(height: 14),

                        // 5. Total Cost of Ownership (TCO) Breakdown
                        _buildTcoBreakdownCard(context, tco, currency),
                        const SizedBox(height: 14),

                        // 6. Upcoming Maintenance Alerts
                        _buildUpcomingMaintenanceCard(context, activeVehicle, schedules),
                        const SizedBox(height: 14),

                        // 7. Recent Service List Preview
                        _buildRecentServicesCard(context, ref, serviceLogs, currency),
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
    final isCar = v.type == VehicleType.car;
    final vehicleColor = isCar ? AppColors.carColor : AppColors.motoColor;

    return Card(
      color: context.cardBg,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                // Vehicle Icon Badge
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: vehicleColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    isCar ? Icons.directions_car : Icons.two_wheeler,
                    color: vehicleColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                // Vehicle Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        v.name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: context.textPrimary,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: context.surfaceBg,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: context.borderColor),
                            ),
                            child: Text(
                              v.plateNumber,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: context.textPrimary,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${Localizations.localeOf(context).languageCode == 'id' ? 'Tahun' : 'Year'} ${v.manufactureYear}',
                            style: TextStyle(fontSize: 12, color: context.textSecondary),
                          ),
                        ],
                      ),
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
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            value: score / 100,
                            backgroundColor: context.surfaceBg,
                            color: color,
                            strokeWidth: 4.5,
                          ),
                        ),
                        Text(
                          '$score',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      health?.statusText ?? (Localizations.localeOf(context).languageCode == 'id' ? 'Prima' : 'Prime'),
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color),
                    ),
                  ],
                ),
              ],
            ),
            if (health != null && health.warnings.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.danger.withValues(alpha: 0.2)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.danger),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        health.warnings.first,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.danger,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: AppColors.primary,
                  ),
                  icon: const Icon(Icons.share_rounded, size: 15),
                  label: const Text(
                    'Bagikan Paspor Kendaraan',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () => GarageShareDialog.show(
                    context,
                    vehicle: v,
                    health: health,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOilStatusCard(BuildContext context, WidgetRef ref, Vehicle v) {
    final l10n = AppLocalizations.of(context)!;
    final remainingOilKm = v.kmUntilNextOilChange;
    final isOilOverdue = remainingOilKm < 0;
    final progress = (1.0 - (remainingOilKm / v.oilIntervalKm)).clamp(0.0, 1.0);
    final statusColor = isOilOverdue ? AppColors.danger : (remainingOilKm <= 1000 ? AppColors.warning : AppColors.accent);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.oil_barrel_outlined, size: 16, color: statusColor),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      l10n.statusOliMesin,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: context.textPrimary,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  ),
                  onPressed: () => _showResetOilDialog(context, ref, v),
                  icon: const Icon(Icons.refresh, size: 14, color: AppColors.primary),
                  label: Text(
                    l10n.resetOli,
                    style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Localizations.localeOf(context).languageCode == 'id'
                      ? 'Interval: tiap ${NumberFormat('#,###', 'id_ID').format(v.oilIntervalKm)} km'
                      : 'Interval: every ${NumberFormat('#,###', 'en_US').format(v.oilIntervalKm)} km',
                  style: TextStyle(fontSize: 12, color: context.textSecondary),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    isOilOverdue
                        ? (Localizations.localeOf(context).languageCode == 'id'
                            ? 'Terlewat ${-remainingOilKm} km'
                            : 'Overdue by ${-remainingOilKm} km')
                        : (Localizations.localeOf(context).languageCode == 'id'
                            ? 'Sisa $remainingOilKm km'
                            : '$remainingOilKm km remaining'),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: context.surfaceBg,
                color: statusColor,
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaxReminderCard(BuildContext context, Vehicle v) {
    final l10n = AppLocalizations.of(context)!;
    final pkbColor = v.isTaxClose ? AppColors.danger : AppColors.success;
    final plateColor = v.isPlateClose ? AppColors.warning : context.textPrimary;

    return Card(
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
                    color: AppColors.warning.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.badge_outlined, size: 16, color: AppColors.warning),
                ),
                const SizedBox(width: 10),
                Text(
                  l10n.pajakStnk,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: context.textPrimary,
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  ),
                  onPressed: () => context.go('/glovebox'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.bukaBrankas,
                        style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.surfaceBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: context.borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.pkbTahunan,
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: context.textSecondary),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.daysRemaining(v.daysUntilTaxDue.toString()),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: pkbColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.surfaceBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: context.borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.pelat5Th,
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: context.textSecondary),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.daysRemaining(v.daysUntilPlateDue.toString()),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: plateColor,
                          ),
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
    final l10n = AppLocalizations.of(context)!;
    return Card(
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
                  child: const Icon(Icons.pie_chart_outline, size: 16, color: AppColors.primary),
                ),
                const SizedBox(width: 10),
                Text(
                  l10n.totalBiayaKepemilikanTco,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: context.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTcoItem(context, l10n.navFuel, currency.format(tco.fuelCost), AppColors.warning),
                _buildTcoItem(context, l10n.navMaintenance, currency.format(tco.serviceCost), AppColors.accent),
                _buildTcoItem(context, l10n.pajakStnk, currency.format(tco.documentCost), AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTcoItem(BuildContext context, String label, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: context.textSecondary)),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: context.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingMaintenanceCard(BuildContext context, Vehicle v, List<MaintenanceSchedule> schedules) {
    final l10n = AppLocalizations.of(context)!;
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
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.alarm, size: 16, color: AppColors.accent),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      l10n.jadwalServisMendatang,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: context.textPrimary,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  ),
                  onPressed: () => context.go('/maintenance'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.lihatSemua,
                        style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (nearest.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  l10n.belumAdaJadwalPerawatanBerkala,
                  style: TextStyle(color: context.textSecondary, fontSize: 12),
                ),
              )
            else
              ...nearest.map((s) {
                final urgency = s.urgency(v.currentOdometer);
                final km = s.kmRemaining(v.currentOdometer);
                final c = urgency == ScheduleUrgency.overdue
                    ? AppColors.danger
                    : (urgency == ScheduleUrgency.dueSoon ? AppColors.warning : AppColors.success);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: context.surfaceBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: context.borderColor),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: c.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(Icons.build_circle_outlined, size: 16, color: c),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            s.title,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: context.textPrimary,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: c.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            km < 0
                                ? (Localizations.localeOf(context).languageCode == 'id'
                                    ? 'Lewat ${-km} km'
                                    : 'Overdue by ${-km} km')
                                : (Localizations.localeOf(context).languageCode == 'id'
                                    ? 'Sisa $km km'
                                    : '$km km left'),
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: c),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentServicesCard(BuildContext context, WidgetRef ref, List<ServiceLog> serviceLogs, NumberFormat currency) {
    final l10n = AppLocalizations.of(context)!;
    // Stored instants are UTC; display in the selected zone (§TZ).
    final loc = ref.watch(timezoneLocationProvider);
    final localeCode = AppTimeZone.intlLocale(Localizations.localeOf(context).languageCode);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.history, size: 16, color: AppColors.primary),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      l10n.servisTerakhir,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: context.textPrimary,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  ),
                  onPressed: () => context.go('/maintenance'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.riwayatLengkap,
                        style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (serviceLogs.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  l10n.belumAdaCatatanServis,
                  style: TextStyle(color: context.textSecondary, fontSize: 13),
                ),
              )
            else
              ...serviceLogs.take(3).map((log) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: context.surfaceBg,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: context.borderColor),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.build_outlined, size: 16, color: AppColors.primary),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  log.title,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: context.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${NumberFormat('#,###', 'id_ID').format(log.odometer)} km • ${AppTimeZone.formatDate(log.date, loc, locale: localeCode)}',
                                  style: TextStyle(fontSize: 11, color: context.textSecondary),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            currency.format(log.cost),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required BuildContext context,
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
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(icon, size: 14, color: iconColor),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: context.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: context.textPrimary,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
