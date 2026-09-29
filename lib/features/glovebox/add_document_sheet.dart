import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/utils/validators.dart';

class AddDocumentSheet extends ConsumerStatefulWidget {
  final Vehicle vehicle;
  final VehicleDocument? initialDoc;

  const AddDocumentSheet({super.key, required this.vehicle, this.initialDoc});

  @override
  ConsumerState<AddDocumentSheet> createState() => _AddDocumentSheetState();
}

class _AddDocumentSheetState extends ConsumerState<AddDocumentSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _docNumberController;
  late TextEditingController _costController;
  late TextEditingController _notesController;
  late DocumentType _selectedType;
  late DateTime _expiryDate;

  @override
  void initState() {
    super.initState();
    final d = widget.initialDoc;
    _titleController = TextEditingController(text: d?.title ?? '');
    _docNumberController = TextEditingController(text: d?.documentNumber ?? widget.vehicle.plateNumber);
    _costController = TextEditingController(text: d != null ? d.cost.toStringAsFixed(0) : '0');
    _notesController = TextEditingController(text: d?.notes ?? '');
    _selectedType = d?.type ?? DocumentType.stnkTahunan;
    _expiryDate = d?.expiryDate ?? DateTime.now().add(const Duration(days: 365));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _docNumberController.dispose();
    _costController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initialDoc != null;
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isEditing
                        ? (Localizations.localeOf(context).languageCode == 'id' ? 'Ubah Dokumen' : 'Edit Document')
                        : (Localizations.localeOf(context).languageCode == 'id' ? 'Tambah Dokumen Garasi' : 'Add Garage Document'),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: context.textPrimary,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: context.textSecondary),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              DropdownButtonFormField<DocumentType>(
                initialValue: _selectedType,
                decoration: InputDecoration(labelText: l10n.jenisDokumen),
                dropdownColor: context.cardBg,
                items: DocumentType.values
                    .map((t) => DropdownMenuItem(
                          value: t,
                          child: Text(t.getLocalizedLabel(context), style: TextStyle(color: context.textPrimary, fontSize: 13)),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _selectedType = val;
                      if (_titleController.text.isEmpty) {
                        _titleController.text = val.label;
                      }
                    });
                  }
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: l10n.judulKeteranganDokumen,
                  hintText: 'Misal: PKB Tahunan / Asuransi All Risk',
                ),
                validator: (val) => val == null || val.trim().isEmpty
                    ? (Localizations.localeOf(context).languageCode == 'id' ? 'Nama dokumen wajib diisi' : 'Document name is required')
                    : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _docNumberController,
                decoration: InputDecoration(
                  labelText: l10n.nomorDokumenNoPolisNoPolisi,
                  hintText: 'Misal: B 1234 CD / POL-88902',
                ),
              ),
              const SizedBox(height: 12),

              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _expiryDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2045),
                  );
                  if (picked != null) {
                    setState(() => _expiryDate = picked);
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: l10n.tanggalMasaBerlakuJatuhTempo,
                    suffixIcon: Icon(Icons.calendar_today, size: 18, color: context.textSecondary),
                  ),
                  child: Text(
                    '${_expiryDate.day}/${_expiryDate.month}/${_expiryDate.year}',
                    style: TextStyle(color: context.textPrimary, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _costController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: l10n.totalBiayaRp,
                  hintText: 'Misal: 3500000',
                ),
                validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _notesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: Localizations.localeOf(context).languageCode == 'id' ? 'Catatan & Petunjuk Perpanjangan' : 'Notes & Renewal Instructions',
                  hintText: Localizations.localeOf(context).languageCode == 'id' ? 'Misal: Bayar online via Signal app' : 'e.g. Pay online or visit office',
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final doc = VehicleDocument(
                    id: widget.initialDoc?.id ?? 'doc_${DateTime.now().millisecondsSinceEpoch}',
                    vehicleId: widget.vehicle.id,
                    title: _titleController.text.trim(),
                    type: _selectedType,
                    expiryDate: _expiryDate,
                    documentNumber: _docNumberController.text.trim(),
                    cost: double.parse(_costController.text.trim()),
                    notes: _notesController.text.trim(),
                  );

                  if (isEditing) {
                    ref.read(vehicleDocumentsProvider.notifier).updateDocument(doc);
                  } else {
                    ref.read(vehicleDocumentsProvider.notifier).addDocument(doc);
                  }

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isEditing
                            ? (Localizations.localeOf(context).languageCode == 'id' ? 'Dokumen berhasil diperbarui!' : 'Document updated successfully!')
                            : (Localizations.localeOf(context).languageCode == 'id' ? 'Dokumen berhasil ditambahkan!' : 'Document added successfully!'),
                      ),
                    ),
                  );
                },
                child: Text(
                  isEditing
                      ? (Localizations.localeOf(context).languageCode == 'id' ? 'Perbarui Dokumen' : 'Update Document')
                      : (Localizations.localeOf(context).languageCode == 'id' ? 'Simpan Dokumen' : 'Save Document'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
