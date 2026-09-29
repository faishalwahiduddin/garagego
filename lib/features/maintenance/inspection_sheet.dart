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

  @override
  void initState() {
    super.initState();
    _items = InspectionChecklist.generateDefaultItems(widget.vehicle.type);
    _notesController = TextEditingController();
    _titleController = TextEditingController(
      text: 'Inspeksi Pra-Perjalanan (${widget.vehicle.type == VehicleType.car ? "Mobil" : "Motor"})',
    );
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

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.fact_check_outlined, color: AppColors.primary, size: 24),
                  SizedBox(width: 8),
                  Text(AppLocalizations.of(context)!.ceklisKondisiKendaraan, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
                ],
              ),
              IconButton(
                icon: Icon(Icons.close, color: Color(0xFF94A3B8)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Progress Header
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kelayakan: $passedCount dari $totalCount Poin Lolos',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
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
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: percentage,
                  minHeight: 8,
                  backgroundColor: AppColors.bgCard,
                  color: percentage == 1.0 ? AppColors.success : (percentage >= 0.7 ? AppColors.warning : AppColors.danger),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),

          // List of Inspection Items
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgCard,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: item.isChecked ? AppColors.success.withValues(alpha: 0.3) : AppColors.border,
                      ),
                    ),
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      title: Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: item.isChecked ? Colors.white : Color(0xFFCBD5E1),
                        ),
                      ),
                      subtitle: Text(
                        item.category,
                        style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
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
          SizedBox(height: 8),
          TextField(
            controller: _notesController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.catatanTambahanKondisiKendaraa,
              labelText: AppLocalizations.of(context)!.catatanPemeriksaOpsional,
              isDense: true,
            ),
          ),
          SizedBox(height: 14),

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
                SnackBar(content: Text(AppLocalizations.of(context)!.hasilCeklisInspeksiBerhasilDis)),
              );
            },
            icon: Icon(Icons.check_circle_outline),
            label: Text(AppLocalizations.of(context)!.simpanAuditInspeksi),
          ),
        ],
      ),
    );
  }
}
