import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';
import 'package:garagego/core/services/analytics_service.dart';

void main() {
  group('GarageGo Analytics & Calculator Tests', () {
    late Vehicle sampleVehicle;

    setUp(() {
      sampleVehicle = Vehicle(
        id: 'test-v1',
        name: 'Innova Test',
        type: VehicleType.car,
        plateNumber: 'B 1234 TEST',
        currentOdometer: 25000,
        manufactureYear: 2023,
        taxDueDate: DateTime.now().add(const Duration(days: 60)),
        oilIntervalKm: 5000,
        lastOilOdometer: 20000,
        estimatedAnnualTax: 4000000,
      );
    });

    test('MaintenanceSchedule dual-trigger and urgency calculation', () {
      final now = DateTime.now();

      // Safe schedule: due in 3000 km and 5 months
      final safeSched = MaintenanceSchedule(
        id: 's1',
        vehicleId: sampleVehicle.id,
        title: 'Filter Udara',
        category: 'Filter & Udara',
        intervalKm: 10000,
        intervalMonths: 12,
        lastPerformedOdometer: 18000, // due at 28000 km, current 25000
        lastPerformedDate: now.subtract(const Duration(days: 90)),
      );
      expect(safeSched.kmRemaining(sampleVehicle.currentOdometer), 3000);
      expect(safeSched.urgency(sampleVehicle.currentOdometer), ScheduleUrgency.safe);

      // Overdue schedule: due at 24000 km, current is 25000 km
      final overdueSched = MaintenanceSchedule(
        id: 's2',
        vehicleId: sampleVehicle.id,
        title: 'Rotasi Ban',
        category: 'Ban & Suspensi',
        intervalKm: 5000,
        intervalMonths: 6,
        lastPerformedOdometer: 19000, // due at 24000 km
        lastPerformedDate: now.subtract(const Duration(days: 200)),
      );
      expect(overdueSched.kmRemaining(sampleVehicle.currentOdometer), -1000);
      expect(overdueSched.urgency(sampleVehicle.currentOdometer), ScheduleUrgency.overdue);
    });

    test('Vehicle Health Score computation reflects overdue items', () {
      final now = DateTime.now();
      final schedules = [
        MaintenanceSchedule(
          id: 's1',
          vehicleId: sampleVehicle.id,
          title: 'Ganti Busi',
          category: 'Pengapian',
          intervalKm: 5000,
          intervalMonths: 6,
          lastPerformedOdometer: 19000, // Overdue by 1000 km
          lastPerformedDate: now.subtract(const Duration(days: 200)),
        ),
      ];

      final docs = VehicleDocument.defaultDocumentsFor(sampleVehicle);

      final result = AnalyticsService.computeHealthScore(
        vehicle: sampleVehicle,
        schedules: schedules,
        documents: docs,
      );

      // Since one schedule is overdue, score is deducted
      expect(result.score, lessThan(100));
      expect(result.warnings, isNotEmpty);
      expect(result.warnings.any((w) => w.contains('Ganti Busi')), isTrue);
    });

    test('Total Cost of Ownership (TCO) computes accurately', () {
      final services = [
        ServiceLog(
          id: 's1',
          vehicleId: sampleVehicle.id,
          date: DateTime.now(),
          odometer: 20000,
          title: 'Servis Berkala',
          cost: 1000000,
        ),
      ];

      final fuels = [
        FuelLog(
          id: 'f1',
          vehicleId: sampleVehicle.id,
          date: DateTime.now(),
          odometer: 22000,
          liters: 40,
          pricePerLiter: 15000, // 600,000
        ),
      ];

      final docs = [
        VehicleDocument(
          id: 'd1',
          vehicleId: sampleVehicle.id,
          title: 'Pajak STNK',
          type: DocumentType.stnkTahunan,
          documentNumber: 'B 1234 TEST',
          expiryDate: DateTime.now().add(const Duration(days: 60)),
          cost: 4000000,
        ),
      ];

      final tco = AnalyticsService.computeTCO(
        vehicle: sampleVehicle,
        services: services,
        fuels: fuels,
        documents: docs,
      );

      expect(tco.serviceCost, 1000000);
      expect(tco.fuelCost, 600000);
      expect(tco.documentCost, 4000000);
      expect(tco.totalCost, 5600000);
      expect(tco.costPerKm, closeTo(5600000 / 25000, 0.1));
    });

    test('Fuel efficiency calculation computes km/L and cost/km between full tanks', () {
      final now = DateTime.now();
      final fuels = [
        FuelLog(
          id: 'f1',
          vehicleId: sampleVehicle.id,
          date: now.subtract(const Duration(days: 10)),
          odometer: 24000,
          liters: 40,
          pricePerLiter: 10000,
          isFullTank: true,
        ),
        FuelLog(
          id: 'f2',
          vehicleId: sampleVehicle.id,
          date: now.subtract(const Duration(days: 2)),
          odometer: 24450, // 450 km driven
          liters: 30, // on 30 liters -> 15.0 km/L
          pricePerLiter: 10000,
          isFullTank: true,
        ),
      ];

      final summary = AnalyticsService.computeFuelEfficiency(fuels);

      expect(summary.points.length, 1);
      final point = summary.points.first;
      expect(point.distanceDeltaKm, 450);
      expect(point.kmPerLiter, 15.0);
      expect(point.costPerKm, closeTo(300000 / 450, 0.1));
      expect(summary.averageKmPerLiter, 15.0);
    });

    test('InspectionChecklist calculation and presets', () {
      final items = InspectionChecklist.generateDefaultItems(VehicleType.car);
      expect(items.length, greaterThanOrEqualTo(8));

      final checklist = InspectionChecklist(
        id: 'chk-1',
        vehicleId: sampleVehicle.id,
        date: DateTime.now(),
        odometer: 25000,
        title: 'Inspeksi Mudik',
        items: items,
      );

      expect(checklist.passPercentage, 100.0);
      expect(checklist.isAllPassed, isTrue);

      items.first.isChecked = false;
      expect(checklist.passPercentage, lessThan(100.0));
      expect(checklist.isAllPassed, isFalse);
    });
  });
}
