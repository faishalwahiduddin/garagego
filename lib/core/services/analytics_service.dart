import '../models/vehicle.dart';

class VehicleHealthResult {
  final int score; // 0 - 100
  final String statusText;
  final int statusColor;
  final List<String> warnings;
  final List<String> goodPoints;

  const VehicleHealthResult({
    required this.score,
    required this.statusText,
    required this.statusColor,
    required this.warnings,
    required this.goodPoints,
  });
}

class TCOResult {
  final double totalCost;
  final double fuelCost;
  final double serviceCost;
  final double documentCost;
  final double costPerKm;
  final double monthlyEstimatedCost;

  const TCOResult({
    required this.totalCost,
    required this.fuelCost,
    required this.serviceCost,
    required this.documentCost,
    required this.costPerKm,
    required this.monthlyEstimatedCost,
  });
}

class FuelEfficiencyPoint {
  final DateTime date;
  final int odometer;
  final double liters;
  final double distanceDeltaKm;
  final double kmPerLiter;
  final double costPerKm;

  const FuelEfficiencyPoint({
    required this.date,
    required this.odometer,
    required this.liters,
    required this.distanceDeltaKm,
    required this.kmPerLiter,
    required this.costPerKm,
  });
}

class FuelEfficiencySummary {
  final double averageKmPerLiter;
  final double bestKmPerLiter;
  final double averageCostPerKm;
  final double totalLiters;
  final double totalFuelCost;
  final List<FuelEfficiencyPoint> points;

  const FuelEfficiencySummary({
    required this.averageKmPerLiter,
    required this.bestKmPerLiter,
    required this.averageCostPerKm,
    required this.totalLiters,
    required this.totalFuelCost,
    required this.points,
  });
}

class AnalyticsService {
  /// Computes Vehicle Health Score (0 - 100%) inspired by FIXD & Y-Connect
  static VehicleHealthResult computeHealthScore({
    required Vehicle vehicle,
    required List<MaintenanceSchedule> schedules,
    required List<VehicleDocument> documents,
    bool isEnglish = false,
  }) {
    int score = 100;
    final List<String> warnings = [];
    final List<String> goodPoints = [];

    // 1. Oil change check (max deduction 25)
    final kmUntilOil = vehicle.kmUntilNextOilChange;
    if (kmUntilOil < 0) {
      score -= 25;
      warnings.add(isEnglish
          ? 'Engine oil change is overdue by ${-kmUntilOil} km'
          : 'Ganti oli mesin sudah terlewat ${-kmUntilOil} km');
    } else if (kmUntilOil <= 500) {
      score -= 10;
      warnings.add(isEnglish
          ? 'Engine oil change due in $kmUntilOil km'
          : 'Ganti oli mesin perlu dilakukan dalam $kmUntilOil km lagi');
    } else {
      goodPoints.add(isEnglish
          ? 'Engine oil interval is optimal'
          : 'Interval oli mesin dalam kondisi prima');
    }

    // 2. Tax & Plate status check (max deduction 25)
    if (vehicle.daysUntilTaxDue < 0) {
      score -= 20;
      warnings.add(isEnglish
          ? 'Annual vehicle tax is overdue'
          : 'Pajak STNK tahunan telah lewat jatuh tempo');
    } else if (vehicle.daysUntilTaxDue <= 14) {
      score -= 8;
      warnings.add(isEnglish
          ? 'Annual vehicle tax due in ${vehicle.daysUntilTaxDue} days'
          : 'Pajak STNK tahunan jatuh tempo dalam ${vehicle.daysUntilTaxDue} hari');
    } else {
      goodPoints.add(isEnglish
          ? 'Annual vehicle tax is active & safe'
          : 'Pajak PKB tahunan aktif & aman');
    }

    if (vehicle.daysUntilPlateDue < 0) {
      score -= 15;
      warnings.add(isEnglish
          ? '5-year license plate has expired'
          : 'Masa berlaku pelat 5 tahunan telah habis');
    } else if (vehicle.daysUntilPlateDue <= 30) {
      score -= 5;
      warnings.add(isEnglish
          ? '5-year license plate renewal due in ${vehicle.daysUntilPlateDue} days'
          : 'Pelat 5 tahunan perlu diperpanjang dalam ${vehicle.daysUntilPlateDue} hari');
    }

    // 3. Periodic maintenance schedules check
    int overdueCount = 0;
    int dueSoonCount = 0;
    for (final s in schedules) {
      final u = s.urgency(vehicle.currentOdometer);
      if (u == ScheduleUrgency.overdue) {
        overdueCount++;
        warnings.add(isEnglish ? '${s.title} is overdue' : '${s.title} sudah terlewat');
      } else if (u == ScheduleUrgency.dueSoon) {
        dueSoonCount++;
        warnings.add(isEnglish ? '${s.title} is due soon' : '${s.title} mendekati batas servis');
      }
    }

    score -= (overdueCount * 12);
    score -= (dueSoonCount * 4);

    // Clamp score
    if (score < 10) score = 10;
    if (score > 100) score = 100;

    String statusText;
    int statusColor;
    if (score >= 85) {
      statusText = isEnglish ? 'Prime' : 'Sangat Prima';
      statusColor = 0xFF10B981; // Green
    } else if (score >= 60) {
      statusText = isEnglish ? 'Attention' : 'Perlu Perhatian';
      statusColor = 0xFFF59E0B; // Amber
    } else {
      statusText = isEnglish ? 'Critical / Due Soon' : 'Kritis / Servis Segera';
      statusColor = 0xFFEF4444; // Red
    }

    return VehicleHealthResult(
      score: score,
      statusText: statusText,
      statusColor: statusColor,
      warnings: warnings,
      goodPoints: goodPoints,
    );
  }

