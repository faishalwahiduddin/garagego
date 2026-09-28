enum VehicleType {
  car('Mobil', 'Roda Empat'),
  motorcycle('Motor', 'Roda Dua');

  final String label;
  final String sublabel;
  const VehicleType(this.label, this.sublabel);
}

enum ScheduleUrgency {
  safe('Aman', 0xFF10B981),
  dueSoon('Segera', 0xFFF59E0B),
  overdue('Terlewat', 0xFFEF4444);

  final String label;
  final int colorValue;
  const ScheduleUrgency(this.label, this.colorValue);
}

enum DocumentType {
  stnkTahunan('Pajak PKB Tahunan'),
  stnkLimaTahunan('Ganti Pelat & STNK 5 Th'),
  asuransi('Asuransi Kendaraan'),
  ujiEmisi('Uji Emisi / KIR'),
  sim('SIM Pengemudi'),
  bpkb('BPKB Kendaraan'),
  lainnya('Dokumen Lainnya');

  final String label;
  const DocumentType(this.label);
}

class Vehicle {
  final String id;
  final String name;
  final VehicleType type;
  final String plateNumber;
  final int currentOdometer;
  final int manufactureYear;
  final DateTime taxDueDate; // Tanggal jatuh tempo PKB tahunan
  final int oilIntervalKm; // Rekomendasi interval ganti oli
  final int lastOilOdometer; // Odometer terakhir ganti oli
  final DateTime? plateDueDate; // Tanggal perpanjangan pelat & STNK 5 tahunan
  final double estimatedAnnualTax; // Estimasi biaya PKB tahunan
  final DateTime? insuranceExpiryDate;
  final String insuranceProvider;
  final String insurancePolicyNumber;

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
    this.plateDueDate,
    this.estimatedAnnualTax = 0,
    this.insuranceExpiryDate,
    this.insuranceProvider = '',
    this.insurancePolicyNumber = '',
  });

  factory Vehicle.sampleCar() => Vehicle(
        id: 'sample-car-1',
        name: 'Toyota Innova Zenix',
        type: VehicleType.car,
        plateNumber: 'B 1234 ABC',
        currentOdometer: 24500,
        manufactureYear: 2023,
        taxDueDate: DateTime.now().add(const Duration(days: 75)),
        plateDueDate: DateTime.now().add(const Duration(days: 805)),
        oilIntervalKm: 5000,
        lastOilOdometer: 20000,
        estimatedAnnualTax: 5200000,
        insuranceProvider: 'Garda Oto Total Loss / All Risk',
        insurancePolicyNumber: 'POL-ID-2023-778',
        insuranceExpiryDate: DateTime.now().add(const Duration(days: 190)),
      );

  factory Vehicle.sampleMotorcycle() => Vehicle(
        id: 'sample-moto-1',
        name: 'Honda Vario 160',
        type: VehicleType.motorcycle,
        plateNumber: 'B 5678 XYZ',
        currentOdometer: 14200,
        manufactureYear: 2022,
        taxDueDate: DateTime.now().add(const Duration(days: 30)),
        plateDueDate: DateTime.now().add(const Duration(days: 430)),
        oilIntervalKm: 2500,
        lastOilOdometer: 12500,
        estimatedAnnualTax: 450000,
        insuranceProvider: 'Asuransi Astra Motor TLO',
        insurancePolicyNumber: 'POL-MT-2022-311',
        insuranceExpiryDate: DateTime.now().add(const Duration(days: 120)),
      );

  int get kmUntilNextOilChange {
    final nextChangeKm = lastOilOdometer + oilIntervalKm;
    return nextChangeKm - currentOdometer;
  }

  int get daysUntilTaxDue {
    final now = DateTime.now();
    return taxDueDate.difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  int get daysUntilPlateDue {
    final dueDate = plateDueDate ?? taxDueDate.add(const Duration(days: 365 * 4));
    final now = DateTime.now();
    return dueDate.difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  bool get isTaxClose => daysUntilTaxDue <= 30;
  bool get isPlateClose => daysUntilPlateDue <= 60;

  Vehicle copyWith({
    String? name,
    VehicleType? type,
    String? plateNumber,
    int? currentOdometer,
    int? manufactureYear,
    DateTime? taxDueDate,
    int? oilIntervalKm,
    int? lastOilOdometer,
    DateTime? plateDueDate,
    double? estimatedAnnualTax,
    DateTime? insuranceExpiryDate,
    String? insuranceProvider,
    String? insurancePolicyNumber,
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
      plateDueDate: plateDueDate ?? this.plateDueDate,
      estimatedAnnualTax: estimatedAnnualTax ?? this.estimatedAnnualTax,
      insuranceExpiryDate: insuranceExpiryDate ?? this.insuranceExpiryDate,
      insuranceProvider: insuranceProvider ?? this.insuranceProvider,
      insurancePolicyNumber: insurancePolicyNumber ?? this.insurancePolicyNumber,
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
        'plateDueDate': plateDueDate?.toIso8601String(),
        'estimatedAnnualTax': estimatedAnnualTax,
        'insuranceExpiryDate': insuranceExpiryDate?.toIso8601String(),
        'insuranceProvider': insuranceProvider,
        'insurancePolicyNumber': insurancePolicyNumber,
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
        plateDueDate: json['plateDueDate'] != null ? DateTime.parse(json['plateDueDate'] as String) : null,
        estimatedAnnualTax: (json['estimatedAnnualTax'] as num?)?.toDouble() ?? 0,
        insuranceExpiryDate: json['insuranceExpiryDate'] != null ? DateTime.parse(json['insuranceExpiryDate'] as String) : null,
        insuranceProvider: json['insuranceProvider'] as String? ?? '',
        insurancePolicyNumber: json['insurancePolicyNumber'] as String? ?? '',
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
  final String workshop;
  final String category; // Rutin, Oli, Rem, Ban, Kelistrikan, Mesin, Suspensi, Lainnya

  const ServiceLog({
    required this.id,
    required this.vehicleId,
    required this.date,
    required this.odometer,
    required this.title,
    required this.cost,
    this.notes = '',
    this.isOilChange = false,
    this.workshop = '',
    this.category = 'Servis Rutin',
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
        'workshop': workshop,
        'category': category,
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
        workshop: json['workshop'] as String? ?? '',
        category: json['category'] as String? ?? (json['isOilChange'] == true ? 'Ganti Oli' : 'Servis Rutin'),
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
  final String fuelType; // Pertalite, Pertamax, Pertamax Turbo, Solar/Dex, SPKLU Listrik
  final String gasStation;

  const FuelLog({
    required this.id,
    required this.vehicleId,
    required this.date,
    required this.odometer,
    required this.liters,
    required this.pricePerLiter,
    this.isFullTank = true,
    this.fuelType = 'Pertamax (RON 92)',
    this.gasStation = '',
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
        'fuelType': fuelType,
        'gasStation': gasStation,
      };

  factory FuelLog.fromJson(Map<String, dynamic> json) => FuelLog(
        id: json['id'] as String,
        vehicleId: json['vehicleId'] as String,
        date: DateTime.parse(json['date'] as String),
        odometer: (json['odometer'] as num).toInt(),
        liters: (json['liters'] as num).toDouble(),
        pricePerLiter: (json['pricePerLiter'] as num).toDouble(),
        isFullTank: json['isFullTank'] as bool? ?? true,
        fuelType: json['fuelType'] as String? ?? 'Pertamax (RON 92)',
        gasStation: json['gasStation'] as String? ?? '',
      );
}

/// Dual-Trigger Periodic Maintenance Schedule
class MaintenanceSchedule {
  final String id;
  final String vehicleId;
  final String title;
  final String category;
  final int intervalKm; // Trigger 1: jarak tempuh
  final int intervalMonths; // Trigger 2: durasi bulan
  final int lastPerformedOdometer;
  final DateTime lastPerformedDate;
  final bool isPreset;

  const MaintenanceSchedule({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.category,
    required this.intervalKm,
    required this.intervalMonths,
    required this.lastPerformedOdometer,
    required this.lastPerformedDate,
    this.isPreset = false,
  });

  int get dueOdometer => lastPerformedOdometer + intervalKm;
  DateTime get dueDate => DateTime(
        lastPerformedDate.year,
        lastPerformedDate.month + intervalMonths,
        lastPerformedDate.day,
      );

  int kmRemaining(int currentOdometer) => dueOdometer - currentOdometer;

  int get daysRemaining {
    final now = DateTime.now();
    return dueDate.difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  ScheduleUrgency urgency(int currentOdometer) {
    final kmLeft = kmRemaining(currentOdometer);
    final daysLeft = daysRemaining;
    if (kmLeft <= 0 || daysLeft <= 0) {
      return ScheduleUrgency.overdue;
    }
    if (kmLeft <= (intervalKm * 0.15).round() || daysLeft <= 14) {
      return ScheduleUrgency.dueSoon;
    }
    return ScheduleUrgency.safe;
  }

  MaintenanceSchedule copyWith({
    String? title,
    String? category,
    int? intervalKm,
    int? intervalMonths,
    int? lastPerformedOdometer,
    DateTime? lastPerformedDate,
  }) {
    return MaintenanceSchedule(
      id: id,
      vehicleId: vehicleId,
      title: title ?? this.title,
      category: category ?? this.category,
      intervalKm: intervalKm ?? this.intervalKm,
      intervalMonths: intervalMonths ?? this.intervalMonths,
      lastPerformedOdometer: lastPerformedOdometer ?? this.lastPerformedOdometer,
      lastPerformedDate: lastPerformedDate ?? this.lastPerformedDate,
      isPreset: isPreset,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'vehicleId': vehicleId,
        'title': title,
        'category': category,
        'intervalKm': intervalKm,
        'intervalMonths': intervalMonths,
        'lastPerformedOdometer': lastPerformedOdometer,
        'lastPerformedDate': lastPerformedDate.toIso8601String(),
        'isPreset': isPreset,
      };

  factory MaintenanceSchedule.fromJson(Map<String, dynamic> json) => MaintenanceSchedule(
        id: json['id'] as String,
        vehicleId: json['vehicleId'] as String,
        title: json['title'] as String,
        category: json['category'] as String? ?? 'Perawatan Berkala',
        intervalKm: (json['intervalKm'] as num).toInt(),
        intervalMonths: (json['intervalMonths'] as num).toInt(),
        lastPerformedOdometer: (json['lastPerformedOdometer'] as num).toInt(),
        lastPerformedDate: DateTime.parse(json['lastPerformedDate'] as String),
        isPreset: json['isPreset'] as bool? ?? false,
      );

  static List<MaintenanceSchedule> defaultPresetsFor(Vehicle v) {
    final now = DateTime.now();
    if (v.type == VehicleType.car) {
      return [
        MaintenanceSchedule(
          id: 'preset_${v.id}_oil',
          vehicleId: v.id,
          title: 'Ganti Oli Mesin Sintetik',
          category: 'Oli & Pelumas',
          intervalKm: 5000,
          intervalMonths: 6,
          lastPerformedOdometer: v.lastOilOdometer,
          lastPerformedDate: now.subtract(const Duration(days: 45)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_filter_oil',
          vehicleId: v.id,
          title: 'Ganti Filter Oli Mesin',
          category: 'Oli & Filter',
          intervalKm: 10000,
          intervalMonths: 12,
          lastPerformedOdometer: (v.lastOilOdometer > 10000 ? v.lastOilOdometer - 10000 : 0),
          lastPerformedDate: now.subtract(const Duration(days: 120)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_filter_air',
          vehicleId: v.id,
          title: 'Filter Udara & AC Kabin',
          category: 'Filter & Udara',
          intervalKm: 10000,
          intervalMonths: 12,
          lastPerformedOdometer: (v.currentOdometer > 8000 ? v.currentOdometer - 8000 : 0),
          lastPerformedDate: now.subtract(const Duration(days: 90)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_brake_fluid',
          vehicleId: v.id,
          title: 'Kuras Minyak Rem & Kampas',
          category: 'Pengereman',
          intervalKm: 20000,
          intervalMonths: 24,
          lastPerformedOdometer: 10000,
          lastPerformedDate: now.subtract(const Duration(days: 200)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_tire_rotation',
          vehicleId: v.id,
          title: 'Rotasi Ban & Spooring Balancing',
          category: 'Ban & Suspensi',
          intervalKm: 10000,
          intervalMonths: 6,
          lastPerformedOdometer: 15000,
          lastPerformedDate: now.subtract(const Duration(days: 60)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_spark_plugs',
          vehicleId: v.id,
          title: 'Ganti Busi Iridium',
          category: 'Pengapian',
          intervalKm: 40000,
          intervalMonths: 36,
          lastPerformedOdometer: 0,
          lastPerformedDate: now.subtract(const Duration(days: 300)),
          isPreset: true,
        ),
      ];
    } else {
      return [
        MaintenanceSchedule(
          id: 'preset_${v.id}_moto_oil',
          vehicleId: v.id,
          title: 'Ganti Oli Mesin Matic/Manual',
          category: 'Oli & Pelumas',
          intervalKm: 2500,
          intervalMonths: 3,
          lastPerformedOdometer: v.lastOilOdometer,
          lastPerformedDate: now.subtract(const Duration(days: 30)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_gear_oil',
          vehicleId: v.id,
          title: 'Ganti Oli Gardan (Gear Oil)',
          category: 'Oli & Transmisi',
          intervalKm: 6000,
          intervalMonths: 6,
          lastPerformedOdometer: 10000,
          lastPerformedDate: now.subtract(const Duration(days: 80)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_vbelt',
          vehicleId: v.id,
          title: 'Servis CVT, V-Belt & Roller',
          category: 'Transmisi CVT',
          intervalKm: 20000,
          intervalMonths: 24,
          lastPerformedOdometer: 0,
          lastPerformedDate: now.subtract(const Duration(days: 250)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_moto_brakes',
          vehicleId: v.id,
          title: 'Cek & Ganti Kampas Rem',
          category: 'Pengereman',
          intervalKm: 10000,
          intervalMonths: 12,
          lastPerformedOdometer: 8000,
          lastPerformedDate: now.subtract(const Duration(days: 100)),
          isPreset: true,
        ),
        MaintenanceSchedule(
          id: 'preset_${v.id}_moto_spark',
          vehicleId: v.id,
          title: 'Ganti Busi Motor',
          category: 'Pengapian',
          intervalKm: 8000,
          intervalMonths: 10,
          lastPerformedOdometer: 8000,
          lastPerformedDate: now.subtract(const Duration(days: 110)),
          isPreset: true,
        ),
      ];
    }
  }
}

/// Digital Glovebox & Vehicle Document
class VehicleDocument {
  final String id;
  final String vehicleId;
  final String title;
  final DocumentType type;
  final String documentNumber;
  final DateTime expiryDate;
  final double cost;
  final String notes;

  const VehicleDocument({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.type,
    required this.documentNumber,
    required this.expiryDate,
    this.cost = 0,
    this.notes = '',
  });

  int get daysRemaining {
    final now = DateTime.now();
    return expiryDate.difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  bool get isExpired => daysRemaining < 0;
  bool get isDueSoon => daysRemaining <= 30 && daysRemaining >= 0;

  Map<String, dynamic> toJson() => {
        'id': id,
        'vehicleId': vehicleId,
        'title': title,
        'type': type.name,
        'documentNumber': documentNumber,
        'expiryDate': expiryDate.toIso8601String(),
        'cost': cost,
        'notes': notes,
      };

  factory VehicleDocument.fromJson(Map<String, dynamic> json) => VehicleDocument(
        id: json['id'] as String,
        vehicleId: json['vehicleId'] as String,
        title: json['title'] as String,
        type: DocumentType.values.firstWhere(
          (d) => d.name == json['type'],
          orElse: () => DocumentType.lainnya,
        ),
        documentNumber: json['documentNumber'] as String? ?? '',
        expiryDate: DateTime.parse(json['expiryDate'] as String),
        cost: (json['cost'] as num?)?.toDouble() ?? 0,
        notes: json['notes'] as String? ?? '',
      );

  static List<VehicleDocument> defaultDocumentsFor(Vehicle v) {
    return [
      VehicleDocument(
        id: 'doc_${v.id}_tax',
        vehicleId: v.id,
        title: 'Pajak PKB Tahunan STNK',
        type: DocumentType.stnkTahunan,
        documentNumber: v.plateNumber,
        expiryDate: v.taxDueDate,
        cost: v.estimatedAnnualTax,
        notes: 'Bayar via Samsat Digital Nasional (SIGNAL) atau Samsat terdekat',
      ),
      VehicleDocument(
        id: 'doc_${v.id}_plate',
        vehicleId: v.id,
        title: 'Perpanjangan Pelat & STNK 5 Tahunan',
        type: DocumentType.stnkLimaTahunan,
        documentNumber: v.plateNumber,
        expiryDate: v.plateDueDate ?? v.taxDueDate.add(const Duration(days: 365 * 3)),
        cost: v.estimatedAnnualTax + 350000,
        notes: 'Wajib cek fisik kendaraan langsung di Samsat Induk',
      ),
      if (v.insuranceExpiryDate != null)
        VehicleDocument(
          id: 'doc_${v.id}_ins',
          vehicleId: v.id,
          title: v.insuranceProvider.isNotEmpty ? v.insuranceProvider : 'Asuransi Kendaraan',
          type: DocumentType.asuransi,
          documentNumber: v.insurancePolicyNumber,
          expiryDate: v.insuranceExpiryDate!,
          cost: 3200000,
          notes: 'Nomor klaim darurat atau towing tersedia di polis',
        ),
    ];
  }
}

/// Inspection Checklist
class InspectionItem {
  final String id;
  final String label;
  final String category; // Mesin, Kaki-Kaki, Kelistrikan, Keselamatan
  bool isChecked;
  String notes;

  InspectionItem({
    required this.id,
    required this.label,
    required this.category,
    this.isChecked = false,
    this.notes = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'category': category,
        'isChecked': isChecked,
        'notes': notes,
      };

  factory InspectionItem.fromJson(Map<String, dynamic> json) => InspectionItem(
        id: json['id'] as String,
        label: json['label'] as String,
        category: json['category'] as String,
        isChecked: json['isChecked'] as bool? ?? false,
        notes: json['notes'] as String? ?? '',
      );
}

class InspectionChecklist {
  final String id;
  final String vehicleId;
  final DateTime date;
  final int odometer;
  final String title;
  final List<InspectionItem> items;
  final String inspectorNotes;

  const InspectionChecklist({
    required this.id,
    required this.vehicleId,
    required this.date,
    required this.odometer,
    required this.title,
    required this.items,
    this.inspectorNotes = '',
  });

  int get passedCount => items.where((i) => i.isChecked).length;
  int get totalCount => items.length;
  double get passPercentage => totalCount > 0 ? (passedCount / totalCount) * 100 : 0;
  bool get isAllPassed => passedCount == totalCount;

  Map<String, dynamic> toJson() => {
        'id': id,
        'vehicleId': vehicleId,
        'date': date.toIso8601String(),
        'odometer': odometer,
        'title': title,
        'items': items.map((i) => i.toJson()).toList(),
        'inspectorNotes': inspectorNotes,
      };

  factory InspectionChecklist.fromJson(Map<String, dynamic> json) => InspectionChecklist(
        id: json['id'] as String,
        vehicleId: json['vehicleId'] as String,
        date: DateTime.parse(json['date'] as String),
        odometer: (json['odometer'] as num).toInt(),
        title: json['title'] as String,
        items: (json['items'] as List)
            .map((item) => InspectionItem.fromJson(item as Map<String, dynamic>))
            .toList(),
        inspectorNotes: json['inspectorNotes'] as String? ?? '',
      );

  static List<InspectionItem> generateDefaultItems(VehicleType type) {
    if (type == VehicleType.car) {
      return [
        InspectionItem(id: 'i1', label: 'Dipstick Level & Kejernihan Oli Mesin', category: 'Mesin & Cairan', isChecked: true),
        InspectionItem(id: 'i2', label: 'Level Air Reservoir Radiator Coolant', category: 'Mesin & Cairan', isChecked: true),
        InspectionItem(id: 'i3', label: 'Level Minyak Rem & Minyak Kopling/Power Steering', category: 'Mesin & Cairan', isChecked: true),
        InspectionItem(id: 'i4', label: 'Tekanan Udara & Alur Ketebalan 4 Ban + Ban Serep', category: 'Roda & Pengereman', isChecked: true),
        InspectionItem(id: 'i5', label: 'Kondisi Kampas Rem & Daya Cengkeram Rem Tangan', category: 'Roda & Pengereman', isChecked: true),
        InspectionItem(id: 'i6', label: 'Lampu Utama, Lampu Rem, Sein & Lampu Hazard', category: 'Lampu & Kelistrikan', isChecked: true),
        InspectionItem(id: 'i7', label: 'Kondisi Terminal & Tegangan Indikator Aki (12V)', category: 'Lampu & Kelistrikan', isChecked: true),
        InspectionItem(id: 'i8', label: 'Karet Wiper & Air Tabung Washer Kaca Depan', category: 'Keselamatan', isChecked: true),
        InspectionItem(id: 'i9', label: 'Dongkrak, Kunci Roda, Segitiga Pengaman & Kotak P3K', category: 'Keselamatan', isChecked: true),
      ];
    } else {
      return [
        InspectionItem(id: 'm1', label: 'Ketinggian & Kualitas Oli Mesin', category: 'Mesin & Pelumas', isChecked: true),
        InspectionItem(id: 'm2', label: 'Kondisi Oli Gardan / Ketegangan Rantai Roda', category: 'Transmisi & Penggerak', isChecked: true),
        InspectionItem(id: 'm3', label: 'Tekanan Angin Ban Depan & Belakang', category: 'Roda & Kemudi', isChecked: true),
        InspectionItem(id: 'm4', label: 'Ketebalan Kampas Rem Depan & Belakang', category: 'Pengereman', isChecked: true),
        InspectionItem(id: 'm5', label: 'Lampu Depan, Lampu Belakang & Lampu Sein', category: 'Kelistrikan', isChecked: true),
        InspectionItem(id: 'm6', label: 'Fungsi Klakson & Starter Elektrik (Kondisi Aki)', category: 'Kelistrikan', isChecked: true),
        InspectionItem(id: 'm7', label: 'Spion Kanan & Kiri serta Kunci Kelengkapan', category: 'Kelengkapan', isChecked: true),
      ];
    }
  }
}
