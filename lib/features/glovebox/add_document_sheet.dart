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
    _expiryDate = d?.expiryDate ?? DateTime.now().add(Duration(days: 365));
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
                    isEditing ? 'Ubah Dokumen' : 'Tambah Dokumen Garasi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Color(0xFF94A3B8)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 14),

              DropdownButtonFormField<DocumentType>(
                initialValue: _selectedType,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.jenisDokumen),
                dropdownColor: AppColors.bgCard,
                items: DocumentType.values
                    .map((t) => DropdownMenuItem(value: t, child: Text(t.label, style: TextStyle(color: Colors.white))))
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
              SizedBox(height: 12),

              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.judulKeteranganDokumen,
                  hintText: 'Misal: Pajak PKB Tahunan STNK 2026',
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Judul dokumen wajib diisi' : null,
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _docNumberController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.nomorDokumenNoPolisNoPolisi,
                  hintText: 'B 1234 ABC',
                ),
              ),
              SizedBox(height: 12),

              // Expiry Date Picker
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _expiryDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now().add(Duration(days: 365 * 10)),
                  );
                  if (picked != null) {
                    setState(() => _expiryDate = picked);
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.tanggalMasaBerlakuJatuhTempo,
                    suffixIcon: Icon(Icons.event, size: 18),
                  ),
                  child: Text(
                    '${_expiryDate.day}/${_expiryDate.month}/${_expiryDate.year}',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _costController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.estimasiBiayaPremiRp,
                  hintText: '2500000',
                ),
                validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _notesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.catatanLokasiBerkasFisik,
                  hintText: 'Misal: STNK di dompet, BPKB di lemari arsip',
                ),
              ),
              SizedBox(height: 22),

              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final doc = VehicleDocument(
                    id: widget.initialDoc?.id ?? 'doc_${DateTime.now().millisecondsSinceEpoch}',
                    vehicleId: widget.vehicle.id,
                    title: _titleController.text.trim().isNotEmpty ? _titleController.text.trim() : _selectedType.label,
                    type: _selectedType,
                    documentNumber: _docNumberController.text.trim(),
                    expiryDate: _expiryDate,
                    cost: double.tryParse(_costController.text.trim()) ?? 0,
                    notes: _notesController.text.trim(),
                  );

                  if (isEditing) {
                    ref.read(vehicleDocumentsProvider.notifier).updateDocument(doc);
                  } else {
                    ref.read(vehicleDocumentsProvider.notifier).addDocument(doc);
                  }

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(isEditing ? 'Dokumen diperbarui!' : 'Dokumen berhasil ditambahkan!')),
                  );
                },
                child: Text(isEditing ? 'Perbarui Dokumen' : 'Simpan Dokumen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
