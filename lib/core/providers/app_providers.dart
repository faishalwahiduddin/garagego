import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vehicle.dart';
import '../storage/local_storage_service.dart';

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  throw UnimplementedError('localStorageServiceProvider must be provided');
});

// --- Vehicles Notifier ---
class VehiclesNotifier extends Notifier<List<Vehicle>> {
  @override
  List<Vehicle> build() {
    final storage = ref.watch(localStorageServiceProvider);
    return storage.getVehicles();
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    state = [...state, vehicle];
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveVehicles(state);
    if (state.length == 1) {
      ref.read(activeVehicleIdProvider.notifier).setActiveId(vehicle.id);
    }
  }

  Future<void> updateVehicle(Vehicle updated) async {
    state = state.map((v) => v.id == updated.id ? updated : v).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveVehicles(state);
  }

  Future<void> deleteVehicle(String id) async {
    state = state.where((v) => v.id != id).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveVehicles(state);
    final activeId = ref.read(activeVehicleIdProvider);
    if (activeId == id && state.isNotEmpty) {
      ref.read(activeVehicleIdProvider.notifier).setActiveId(state.first.id);
    }
  }
}

final vehiclesProvider =
    NotifierProvider<VehiclesNotifier, List<Vehicle>>(VehiclesNotifier.new);

// --- Active Vehicle ID Notifier ---
class ActiveVehicleIdNotifier extends Notifier<String?> {
  @override
  String? build() {
    final storage = ref.watch(localStorageServiceProvider);
    return storage.getActiveVehicleId();
  }

  Future<void> setActiveId(String id) async {
    state = id;
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveActiveVehicleId(id);
  }
}

final activeVehicleIdProvider =
    NotifierProvider<ActiveVehicleIdNotifier, String?>(ActiveVehicleIdNotifier.new);

final activeVehicleProvider = Provider<Vehicle?>((ref) {
  final vehicles = ref.watch(vehiclesProvider);
  final activeId = ref.watch(activeVehicleIdProvider);
  if (vehicles.isEmpty) return null;
  if (activeId == null) return vehicles.first;
  return vehicles.firstWhere((v) => v.id == activeId, orElse: () => vehicles.first);
});

// --- Service Logs Notifier ---
class ServiceLogsNotifier extends Notifier<List<ServiceLog>> {
  @override
  List<ServiceLog> build() {
    final storage = ref.watch(localStorageServiceProvider);
    return storage.getServiceLogs();
  }

  Future<void> addLog(ServiceLog log) async {
    state = [log, ...state];
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveServiceLogs(state);

    // Update vehicle's current odometer and oil odometer if this log is higher
    final active = ref.read(activeVehicleProvider);
    if (active != null && active.id == log.vehicleId) {
      var updated = active;
      if (log.odometer > active.currentOdometer) {
        updated = updated.copyWith(currentOdometer: log.odometer);
      }
      if (log.isOilChange && log.odometer >= active.lastOilOdometer) {
        updated = updated.copyWith(lastOilOdometer: log.odometer);
      }
      await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
    }
  }

  Future<void> deleteLog(String id) async {
    state = state.where((l) => l.id != id).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveServiceLogs(state);
  }
}

final serviceLogsProvider =
    NotifierProvider<ServiceLogsNotifier, List<ServiceLog>>(ServiceLogsNotifier.new);

// --- Fuel Logs Notifier ---
class FuelLogsNotifier extends Notifier<List<FuelLog>> {
  @override
  List<FuelLog> build() {
    final storage = ref.watch(localStorageServiceProvider);
    return storage.getFuelLogs();
  }

  Future<void> addFuelLog(FuelLog log) async {
    state = [log, ...state];
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveFuelLogs(state);

    // Update odometer if higher
    final active = ref.read(activeVehicleProvider);
    if (active != null && active.id == log.vehicleId && log.odometer > active.currentOdometer) {
      await ref.read(vehiclesProvider.notifier).updateVehicle(active.copyWith(currentOdometer: log.odometer));
    }
  }

  Future<void> deleteFuelLog(String id) async {
    state = state.where((f) => f.id != id).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveFuelLogs(state);
  }
}

final fuelLogsProvider =
    NotifierProvider<FuelLogsNotifier, List<FuelLog>>(FuelLogsNotifier.new);

// Active vehicle filtered logs
final activeServiceLogsProvider = Provider<List<ServiceLog>>((ref) {
  final active = ref.watch(activeVehicleProvider);
  if (active == null) return [];
  final logs = ref.watch(serviceLogsProvider);
  return logs.where((l) => l.vehicleId == active.id).toList();
});

final activeFuelLogsProvider = Provider<List<FuelLog>>((ref) {
  final active = ref.watch(activeVehicleProvider);
  if (active == null) return [];
  final logs = ref.watch(fuelLogsProvider);
  return logs.where((l) => l.vehicleId == active.id).toList();
});
