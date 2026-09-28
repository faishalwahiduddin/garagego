import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/utils/validators.dart';

void main() {
  group('GarageGo AppValidators (§VAL)', () {
    test('validateVehicleName rejects empty or invalid length', () {
      expect(AppValidators.validateVehicleName(null), isNotNull);
      expect(AppValidators.validateVehicleName(''), isNotNull);
      expect(AppValidators.validateVehicleName('A'), isNotNull);
      expect(AppValidators.validateVehicleName('Toyota Yaris Cross'), isNull);
    });

    test('validatePlateNumber rejects empty or excessive length', () {
      expect(AppValidators.validatePlateNumber(null), isNotNull);
      expect(AppValidators.validatePlateNumber(''), isNotNull);
      expect(AppValidators.validatePlateNumber('B 1234 ABC'), isNull);
      expect(AppValidators.validatePlateNumber('B 1234567890123456'), isNotNull);
    });

    test('validateOdometer enforces positive and sequence logic', () {
      expect(AppValidators.validateOdometer(null), isNotNull);
      expect(AppValidators.validateOdometer(-10), isNotNull);
      expect(AppValidators.validateOdometer(25000), isNull);
      // Decreasing odometer check
      expect(AppValidators.validateOdometer(20000, previousKm: 25000), isNotNull);
      expect(AppValidators.validateOdometer(26000, previousKm: 25000), isNull);
    });

    test('validateCost rejects negative', () {
      expect(AppValidators.validateCost(-5000), isNotNull);
      expect(AppValidators.validateCost(0), isNull);
      expect(AppValidators.validateCost(350000), isNull);
    });

    test('validateFuelLiters enforces > 0 and <= 500', () {
      expect(AppValidators.validateFuelLiters(0), isNotNull);
      expect(AppValidators.validateFuelLiters(-5), isNotNull);
      expect(AppValidators.validateFuelLiters(600), isNotNull);
      expect(AppValidators.validateFuelLiters(35.5), isNull);
    });
  });
}
