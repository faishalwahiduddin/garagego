import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('GarageGo Storage, Export, and Feature Tests', () {
    late LocalStorageService storage;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      storage = await LocalStorageService.init();
    });

    test('Initial seeding initializes vehicles, schedules, documents, and logs', () {
      final vehicles = storage.getVehicles();
      expect(vehicles.length, 2); // 1 car, 1 motorcycle

      final car = vehicles.first;
      expect(car.name, contains('Toyota Innova'));
      expect(car.type, VehicleType.car);

      final schedules = storage.getMaintenanceSchedules();
      expect(schedules, isNotEmpty);

      final docs = storage.getVehicleDocuments();
      expect(docs, isNotEmpty);
      expect(docs.any((d) => d.type == DocumentType.stnkTahunan), isTrue);

      final services = storage.getServiceLogs();
      expect(services, isNotEmpty);

      final fuels = storage.getFuelLogs();
      expect(fuels, isNotEmpty);
    });

    test('Custom format Backup export and import round-trip preserves all entities', () async {
      final backup = storage.exportBackupJson();
      expect(backup.startsWith('FSBK1#GARAGEGO#'), isTrue);
      expect(backup, isNot(contains('Toyota Innova'))); // Obfuscated custom format

      // Raw JSON is rejected to prevent tampering
      expect(() => storage.importBackupJson('{"vehicles": []}'), throwsFormatException);

      // Clear storage
      await storage.clearAllData();
      expect(storage.getVehicles(), isEmpty);

      // Restore from backup
      final success = await storage.importBackupJson(backup);
      expect(success, isTrue);

      final restoredVehicles = storage.getVehicles();
      expect(restoredVehicles.length, 2);
      expect(restoredVehicles.first.name, contains('Toyota Innova'));

      final restoredSchedules = storage.getMaintenanceSchedules();
      expect(restoredSchedules, isNotEmpty);
    });

    test('CSV export formats service and fuel logs correctly', () {
      final vehicles = storage.getVehicles();
      final car = vehicles.first;

      final serviceCsv = storage.exportServiceLogsCsv(car.id);
      expect(serviceCsv, contains('ID,Tanggal,Odometer (km),Pekerjaan / Servis,Kategori,Biaya (Rp),Bengkel,Ganti Oli,Catatan'));
      expect(serviceCsv, contains('Ganti Oli Mesin Sintetik'));

      final fuelCsv = storage.exportFuelLogsCsv(car.id);
      expect(fuelCsv, contains('ID,Tanggal,Odometer (km),Volume (Liter),Harga/L (Rp),Total Biaya (Rp),Jenis BBM,Full Tank,SPBU'));
      expect(fuelCsv, contains('Pertamax'));
    });

    test('Motorcycle preset schedules have appropriate intervals', () {
      final moto = Vehicle.sampleMotorcycle();
      final presets = MaintenanceSchedule.defaultPresetsFor(moto);

      final oilPreset = presets.firstWhere((p) => p.category.contains('Oli'));
      expect(oilPreset.intervalKm, 2500);

      final vbeltPreset = presets.firstWhere((p) => p.category.contains('CVT'));
      expect(vbeltPreset.intervalKm, 20000);
    });
  });
}
