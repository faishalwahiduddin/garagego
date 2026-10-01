import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/timezone_provider.dart';
import '../../core/utils/app_timezone.dart';
import 'add_document_sheet.dart';

class GloveboxScreen extends ConsumerWidget {
  const GloveboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final active = ref.watch(activeVehicleProvider);
    final documents = ref.watch(activeVehicleDocumentsProvider);
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    // Stored instants are UTC; display in the selected zone (§TZ).
    final loc = ref.watch(timezoneLocationProvider);
    final localeCode = AppTimeZone.intlLocale(Localizations.localeOf(context).languageCode);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          active != null ? '${l10n.navGlovebox}: ${active.name}' : '${l10n.navGlovebox} & ${l10n.pajakStnk}',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: context.textPrimary),
        ),
        actions: [
          if (active != null)
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: AppColors.primary, size: 18),
              ),
              tooltip: l10n.tambahDokumen,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: context.cardBg,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (_) => AddDocumentSheet(vehicle: active),
                );
              },
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: active == null
          ? Center(
              child: Text(
                l10n.pilihAtauTambahKendaraanTerleb,
                style: TextStyle(color: context.textSecondary),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Card: Clean Digital Glovebox Vault Summary
                      Card(
                        color: context.cardBg,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(Icons.folder_shared_outlined, color: AppColors.primary, size: 22),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Digital Glovebox — ${active.name}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: context.textPrimary,
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${active.plateNumber} • ${documents.length} ${Localizations.localeOf(context).languageCode == 'id' ? 'Dokumen Terdaftar' : 'Registered Documents'}',
                                          style: TextStyle(fontSize: 12, color: context.textSecondary),
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
                                        color: context.surfaceBg,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: context.borderColor),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            l10n.pajakPkbTahunan,
                                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: context.textSecondary),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            l10n.daysRemaining(active.daysUntilTaxDue.toString()),
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
                                        color: context.surfaceBg,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: context.borderColor),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            l10n.gantiPelat5Th,
                                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: context.textSecondary),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            l10n.daysRemaining(active.daysUntilPlateDue.toString()),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              color: active.isPlateClose ? AppColors.warning : context.textPrimary,
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
                      ),
                      const SizedBox(height: 20),

                      Text(
                        l10n.daftarMasaBerlakuDokumenLisens,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: context.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 10),

                      if (documents.isEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.description_outlined, size: 32, color: AppColors.primary),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  l10n.belumAdaDokumenTercatat,
                                  style: TextStyle(color: context.textPrimary, fontWeight: FontWeight.w800, fontSize: 16),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  l10n.simpanTanggalJatuhTempoStnkAsu,
                                  style: TextStyle(color: context.textSecondary, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 18),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: context.cardBg,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                      ),
                                      builder: (_) => AddDocumentSheet(vehicle: active),
                                    );
                                  },
                                  icon: const Icon(Icons.add, size: 16),
                                  label: Text(l10n.tambahDokumenPertama),
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

                          final isId = Localizations.localeOf(context).languageCode == 'id';
                          if (doc.isExpired) {
                            statusColor = AppColors.danger;
                            statusText = isId ? 'Kedaluwarsa ${-days} hari lalu' : 'Expired ${-days} days ago';
                          } else if (doc.isDueSoon) {
                            statusColor = AppColors.warning;
                            statusText = isId ? 'Jatuh tempo $days hari lagi' : 'Due in $days days';
                          } else {
                            statusColor = AppColors.success;
                            statusText = isId ? '$days hari lagi' : '$days days remaining';
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
                                          width: 38,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            color: statusColor.withValues(alpha: 0.12),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Icon(iconData, size: 20, color: statusColor),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                doc.title,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: context.textPrimary,
                                                ),
                                              ),
                                              if (doc.documentNumber.isNotEmpty)
                                                Text(
                                                  doc.documentNumber,
                                                  style: TextStyle(fontSize: 12, color: context.textSecondary),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: statusColor.withValues(alpha: 0.12),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            statusText,
                                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: statusColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Localizations.localeOf(context).languageCode == 'id'
                                              ? 'Masa Berlaku: ${AppTimeZone.formatDate(doc.expiryDate, loc, locale: localeCode)}'
                                              : 'Valid until: ${AppTimeZone.formatDate(doc.expiryDate, loc, locale: localeCode)}',
                                          style: TextStyle(fontSize: 12, color: context.textSecondary),
                                        ),
                                        if (doc.cost > 0)
                                          Text(
                                            currency.format(doc.cost),
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                      ],
                                    ),
                                    if (doc.notes.isNotEmpty) ...[
                                      const SizedBox(height: 6),
                                      Text(doc.notes, style: TextStyle(fontSize: 11, color: context.textMuted)),
                                    ],
                                    Divider(color: context.borderColor, height: 18),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton.icon(
                                          style: TextButton.styleFrom(
                                            visualDensity: VisualDensity.compact,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          ),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              backgroundColor: context.cardBg,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                              ),
                                              builder: (_) => AddDocumentSheet(vehicle: active, initialDoc: doc),
                                            );
                                          },
                                          icon: const Icon(Icons.edit_outlined, size: 15, color: AppColors.primary),
                                          label: Text(
                                            l10n.ubah,
                                            style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.danger),
                                          visualDensity: VisualDensity.compact,
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
