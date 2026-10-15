import 'package:flutter/material.dart';

class FleetSlideItem {
  final String headline;
  final String subtext;
  final IconData? icon;
  final String? badgeText;

  const FleetSlideItem({
    required this.headline,
    required this.subtext,
    this.icon,
    this.badgeText,
  });
}

class FleetAppConfig {
  final String appName;
  final String tagline;
  final Color primaryColor;
  final Color darkColor;
  final Color accentColor;
  final IconData fallbackIcon;
  final String skipLabel;
  final String nextLabel;
  final String getStartedLabel;
  final String defaultBadgeText;
  final String privacyHeadline;
  final String privacyDetail;
  final List<FleetSlideItem> slides;

  const FleetAppConfig({
    required this.appName,
    required this.tagline,
    required this.primaryColor,
    required this.darkColor,
    required this.accentColor,
    required this.fallbackIcon,
    this.skipLabel = 'Lewati',
    this.nextLabel = 'Lanjut',
    this.getStartedLabel = 'Mulai Sekarang',
    this.defaultBadgeText = '100% Offline & Cepat',
    this.privacyHeadline = 'Privasi & Offline Terjamin',
    this.privacyDetail =
        'Semua data tersimpan aman di perangkat Anda tanpa pelacak.',
    required this.slides,
  });

  static final FleetAppConfig current = FleetAppConfig(
    appName: 'GaragegoGo',
    tagline: 'Catat servis berkala, ganti oli, BBM & pajak STNK kendaraan.',
    primaryColor: const Color(0xFF334155),
    darkColor: const Color(0xFF1E293B),
    accentColor: const Color(0xFFF59E0B),
    fallbackIcon: Icons.directions_car_rounded,
    slides: const [
    FleetSlideItem(
      headline: 'Garasi Anda',
      subtext: 'Mobil & motor dalam satu tempat',
      icon: Icons.speed_rounded,
      badgeText: '100% Offline & Privat',
    ),
    FleetSlideItem(
      headline: 'Perawatan',
      subtext: 'Servis, oli, STNK',
      icon: Icons.construction_rounded,
      badgeText: 'Ringan & Responsif',
    ),
    FleetSlideItem(
      headline: 'BBM',
      subtext: 'Catat konsumsi bahan bakar',
      icon: Icons.receipt_long_rounded,
      badgeText: 'Tanpa Iklan & Tanpa Akun',
    ),
    FleetSlideItem(
      headline: 'Offline',
      subtext: 'Tanpa iklan, data lokal',
      icon: Icons.shield_rounded,
      badgeText: 'Data Tersimpan di Perangkat',
    ),
    ],
  );
}
