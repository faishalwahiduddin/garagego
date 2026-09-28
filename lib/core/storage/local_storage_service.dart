import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../models/vehicle.dart';
import '../utils/validators.dart';

class LocalStorageService {
  final SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  LocalStorageService(this._prefs);

  static Future<LocalStorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    final service = LocalStorageService(prefs);
    service.seedInitialIfEmpty();
    return service;
  }

  void seedInitialIfEmpty() {
    if (!_prefs.containsKey(AppConstants.keyVehicles)) {
      final defaultVehicles = [Vehicle.sampleCar(), Vehicle.sampleMotorcycle()];
      saveVehicles(defaultVehicles);
      saveActiveVehicleId(defaultVehicles.first.id);

      // Seed initial service log
      final defaultLogs = [
        ServiceLog(
          id: 'log-1',
          vehicleId: defaultVehicles.first.id,
          date: DateTime.now().subtract(const Duration(days: 45)),
          odometer: 20000,
          title: 'Servis Berkala & Ganti Oli Mesin Sintetik 5W-30',
          cost: 850000,
          notes: 'Ganti filter oli & filter AC kabin di bengkel resmi',
          isOilChange: true,
          workshop: 'Auto2000 BSD City',
          category: 'Ganti Oli & Filter',
        ),
        ServiceLog(
          id: 'log-2',
          vehicleId: defaultVehicles.first.id,
          date: DateTime.now().subtract(const Duration(days: 120)),
          odometer: 15000,
          title: 'Rotasi Ban & Spooring Balancing',
          cost: 320000,
          notes: 'Tekanan ban disetel 33 psi nitrogen',
          isOilChange: false,
          workshop: 'Kios Ban Paramount',
          category: 'Ban & Suspensi',
        ),
      ];
      saveServiceLogs(defaultLogs);

      // Seed initial fuel log
      final defaultFuel = [
        FuelLog(
          id: 'fuel-1',
          vehicleId: defaultVehicles.first.id,
          date: DateTime.now().subtract(const Duration(days: 15)),
          odometer: 24100,
          liters: 40.0,
          pricePerLiter: 13700,
          isFullTank: true,
          fuelType: 'Pertamax (RON 92)',
          gasStation: 'Pertamina 34.15321 Serpong',
        ),
        FuelLog(
          id: 'fuel-2',
          vehicleId: defaultVehicles.first.id,
          date: DateTime.now().subtract(const Duration(days: 5)),
          odometer: 24500,
          liters: 32.5,
          pricePerLiter: 13700,
          isFullTank: true,
          fuelType: 'Pertamax (RON 92)',
          gasStation: 'Pertamina 34.15321 Serpong',
        ),
      ];
      saveFuelLogs(defaultFuel);

      // Seed initial maintenance schedules
      final carPresets = MaintenanceSchedule.defaultPresetsFor(defaultVehicles.first);
      final motoPresets = MaintenanceSchedule.defaultPresetsFor(defaultVehicles[1]);
      saveMaintenanceSchedules([...carPresets, ...motoPresets]);

      // Seed initial vehicle documents
      final carDocs = VehicleDocument.defaultDocumentsFor(defaultVehicles.first);
      final motoDocs = VehicleDocument.defaultDocumentsFor(defaultVehicles[1]);
      saveVehicleDocuments([...carDocs, ...motoDocs]);

      // Seed sample inspection checklist
      final sampleInspection = InspectionChecklist(
        id: 'insp-1',
        vehicleId: defaultVehicles.first.id,
        date: DateTime.now().subtract(const Duration(days: 2)),
        odometer: 24500,
        title: 'Inspeksi Lengkap Pra-Roadtrip',
        items: InspectionChecklist.generateDefaultItems(VehicleType.car),
        inspectorNotes: 'Kondisi kendaraan sangat prima, tekanan ban dan oli mesin dalam kondisi ideal.',
      );
      saveInspectionChecklists([sampleInspection]);
    }
  }

  // --- Vehicles ---
  List<Vehicle> getVehicles() {
    final raw = _prefs.getString(AppConstants.keyVehicles);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((item) => Vehicle.fromJson(item as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> saveVehicles(List<Vehicle> vehicles) async {
    for (final v in vehicles) {
      final nameErr = AppValidators.validateVehicleName(v.name);
      if (nameErr != null) throw ArgumentError(nameErr);

      final plateErr = AppValidators.validatePlateNumber(v.plateNumber);
      if (plateErr != null) throw ArgumentError(plateErr);

      final odoErr = AppValidators.validateOdometer(v.currentOdometer);
      if (odoErr != null) throw ArgumentError(odoErr);
    }
    final raw = jsonEncode(vehicles.map((v) => v.toJson()).toList());
    return _prefs.setString(AppConstants.keyVehicles, raw);
  }

  String? getActiveVehicleId() {
    return _prefs.getString(AppConstants.keyActiveVehicleId);
  }

  Future<bool> saveActiveVehicleId(String id) async {
    return _prefs.setString(AppConstants.keyActiveVehicleId, id);
  }

  // --- Service Logs ---
  List<ServiceLog> getServiceLogs() {
    final raw = _prefs.getString(AppConstants.keyServiceLogs);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((item) => ServiceLog.fromJson(item as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> saveServiceLogs(List<ServiceLog> logs) async {
    final raw = jsonEncode(logs.map((l) => l.toJson()).toList());
    return _prefs.setString(AppConstants.keyServiceLogs, raw);
  }

  // --- Fuel Logs ---
  List<FuelLog> getFuelLogs() {
    final raw = _prefs.getString(AppConstants.keyFuelLogs);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((item) => FuelLog.fromJson(item as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> saveFuelLogs(List<FuelLog> logs) async {
    final raw = jsonEncode(logs.map((f) => f.toJson()).toList());
    return _prefs.setString(AppConstants.keyFuelLogs, raw);
  }

  // --- Maintenance Schedules ---
  List<MaintenanceSchedule> getMaintenanceSchedules() {
    final raw = _prefs.getString(AppConstants.keyMaintenanceSchedules);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((item) => MaintenanceSchedule.fromJson(item as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> saveMaintenanceSchedules(List<MaintenanceSchedule> schedules) async {
    final raw = jsonEncode(schedules.map((s) => s.toJson()).toList());
    return _prefs.setString(AppConstants.keyMaintenanceSchedules, raw);
  }

  // --- Vehicle Documents ---
  List<VehicleDocument> getVehicleDocuments() {
    final raw = _prefs.getString(AppConstants.keyVehicleDocuments);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((item) => VehicleDocument.fromJson(item as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> saveVehicleDocuments(List<VehicleDocument> documents) async {
    final raw = jsonEncode(documents.map((d) => d.toJson()).toList());
    return _prefs.setString(AppConstants.keyVehicleDocuments, raw);
  }

  // --- Inspection Checklists ---
  List<InspectionChecklist> getInspectionChecklists() {
    final raw = _prefs.getString(AppConstants.keyInspectionChecklists);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((item) => InspectionChecklist.fromJson(item as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> saveInspectionChecklists(List<InspectionChecklist> checklists) async {
    final raw = jsonEncode(checklists.map((c) => c.toJson()).toList());
    return _prefs.setString(AppConstants.keyInspectionChecklists, raw);
  }

  // --- Backup & Data Portability ---
  String exportBackupJson() {
    final data = {
      'version': AppConstants.appVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'vehicles': getVehicles().map((v) => v.toJson()).toList(),
      'activeVehicleId': getActiveVehicleId(),
      'serviceLogs': getServiceLogs().map((s) => s.toJson()).toList(),
      'fuelLogs': getFuelLogs().map((f) => f.toJson()).toList(),
      'maintenanceSchedules': getMaintenanceSchedules().map((m) => m.toJson()).toList(),
      'vehicleDocuments': getVehicleDocuments().map((d) => d.toJson()).toList(),
      'inspectionChecklists': getInspectionChecklists().map((c) => c.toJson()).toList(),
    };
    return const JsonEncoder.withIndent('  ').convert(data);
  }

  Future<bool> importBackupJson(String jsonString) async {
    final decoded = jsonDecode(jsonString);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Format backup tidak valid: Bukan objek JSON utama');
    }

    if (decoded['vehicles'] is! List) {
      throw const FormatException('Data kendaraan tidak ditemukan dalam berkas backup');
    }

    final rawVehicles = decoded['vehicles'] as List;
    final vehicles = rawVehicles.map((item) => Vehicle.fromJson(item as Map<String, dynamic>)).toList();
    if (vehicles.isEmpty) {
      throw const FormatException('Berkas backup tidak memuat kendaraan valid');
    }

    await saveVehicles(vehicles);

    if (decoded['activeVehicleId'] != null) {
      await saveActiveVehicleId(decoded['activeVehicleId'] as String);
    } else {
      await saveActiveVehicleId(vehicles.first.id);
    }

    if (decoded['serviceLogs'] is List) {
      final logs = (decoded['serviceLogs'] as List)
          .map((item) => ServiceLog.fromJson(item as Map<String, dynamic>))
          .toList();
      await saveServiceLogs(logs);
    }

    if (decoded['fuelLogs'] is List) {
      final fuels = (decoded['fuelLogs'] as List)
          .map((item) => FuelLog.fromJson(item as Map<String, dynamic>))
          .toList();
      await saveFuelLogs(fuels);
    }

    if (decoded['maintenanceSchedules'] is List) {
      final schedules = (decoded['maintenanceSchedules'] as List)
          .map((item) => MaintenanceSchedule.fromJson(item as Map<String, dynamic>))
          .toList();
      await saveMaintenanceSchedules(schedules);
    }

    if (decoded['vehicleDocuments'] is List) {
      final docs = (decoded['vehicleDocuments'] as List)
          .map((item) => VehicleDocument.fromJson(item as Map<String, dynamic>))
          .toList();
      await saveVehicleDocuments(docs);
    }

    if (decoded['inspectionChecklists'] is List) {
      final inspections = (decoded['inspectionChecklists'] as List)
          .map((item) => InspectionChecklist.fromJson(item as Map<String, dynamic>))
          .toList();
      await saveInspectionChecklists(inspections);
    }

    return true;
  }

  String exportServiceLogsCsv(String? vehicleId) {
    final logs = getServiceLogs().where((l) => vehicleId == null || l.vehicleId == vehicleId).toList();
    final buffer = StringBuffer();
    buffer.writeln('ID,Tanggal,Odometer (km),Pekerjaan / Servis,Kategori,Biaya (Rp),Bengkel,Ganti Oli,Catatan');
    for (final l in logs) {
      final dateStr = '${l.date.year}-${l.date.month.toString().padLeft(2, '0')}-${l.date.day.toString().padLeft(2, '0')}';
      final cleanTitle = l.title.replaceAll('"', '""');
      final cleanNotes = l.notes.replaceAll('"', '""');
      final cleanWorkshop = l.workshop.replaceAll('"', '""');
      buffer.writeln('"${l.id}","$dateStr",${l.odometer},"$cleanTitle","${l.category}",${l.cost.toStringAsFixed(0)},"$cleanWorkshop",${l.isOilChange},"$cleanNotes"');
    }
    return buffer.toString();
  }

  String exportFuelLogsCsv(String? vehicleId) {
    final fuels = getFuelLogs().where((f) => vehicleId == null || f.vehicleId == vehicleId).toList();
    final buffer = StringBuffer();
    buffer.writeln('ID,Tanggal,Odometer (km),Volume (Liter),Harga/L (Rp),Total Biaya (Rp),Jenis BBM,Full Tank,SPBU');
    for (final f in fuels) {
      final dateStr = '${f.date.year}-${f.date.month.toString().padLeft(2, '0')}-${f.date.day.toString().padLeft(2, '0')}';
      final cleanStation = f.gasStation.replaceAll('"', '""');
      buffer.writeln('"${f.id}","$dateStr",${f.odometer},${f.liters.toStringAsFixed(2)},${f.pricePerLiter.toStringAsFixed(0)},${f.totalCost.toStringAsFixed(0)},"${f.fuelType}",${f.isFullTank},"$cleanStation"');
    }
    return buffer.toString();
  }

  ThemeMode getThemeMode() {
    final mode = _prefs.getString('theme_mode');
    if (mode == 'light') return ThemeMode.light;
    if (mode == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  Future<bool> saveThemeMode(ThemeMode mode) async {
    final str = mode == ThemeMode.light ? 'light' : (mode == ThemeMode.dark ? 'dark' : 'system');
    return _prefs.setString('theme_mode', str);
  }

  Future<bool> clearAllData() async {
    final keys = _prefs.getKeys();
    for (final k in keys) {
      if (k.startsWith('garagego_')) {
        await _prefs.remove(k);
      }
    }
    return true;
  }
}
