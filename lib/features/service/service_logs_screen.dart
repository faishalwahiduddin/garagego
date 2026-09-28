import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/utils/validators.dart';

class ServiceLogsScreen extends ConsumerWidget {
  const ServiceLogsScreen({super.key});

  void _showAddServiceDialog(BuildContext context, WidgetRef ref, Vehicle active) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final odoController = TextEditingController(text: active.currentOdometer.toString());
    final costController = TextEditingController();
    final notesController = TextEditingController();
    bool isOilChange = true;
    DateTime serviceDate = DateTime.now();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: AppColors.bgSurface,
          title: const Text('Catat Servis Baru', style: TextStyle(color: Colors.white, fontSize: 17)),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Pekerjaan / Servis', hintText: 'Misal: Ganti Oli Mesin & Filter'),
                    validator: (val) => val == null || val.trim().isEmpty ? 'Nama servis wajib diisi' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: odoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Kilometer Odometer (km)', hintText: '25000'),
                    validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: costController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Biaya Total (Rp)', hintText: '450000'),
                    validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: notesController,
                    maxLines: 2,
                    decoration: const InputDecoration(labelText: 'Catatan / Nama Bengkel', hintText: 'Misal: Bengkel Resmi Astra'),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Termasuk Ganti Oli?', style: TextStyle(color: Colors.white, fontSize: 13)),
                    value: isOilChange,
                    activeThumbColor: AppColors.primary,
                    onChanged: (val) => setState(() => isOilChange = val),
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

                final log = ServiceLog(
                  id: 'serv_${DateTime.now().millisecondsSinceEpoch}',
                  vehicleId: active.id,
                  date: serviceDate,
                  odometer: int.parse(odoController.text.trim()),
                  title: titleController.text.trim(),
                  cost: double.parse(costController.text.trim()),
                  notes: notesController.text.trim(),
                  isOilChange: isOilChange,
                );

                ref.read(serviceLogsProvider.notifier).addLog(log);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Catatan servis berhasil ditambahkan!')),
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
    final logs = ref.watch(activeServiceLogsProvider);
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(active != null ? 'Servis: ${active.name}' : 'Riwayat Servis'),
        actions: [
          if (active != null)
            IconButton(
              icon: const Icon(Icons.add, color: AppColors.primaryLight),
              tooltip: 'Catat Servis',
              onPressed: () => _showAddServiceDialog(context, ref, active),
            ),
        ],
      ),
      body: logs.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.build_circle_outlined, size: 48, color: Color(0xFF64748B)),
                  const SizedBox(height: 12),
                  const Text('Belum Ada Riwayat Servis', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  const Text('Catat ganti oli dan servis rutin kendaraan Anda.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                  const SizedBox(height: 16),
                  if (active != null)
                    ElevatedButton.icon(
                      onPressed: () => _showAddServiceDialog(context, ref, active),
                      icon: const Icon(Icons.add),
                      label: const Text('Catat Servis Pertama'),
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
                                  color: (log.isOilChange ? AppColors.accent : AppColors.primary).withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  log.isOilChange ? 'Ganti Oli' : 'Servis Berkala',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: log.isOilChange ? AppColors.accent : AppColors.primaryLight,
                                  ),
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
                                  ref.read(serviceLogsProvider.notifier).deleteLog(log.id);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            log.title,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Odometer: ${NumberFormat('#,###', 'id_ID').format(log.odometer)} km',
                            style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1), fontWeight: FontWeight.w600),
                          ),
                          if (log.notes.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text(log.notes, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                          ],
                          const Divider(color: AppColors.border, height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Biaya Bengkel', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                              Text(
                                currency.format(log.cost),
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.accent),
                              ),
                            ],
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
