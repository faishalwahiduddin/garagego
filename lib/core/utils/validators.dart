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
    if (km == null) {
      return 'validationOdometerRequired';
    }
    if (km < 0) {
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
    if (cost == null) {
      return 'validationCostRequired';
    }
    if (cost < 0) {
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

  /// Validates a fuel unit price: required and above zero.
  static String? validateFuelPrice(double? price) {
    if (price == null || price <= 0) {
      return 'validationPriceRequired';
    }
    return null;
  }

  /// Odometer readings an entry dated [date] must sit between: the nearest
  /// earlier and nearest later entries of the same vehicle ([excludeId] is the
  /// entry being edited). Entries on the same instant count as earlier.
  static OdometerBounds odometerBounds(
    Iterable<OdometerEntry> entries,
    DateTime date, {
    String? excludeId,
  }) {
    OdometerEntry? before;
    OdometerEntry? after;
    for (final e in entries) {
      if (e.id == excludeId) continue;
      if (!e.date.isAfter(date)) {
        if (before == null || e.date.isAfter(before.date)) before = e;
      } else {
        if (after == null || e.date.isBefore(after.date)) after = e;
      }
    }
    return OdometerBounds(above: before?.odometer, below: after?.odometer);
  }

  /// Checks [km] against [bounds]. Fill-ups are [strict] (a second fill at the
  /// same reading would fake a 0 km interval); services may share a reading.
  /// Returns `validationOdometerAbove` / `validationOdometerBelow` (strict) or
  /// `validationOdometerAtLeast` / `validationOdometerAtMost`; the caller
  /// formats the bound into the message.
  static String? validateOdometerInHistory(
    int km,
    OdometerBounds bounds, {
    bool strict = true,
  }) {
    final above = bounds.above;
    final below = bounds.below;
    if (above != null && (strict ? km <= above : km < above)) {
      return strict ? 'validationOdometerAbove' : 'validationOdometerAtLeast';
    }
    if (below != null && (strict ? km >= below : km > below)) {
      return strict ? 'validationOdometerBelow' : 'validationOdometerAtMost';
    }
    return null;
  }
}

/// One dated odometer reading (fuel or service log) for [AppValidators.odometerBounds].
typedef OdometerEntry = ({String id, DateTime date, int odometer});

/// Neighbouring readings around a dated entry; null when there is none.
class OdometerBounds {
  final int? above;
  final int? below;
  const OdometerBounds({this.above, this.below});
}
