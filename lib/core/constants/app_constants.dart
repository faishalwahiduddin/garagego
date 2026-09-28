class AppConstants {
  static const String appName = 'GarageGo';
  static const String appVersion = '1.1.0';
  static const String appTagline = 'Personal Vehicle Garage & Fleet Maintenance Manager';
  static const String appDomain = 'https://garagego.faishal.id';
  static const String fleetHome = 'https://faishal.id';

  // Storage Keys
  static const String keyVehicles = 'garagego_vehicles';
  static const String keyActiveVehicleId = 'garagego_active_vehicle_id';
  static const String keyServiceLogs = 'garagego_service_logs';
  static const String keyFuelLogs = 'garagego_fuel_logs';
  static const String keyMaintenanceSchedules = 'garagego_maintenance_schedules';
  static const String keyVehicleDocuments = 'garagego_vehicle_documents';
  static const String keyInspectionChecklists = 'garagego_inspection_checklists';

  // Validation Limits (§VAL)
  static const int minVehicleNameLength = 2;
  static const int maxVehicleNameLength = 50;
  static const int maxPlateNumberLength = 15;
  static const int maxOdometerKm = 2000000; // 2 million km
}
