import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../domain/models/garage_gamification.dart';

final garageGamificationProvider = Provider<GarageGamificationState>((ref) {
  final vehicles = ref.watch(vehiclesProvider);
  final serviceLogs = ref.watch(serviceLogsProvider);
  final fuelLogs = ref.watch(fuelLogsProvider);
  final inspections = ref.watch(inspectionChecklistsProvider);
  final documents = ref.watch(vehicleDocumentsProvider);
  final healthScoreResult = ref.watch(vehicleHealthScoreProvider);

  final vehicleCount = vehicles.length;
  final serviceCount = serviceLogs.length;
  final fuelCount = fuelLogs.length;
  final inspectionCount = inspections.length;
  final documentCount = documents.length;
  final healthScore = healthScoreResult?.score ?? 100;
  final maxOdometer = vehicles.isEmpty
      ? 0
      : vehicles.map((v) => v.currentOdometer).reduce((a, b) => a > b ? a : b);
  final hasOilChange = serviceLogs.any((s) => s.isOilChange);

  final criteria = GarageCriteria(
    vehicleCount: vehicleCount,
    serviceCount: serviceCount,
    fuelCount: fuelCount,
    inspectionCount: inspectionCount,
    documentCount: documentCount,
    healthScore: healthScore,
    maxOdometer: maxOdometer,
    hasOilChange: hasOilChange,
  );

  final badgeStatuses = GarageBadge.allBadges.map((badge) {
    final unlocked = badge.isUnlocked(criteria);
    return GarageBadgeStatus(badge: badge, isUnlocked: unlocked);
  }).toList();

  final unlockedBadgeCount = badgeStatuses.where((b) => b.isUnlocked).length;

  // XP calculations:
  // - 50 XP per vehicle registered
  // - 30 XP per service log recorded
  // - 15 XP per fuel log recorded
  // - 35 XP per inspection checklist completed
  // - 20 XP per legal/vehicle document saved
  // - 100 XP per unlocked achievement badge
  final xpVehicles = vehicleCount * 50;
  final xpServices = serviceCount * 30;
  final xpFuels = fuelCount * 15;
  final xpInspections = inspectionCount * 35;
  final xpDocuments = documentCount * 20;
  final xpBadges = unlockedBadgeCount * 100;

  final totalXp = xpVehicles + xpServices + xpFuels + xpInspections + xpDocuments + xpBadges;

  final currentLevel = GarageLevel.forXp(totalXp);
  final nextLevel = GarageLevel.nextLevelForXp(totalXp);

  double levelProgress = 1.0;
  if (nextLevel != null) {
    final span = nextLevel.requiredXp - currentLevel.requiredXp;
    if (span > 0) {
      levelProgress = ((totalXp - currentLevel.requiredXp) / span).clamp(0.0, 1.0);
    }
  }

  return GarageGamificationState(
    totalXp: totalXp,
    currentLevel: currentLevel,
    nextLevel: nextLevel,
    levelProgress: levelProgress,
    badges: badgeStatuses,
  );
});
