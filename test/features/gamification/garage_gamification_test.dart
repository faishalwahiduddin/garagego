import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/services/analytics_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/features/gamification/domain/models/garage_gamification.dart';
import 'package:garagego/features/gamification/providers/garage_gamification_provider.dart';

void main() {
  setUpAll(AppTimeZone.initAppTimeZones);

  group('GarageLevel Tests', () {
    test('resolves correct level based on XP thresholds', () {
      expect(GarageLevel.forXp(0).level, equals(1));
      expect(GarageLevel.forXp(100).level, equals(1));
      expect(GarageLevel.forXp(150).level, equals(2));
      expect(GarageLevel.forXp(449).level, equals(2));
      expect(GarageLevel.forXp(450).level, equals(3));
      expect(GarageLevel.forXp(1000).level, equals(4));
      expect(GarageLevel.forXp(2500).level, equals(5));
      expect(GarageLevel.forXp(9999).level, equals(5));
    });

    test('returns correct next level or null at max level', () {
      expect(GarageLevel.nextLevelForXp(0)?.level, equals(2));
      expect(GarageLevel.nextLevelForXp(200)?.level, equals(3));
      expect(GarageLevel.nextLevelForXp(2500), isNull);
    });
  });

  group('GarageBadge Criteria Tests', () {
    test('first_ride badge checks vehicle count', () {
      final badge = GarageBadge.allBadges.firstWhere((b) => b.id == 'first_ride');
      const criteria0 = GarageCriteria(
        vehicleCount: 0,
        serviceCount: 0,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 100,
        maxOdometer: 0,
        hasOilChange: false,
      );
      expect(badge.isUnlocked(criteria0), isFalse);

      const criteria1 = GarageCriteria(
        vehicleCount: 1,
        serviceCount: 0,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 100,
        maxOdometer: 0,
        hasOilChange: false,
      );
      expect(badge.isUnlocked(criteria1), isTrue);
    });

    test('oil_care badge checks hasOilChange', () {
      final badge = GarageBadge.allBadges.firstWhere((b) => b.id == 'oil_care');
      const criteriaNoOil = GarageCriteria(
        vehicleCount: 1,
        serviceCount: 2,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 100,
        maxOdometer: 5000,
        hasOilChange: false,
      );
      expect(badge.isUnlocked(criteriaNoOil), isFalse);

      const criteriaWithOil = GarageCriteria(
        vehicleCount: 1,
        serviceCount: 2,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 100,
        maxOdometer: 5000,
        hasOilChange: true,
      );
      expect(badge.isUnlocked(criteriaWithOil), isTrue);
    });

    test('prime_fleet badge checks healthScore >= 90', () {
      final badge = GarageBadge.allBadges.firstWhere((b) => b.id == 'prime_fleet');
      const criteriaLow = GarageCriteria(
        vehicleCount: 1,
        serviceCount: 0,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 89,
        maxOdometer: 5000,
        hasOilChange: false,
      );
      expect(badge.isUnlocked(criteriaLow), isFalse);

      const criteriaHigh = GarageCriteria(
        vehicleCount: 1,
        serviceCount: 0,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 90,
        maxOdometer: 5000,
        hasOilChange: false,
      );
      expect(badge.isUnlocked(criteriaHigh), isTrue);
    });

    test('road_warrior badge checks maxOdometer >= 10000', () {
      final badge = GarageBadge.allBadges.firstWhere((b) => b.id == 'road_warrior');
      const criteriaBelow = GarageCriteria(
        vehicleCount: 1,
        serviceCount: 0,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 100,
        maxOdometer: 9999,
        hasOilChange: false,
      );
      expect(badge.isUnlocked(criteriaBelow), isFalse);

      const criteriaAbove = GarageCriteria(
        vehicleCount: 1,
        serviceCount: 0,
        fuelCount: 0,
        inspectionCount: 0,
        documentCount: 0,
        healthScore: 100,
        maxOdometer: 10000,
        hasOilChange: false,
      );
      expect(badge.isUnlocked(criteriaAbove), isTrue);
    });
  });

  group('garageGamificationProvider Tests', () {
    test('computes XP, badges, and level progress accurately', () {
      final mockVehicles = [
        Vehicle(
          id: 'v1',
          name: 'Test Car',
          type: VehicleType.car,
          plateNumber: 'B 1234 CD',
          currentOdometer: 15000,
          manufactureYear: 2022,
          taxDueDate: DateTime.utc(2027, 1, 1),
        ),
      ];

      final mockServices = [
        ServiceLog(
          id: 's1',
          vehicleId: 'v1',
          date: DateTime.utc(2026, 1, 1),
          odometer: 10000,
          title: 'Ganti Oli Mesin',
          cost: 450000,
          isOilChange: true,
        ),
        ServiceLog(
          id: 's2',
          vehicleId: 'v1',
          date: DateTime.utc(2026, 2, 1),
          odometer: 12000,
          title: 'Servis Rem',
          cost: 200000,
        ),
        ServiceLog(
          id: 's3',
          vehicleId: 'v1',
          date: DateTime.utc(2026, 3, 1),
          odometer: 14000,
          title: 'Tune up',
          cost: 300000,
        ),
      ];

      final mockFuels = [
        FuelLog(
          id: 'f1',
          vehicleId: 'v1',
          date: DateTime.utc(2026, 3, 1),
          odometer: 14500,
          liters: 30,
          pricePerLiter: 13000,
        ),
      ];

      final mockHealth = const VehicleHealthResult(
        score: 95,
        statusText: 'Sangat Baik',
        statusColor: 0xFF10B981,
        warnings: [],
        goodPoints: ['Semua aman'],
      );

      final container = ProviderContainer(
        overrides: [
          vehiclesProvider.overrideWith(() => _MockVehiclesNotifier(mockVehicles)),
          serviceLogsProvider.overrideWith(() => _MockServiceLogsNotifier(mockServices)),
          fuelLogsProvider.overrideWith(() => _MockFuelLogsNotifier(mockFuels)),
          inspectionChecklistsProvider.overrideWith(() => _MockInspectionsNotifier([])),
          vehicleDocumentsProvider.overrideWith(() => _MockDocumentsNotifier([])),
          vehicleHealthScoreProvider.overrideWithValue(mockHealth),
        ],
      );
      addTearDown(container.dispose);

      final state = container.read(garageGamificationProvider);

      // Criteria evaluation:
      // - first_ride: vehicleCount (1 >= 1) -> unlocked
      // - oil_care: hasOilChange (true) -> unlocked
      // - service_veteran: serviceCount (3 >= 3) -> unlocked
      // - fuel_watcher: fuelCount (1 < 3) -> locked
      // - safe_voyage: inspectionCount (0 < 1) -> locked
      // - doc_keeper: documentCount (0 < 1) -> locked
      // - prime_fleet: healthScore (95 >= 90) -> unlocked
      // - road_warrior: maxOdometer (15000 >= 10000) -> unlocked
      // 5 badges unlocked!
      expect(state.unlockedCount, equals(5));

      // XP calculation:
      // - vehicles: 1 * 50 = 50
      // - services: 3 * 30 = 90
      // - fuels: 1 * 15 = 15
      // - inspections: 0
      // - documents: 0
      // - badges: 5 * 100 = 500
      // Total XP = 50 + 90 + 15 + 500 = 655 XP
      expect(state.totalXp, equals(655));

      // 655 XP -> Fleet Guardian (Level 3, required 450). Next level is Level 4 (required 1000).
      expect(state.currentLevel.level, equals(3));
      expect(state.nextLevel?.level, equals(4));

      // Progress: (655 - 450) / (1000 - 450) = 205 / 550
      expect(state.levelProgress, closeTo(205 / 550, 0.01));
    });
  });
}

class _MockVehiclesNotifier extends VehiclesNotifier {
  final List<Vehicle> initial;
  _MockVehiclesNotifier(this.initial);
  @override
  List<Vehicle> build() => initial;
}

class _MockServiceLogsNotifier extends ServiceLogsNotifier {
  final List<ServiceLog> initial;
  _MockServiceLogsNotifier(this.initial);
  @override
  List<ServiceLog> build() => initial;
}

class _MockFuelLogsNotifier extends FuelLogsNotifier {
  final List<FuelLog> initial;
  _MockFuelLogsNotifier(this.initial);
  @override
  List<FuelLog> build() => initial;
}

class _MockInspectionsNotifier extends InspectionChecklistsNotifier {
  final List<InspectionChecklist> initial;
  _MockInspectionsNotifier(this.initial);
  @override
  List<InspectionChecklist> build() => initial;
}

class _MockDocumentsNotifier extends VehicleDocumentsNotifier {
  final List<VehicleDocument> initial;
  _MockDocumentsNotifier(this.initial);
  @override
  List<VehicleDocument> build() => initial;
}
