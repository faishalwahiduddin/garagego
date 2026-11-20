import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_numeric.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/timezone_provider.dart';
import '../../core/services/analytics_service.dart';
import '../../core/ui/fleet_sheet.dart';
import '../../core/ui/press_scale.dart';
import '../../core/ui/undo_snackbar.dart';
import 'fuel_log_sheet.dart';
import '../../core/utils/app_timezone.dart';
import '../../core/constants/units.dart';

class FuelLogsScreen extends ConsumerWidget {
  const FuelLogsScreen({super.key});

  void _showFuelSheet(BuildContext context, Vehicle active, {FuelLog? initial}) {
    showFleetSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.cardBg,
      builder: (_) => FuelLogSheet(vehicle: active, initial: initial),
    );
  }

  void _deleteWithUndo(BuildContext context, WidgetRef ref, FuelLog log) {
    final notifier = ref.read(fuelLogsProvider.notifier);
    final index = ref.read(fuelLogsProvider).indexWhere((f) => f.id == log.id);
    notifier.deleteFuelLog(log.id);
    showUndoSnackBar(context, onUndo: () => notifier.restoreFuelLog(log, index));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final active = ref.watch(activeVehicleProvider);
    final logs = ref.watch(activeFuelLogsProvider);
    final efficiencySummary = ref.watch(activeFuelEfficiencyProvider);
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    // Stored instants are UTC; display in the selected zone (§TZ).
    final loc = ref.watch(timezoneLocationProvider);
    final localeCode = AppTimeZone.intlLocale(Localizations.localeOf(context).languageCode);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          active != null ? '${l10n.navFuel}: ${active.name}' : l10n.konsumsiBbm,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: context.textPrimary, letterSpacing: -0.4),
        ),
        actions: [
          if (active != null)
            PressScale(
              scale: 0.92,
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: AppColors.primary, size: 18),
                ),
                tooltip: l10n.catatPengisianBbm,
                onPressed: () => _showFuelSheet(context, active),
              ),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: active == null
          ? Center(
              child: Text(
                l10n.pilihAtauTambahKendaraanTerleb,
                style: TextStyle(color: context.textSecondary),
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 96),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Efficiency KPI Grid
                      Row(
                        children: [
                          Expanded(
                            child: _buildKpiCard(
                              context: context,
                              title: l10n.rataRataEfisiensi,
                              value: l10n.fuelKmL(
                                efficiencySummary.averageKmPerLiter > 0
                                    ? efficiencySummary.averageKmPerLiter.toStringAsFixed(1)
                                    : '—',
                              ),
                              icon: Icons.speed_outlined,
                              color: AppColors.accent,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildKpiCard(
                              context: context,
                              title: l10n.biayaPerKm,
                              value: efficiencySummary.averageCostPerKm > 0
                                  ? '${currency.format(efficiencySummary.averageCostPerKm)}$kPerKmSuffix'
                                  : '—',
                              icon: Icons.route_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _buildKpiCard(
                              context: context,
                              title: l10n.rekorIritTerbaik,
                              value: l10n.fuelKmL(
                                // A "best" needs at least two measured intervals;
                                // with one it just repeats the average.
                                efficiencySummary.points.length >= 2
                                    ? efficiencySummary.bestKmPerLiter.toStringAsFixed(1)
                                    : '—',
                              ),
                              icon: Icons.trending_up,
                              color: AppColors.success,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildKpiCard(
                              context: context,
                              title: l10n.totalPengeluaranBbm,
                              value: currency.format(efficiencySummary.totalFuelCost),
                              icon: Icons.local_gas_station_outlined,
                              color: AppColors.warning,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Text(
                        l10n.riwayatPengisianBahanBakar,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: context.textSecondary,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 10),

                      if (logs.isEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: AppColors.warning.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.local_gas_station_outlined, size: 32, color: AppColors.warning),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  l10n.belumAdaCatatanBbm,
                                  style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: -0.3),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  l10n.catatStrukPengisianBensinUntuk,
                                  style: TextStyle(color: context.textSecondary, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 18),
                                PressScale(
                                  scale: 0.97,
                                  child: ElevatedButton.icon(
                                    onPressed: () => _showFuelSheet(context, active),
                                    icon: const Icon(Icons.add, size: 16),
                                    label: Text(l10n.catatPengisianPertama),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ...sortFuelLogsNewestFirst(logs).map((log) {
                          final pt = efficiencySummary.points.where((p) => p.logId == log.id).firstOrNull;
                          final liters = NumberFormat.decimalPatternDigits(locale: localeCode, decimalDigits: 1)
                              .format(log.liters);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _FuelLogRow(
                              log: log,
                              point: pt,
                              litersLabel: '$liters$kSpaceChar$kLiterUnit$kDotSeparator${log.fuelType}',
                              dateLabel: AppTimeZone.formatDate(log.date, loc, locale: localeCode),
                              currency: currency,
                              onEdit: () => _showFuelSheet(context, active, initial: log),
                              onDelete: () => _deleteWithUndo(context, ref, log),
                            ),
                          );
                        }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildKpiCard({
    required BuildContext context,
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return PressScale(
      scale: 0.97,
      child: Card(
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
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(icon, size: 14, color: color),
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
                      maxLines: 2,
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
                ).tabular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One fill-up: volume and fuel type as plain secondary text, km/L as the
/// only emphasised value (no pills). Tap the row to edit; delete is undoable.
class _FuelLogRow extends StatelessWidget {
  const _FuelLogRow({
    required this.log,
    required this.point,
    required this.litersLabel,
    required this.dateLabel,
    required this.currency,
    required this.onEdit,
    required this.onDelete,
  });

  final FuelLog log;
  final FuelEfficiencyPoint? point;
  final String litersLabel;
  final String dateLabel;
  final NumberFormat currency;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pt = point;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onEdit,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 4, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      litersLabel,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: context.textSecondary).tabular,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(dateLabel, style: TextStyle(fontSize: 12, color: context.textSecondary).tabular),
                  IconButton(
                    icon: Icon(Icons.delete_outline, size: 20, color: context.textSecondary),
                    tooltip: l10n.delete,
                    onPressed: onDelete,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            l10n.fuelOdometerValue(NumberFormat('#,###', 'id_ID').format(log.odometer)),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: context.textPrimary,
                              letterSpacing: -0.2,
                            ).tabular,
                          ),
                        ),
                        Text(
                          currency.format(log.totalCost),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: context.textPrimary,
                          ).tabular,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            l10n.fuelPricePerLiterLine(
                              currency.format(log.pricePerLiter),
                              log.isFullTank ? l10n.fuelFullTank : l10n.fuelPartial,
                            ),
                            style: TextStyle(fontSize: 12, color: context.textSecondary),
                          ),
                        ),
                        if (pt != null)
                          Text(
                            l10n.fuelKmL(pt.kmPerLiter.toStringAsFixed(1)),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: context.readable(AppColors.success),
                            ).tabular,
                          ),
                      ],
                    ),
                    if (log.gasStation.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 14, color: context.textMuted),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              log.gasStation,
                              style: TextStyle(fontSize: 11, color: context.textSecondary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Display order for the fill-up history: newest date first, ties broken by
/// higher odometer first. Returns a copy; efficiency is computed elsewhere in
/// chronological order, so only presentation changes.
List<FuelLog> sortFuelLogsNewestFirst(List<FuelLog> logs) {
  final sorted = [...logs];
  sorted.sort((a, b) {
    final byDate = b.date.compareTo(a.date);
    return byDate != 0 ? byDate : b.odometer.compareTo(a.odometer);
  });
  return sorted;
}
