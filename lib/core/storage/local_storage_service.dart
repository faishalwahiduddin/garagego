import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../models/vehicle.dart';
import '../utils/validators.dart';

class LocalStorageService {
  final SharedPreferences _prefs;

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
        ),
      ];
      saveServiceLogs(defaultLogs);

      // Seed initial fuel log
      final defaultFuel = [
        FuelLog(
          id: 'fuel-1',
          vehicleId: defaultVehicles.first.id,
          date: DateTime.now().subtract(const Duration(days: 5)),
          odometer: 24500,
          liters: 42.5,
          pricePerLiter: 13700,
          isFullTank: true,
        ),
      ];
      saveFuelLogs(defaultFuel);
    }
  }

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
