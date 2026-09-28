import '../constants/app_constants.dart';

class AppValidators {
  /// Validates vehicle name (§VAL)
  static String? validateVehicleName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Nama kendaraan tidak boleh kosong';
    }
    final trimmed = name.trim();
    if (trimmed.length < AppConstants.minVehicleNameLength) {
      return 'Nama kendaraan minimal ${AppConstants.minVehicleNameLength} karakter';
    }
    if (trimmed.length > AppConstants.maxVehicleNameLength) {
      return 'Nama kendaraan maksimal ${AppConstants.maxVehicleNameLength} karakter';
    }
    return null;
  }

  /// Validates plate number
  static String? validatePlateNumber(String? plate) {
    if (plate == null || plate.trim().isEmpty) {
      return 'Nomor pelat polisi tidak boleh kosong';
    }
    if (plate.trim().length > AppConstants.maxPlateNumberLength) {
      return 'Nomor pelat maksimal ${AppConstants.maxPlateNumberLength} karakter';
    }
    return null;
  }

  /// Validates odometer reading (must be >= 0 and reasonable)
  static String? validateOdometer(int? km, {int? previousKm}) {
    if (km == null || km < 0) {
      return 'Kilometer odometer tidak boleh negatif';
    }
    if (km > AppConstants.maxOdometerKm) {
      return 'Kilometer odometer melebihi batas wajar';
    }
    if (previousKm != null && km < previousKm) {
      return 'Odometer baru ($km km) tidak boleh lebih kecil dari sebelumnya ($previousKm km)';
    }
    return null;
  }

  /// Validates service cost (must be >= 0)
  static String? validateCost(double? cost) {
    if (cost == null || cost < 0) {
      return 'Biaya tidak boleh bernilai negatif';
    }
    return null;
  }

  /// Validates fuel liters (must be > 0 and <= 500)
  static String? validateFuelLiters(double? liters) {
    if (liters == null || liters <= 0) {
      return 'Volume bahan bakar harus lebih dari 0 liter';
    }
    if (liters > 500) {
      return 'Volume tangki melebihi kapasitas wajar';
    }
    return null;
  }
}
