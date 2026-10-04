import 'package:flutter/material.dart';

class GarageLevel {
  final int level;
  final String titleId;
  final String titleEn;
  final int requiredXp;
  final String emoji;
  final IconData icon;

  const GarageLevel({
    required this.level,
    required this.titleId,
    required this.titleEn,
    required this.requiredXp,
    required this.emoji,
    required this.icon,
  });

  String getLocalizedTitle(BuildContext context) {
    final isId = Localizations.localeOf(context).languageCode == 'id';
    return isId ? titleId : titleEn;
  }

  static const List<GarageLevel> levels = [
    GarageLevel(
      level: 1,
      titleId: 'Pengendara Pemula',
      titleEn: 'Novice Driver',
      requiredXp: 0,
      emoji: '🚗',
      icon: Icons.directions_car_outlined,
    ),
    GarageLevel(
      level: 2,
      titleId: 'Pemilik Peduli',
      titleEn: 'Diligent Owner',
      requiredXp: 150,
      emoji: '🔧',
      icon: Icons.build_outlined,
    ),
    GarageLevel(
      level: 3,
      titleId: 'Penjaga Armada',
      titleEn: 'Fleet Guardian',
      requiredXp: 450,
      emoji: '🛡️',
      icon: Icons.shield_outlined,
    ),
    GarageLevel(
      level: 4,
      titleId: 'Spesialis Servis',
      titleEn: 'Maintenance Specialist',
      requiredXp: 1000,
      emoji: '⚡',
      icon: Icons.bolt,
    ),
    GarageLevel(
      level: 5,
      titleId: 'Master Garasi',
      titleEn: 'Master Custodian',
      requiredXp: 2500,
      emoji: '👑',
      icon: Icons.military_tech,
    ),
  ];

  static GarageLevel forXp(int xp) {
    GarageLevel current = levels.first;
    for (final lvl in levels) {
      if (xp >= lvl.requiredXp) {
        current = lvl;
      } else {
        break;
      }
    }
    return current;
  }

  static GarageLevel? nextLevelForXp(int xp) {
    for (final lvl in levels) {
      if (xp < lvl.requiredXp) {
        return lvl;
      }
    }
    return null;
  }
}

class GarageBadge {
  final String id;
  final String titleId;
  final String titleEn;
  final String descriptionId;
  final String descriptionEn;
  final IconData icon;
  final bool Function(GarageCriteria criteria) isUnlocked;

  const GarageBadge({
    required this.id,
    required this.titleId,
    required this.titleEn,
    required this.descriptionId,
    required this.descriptionEn,
    required this.icon,
    required this.isUnlocked,
  });

  String getLocalizedTitle(BuildContext context) {
    final isId = Localizations.localeOf(context).languageCode == 'id';
    return isId ? titleId : titleEn;
  }

  String getLocalizedDescription(BuildContext context) {
    final isId = Localizations.localeOf(context).languageCode == 'id';
    return isId ? descriptionId : descriptionEn;
  }

  static final List<GarageBadge> allBadges = [
    GarageBadge(
      id: 'first_ride',
      titleId: 'Armada Pertama',
      titleEn: 'First Vehicle',
      descriptionId: 'Mendaftarkan kendaraan pertama ke dalam garasi digital.',
      descriptionEn: 'Registered your first vehicle in the digital garage.',
      icon: Icons.directions_car,
      isUnlocked: (c) => c.vehicleCount >= 1,
    ),
    GarageBadge(
      id: 'oil_care',
      titleId: 'Disiplin Oli',
      titleEn: 'Oil Sentinel',
      descriptionId: 'Mencatat riwayat ganti oli mesin tepat waktu.',
      descriptionEn: 'Logged an on-time engine oil change.',
      icon: Icons.opacity,
      isUnlocked: (c) => c.hasOilChange,
    ),
    GarageBadge(
      id: 'service_veteran',
      titleId: 'Rutin Berkala',
      titleEn: 'Service Regular',
      descriptionId: 'Mencatatkan minimal 3 log servis perawatan berkala.',
      descriptionEn: 'Recorded at least 3 maintenance service logs.',
      icon: Icons.build_circle,
      isUnlocked: (c) => c.serviceCount >= 3,
    ),
    GarageBadge(
      id: 'fuel_watcher',
      titleId: 'Jejak Efisiensi',
      titleEn: 'Fuel Tracker',
      descriptionId: 'Mencatat minimal 3 pengisian BBM untuk memantau konsumsi.',
      descriptionEn: 'Logged at least 3 fuel fill-ups to monitor efficiency.',
      icon: Icons.local_gas_station,
      isUnlocked: (c) => c.fuelCount >= 3,
    ),
    GarageBadge(
      id: 'safe_voyage',
      titleId: 'Inspektur Teliti',
      titleEn: 'Safety Inspector',
      descriptionId: 'Menyelesaikan checklist inspeksi keselamatan kendaraan.',
      descriptionEn: 'Completed a vehicle safety inspection checklist.',
      icon: Icons.fact_check,
      isUnlocked: (c) => c.inspectionCount >= 1,
    ),
    GarageBadge(
      id: 'doc_keeper',
      titleId: 'Tertib Dokumen',
      titleEn: 'Document Guard',
      descriptionId: 'Menyimpan dokumen legalitas (STNK/Pajak/SIM/Asuransi).',
      descriptionEn: 'Saved vehicle legal documents (Tax/License/Insurance).',
      icon: Icons.folder_shared,
      isUnlocked: (c) => c.documentCount >= 1,
    ),
    GarageBadge(
      id: 'prime_fleet',
      titleId: 'Kondisi Prima',
      titleEn: 'Prime Health',
      descriptionId: 'Mencapai skor kesehatan kendaraan 90 atau lebih.',
      descriptionEn: 'Achieved vehicle health score of 90 or above.',
      icon: Icons.verified,
      isUnlocked: (c) => c.healthScore >= 90,
    ),
    GarageBadge(
      id: 'road_warrior',
      titleId: 'Jelajah 10.000 KM',
      titleEn: 'Road Warrior',
      descriptionId: 'Memantau kendaraan dengan odometer melampaui 10.000 km.',
      descriptionEn: 'Tracking a vehicle with odometer exceeding 10,000 km.',
      icon: Icons.speed,
      isUnlocked: (c) => c.maxOdometer >= 10000,
    ),
  ];
}

class GarageCriteria {
  final int vehicleCount;
  final int serviceCount;
  final int fuelCount;
  final int inspectionCount;
  final int documentCount;
  final int healthScore;
  final int maxOdometer;
  final bool hasOilChange;

  const GarageCriteria({
    required this.vehicleCount,
    required this.serviceCount,
    required this.fuelCount,
    required this.inspectionCount,
    required this.documentCount,
    required this.healthScore,
    required this.maxOdometer,
    required this.hasOilChange,
  });
}

class GarageGamificationState {
  final int totalXp;
  final GarageLevel currentLevel;
  final GarageLevel? nextLevel;
  final double levelProgress;
  final List<GarageBadgeStatus> badges;

  const GarageGamificationState({
    required this.totalXp,
    required this.currentLevel,
    required this.nextLevel,
    required this.levelProgress,
    required this.badges,
  });

  int get unlockedCount => badges.where((b) => b.isUnlocked).length;
}

class GarageBadgeStatus {
  final GarageBadge badge;
  final bool isUnlocked;

  const GarageBadgeStatus({
    required this.badge,
    required this.isUnlocked,
  });
}
