import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/ui/press_scale.dart';
import '../../core/utils/l10n_helpers.dart';
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
  bool _initialized = false;

  List<String> _suggestedCategories(AppLocalizations l10n) => [
    l10n.mtCatOilFluids,
    l10n.mtCatOilFilter,
    l10n.mtCatBrakes,
    l10n.mtCatAirFilter,
    l10n.mtCatTires,
    l10n.mtCatIgnition,
    l10n.mtCatCvt,
    l10n.mtCatElectrical,
    l10n.mtCatCoolant,
    l10n.mtCatGeneral,
  ];

  @override
  void initState() {
    super.initState();
    final s = widget.initialSchedule;
    _titleController = TextEditingController(text: s?.title ?? '');
    _categoryController = TextEditingController(text: s?.category ?? '');
    _intervalKmController = TextEditingController(
      text: s?.intervalKm.toString() ?? '5000',
    );
    _intervalMonthsController = TextEditingController(
      text: s?.intervalMonths.toString() ?? '6',
    );
    _lastOdoController = TextEditingController(
      text:
          s?.lastPerformedOdometer.toString() ??
          widget.vehicle.currentOdometer.toString(),
    );
    _lastDate = s?.lastPerformedDate ?? DateTime.now();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    // A new schedule starts on the first suggested category in the user's
    // language; an edited one keeps the category that was stored with it.
    if (_categoryController.text.isEmpty) {
      _categoryController.text = AppLocalizations.of(context)!.mtCatOilFluids;
    }
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
    final l10n = AppLocalizations.of(context)!;

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
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isEditing
                        ? l10n.editScheduleTitle
                        : l10n.tambahJadwalPerawatan,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: context.textPrimary,
                      letterSpacing: -0.4,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: context.textSecondary),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                l10n.dualTriggerReminderAlarmAkanAk,
                style: TextStyle(
                  fontSize: 12,
                  color: context.readable(AppColors.primary),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              // Title
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: l10n.namaPekerjaanKomponen,
                  hintText: l10n.misalKurasMinyakRem,
                ),
                validator: (v) => v == null || v.trim().isEmpty
                    ? l10n.validationServiceNameRequired
                    : null,
              ),
              const SizedBox(height: 14),

              // Category Selector Chips
              Text(
                l10n.kategori,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: context.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _suggestedCategories(l10n).map((cat) {
                  final isSelected = _categoryController.text == cat;
                  return ChoiceChip(
                    label: Text(cat),
                    labelStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: isSelected ? Colors.white : context.textSecondary,
                    ),
                    selected: isSelected,
                    selectedColor: AppColors.primaryDark,
                    backgroundColor: context.surfaceBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.primary
                            : context.borderColor,
                      ),
                    ),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _categoryController.text = cat);
                      }
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Dual-Trigger Row: Interval KM and Interval Months
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _intervalKmController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.intervalJarakKm,
                        hintText: '5000',
                        suffixText: 'km',
                      ),
                      validator: (val) {
                        final parsed = int.tryParse(val ?? '');
                        if (parsed == null || parsed <= 0) {
                          return l10n.mustBePositive;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _intervalMonthsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.intervalWaktu,
                        hintText: '6',
                        suffixText: l10n.unitMonthsShort,
                      ),
                      validator: (val) {
                        final parsed = int.tryParse(val ?? '');
                        if (parsed == null || parsed <= 0) {
                          return l10n.mustBePositive;
                        }
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
                decoration: InputDecoration(
                  labelText: l10n.odometerTerakhirDikerjakanKm,
                  hintText: '20000',
                ),
                validator: (val) => mapValidationError(
                  AppValidators.validateOdometer(int.tryParse(val ?? '')),
                  l10n,
                ),
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
                  decoration: InputDecoration(
                    labelText: l10n.tanggalTerakhirDikerjakan,
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: context.textSecondary,
                    ),
                  ),
                  child: Text(
                    MaterialLocalizations.of(
                      context,
                    ).formatCompactDate(_lastDate),
                    style: TextStyle(color: context.textPrimary, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 22),

              // Submit Button
              PressScale(
                scale: 0.97,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    final schedule = MaintenanceSchedule(
                      id:
                          widget.initialSchedule?.id ??
                          'sched_${DateTime.now().millisecondsSinceEpoch}',
                      vehicleId: widget.vehicle.id,
                      title: _titleController.text.trim(),
                      category: _categoryController.text.trim(),
                      intervalKm: int.parse(_intervalKmController.text.trim()),
                      intervalMonths: int.parse(
                        _intervalMonthsController.text.trim(),
                      ),
                      lastPerformedOdometer: int.parse(
                        _lastOdoController.text.trim(),
                      ),
                      lastPerformedDate: _lastDate,
                      isPreset: widget.initialSchedule?.isPreset ?? false,
                    );

                    if (isEditing) {
                      ref
                          .read(maintenanceSchedulesProvider.notifier)
                          .updateSchedule(schedule);
                    } else {
                      ref
                          .read(maintenanceSchedulesProvider.notifier)
                          .addSchedule(schedule);
                    }

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isEditing ? l10n.scheduleUpdated : l10n.scheduleSaved,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    isEditing ? l10n.updateSchedule : l10n.saveSchedule,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
