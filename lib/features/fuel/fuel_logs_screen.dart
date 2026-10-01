import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/timezone_provider.dart';
import '../../core/utils/app_timezone.dart';
import '../../core/utils/validators.dart';

class FuelLogsScreen extends ConsumerWidget {
  const FuelLogsScreen({super.key});

  void _showAddFuelDialog(BuildContext context, WidgetRef ref, Vehicle active) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final odoController = TextEditingController(text: active.currentOdometer.toString());
    final litersController = TextEditingController();
    final priceController = TextEditingController(text: '13700');
    final stationController = TextEditingController(text: 'Pertamina ');
    bool isFullTank = true;
    String selectedFuelType = 'Pertamax (RON 92)';

    final fuelTypes = [
      'Pertalite (RON 90)',
      'Pertamax (RON 92)',
      'Pertamax Turbo (RON 98)',
      'Pertamina Dex (CN 53)',
      'Dexlite (CN 51)',
      'Shell Super (RON 92)',
      'Shell V-Power (RON 95)',
      'Shell V-Power Nitro+',
      'Shell V-Power Diesel',
      'BP 92',
      'BP Ultimate',
      'SPKLU Listrik (kWh)',
    ];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: context.cardBg,
          title: Text(
            l10n.catatPengisianBbm,
            style: TextStyle(
              color: context.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: selectedFuelType,
                    decoration: InputDecoration(labelText: l10n.jenisBahanBakar),
                    dropdownColor: context.cardBg,
                    items: fuelTypes
                        .map((t) => DropdownMenuItem(
                              value: t,
                              child: Text(t, style: TextStyle(color: context.textPrimary, fontSize: 13)),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => selectedFuelType = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: odoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.kilometerOdometerKm,
                      hintText: '25500',
                    ),
                    validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: litersController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: l10n.volumeLiterKwh,
                      hintText: '35.5',
                    ),
                    validator: (val) => AppValidators.validateFuelLiters(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.hargaSatuanRpLiter,
                      hintText: '13700',
                    ),
                    validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: stationController,
                    decoration: InputDecoration(
                      labelText: l10n.namaSpbuLokasi,
                      hintText: 'Pertamina 34.15321 Serpong',
                    ),
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      l10n.isiTangkiPenuhFullTank,
                      style: TextStyle(color: context.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      l10n.diperlukanUntukAkurasiKalkulas,
                      style: TextStyle(fontSize: 11, color: context.textSecondary),
                    ),
                    value: isFullTank,
                    activeColor: AppColors.primary,
                    onChanged: (val) => setState(() => isFullTank = val ?? true),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
            ),
            ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                final log = FuelLog(
                  id: 'fuel_${DateTime.now().millisecondsSinceEpoch}',
                  vehicleId: active.id,
                  date: DateTime.now(),
                  odometer: int.parse(odoController.text.trim()),
                  liters: double.parse(litersController.text.trim()),
                  pricePerLiter: double.parse(priceController.text.trim()),
                  isFullTank: isFullTank,
                  fuelType: selectedFuelType,
                  gasStation: stationController.text.trim(),
                );

                ref.read(fuelLogsProvider.notifier).addFuelLog(log);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.catatanBbmBerhasilDisimpan)),
                );
              },
              child: Text(l10n.simpan),
            ),
          ],
        ),
      ),
    );
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
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: context.textPrimary),
        ),
        actions: [
          if (active != null)
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: AppColors.primary, size: 18),
              ),
              tooltip: l10n.catatPengisianBbm,
              onPressed: () => _showAddFuelDialog(context, ref, active),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                              value: efficiencySummary.averageKmPerLiter > 0
                                  ? '${efficiencySummary.averageKmPerLiter.toStringAsFixed(1)} km/L'
                                  : '— km/L',
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
                                  ? 'Rp ${NumberFormat('#,###', 'id_ID').format(efficiencySummary.averageCostPerKm)}/km'
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
                              value: efficiencySummary.bestKmPerLiter > 0
                                  ? '${efficiencySummary.bestKmPerLiter.toStringAsFixed(1)} km/L'
                                  : '— km/L',
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
                                  style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  l10n.catatStrukPengisianBensinUntuk,
                                  style: TextStyle(color: context.textSecondary, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 18),
                                ElevatedButton.icon(
                                  onPressed: () => _showAddFuelDialog(context, ref, active),
                                  icon: const Icon(Icons.add, size: 16),
                                  label: Text(l10n.catatPengisianPertama),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ...logs.map((log) {
                          final pt = efficiencySummary.points.where((p) => p.odometer == log.odometer).firstOrNull;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AppColors.warning.withValues(alpha: 0.12),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            '${log.liters.toStringAsFixed(1)} L',
                                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.warning),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: context.surfaceBg,
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(color: context.borderColor),
                                          ),
                                          child: Text(
                                            log.fuelType,
                                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: context.textPrimary),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          AppTimeZone.formatDate(log.date, loc, locale: localeCode),
                                          style: TextStyle(fontSize: 12, color: context.textSecondary),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.danger),
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            ref.read(fuelLogsProvider.notifier).deleteFuelLog(log.id);
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Odo: ${NumberFormat('#,###', 'id_ID').format(log.odometer)} km',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: context.textPrimary,
                                            letterSpacing: -0.2,
                                          ),
                                        ),
                                        Text(
                                          currency.format(log.totalCost),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '@ ${currency.format(log.pricePerLiter)} / L • ${log.isFullTank ? (Localizations.localeOf(context).languageCode == 'id' ? "Tangki Penuh" : "Full Tank") : (Localizations.localeOf(context).languageCode == 'id' ? "Sebagian" : "Partial")}',
                                          style: TextStyle(fontSize: 12, color: context.textSecondary),
                                        ),
                                        if (pt != null)
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: AppColors.success.withValues(alpha: 0.12),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              '${pt.kmPerLiter.toStringAsFixed(1)} km/L',
                                              style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w800,
                                                color: AppColors.success,
                                              ),
                                            ),
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
