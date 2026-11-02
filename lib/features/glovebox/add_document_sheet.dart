import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/utils/l10n_helpers.dart';
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
    _docNumberController = TextEditingController(
      text: d?.documentNumber ?? widget.vehicle.plateNumber,
    );
    _costController = TextEditingController(
      text: d != null ? d.cost.toStringAsFixed(0) : '0',
    );
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
                    isEditing ? l10n.docEditTitle : l10n.docAddTitle,
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
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(
                          t.getLocalizedLabel(context),
                          style: TextStyle(
                            color: context.textPrimary,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _selectedType = val;
                      if (_titleController.text.isEmpty) {
                        _titleController.text = val.getLocalizedLabel(context);
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
                  hintText: l10n.docTitleHint,
                ),
                validator: (val) => val == null || val.trim().isEmpty
                    ? l10n.validationDocNameRequired
                    : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _docNumberController,
                decoration: InputDecoration(
                  labelText: l10n.nomorDokumenNoPolisNoPolisi,
                  hintText: l10n.docNumberHint,
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
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: context.textSecondary,
                    ),
                  ),
                  child: Text(
                    MaterialLocalizations.of(
                      context,
                    ).formatCompactDate(_expiryDate),
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
                  hintText: l10n.docCostHint,
                ),
                validator: (val) => mapValidationError(
                  AppValidators.validateCost(double.tryParse(val ?? '')),
                  l10n,
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _notesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: l10n.docNotesLabel,
                  hintText: l10n.docNotesHint,
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final doc = VehicleDocument(
                    id:
                        widget.initialDoc?.id ??
                        'doc_${DateTime.now().millisecondsSinceEpoch}',
                    vehicleId: widget.vehicle.id,
                    title: _titleController.text.trim(),
                    type: _selectedType,
                    expiryDate: _expiryDate,
                    documentNumber: _docNumberController.text.trim(),
                    cost: double.parse(_costController.text.trim()),
                    notes: _notesController.text.trim(),
                  );

                  if (isEditing) {
                    ref
                        .read(vehicleDocumentsProvider.notifier)
                        .updateDocument(doc);
                  } else {
                    ref
                        .read(vehicleDocumentsProvider.notifier)
                        .addDocument(doc);
                  }

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isEditing ? l10n.docUpdated : l10n.docAdded,
                      ),
                    ),
                  );
                },
                child: Text(isEditing ? l10n.docUpdate : l10n.docSave),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
