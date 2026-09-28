import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';

void main() {
  group('GarageGo Vehicle & Log Model Tests', () {
    test('Vehicle oil change calculation', () {
      final v = Vehicle(
        id: 'v1',
        name: 'Avanza',
        type: VehicleType.car,
        plateNumber: 'B 1111 AA',
        currentOdometer: 23000,
        manufactureYear: 2021,
        taxDueDate: DateTime.now().add(const Duration(days: 60)),
        oilIntervalKm: 5000,
        lastOilOdometer: 20000,
      );

      // next due at 25000, current 23000 -> remaining 2000 km
      expect(v.kmUntilNextOilChange, 2000);
    });

    test('Vehicle serialization round-trip', () {
      final v = Vehicle.sampleCar();
      final json = v.toJson();
      final restored = Vehicle.fromJson(json);

      expect(restored.id, v.id);
      expect(restored.name, v.name);
      expect(restored.type, v.type);
      expect(restored.plateNumber, v.plateNumber);
    });

    test('FuelLog totalCost calculation', () {
      final fuel = FuelLog(
        id: 'f1',
        vehicleId: 'v1',
        date: DateTime.now(),
        odometer: 10000,
        liters: 30,
        pricePerLiter: 10000,
      );

      expect(fuel.totalCost, 300000);
    });
  });
}
