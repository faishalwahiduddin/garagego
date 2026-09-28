import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import 'add_document_sheet.dart';

class GloveboxScreen extends ConsumerWidget {
  const GloveboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeVehicleProvider);
    final documents = ref.watch(activeVehicleDocumentsProvider);
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(active != null ? 'Brankas: ${active.name}' : 'Brankas & Pajak'),
        actions: [
          if (active != null)
            IconButton(
              icon: const Icon(Icons.add_circle_outline, color: AppColors.primaryLight),
              tooltip: 'Tambah Dokumen',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.bgCard,
                  builder: (_) => AddDocumentSheet(vehicle: active),
                );
              },
            ),
        ],
      ),
      body: active == null
          ? const Center(child: Text('Pilih atau tambah kendaraan terlebih dahulu.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Card: Summary of Taxes & Documents
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryDark.withValues(alpha: 0.3),
                              AppColors.bgSurface,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.folder_shared_outlined, color: AppColors.primaryLight, size: 24),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Digital Glovebox — ${active.name}',
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
                                      ),
                                      Text(
                                        '${active.plateNumber} • ${documents.length} Dokumen Terdaftar',
                                        style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgDark,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Pajak PKB Tahunan', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${active.daysUntilTaxDue} Hari Lagi',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: active.isTaxClose ? AppColors.danger : AppColors.success,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgDark,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Ganti Pelat 5 Th', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${active.daysUntilPlateDue} Hari Lagi',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: active.isPlateClose ? AppColors.warning : Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'Daftar Masa Berlaku Dokumen & Lisensi',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8)),
                      ),
                      const SizedBox(height: 10),

                      if (documents.isEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                const Icon(Icons.description_outlined, size: 40, color: Color(0xFF64748B)),
                                const SizedBox(height: 12),
                                const Text('Belum Ada Dokumen Tercatat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 4),
                                const Text('Simpan tanggal jatuh tempo STNK, asuransi, dan dokumen kendaraan Anda.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12), textAlign: TextAlign.center),
                                const SizedBox(height: 16),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: AppColors.bgCard,
                                      builder: (_) => AddDocumentSheet(vehicle: active),
                                    );
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Tambah Dokumen Pertama'),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ...documents.map((doc) {
                          final days = doc.daysRemaining;
                          Color statusColor;
                          String statusText;

                          if (doc.isExpired) {
                            statusColor = AppColors.danger;
                            statusText = 'Kedaluwarsa ${-days} hari lalu';
                          } else if (doc.isDueSoon) {
                            statusColor = AppColors.warning;
                            statusText = 'Jatuh tempo $days hari lagi';
                          } else {
                            statusColor = AppColors.success;
                            statusText = '$days hari lagi';
                          }

                          IconData iconData;
                          switch (doc.type) {
                            case DocumentType.stnkTahunan:
                            case DocumentType.stnkLimaTahunan:
                              iconData = Icons.badge_outlined;
                              break;
                            case DocumentType.asuransi:
                              iconData = Icons.security_outlined;
                              break;
                            case DocumentType.ujiEmisi:
                              iconData = Icons.eco_outlined;
                              break;
                            case DocumentType.sim:
                              iconData = Icons.card_membership_outlined;
                              break;
                            case DocumentType.bpkb:
                            case DocumentType.lainnya:
                              iconData = Icons.folder_outlined;
                              break;
                          }

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
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: statusColor.withValues(alpha: 0.15),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Icon(iconData, size: 20, color: statusColor),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(doc.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                                              if (doc.documentNumber.isNotEmpty)
                                                Text(doc.documentNumber, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: statusColor.withValues(alpha: 0.15),
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(color: statusColor.withValues(alpha: 0.4)),
                                          ),
                                          child: Text(
                                            statusText,
                                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: statusColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Masa Berlaku: ${doc.expiryDate.day}/${doc.expiryDate.month}/${doc.expiryDate.year}',
                                          style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1)),
                                        ),
                                        if (doc.cost > 0)
                                          Text(
                                            currency.format(doc.cost),
                                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.accent),
                                          ),
                                      ],
                                    ),
                                    if (doc.notes.isNotEmpty) ...[
                                      const SizedBox(height: 6),
                                      Text(doc.notes, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                    ],
                                    const Divider(color: AppColors.border, height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              backgroundColor: AppColors.bgCard,
                                              builder: (_) => AddDocumentSheet(vehicle: active, initialDoc: doc),
                                            );
                                          },
                                          icon: const Icon(Icons.edit_outlined, size: 16),
                                          label: const Text('Ubah', style: TextStyle(fontSize: 12)),
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.danger),
                                          onPressed: () {
                                            ref.read(vehicleDocumentsProvider.notifier).deleteDocument(doc.id);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
