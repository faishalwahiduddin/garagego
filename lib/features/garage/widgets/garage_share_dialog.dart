import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/models/vehicle.dart';
import '../../../core/services/analytics_service.dart';
import '../../../core/utils/app_timezone.dart';
import '../../../core/utils/web_download_helper.dart';

enum GarageShareAspectRatio {
  feed('4:5 Feed', 4 / 5, 1080, 1350),
  story('9:16 Story', 9 / 16, 1080, 1920);

  final String label;
  final double ratio;
  final double width;
  final double height;

  const GarageShareAspectRatio(this.label, this.ratio, this.width, this.height);
}

enum GarageShareTheme {
  racingCarbon(
    name: 'Racing Carbon',
    gradient: [Color(0xFF111827), Color(0xFF1F2937)],
    accentColor: Color(0xFFF59E0B),
    badgeBackground: Color(0xFF374151),
    textColor: Colors.white,
    secondaryTextColor: Color(0xFF9CA3AF),
  ),
  speedwayRed(
    name: 'Speedway Red',
    gradient: [Color(0xFF1C1917), Color(0xFF450A0A)],
    accentColor: Color(0xFFEF4444),
    badgeBackground: Color(0xFF7F1D1D),
    textColor: Colors.white,
    secondaryTextColor: Color(0xFFA8A29E),
  ),
  primeTeal(
    name: 'Prime Teal',
    gradient: [Color(0xFF0F172A), Color(0xFF0D9488)],
    accentColor: Color(0xFF14B8A6),
    badgeBackground: Color(0xFF115E59),
    textColor: Colors.white,
    secondaryTextColor: Color(0xFF99F6E4),
  ),
  pitStopBlue(
    name: 'Pit Stop Blue',
    gradient: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
    accentColor: Color(0xFF38BDF8),
    badgeBackground: Color(0xFF1E40AF),
    textColor: Colors.white,
    secondaryTextColor: Color(0xFFBAE6FD),
  );

  final String name;
  final List<Color> gradient;
  final Color accentColor;
  final Color badgeBackground;
  final Color textColor;
  final Color secondaryTextColor;

  const GarageShareTheme({
    required this.name,
    required this.gradient,
    required this.accentColor,
    required this.badgeBackground,
    required this.textColor,
    required this.secondaryTextColor,
  });
}

class GarageShareDialog extends StatefulWidget {
  final Vehicle vehicle;
  final VehicleHealthResult? health;

  const GarageShareDialog({
    super.key,
    required this.vehicle,
    this.health,
  });

  static Future<void> show(
    BuildContext context, {
    required Vehicle vehicle,
    VehicleHealthResult? health,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (context) => GarageShareDialog(
        vehicle: vehicle,
        health: health,
      ),
    );
  }

  @override
  State<GarageShareDialog> createState() => _GarageShareDialogState();
}

class _GarageShareDialogState extends State<GarageShareDialog> {
  final GlobalKey _repaintKey = GlobalKey();
  GarageShareAspectRatio _aspectRatio = GarageShareAspectRatio.feed;
  GarageShareTheme _selectedTheme = GarageShareTheme.racingCarbon;
  bool _isExporting = false;

  String get _shareText {
    final v = widget.vehicle;
    final health = widget.health;
    final odoStr = NumberFormat('#,###', 'id_ID').format(v.currentOdometer);
    final score = health?.score ?? 100;
    final status = health?.statusText ?? 'Prima';

    return '🚗 Paspor Perawatan Kendaraan — ${v.name} (${v.plateNumber})\n'
        '🏆 Skor Kesehatan: $score/100 ($status)\n'
        '⚡ Odometer: $odoStr km\n'
        '🛢️ Interval Ganti Oli: ${v.kmUntilNextOilChange > 0 ? "+${v.kmUntilNextOilChange} km lagi" : "Perlu Ganti Oli Segera"}\n'
        '📋 Pajak PKB: ${v.daysUntilTaxDue} hari lagi\n\n'
        'Kelola perawatan garasi lengkap & offline di GarageGo: https://garagego.faishal.id';
  }

