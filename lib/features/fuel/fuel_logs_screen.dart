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
    bool isFullTank = true;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: AppColors.bgSurface,
          title: const Text('Catat Pengisian BBM', style: TextStyle(color: Colors.white, fontSize: 17)),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                    decoration: const InputDecoration(labelText: 'Volume BBM (Liter)', hintText: '35.5'),
                    validator: (val) => AppValidators.validateFuelLiters(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Harga / Liter (Rp)', hintText: '13700'),
                    validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Isi Tangki Penuh (Full Tank)?', style: TextStyle(color: Colors.white, fontSize: 13)),
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
      body: logs.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_gas_station_outlined, size: 48, color: Color(0xFF64748B)),
                  const SizedBox(height: 12),
                  const Text('Belum Ada Catatan BBM', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  const Text('Catat struk pengisian bensin untuk memantau konsumsi km/L.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                  const SizedBox(height: 16),
                  if (active != null)
                    ElevatedButton.icon(
                      onPressed: () => _showAddFuelDialog(context, ref, active),
                      icon: const Icon(Icons.add),
                      label: const Text('Catat Pengisian Pertama'),
                    ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
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
                                  '${log.liters.toStringAsFixed(1)} Liter',
                                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.warning),
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
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                              Text(
                                currency.format(log.totalCost),
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.primaryLight),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '@ ${currency.format(log.pricePerLiter)} / liter • ${log.isFullTank ? "Full Tank" : "Sebagian"}',
                            style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
