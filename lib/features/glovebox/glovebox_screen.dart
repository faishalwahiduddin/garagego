import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
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
              icon: Icon(Icons.add_circle_outline, color: AppColors.primaryLight),
              tooltip: AppLocalizations.of(context)!.tambahDokumen,
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
          ? Center(child: Text(AppLocalizations.of(context)!.pilihAtauTambahKendaraanTerleb))
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Card: Summary of Taxes & Documents
                      Container(
                        padding: EdgeInsets.all(18),
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
                                Icon(Icons.folder_shared_outlined, color: AppColors.primaryLight, size: 24),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Digital Glovebox — ${active.name}',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
                                      ),
                                      Text(
                                        '${active.plateNumber} • ${documents.length} Dokumen Terdaftar',
                                        style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgDark,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(AppLocalizations.of(context)!.pajakPkbTahunan, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                        SizedBox(height: 4),
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
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgDark,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(AppLocalizations.of(context)!.gantiPelat5Th, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                        SizedBox(height: 4),
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
                      SizedBox(height: 20),

                      Text(AppLocalizations.of(context)!.daftarMasaBerlakuDokumenLisens,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF94A3B8)),
                      ),
                      SizedBox(height: 10),

                      if (documents.isEmpty)
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Icon(Icons.description_outlined, size: 40, color: Color(0xFF64748B)),
                                SizedBox(height: 12),
                                Text(AppLocalizations.of(context)!.belumAdaDokumenTercatat, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                SizedBox(height: 4),
                                Text(AppLocalizations.of(context)!.simpanTanggalJatuhTempoStnkAsu, style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12), textAlign: TextAlign.center),
                                SizedBox(height: 16),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: AppColors.bgCard,
                                      builder: (_) => AddDocumentSheet(vehicle: active),
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text(AppLocalizations.of(context)!.tambahDokumenPertama),
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
                            padding: EdgeInsets.only(bottom: 12),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: statusColor.withValues(alpha: 0.15),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Icon(iconData, size: 20, color: statusColor),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(doc.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                                              if (doc.documentNumber.isNotEmpty)
                                                Text(doc.documentNumber, style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Masa Berlaku: ${doc.expiryDate.day}/${doc.expiryDate.month}/${doc.expiryDate.year}',
                                          style: TextStyle(fontSize: 12, color: Color(0xFFCBD5E1)),
                                        ),
                                        if (doc.cost > 0)
                                          Text(
                                            currency.format(doc.cost),
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.accent),
                                          ),
                                      ],
                                    ),
                                    if (doc.notes.isNotEmpty) ...[
                                      SizedBox(height: 6),
                                      Text(doc.notes, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                    ],
                                    Divider(color: AppColors.border, height: 20),
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
                                          icon: Icon(Icons.edit_outlined, size: 16),
                                          label: Text(AppLocalizations.of(context)!.ubah, style: TextStyle(fontSize: 12)),
                                        ),
                                        SizedBox(width: 8),
                                        IconButton(
                                          icon: Icon(Icons.delete_outline, size: 18, color: AppColors.danger),
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