  /// Computes Total Cost of Ownership (TCO)
  static TCOResult computeTCO({
    required Vehicle vehicle,
    required List<ServiceLog> services,
    required List<FuelLog> fuels,
    required List<VehicleDocument> documents,
  }) {
    final fuelCost = fuels.fold<double>(0, (sum, f) => sum + f.totalCost);
    final serviceCost = services.fold<double>(0, (sum, s) => sum + s.cost);
    final docCost = documents.fold<double>(0, (sum, d) => sum + d.cost);
    final totalCost = fuelCost + serviceCost + docCost;

    final costPerKm = vehicle.currentOdometer > 0 ? (totalCost / vehicle.currentOdometer) : 0.0;

    // Monthly estimated projection based on past records
    final monthlyEstimatedCost = totalCost > 0 ? (totalCost / 6.0) : 0.0;

    return TCOResult(
      totalCost: totalCost,
      fuelCost: fuelCost,
      serviceCost: serviceCost,
      documentCost: docCost,
      costPerKm: costPerKm,
      monthlyEstimatedCost: monthlyEstimatedCost,
    );
  }

  /// Computes Fuel Economy & Consumption metrics
  static FuelEfficiencySummary computeFuelEfficiency(List<FuelLog> fuels) {
    if (fuels.isEmpty) {
      return const FuelEfficiencySummary(
        averageKmPerLiter: 0,
        bestKmPerLiter: 0,
        averageCostPerKm: 0,
        totalLiters: 0,
        totalFuelCost: 0,
        points: [],
      );
    }

    // Sort by odometer ascending
    final sorted = [...fuels]..sort((a, b) => a.odometer.compareTo(b.odometer));
    final List<FuelEfficiencyPoint> points = [];

    double totalLiters = 0;
    double totalCost = 0;

    for (final f in sorted) {
      totalLiters += f.liters;
      totalCost += f.totalCost;
    }

    for (int i = 1; i < sorted.length; i++) {
      final prev = sorted[i - 1];
      final curr = sorted[i];

      final dist = (curr.odometer - prev.odometer).toDouble();
      if (dist > 0 && curr.liters > 0) {
        final kmL = dist / curr.liters;
        final costKm = curr.totalCost / dist;
        points.add(FuelEfficiencyPoint(
          date: curr.date,
          odometer: curr.odometer,
          liters: curr.liters,
          distanceDeltaKm: dist,
          kmPerLiter: kmL,
          costPerKm: costKm,
        ));
      }
    }

    double avgKmL = 0;
    double bestKmL = 0;
    double avgCostKm = 0;

    if (points.isNotEmpty) {
      final sumKmL = points.fold<double>(0, (s, p) => s + p.kmPerLiter);
      avgKmL = sumKmL / points.length;
      bestKmL = points.map((p) => p.kmPerLiter).reduce((a, b) => a > b ? a : b);
      final sumCostKm = points.fold<double>(0, (s, p) => s + p.costPerKm);
      avgCostKm = sumCostKm / points.length;
    } else if (sorted.length == 1) {
      // Default baseline estimation
      avgKmL = 12.5;
      bestKmL = 12.5;
    }

    return FuelEfficiencySummary(
      averageKmPerLiter: avgKmL,
      bestKmPerLiter: bestKmL,
      averageCostPerKm: avgCostKm,
      totalLiters: totalLiters,
      totalFuelCost: totalCost,
      points: points.reversed.toList(), // Most recent first for display
    );
  }
}
