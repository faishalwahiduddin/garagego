enum VehicleType {
  car('Mobil', 'Roda Empat'),
  motorcycle('Motor', 'Roda Dua');

  final String label;
  final String sublabel;
  const VehicleType(this.label, this.sublabel);
}

class Vehicle {
  final String id;
  final String name;
  final VehicleType type;
  final String plateNumber;
  final int currentOdometer;
  final int manufactureYear;
  final DateTime taxDueDate; // Tanggal jatuh tempo PKB tahunan
  final int oilIntervalKm; // Rekomendasi interval ganti oli (misal 5000 km mobil, 2500 km motor)
  final int lastOilOdometer; // Odometer terakhir ganti oli

  const Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.plateNumber,
    required this.currentOdometer,
    required this.manufactureYear,
    required this.taxDueDate,
    this.oilIntervalKm = 5000,
    this.lastOilOdometer = 0,
  });

  /// Factory default template for new cars/motorcycles
  factory Vehicle.sampleCar() => Vehicle(
        id: 'sample-car-1',
        name: 'Toyota Innova Zenix',
        type: VehicleType.car,
        plateNumber: 'B 1234 ABC',
        currentOdometer: 24500,
        manufactureYear: 2023,
        taxDueDate: DateTime.now().add(const Duration(days: 75)),
        oilIntervalKm: 5000,
        lastOilOdometer: 20000,
      );

  factory Vehicle.sampleMotorcycle() => Vehicle(
        id: 'sample-moto-1',
        name: 'Honda Vario 160',
        type: VehicleType.motorcycle,
        plateNumber: 'B 5678 XYZ',
        currentOdometer: 14200,
        manufactureYear: 2022,
        taxDueDate: DateTime.now().add(const Duration(days: 30)),
        oilIntervalKm: 2500,
        lastOilOdometer: 12500,
      );

  int get kmUntilNextOilChange {
    final nextChangeKm = lastOilOdometer + oilIntervalKm;
    return nextChangeKm - currentOdometer;
  }

  int get daysUntilTaxDue {
    final now = DateTime.now();
    return taxDueDate.difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  Vehicle copyWith({
    String? name,
    VehicleType? type,
    String? plateNumber,
    int? currentOdometer,
    int? manufactureYear,
    DateTime? taxDueDate,
    int? oilIntervalKm,
    int? lastOilOdometer,
  }) {
    return Vehicle(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      plateNumber: plateNumber ?? this.plateNumber,
      currentOdometer: currentOdometer ?? this.currentOdometer,
      manufactureYear: manufactureYear ?? this.manufactureYear,
      taxDueDate: taxDueDate ?? this.taxDueDate,
      oilIntervalKm: oilIntervalKm ?? this.oilIntervalKm,
      lastOilOdometer: lastOilOdometer ?? this.lastOilOdometer,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.name,
        'plateNumber': plateNumber,
        'currentOdometer': currentOdometer,
        'manufactureYear': manufactureYear,
        'taxDueDate': taxDueDate.toIso8601String(),
        'oilIntervalKm': oilIntervalKm,
        'lastOilOdometer': lastOilOdometer,
      };

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'] as String,
        name: json['name'] as String,
        type: VehicleType.values.firstWhere(
          (t) => t.name == json['type'],
          orElse: () => VehicleType.car,
        ),
        plateNumber: json['plateNumber'] as String,
        currentOdometer: (json['currentOdometer'] as num).toInt(),
        manufactureYear: (json['manufactureYear'] as num).toInt(),
        taxDueDate: DateTime.parse(json['taxDueDate'] as String),
        oilIntervalKm: (json['oilIntervalKm'] as num?)?.toInt() ?? 5000,
        lastOilOdometer: (json['lastOilOdometer'] as num?)?.toInt() ?? 0,
      );
}

class ServiceLog {
  final String id;
  final String vehicleId;
  final DateTime date;
  final int odometer;
  final String title;
  final double cost;
  final String notes;
  final bool isOilChange;

  const ServiceLog({
    required this.id,
    required this.vehicleId,
    required this.date,
    required this.odometer,
    required this.title,
    required this.cost,
    this.notes = '',
    this.isOilChange = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'vehicleId': vehicleId,
        'date': date.toIso8601String(),
        'odometer': odometer,
        'title': title,
        'cost': cost,
        'notes': notes,
        'isOilChange': isOilChange,
      };

  factory ServiceLog.fromJson(Map<String, dynamic> json) => ServiceLog(
        id: json['id'] as String,
        vehicleId: json['vehicleId'] as String,
        date: DateTime.parse(json['date'] as String),
        odometer: (json['odometer'] as num).toInt(),
        title: json['title'] as String,
        cost: (json['cost'] as num).toDouble(),
        notes: json['notes'] as String? ?? '',
        isOilChange: json['isOilChange'] as bool? ?? false,
      );
}

class FuelLog {
  final String id;
  final String vehicleId;
  final DateTime date;
  final int odometer;
  final double liters;
  final double pricePerLiter;
  final bool isFullTank;

  const FuelLog({
    required this.id,
    required this.vehicleId,
    required this.date,
    required this.odometer,
    required this.liters,
    required this.pricePerLiter,
    this.isFullTank = true,
  });

  double get totalCost => liters * pricePerLiter;

  Map<String, dynamic> toJson() => {
        'id': id,
        'vehicleId': vehicleId,
        'date': date.toIso8601String(),
        'odometer': odometer,
        'liters': liters,
        'pricePerLiter': pricePerLiter,
        'isFullTank': isFullTank,
      };

  factory FuelLog.fromJson(Map<String, dynamic> json) => FuelLog(
        id: json['id'] as String,
        vehicleId: json['vehicleId'] as String,
        date: DateTime.parse(json['date'] as String),
        odometer: (json['odometer'] as num).toInt(),
        liters: (json['liters'] as num).toDouble(),
        pricePerLiter: (json['pricePerLiter'] as num).toDouble(),
        isFullTank: json['isFullTank'] as bool? ?? true,
      );
}