  Future<Uint8List?> _capturePngBytes() async {
    try {
      final boundary = _repaintKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) return null;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint('Error capturing vehicle card: $e');
      return null;
    }
  }

  Future<void> _shareImage() async {
    setState(() => _isExporting = true);
    try {
      final bytes = await _capturePngBytes();
      if (bytes == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gagal membuat gambar paspor kendaraan')),
          );
        }
        return;
      }

      final safePlate = widget.vehicle.plateNumber.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
      final filename = 'garagego_${safePlate}_${_aspectRatio.name}.png';

      if (kIsWeb) {
        downloadFileWeb(bytes, filename, 'image/png');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Paspor kendaraan berhasil diunduh')),
          );
        }
      } else {
        // ignore: deprecated_member_use
        await Share.shareXFiles(
          [
            XFile.fromData(
              bytes,
              name: filename,
              mimeType: 'image/png',
            ),
          ],
          text: _shareText,
        );
      }
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  void _copyText() {
    Clipboard.setData(ClipboardData(text: _shareText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ringkasan status kendaraan berhasil disalin'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final v = widget.vehicle;
    final health = widget.health;
    final isCar = v.type == VehicleType.car;
    final score = health?.score ?? 100;
    final statusText = health?.statusText ?? 'Prima';
    final odoStr = NumberFormat('#,###', 'id_ID').format(v.currentOdometer);

    return Dialog(
      backgroundColor: context.cardBg,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 720),
        child: Column(
          children: [
            // Modal Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
              child: Row(
                children: [
                  const Icon(Icons.badge_outlined, size: 22, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Bagikan Paspor Kendaraan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: context.textPrimary,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 20, color: context.textSecondary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Aspect ratio selector
                    SegmentedButton<GarageShareAspectRatio>(
                      segments: GarageShareAspectRatio.values
                          .map(
                            (r) => ButtonSegment(
                              value: r,
                              label: Text(
                                r.label,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      selected: {_aspectRatio},
                      onSelectionChanged: (selected) {
                        setState(() => _aspectRatio = selected.first);
                      },
                    ),
                    const SizedBox(height: 16),

                    // Theme selector chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: GarageShareTheme.values.map((thm) {
                          final isSelected = _selectedTheme == thm;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: thm.gradient,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(thm.name),
                                ],
                              ),
                              selected: isSelected,
                              onSelected: (_) {
                                setState(() => _selectedTheme = thm);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Preview Card
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: RepaintBoundary(
                          key: _repaintKey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: AspectRatio(
                              aspectRatio: _aspectRatio.ratio,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: _selectedTheme.gradient,
                                  ),
                                ),
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Top Bar
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _selectedTheme.accentColor.withValues(alpha: 0.2),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: _selectedTheme.accentColor.withValues(alpha: 0.5),
                                              width: 1,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.garage,
                                                size: 14,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                'GARAGEGO',
                                                style: TextStyle(
                                                  color: _selectedTheme.accentColor,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _selectedTheme.badgeBackground,
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(
                                              color: Colors.white.withValues(alpha: 0.2),
                                            ),
                                          ),
                                          child: Text(
                                            v.plateNumber,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),

                                    // Vehicle Name & Year
                                    Row(
                                      children: [
                                        Icon(
                                          isCar ? Icons.directions_car : Icons.two_wheeler,
                                          size: 24,
                                          color: _selectedTheme.accentColor,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                v.name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: _selectedTheme.textColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: -0.3,
                                                ),
                                              ),
                                              Text(
                                                'Tahun ${v.manufactureYear} • ${isCar ? 'Mobil' : 'Sepeda Motor'}',
                                                style: TextStyle(
                                                  color: _selectedTheme.secondaryTextColor,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 14),

                                    // Health Score Banner
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.08),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: _selectedTheme.accentColor.withValues(alpha: 0.3),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                width: 44,
                                                height: 44,
                                                child: CircularProgressIndicator(
                                                  value: score / 100,
                                                  backgroundColor: Colors.white.withValues(alpha: 0.15),
                                                  color: _selectedTheme.accentColor,
                                                  strokeWidth: 4,
                                                ),
                                              ),
                                              Text(
                                                '$score',
                                                style: TextStyle(
                                                  color: _selectedTheme.textColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 14),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'STATUS KESEHATAN ARMADA',
                                                  style: TextStyle(
                                                    color: _selectedTheme.accentColor,
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: 0.8,
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  'Kondisi $statusText',
                                                  style: TextStyle(
                                                    color: _selectedTheme.textColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),

                                    // Metrics Grid
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withValues(alpha: 0.06),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ODOMETER',
                                                  style: TextStyle(
                                                    color: _selectedTheme.secondaryTextColor,
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  '$odoStr km',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: _selectedTheme.textColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withValues(alpha: 0.06),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'GANTI OLI',
                                                  style: TextStyle(
                                                    color: _selectedTheme.secondaryTextColor,
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  v.kmUntilNextOilChange > 0
                                                      ? '+${v.kmUntilNextOilChange} km'
                                                      : 'Perlu Servis',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: v.kmUntilNextOilChange > 0
                                                        ? _selectedTheme.accentColor
                                                        : const Color(0xFFEF4444),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withValues(alpha: 0.06),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'PAJAK PKB',
                                                  style: TextStyle(
                                                    color: _selectedTheme.secondaryTextColor,
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  '${v.daysUntilTaxDue} hr lagi',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: _selectedTheme.textColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),

                                    // Key condition checklist / highlights
                                    if (health != null && health.goodPoints.isNotEmpty) ...[
                                      ...health.goodPoints.take(_aspectRatio == GarageShareAspectRatio.feed ? 2 : 4).map(
                                            (gp) => Padding(
                                              padding: const EdgeInsets.only(bottom: 4),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    '✓ ',
                                                    style: TextStyle(
                                                      color: Color(0xFF10B981),
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      gp,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: _selectedTheme.secondaryTextColor,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    ],

                                    const Spacer(),

                                    // Footer
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: _selectedTheme.secondaryTextColor.withValues(alpha: 0.2),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Logbook: ${AppTimeZone.formatDate(AppTimeZone.nowUtc(), AppTimeZone.locationOrFallback(null))}',
                                            style: TextStyle(
                                              color: _selectedTheme.secondaryTextColor.withValues(alpha: 0.7),
                                              fontSize: 9,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'garagego.faishal.id',
                                            style: TextStyle(
                                              color: _selectedTheme.accentColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom action buttons
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.copy, size: 16),
                    label: const Text('Salin Ringkasan'),
                    onPressed: _copyText,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      icon: _isExporting
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.share_rounded, size: 18),
                      label: Text(
                        _isExporting
                            ? 'Menyiapkan...'
                            : (kIsWeb ? 'Unduh Paspor' : 'Bagikan Paspor'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      onPressed: _isExporting ? null : _shareImage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
