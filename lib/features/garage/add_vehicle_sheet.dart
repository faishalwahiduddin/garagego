import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/utils/validators.dart';

class AddVehicleSheet extends ConsumerStatefulWidget {
  const AddVehicleSheet({super.key});

  @override
  ConsumerState<AddVehicleSheet> createState() => _AddVehicleSheetState();
}

class _AddVehicleSheetState extends ConsumerState<AddVehicleSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _plateController = TextEditingController();
  final _odoController = TextEditingController();
  final _yearController = TextEditingController(text: DateTime.now().year.toString());
  final _intervalController = TextEditingController(text: '5000');

  VehicleType _selectedType = VehicleType.car;
  DateTime _taxDueDate = DateTime.now().add(const Duration(days: 365));

  @override
  void dispose() {
    _nameController.dispose();
    _plateController.dispose();
    _odoController.dispose();
    _yearController.dispose();
    _intervalController.dispose();
    super.dispose();
  }

  Future<void> _pickTaxDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _taxDueDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      setState(() => _taxDueDate = picked);
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final odo = int.parse(_odoController.text.trim());
    final year = int.parse(_yearController.text.trim());
    final interval = int.tryParse(_intervalController.text.trim()) ?? (_selectedType == VehicleType.car ? 5000 : 2500);

    final newVehicle = Vehicle(
      id: 'veh_${DateTime.now().millisecondsSinceEpoch}',
      name: _nameController.text.trim(),
      type: _selectedType,
      plateNumber: _plateController.text.trim().toUpperCase(),
      currentOdometer: odo,
      manufactureYear: year,
      taxDueDate: _taxDueDate,
      oilIntervalKm: interval,
      lastOilOdometer: odo,
      estimatedAnnualTax: _selectedType == VehicleType.car ? 3500000 : 350000,
    );

    ref.read(vehiclesProvider.notifier).addVehicle(newVehicle);
    ref.read(maintenanceSchedulesProvider.notifier).loadPresetsForVehicle(newVehicle);
    final defaultDocs = VehicleDocument.defaultDocumentsFor(newVehicle);
    for (final d in defaultDocs) {
      ref.read(vehicleDocumentsProvider.notifier).addDocument(d);
    }

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.kendaraanBerhasilDitambahkan(newVehicle.name))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: bottomInset > 0 ? bottomInset + 16 : 28,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sheet Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.tambahKendaraanBaru,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: context.textPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_rounded, size: 20, color: context.textSecondary),
                    visualDensity: VisualDensity.compact,
                    splashRadius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Type Selector Cards
              Row(
                children: [
                  Expanded(
                    child: _buildTypeCard(
                      type: VehicleType.car,
                      title: l10n.mobil,
                      icon: Icons.directions_car_rounded,
                      isSelected: _selectedType == VehicleType.car,
                      onTap: () {
                        setState(() {
                          _selectedType = VehicleType.car;
                          _intervalController.text = '5000';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTypeCard(
                      type: VehicleType.motorcycle,
                      title: l10n.motor,
                      icon: Icons.two_wheeler_rounded,
                      isSelected: _selectedType == VehicleType.motorcycle,
                      onTap: () {
                        setState(() {
                          _selectedType = VehicleType.motorcycle;
                          _intervalController.text = '2500';
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Vehicle Name
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: context.textPrimary, fontSize: 14),
                decoration: InputDecoration(
                  labelText: l10n.namaModelKendaraan,
                  hintText: Localizations.localeOf(context).languageCode == 'id'
                      ? 'Misal: Honda HR-V / Yamaha NMAX'
                      : 'e.g. Honda HR-V / Yamaha NMAX',
                  prefixIcon: Icon(Icons.drive_file_rename_outline_rounded, size: 18, color: context.textSecondary),
                ),
                validator: AppValidators.validateVehicleName,
              ),
              const SizedBox(height: 12),

              // Plate Number & Year
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _plateController,
                      textCapitalization: TextCapitalization.characters,
                      style: TextStyle(
                        color: context.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                      decoration: InputDecoration(
                        labelText: l10n.nomorPelatPolisi,
                        hintText: 'B 1234 CD',
                        prefixIcon: Icon(Icons.badge_outlined, size: 18, color: context.textSecondary),
                      ),
                      validator: AppValidators.validatePlateNumber,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      style: TextStyle(color: context.textPrimary, fontSize: 14),
                      decoration: InputDecoration(
                        labelText: l10n.tahunPembuatan,
                        hintText: '2023',
                        prefixIcon: Icon(Icons.calendar_today_rounded, size: 18, color: context.textSecondary),
                      ),
                      validator: (val) {
                        final y = int.tryParse(val ?? '');
                        if (y == null || y < 1970 || y > DateTime.now().year + 1) {
                          return Localizations.localeOf(context).languageCode == 'id' ? 'Tidak valid' : 'Invalid year';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Odometer & Oil Interval
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _odoController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle(color: context.textPrimary, fontSize: 14),
                      decoration: InputDecoration(
                        labelText: l10n.odometerSaatIniKm,
                        hintText: '15000',
                        suffixText: 'km',
                        prefixIcon: Icon(Icons.speed_rounded, size: 18, color: context.textSecondary),
                      ),
                      validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _intervalController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle(color: context.textPrimary, fontSize: 14),
                      decoration: InputDecoration(
                        labelText: l10n.intervalOliKm,
                        hintText: '5000',
                        suffixText: 'km',
                        prefixIcon: Icon(Icons.oil_barrel_rounded, size: 18, color: context.textSecondary),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Tax Due Date Card
              InkWell(
                onTap: _pickTaxDate,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: context.surfaceBg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: context.borderColor),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.event_note_rounded, size: 18, color: AppColors.primary),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Localizations.localeOf(context).languageCode == 'id'
                                  ? 'Jatuh Tempo Pajak STNK'
                                  : 'Annual Tax Expiration',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: context.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${_taxDueDate.day.toString().padLeft(2, '0')}-${_taxDueDate.month.toString().padLeft(2, '0')}-${_taxDueDate.year}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: context.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.edit_calendar_rounded, size: 18, color: context.textSecondary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.check_circle_rounded, size: 18),
                  label: Text(
                    l10n.simpanKeGarasi,
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeCard({
    required VehicleType type,
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : context.surfaceBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : context.borderColor,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? AppColors.primary : context.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? AppColors.primary : context.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
