import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/utils/validators.dart';

class AddScheduleSheet extends ConsumerStatefulWidget {
  final Vehicle vehicle;
  final MaintenanceSchedule? initialSchedule;

  const AddScheduleSheet({
    super.key,
    required this.vehicle,
    this.initialSchedule,
  });

  @override
  ConsumerState<AddScheduleSheet> createState() => _AddScheduleSheetState();
}

class _AddScheduleSheetState extends ConsumerState<AddScheduleSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _categoryController;
  late TextEditingController _intervalKmController;
  late TextEditingController _intervalMonthsController;
  late TextEditingController _lastOdoController;
  late DateTime _lastDate;

  final List<String> _suggestedCategories = [
    'Oli & Pelumas',
    'Oli & Filter',
    'Pengereman',
    'Filter & Udara',
    'Ban & Suspensi',
    'Pengapian',
    'Transmisi CVT',
    'Kelistrikan & Aki',
    'Cairan & Radiator',
    'Perawatan Berkala',
  ];

  @override
  void initState() {
    super.initState();
    final s = widget.initialSchedule;
    _titleController = TextEditingController(text: s?.title ?? '');
    _categoryController = TextEditingController(text: s?.category ?? 'Oli & Pelumas');
    _intervalKmController = TextEditingController(text: s?.intervalKm.toString() ?? '5000');
    _intervalMonthsController = TextEditingController(text: s?.intervalMonths.toString() ?? '6');
    _lastOdoController = TextEditingController(
      text: s?.lastPerformedOdometer.toString() ?? widget.vehicle.currentOdometer.toString(),
    );
    _lastDate = s?.lastPerformedDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _intervalKmController.dispose();
    _intervalMonthsController.dispose();
    _lastOdoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initialSchedule != null;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isEditing ? 'Ubah Jadwal Perawatan' : 'Tambah Jadwal Perawatan',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF94A3B8)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Dual-Trigger Reminder: Alarm akan aktif jika jarak (km) ATAU waktu (bulan) tercapai.',
                style: TextStyle(fontSize: 12, color: AppColors.primaryLight.withValues(alpha: 0.9)),
              ),
              const SizedBox(height: 16),

              // Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pekerjaan / Komponen',
                  hintText: 'Misal: Kuras Minyak Rem DOT 4',
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Nama pekerjaan wajib diisi' : null,
              ),
              const SizedBox(height: 12),

              // Category Selector Chips
              const Text('Kategori:', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: _suggestedCategories.map((cat) {
                  final isSelected = _categoryController.text == cat;
                  return ChoiceChip(
                    label: Text(cat, style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : const Color(0xFFCBD5E1))),
                    selected: isSelected,
                    selectedColor: AppColors.primary,
                    backgroundColor: AppColors.bgSurface,
                    onSelected: (selected) {
                      if (selected) setState(() => _categoryController.text = cat);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),

              // Dual-Trigger Row: Interval KM and Interval Months
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _intervalKmController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Interval Jarak (km)',
                        hintText: '5000',
                        suffixText: 'km',
                      ),
                      validator: (val) {
                        final parsed = int.tryParse(val ?? '');
                        if (parsed == null || parsed <= 0) return 'Wajib > 0';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _intervalMonthsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Interval Waktu',
                        hintText: '6',
                        suffixText: 'bln',
                      ),
                      validator: (val) {
                        final parsed = int.tryParse(val ?? '');
                        if (parsed == null || parsed <= 0) return 'Wajib > 0';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Last Performed Odometer
              TextFormField(
                controller: _lastOdoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Odometer Terakhir Dikerjakan (km)',
                  hintText: '20000',
                ),
                validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
              ),
              const SizedBox(height: 14),

              // Last Performed Date Picker
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _lastDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() => _lastDate = picked);
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Terakhir Dikerjakan',
                    suffixIcon: Icon(Icons.calendar_today, size: 18),
                  ),
                  child: Text(
                    '${_lastDate.day}/${_lastDate.month}/${_lastDate.year}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 22),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final schedule = MaintenanceSchedule(
                    id: widget.initialSchedule?.id ?? 'sched_${DateTime.now().millisecondsSinceEpoch}',
                    vehicleId: widget.vehicle.id,
                    title: _titleController.text.trim(),
                    category: _categoryController.text.trim(),
                    intervalKm: int.parse(_intervalKmController.text.trim()),
                    intervalMonths: int.parse(_intervalMonthsController.text.trim()),
                    lastPerformedOdometer: int.parse(_lastOdoController.text.trim()),
                    lastPerformedDate: _lastDate,
                    isPreset: widget.initialSchedule?.isPreset ?? false,
                  );

                  if (isEditing) {
                    ref.read(maintenanceSchedulesProvider.notifier).updateSchedule(schedule);
                  } else {
                    ref.read(maintenanceSchedulesProvider.notifier).addSchedule(schedule);
                  }

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isEditing ? 'Jadwal berhasil diperbarui!' : 'Jadwal perawatan berhasil disimpan!'),
                    ),
                  );
                },
                child: Text(isEditing ? 'Perbarui Jadwal' : 'Simpan Jadwal Perawatan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
