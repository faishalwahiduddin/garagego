import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/utils/validators.dart';

class FuelLogsScreen extends ConsumerWidget {
  const FuelLogsScreen({super.key});

  void _showAddFuelDialog(BuildContext context, WidgetRef ref, Vehicle active) {
    final formKey = GlobalKey<FormState>();
    final odoController = TextEditingController(text: active.currentOdometer.toString());
    final litersController = TextEditingController();
    final priceController = TextEditingController(text: '13700'); // Pertamax default
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
          backgroundColor: AppColors.bgSurface,
          title: const Text('Catat Pengisian BBM', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: selectedFuelType,
                    decoration: const InputDecoration(labelText: 'Jenis Bahan Bakar'),
                    dropdownColor: AppColors.bgCard,
                    items: fuelTypes.map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(color: Colors.white, fontSize: 13)))).toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => selectedFuelType = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: odoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Kilometer Odometer (km)', hintText: '25500'),
                    validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: litersController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Volume (Liter / kWh)', hintText: '35.5'),
                    validator: (val) => AppValidators.validateFuelLiters(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Harga Satuan (Rp/Liter)', hintText: '13700'),
                    validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: stationController,
                    decoration: const InputDecoration(labelText: 'Nama SPBU / Lokasi', hintText: 'Pertamina 34.15321 Serpong'),
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Isi Tangki Penuh (Full Tank)?', style: TextStyle(color: Colors.white, fontSize: 13)),
                    subtitle: const Text('Diperlukan untuk akurasi kalkulasi km/L', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                    value: isFullTank,
                    activeColor: AppColors.primary,
                    onChanged: (val) => setState(() => isFullTank = val ?? true),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
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
                  const SnackBar(content: Text('Catatan BBM berhasil disimpan!')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeVehicleProvider);
    final logs = ref.watch(activeFuelLogsProvider);
    final efficiencySummary = ref.watch(activeFuelEfficiencyProvider);
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(active != null ? 'BBM: ${active.name}' : 'Konsumsi BBM'),
        actions: [
          if (active != null)
            IconButton(
              icon: const Icon(Icons.add, color: AppColors.primaryLight),
              tooltip: 'Catat Pengisian BBM',
              onPressed: () => _showAddFuelDialog(context, ref, active),
            ),
        ],
      ),
      body: active == null
          ? const Center(child: Text('Pilih atau tambah kendaraan terlebih dahulu.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Efficiency KPI Row
                      Row(
                        children: [
                          Expanded(
                            child: _buildKpiCard(
                              title: 'Rata-Rata Efisiensi',
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
                              title: 'Biaya per KM',
                              value: efficiencySummary.averageCostPerKm > 0
                                  ? 'Rp ${NumberFormat('#,###', 'id_ID').format(efficiencySummary.averageCostPerKm)}/km'
                                  : '—',
                              icon: Icons.route_outlined,
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _buildKpiCard(
                              title: 'Rekor Irit Terbaik',
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
                              title: 'Total Pengeluaran BBM',
                              value: currency.format(efficiencySummary.totalFuelCost),
                              icon: Icons.local_gas_station_outlined,
                              color: AppColors.warning,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'Riwayat Pengisian Bahan Bakar',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8)),
                      ),
                      const SizedBox(height: 10),

                      if (logs.isEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                const Icon(Icons.local_gas_station_outlined, size: 48, color: Color(0xFF64748B)),
                                const SizedBox(height: 12),
                                const Text('Belum Ada Catatan BBM', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 4),
                                const Text('Catat struk pengisian bensin untuk memantau konsumsi km/L dan cost/km.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12), textAlign: TextAlign.center),
                                const SizedBox(height: 16),
                                ElevatedButton.icon(
                                  onPressed: () => _showAddFuelDialog(context, ref, active),
                                  icon: const Icon(Icons.add),
                                  label: const Text('Catat Pengisian Pertama'),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ...logs.map((log) {
                          // Find corresponding efficiency point if exists
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
                                            color: AppColors.warning.withValues(alpha: 0.15),
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
                                            color: AppColors.bgSurface,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            log.fuelType,
                                            style: const TextStyle(fontSize: 11, color: Color(0xFFCBD5E1)),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${log.date.day}/${log.date.month}/${log.date.year}',
                                          style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
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
                                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white),
                                        ),
                                        Text(
                                          currency.format(log.totalCost),
                                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.primaryLight),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '@ ${currency.format(log.pricePerLiter)} / L • ${log.isFullTank ? "Full Tank" : "Sebagian"}',
                                          style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                                        ),
                                        if (pt != null)
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: AppColors.success.withValues(alpha: 0.2),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              '${pt.kmPerLiter.toStringAsFixed(1)} km/L',
                                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.success),
                                            ),
                                          ),
                                      ],
                                    ),
                                    if (log.gasStation.isNotEmpty) ...[
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF94A3B8)),
                                          const SizedBox(width: 4),
                                          Text(log.gasStation, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
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
                Icon(icon, size: 18, color: color),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(title, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)), overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
