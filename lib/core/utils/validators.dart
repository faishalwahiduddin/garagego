import '../constants/app_constants.dart';

class AppValidators {
  /// Validates vehicle name (§VAL)
  static String? validateVehicleName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'validationVehicleNameRequired';
    }
    final trimmed = name.trim();
    if (trimmed.length < AppConstants.minVehicleNameLength) {
      return 'validationVehicleNameMinLength';
    }
    if (trimmed.length > AppConstants.maxVehicleNameLength) {
      return 'validationVehicleNameMaxLength';
    }
    return null;
  }

  /// Validates plate number
  static String? validatePlateNumber(String? plate) {
    if (plate == null || plate.trim().isEmpty) {
      return 'validationPlateRequired';
    }
    if (plate.trim().length > AppConstants.maxPlateNumberLength) {
      return 'validationPlateMaxLength';
    }
    return null;
  }

  /// Validates odometer reading (must be >= 0 and reasonable)
  static String? validateOdometer(int? km, {int? previousKm}) {
    if (km == null || km < 0) {
      return 'validationOdometerNegative';
    }
    if (km > AppConstants.maxOdometerKm) {
      return 'validationOdometerTooHigh';
    }
    if (previousKm != null && km < previousKm) {
      return 'validationOdometerLessThanPrevious';
    }
    return null;
  }

  /// Validates service cost (must be >= 0)
  static String? validateCost(double? cost) {
    if (cost == null || cost < 0) {
      return 'validationCostNegative';
    }
    return null;
  }

  /// Validates fuel liters (must be > 0 and <= 500)
  static String? validateFuelLiters(double? liters) {
    if (liters == null || liters <= 0) {
      return 'validationFuelLitersPositive';
    }
    if (liters > 500) {
      return 'validationFuelLitersTooHigh';
    }
    return null;
  }
}
