import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../models/vehicle.dart';
import '../services/analytics_service.dart';
import '../storage/local_storage_service.dart';
import 'l10n_provider.dart';

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  throw UnimplementedError('localStorageServiceProvider must be provided');
});

/// Re-inserts [item] at [index] (clamped), used by the delete-undo snackbar.
List<T> _insertAt<T>(List<T> list, T item, int index) {
  final at = index.clamp(0, list.length);
  return [...list.sublist(0, at), item, ...list.sublist(at)];
}

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

    // Cascade: everything below is only read through the active vehicle, so a
    // leftover row is invisible in the garage yet still ships in backup
    // exports (and comes back on import). Drop it with its vehicle.
    await ref.read(serviceLogsProvider.notifier).purgeVehicle(id);
    await ref.read(fuelLogsProvider.notifier).purgeVehicle(id);
    await ref.read(maintenanceSchedulesProvider.notifier).purgeVehicle(id);
    await ref.read(vehicleDocumentsProvider.notifier).purgeVehicle(id);
    await ref.read(inspectionChecklistsProvider.notifier).purgeVehicle(id);

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
    await _syncVehicleOdometers(log);
  }

  /// Replaces an existing log (edit sheet) and keeps the vehicle's odometers
  /// at least as high as the edited reading.
  Future<void> updateLog(ServiceLog log) async {
    state = state.map((l) => l.id == log.id ? log : l).toList();
    await ref.read(localStorageServiceProvider).saveServiceLogs(state);
    await _syncVehicleOdometers(log);
  }

  /// Puts a just-deleted log back where it was (undo).
  Future<void> restoreLog(ServiceLog log, int index) async {
    state = _insertAt(state, log, index);
    await ref.read(localStorageServiceProvider).saveServiceLogs(state);
  }

  Future<void> _syncVehicleOdometers(ServiceLog log) async {
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

  /// Drops every log belonging to a vehicle that is being deleted.
  Future<void> purgeVehicle(String vehicleId) async {
    final remaining = state.where((l) => l.vehicleId != vehicleId).toList();
    if (remaining.length == state.length) return;
    state = remaining;
    await ref.read(localStorageServiceProvider).saveServiceLogs(remaining);
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

    await _syncVehicleOdometer(log);
  }

  /// Replaces an existing fill-up (edit sheet).
  Future<void> updateFuelLog(FuelLog log) async {
    state = state.map((f) => f.id == log.id ? log : f).toList();
    await ref.read(localStorageServiceProvider).saveFuelLogs(state);
    await _syncVehicleOdometer(log);
  }

  /// Puts a just-deleted fill-up back where it was (undo).
  Future<void> restoreFuelLog(FuelLog log, int index) async {
    state = _insertAt(state, log, index);
    await ref.read(localStorageServiceProvider).saveFuelLogs(state);
  }

  Future<void> _syncVehicleOdometer(FuelLog log) async {
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

  /// Drops every fill-up belonging to a vehicle that is being deleted.
  Future<void> purgeVehicle(String vehicleId) async {
    final remaining = state.where((l) => l.vehicleId != vehicleId).toList();
    if (remaining.length == state.length) return;
    state = remaining;
    await ref.read(localStorageServiceProvider).saveFuelLogs(remaining);
  }
}

final fuelLogsProvider =
    NotifierProvider<FuelLogsNotifier, List<FuelLog>>(FuelLogsNotifier.new);

// --- Maintenance Schedules Notifier ---
class MaintenanceSchedulesNotifier extends Notifier<List<MaintenanceSchedule>> {
  @override
  List<MaintenanceSchedule> build() {
    final storage = ref.watch(localStorageServiceProvider);
    return storage.getMaintenanceSchedules();
  }

  Future<void> addSchedule(MaintenanceSchedule schedule) async {
    state = [...state, schedule];
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveMaintenanceSchedules(state);
  }

  Future<void> updateSchedule(MaintenanceSchedule updated) async {
    state = state.map((s) => s.id == updated.id ? updated : s).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveMaintenanceSchedules(state);
  }

  /// Puts a just-deleted schedule back where it was (undo).
  Future<void> restoreSchedule(MaintenanceSchedule schedule, int index) async {
    state = _insertAt(state, schedule, index);
    await ref.read(localStorageServiceProvider).saveMaintenanceSchedules(state);
  }

  Future<void> deleteSchedule(String id) async {
    state = state.where((s) => s.id != id).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveMaintenanceSchedules(state);
  }

  /// Drops every maintenance schedule belonging to a deleted vehicle.
  Future<void> purgeVehicle(String vehicleId) async {
    final remaining = state.where((s) => s.vehicleId != vehicleId).toList();
    if (remaining.length == state.length) return;
    state = remaining;
    await ref.read(localStorageServiceProvider).saveMaintenanceSchedules(remaining);
  }

  Future<void> markScheduleDone({
    required MaintenanceSchedule schedule,
    required int performedOdometer,
    required DateTime performedDate,
    required double cost,
    required AppLocalizations l10n,
    String notes = '',
    String workshop = '',
  }) async {
    final updated = schedule.copyWith(
      lastPerformedOdometer: performedOdometer,
      lastPerformedDate: performedDate,
    );
    await updateSchedule(updated);

    // Automatically create a ServiceLog entry
    final serviceLog = ServiceLog(
      id: 'serv_${DateTime.now().millisecondsSinceEpoch}',
      vehicleId: schedule.vehicleId,
      date: performedDate,
      odometer: performedOdometer,
      title: schedule.title,
      cost: cost,
      notes: notes.isNotEmpty
          ? notes
          : l10n.scheduleDoneNote(schedule.category),
      // Categories are stored values, so the legacy Indonesian key still
      // counts alongside the two localized oil categories.
      isOilChange: schedule.category == kOilChangeServiceCategory ||
          schedule.category == l10n.mtCatOilFluids ||
          schedule.category == l10n.mtCatOilFilter,
      workshop: workshop,
      category: schedule.category,
    );
    await ref.read(serviceLogsProvider.notifier).addLog(serviceLog);
  }

  Future<void> loadPresetsForVehicle(
    Vehicle vehicle,
    AppLocalizations l10n,
  ) async {
    final presets = MaintenanceSchedule.defaultPresetsFor(vehicle, l10n);
    // Remove existing presets for this vehicle and replace
    final nonPresets = state.where((s) => s.vehicleId != vehicle.id || !s.isPreset).toList();
    state = [...nonPresets, ...presets];
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveMaintenanceSchedules(state);
  }
}

final maintenanceSchedulesProvider =
    NotifierProvider<MaintenanceSchedulesNotifier, List<MaintenanceSchedule>>(
        MaintenanceSchedulesNotifier.new);

// --- Vehicle Documents Notifier ---
class VehicleDocumentsNotifier extends Notifier<List<VehicleDocument>> {
  @override
  List<VehicleDocument> build() {
    final storage = ref.watch(localStorageServiceProvider);
    return storage.getVehicleDocuments();
  }

  Future<void> addDocument(VehicleDocument doc) async {
    state = [...state, doc];
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveVehicleDocuments(state);
  }

  Future<void> updateDocument(VehicleDocument updated) async {
    state = state.map((d) => d.id == updated.id ? updated : d).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveVehicleDocuments(state);
  }

  /// Puts a just-deleted document back where it was (undo).
  Future<void> restoreDocument(VehicleDocument doc, int index) async {
    state = _insertAt(state, doc, index);
    await ref.read(localStorageServiceProvider).saveVehicleDocuments(state);
  }

  Future<void> deleteDocument(String id) async {
    state = state.where((d) => d.id != id).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveVehicleDocuments(state);
  }

  /// Drops every document belonging to a deleted vehicle.
  Future<void> purgeVehicle(String vehicleId) async {
    final remaining = state.where((d) => d.vehicleId != vehicleId).toList();
    if (remaining.length == state.length) return;
    state = remaining;
    await ref.read(localStorageServiceProvider).saveVehicleDocuments(remaining);
  }
}

final vehicleDocumentsProvider =
    NotifierProvider<VehicleDocumentsNotifier, List<VehicleDocument>>(
        VehicleDocumentsNotifier.new);

// --- Inspection Checklists Notifier ---
class InspectionChecklistsNotifier extends Notifier<List<InspectionChecklist>> {
  @override
  List<InspectionChecklist> build() {
    final storage = ref.watch(localStorageServiceProvider);
    return storage.getInspectionChecklists();
  }

  Future<void> addChecklist(InspectionChecklist checklist) async {
    state = [checklist, ...state];
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveInspectionChecklists(state);
  }

  /// Puts a just-deleted inspection back where it was (undo).
  Future<void> restoreChecklist(InspectionChecklist checklist, int index) async {
    state = _insertAt(state, checklist, index);
    await ref.read(localStorageServiceProvider).saveInspectionChecklists(state);
  }

  Future<void> deleteChecklist(String id) async {
    state = state.where((c) => c.id != id).toList();
    final storage = ref.read(localStorageServiceProvider);
    await storage.saveInspectionChecklists(state);
  }

  /// Drops every inspection belonging to a deleted vehicle.
  Future<void> purgeVehicle(String vehicleId) async {
    final remaining = state.where((c) => c.vehicleId != vehicleId).toList();
    if (remaining.length == state.length) return;
    state = remaining;
    await ref.read(localStorageServiceProvider).saveInspectionChecklists(remaining);
  }
}

final inspectionChecklistsProvider =
    NotifierProvider<InspectionChecklistsNotifier, List<InspectionChecklist>>(
        InspectionChecklistsNotifier.new);

// --- Active vehicle filtered logs & records ---
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

final activeMaintenanceSchedulesProvider = Provider<List<MaintenanceSchedule>>((ref) {
  final active = ref.watch(activeVehicleProvider);
  if (active == null) return [];
  final schedules = ref.watch(maintenanceSchedulesProvider);
  return schedules.where((s) => s.vehicleId == active.id).toList();
});

final activeVehicleDocumentsProvider = Provider<List<VehicleDocument>>((ref) {
  final active = ref.watch(activeVehicleProvider);
  if (active == null) return [];
  final docs = ref.watch(vehicleDocumentsProvider);
  return docs.where((d) => d.vehicleId == active.id).toList();
});

final activeInspectionChecklistsProvider = Provider<List<InspectionChecklist>>((ref) {
  final active = ref.watch(activeVehicleProvider);
  if (active == null) return [];
  final checklists = ref.watch(inspectionChecklistsProvider);
  return checklists.where((c) => c.vehicleId == active.id).toList();
});

// --- Computed Analytics Providers ---
final vehicleHealthScoreProvider = Provider<VehicleHealthResult?>((ref) {
  final active = ref.watch(activeVehicleProvider);
  if (active == null) return null;
  final schedules = ref.watch(activeMaintenanceSchedulesProvider);
  final documents = ref.watch(activeVehicleDocumentsProvider);
  final l10n = ref.watch(appLocalizationsProvider);
  return AnalyticsService.computeHealthScore(
    vehicle: active,
    schedules: schedules,
    documents: documents,
    l10n: l10n,
  );
});

final activeTCOProvider = Provider<TCOResult>((ref) {
  final active = ref.watch(activeVehicleProvider);
  if (active == null) {
    return const TCOResult(
      totalCost: 0,
      fuelCost: 0,
      serviceCost: 0,
      documentCost: 0,
      costPerKm: 0,
      monthlyEstimatedCost: 0,
    );
  }
  final services = ref.watch(activeServiceLogsProvider);
  final fuels = ref.watch(activeFuelLogsProvider);
  final docs = ref.watch(activeVehicleDocumentsProvider);
  return AnalyticsService.computeTCO(
    vehicle: active,
    services: services,
    fuels: fuels,
    documents: docs,
  );
});

final activeFuelEfficiencyProvider = Provider<FuelEfficiencySummary>((ref) {
  final fuels = ref.watch(activeFuelLogsProvider);
  return AnalyticsService.computeFuelEfficiency(fuels);
});
