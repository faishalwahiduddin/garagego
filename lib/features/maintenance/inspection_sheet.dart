import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';

class InspectionSheet extends ConsumerStatefulWidget {
  final Vehicle vehicle;

  const InspectionSheet({super.key, required this.vehicle});

  @override
  ConsumerState<InspectionSheet> createState() => _InspectionSheetState();
}

class _InspectionSheetState extends ConsumerState<InspectionSheet> {
  late List<InspectionItem> _items;
  late TextEditingController _notesController;
  late TextEditingController _titleController;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _items = InspectionChecklist.generateDefaultItems(widget.vehicle.type);
    _notesController = TextEditingController();
    _titleController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final isId = Localizations.localeOf(context).languageCode == 'id';
      _items = InspectionChecklist.generateDefaultItems(widget.vehicle.type, isEnglish: !isId);
      final typeLabel = widget.vehicle.type == VehicleType.car
          ? (isId ? 'Mobil' : 'Car')
          : (isId ? 'Motor' : 'Motorcycle');
      _titleController.text = isId
          ? 'Inspeksi Pra-Perjalanan ($typeLabel)'
          : 'Pre-Trip Inspection ($typeLabel)';
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passedCount = _items.where((i) => i.isChecked).length;
    final totalCount = _items.length;
    final percentage = totalCount > 0 ? (passedCount / totalCount) : 0.0;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.fact_check_outlined, color: AppColors.primary, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    l10n.ceklisKondisiKendaraan,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: context.textPrimary,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.close, color: context.textSecondary),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Progress Header
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: context.surfaceBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Localizations.localeOf(context).languageCode == 'id'
                          ? 'Kelayakan: $passedCount dari $totalCount Poin Lolos'
                          : 'Roadworthiness: $passedCount of $totalCount Points Passed',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: context.textPrimary),
                    ),
                    Text(
                      '${(percentage * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: percentage == 1.0 ? AppColors.success : (percentage >= 0.7 ? AppColors.warning : AppColors.danger),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: percentage,
                    minHeight: 6,
                    backgroundColor: context.borderColor,
                    color: percentage == 1.0 ? AppColors.success : (percentage >= 0.7 ? AppColors.warning : AppColors.danger),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // List of Inspection Items
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.cardBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: item.isChecked ? AppColors.success.withValues(alpha: 0.4) : context.borderColor,
                      ),
                    ),
                    child: CheckboxListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      title: Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: item.isChecked ? context.textPrimary : context.textSecondary,
                        ),
                      ),
                      subtitle: Text(
                        item.category,
                        style: TextStyle(fontSize: 11, color: context.textMuted),
                      ),
                      value: item.isChecked,
                      activeColor: AppColors.success,
                      onChanged: (val) {
                        setState(() {
                          item.isChecked = val ?? false;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // Inspector Notes Field
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            decoration: InputDecoration(
              hintText: l10n.catatanTambahanKondisiKendaraa,
              labelText: l10n.catatanPemeriksaOpsional,
              isDense: true,
            ),
          ),
          const SizedBox(height: 14),

          // Action Buttons
          ElevatedButton.icon(
            onPressed: () {
              final checklist = InspectionChecklist(
                id: 'insp_${DateTime.now().millisecondsSinceEpoch}',
                vehicleId: widget.vehicle.id,
                date: DateTime.now(),
                odometer: widget.vehicle.currentOdometer,
                title: _titleController.text.trim(),
                items: _items,
                inspectorNotes: _notesController.text.trim(),
              );

              ref.read(inspectionChecklistsProvider.notifier).addChecklist(checklist);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.hasilCeklisInspeksiBerhasilDis)),
              );
            },
            icon: const Icon(Icons.check_circle_outline, size: 18),
            label: Text(l10n.simpanAuditInspeksi),
          ),
        ],
      ),
    );
  }
}
