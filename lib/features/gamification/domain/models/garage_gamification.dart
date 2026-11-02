import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class GarageLevel {
  final int level;
  final int requiredXp;
  final String emoji;
  final IconData icon;

  const GarageLevel({
    required this.level,
    required this.requiredXp,
    required this.emoji,
    required this.icon,
  });

  /// Level name; the copy lives in the ARB files.
  String getLocalizedTitle(AppLocalizations l10n) {
    switch (level) {
      case 1:
        return l10n.gamesLvl1;
      case 2:
        return l10n.gamesLvl2;
      case 3:
        return l10n.gamesLvl3;
      case 4:
        return l10n.gamesLvl4;
      default:
        return l10n.gamesLvl5;
    }
  }

  static const List<GarageLevel> levels = [
    GarageLevel(
      level: 1,
      requiredXp: 0,
      emoji: '🚗',
      icon: Icons.directions_car_outlined,
    ),
    GarageLevel(
      level: 2,
      requiredXp: 150,
      emoji: '🔧',
      icon: Icons.build_outlined,
    ),
    GarageLevel(
      level: 3,
      requiredXp: 450,
      emoji: '🛡️',
      icon: Icons.shield_outlined,
    ),
    GarageLevel(
      level: 4,
      requiredXp: 1000,
      emoji: '⚡',
      icon: Icons.bolt,
    ),
    GarageLevel(
      level: 5,
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
  final IconData icon;
  final bool Function(GarageCriteria criteria) isUnlocked;

  const GarageBadge({
    required this.id,
    required this.icon,
    required this.isUnlocked,
  });

  /// Badge name; the copy lives in the ARB files.
  String getLocalizedTitle(AppLocalizations l10n) {
    switch (id) {
      case 'first_ride':
        return l10n.badgeFirstRideTitle;
      case 'oil_care':
        return l10n.badgeOilCareTitle;
      case 'service_veteran':
        return l10n.badgeServiceVeteranTitle;
      case 'fuel_watcher':
        return l10n.badgeFuelWatcherTitle;
      case 'safe_voyage':
        return l10n.badgeSafeVoyageTitle;
      case 'doc_keeper':
        return l10n.badgeDocKeeperTitle;
      case 'prime_fleet':
        return l10n.badgePrimeFleetTitle;
      default:
        return l10n.badgeRoadWarriorTitle;
    }
  }

  /// Badge description; the copy lives in the ARB files.
  String getLocalizedDescription(AppLocalizations l10n) {
    switch (id) {
      case 'first_ride':
        return l10n.badgeFirstRideDesc;
      case 'oil_care':
        return l10n.badgeOilCareDesc;
      case 'service_veteran':
        return l10n.badgeServiceVeteranDesc;
      case 'fuel_watcher':
        return l10n.badgeFuelWatcherDesc;
      case 'safe_voyage':
        return l10n.badgeSafeVoyageDesc;
      case 'doc_keeper':
        return l10n.badgeDocKeeperDesc;
      case 'prime_fleet':
        return l10n.badgePrimeFleetDesc;
      default:
        return l10n.badgeRoadWarriorDesc;
    }
  }

  static final List<GarageBadge> allBadges = [
    GarageBadge(
      id: 'first_ride',
      icon: Icons.directions_car,
      isUnlocked: (c) => c.vehicleCount >= 1,
    ),
    GarageBadge(
      id: 'oil_care',
      icon: Icons.opacity,
      isUnlocked: (c) => c.hasOilChange,
    ),
    GarageBadge(
      id: 'service_veteran',
      icon: Icons.build_circle,
      isUnlocked: (c) => c.serviceCount >= 3,
    ),
    GarageBadge(
      id: 'fuel_watcher',
      icon: Icons.local_gas_station,
      isUnlocked: (c) => c.fuelCount >= 3,
    ),
    GarageBadge(
      id: 'safe_voyage',
      icon: Icons.fact_check,
      isUnlocked: (c) => c.inspectionCount >= 1,
    ),
    GarageBadge(
      id: 'doc_keeper',
      icon: Icons.folder_shared,
      isUnlocked: (c) => c.documentCount >= 1,
    ),
    GarageBadge(
      id: 'prime_fleet',
      icon: Icons.verified,
      isUnlocked: (c) => c.healthScore >= 90,
    ),
    GarageBadge(
      id: 'road_warrior',
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
