import 'package:flutter/material.dart';
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
  DateTime _taxDueDate = DateTime.now().add(Duration(days: 365));

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
      SnackBar(content: Text('Kendaraan "${newVehicle.name}" berhasil ditambahkan ke garasi!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
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
                  Text(AppLocalizations.of(context)!.tambahKendaraanBaru, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white)),
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, size: 20)),
                ],
              ),
              SizedBox(height: 16),

              // Type Selector
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      avatar: Icon(Icons.directions_car, size: 16),
                      label: Text(AppLocalizations.of(context)!.mobil),
                      selected: _selectedType == VehicleType.car,
                      selectedColor: AppColors.primary,
                      onSelected: (val) {
                        if (val) {
                          setState(() {
                            _selectedType = VehicleType.car;
                            _intervalController.text = '5000';
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ChoiceChip(
                      avatar: Icon(Icons.two_wheeler, size: 16),
                      label: Text(AppLocalizations.of(context)!.motor),
                      selected: _selectedType == VehicleType.motorcycle,
                      selectedColor: AppColors.primary,
                      onSelected: (val) {
                        if (val) {
                          setState(() {
                            _selectedType = VehicleType.motorcycle;
                            _intervalController.text = '2500';
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),

              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.namaModelKendaraan, hintText: 'Misal: Honda HR-V / Yamaha NMAX'),
                validator: AppValidators.validateVehicleName,
              ),
              SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _plateController,
                      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.nomorPelatPolisi, hintText: 'B 1234 CD'),
                      validator: AppValidators.validatePlateNumber,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.tahunPembuatan, hintText: '2023'),
                      validator: (val) {
                        final y = int.tryParse(val ?? '');
                        if (y == null || y < 1970 || y > DateTime.now().year + 1) {
                          return 'Tahun tidak valid';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _odoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.odometerSaatIniKm, hintText: '15000'),
                      validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _intervalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.intervalOliKm, hintText: '5000'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),

              // Tax Due Date
              InkWell(
                onTap: _pickTaxDate,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.bgSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.event_outlined, size: 18, color: AppColors.primaryLight),
                      SizedBox(width: 10),
                      Text(
                        'Jatuh Tempo Pajak: ${_taxDueDate.day.toString().padLeft(2, '0')}-${_taxDueDate.month.toString().padLeft(2, '0')}-${_taxDueDate.year}',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(Icons.edit, size: 16, color: Color(0xFF94A3B8)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _save,
                child: Text(AppLocalizations.of(context)!.simpanKeGarasi),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
