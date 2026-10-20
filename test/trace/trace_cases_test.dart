// §TRACE case evidence — one test per TC in docs/trace/flows.yaml (title prefix = TC id).
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/services/analytics_service.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/core/utils/validators.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LocalStorageService> _storage([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  return LocalStorageService(await SharedPreferences.getInstance());
}

Future<ProviderContainer> _container([Map<String, Object> initial = const {}]) async {
  final storage = await _storage(initial);
  final c = ProviderContainer(overrides: [localStorageServiceProvider.overrideWithValue(storage)]);
  addTearDown(c.dispose);
  return c;
}

Vehicle _car({String id = 'v1', String name = 'Avanza', int odo = 10000, int lastOil = 8000}) => Vehicle(
      id: id,
      name: name,
      type: VehicleType.car,
      plateNumber: 'D 1234 AB',
      currentOdometer: odo,
      manufactureYear: 2020,
      taxDueDate: DateTime.now().add(const Duration(days: 100)),
      lastOilOdometer: lastOil,
    );

FuelLog _fuel(String id, int odo, double liters, {double price = 10000}) => FuelLog(
    id: id, vehicleId: 'v1', date: DateTime(2026, 1, 1), odometer: odo, liters: liters, pricePerLiter: price);

MaintenanceSchedule _schedule({int intervalKm = 5000, int intervalMonths = 6, int lastOdo = 10000, DateTime? lastDate}) =>
    MaintenanceSchedule(
      id: 's1',
      vehicleId: 'v1',
      title: 'Ganti Oli Mesin',
      category: 'Ganti Oli',
      intervalKm: intervalKm,
      intervalMonths: intervalMonths,
      lastPerformedOdometer: lastOdo,
      lastPerformedDate: lastDate ?? DateTime.now(),
    );

VehicleDocument _doc(int daysFromToday) {
  final now = DateTime.now();
  return VehicleDocument(
    id: 'd$daysFromToday',
    vehicleId: 'v1',
    title: 'PKB',
    type: DocumentType.stnkTahunan,
    documentNumber: 'D 1234 AB',
    expiryDate: DateTime(now.year, now.month, now.day).add(Duration(days: daysFromToday)),
  );
}

void main() {
  setUpAll(AppTimeZone.initAppTimeZones);

  group('FLOW-GAR-01 garasi & kendaraan aktif', () {
    test('FLOW-GAR-01-T01 kendaraan pertama yang ditambahkan otomatis menjadi kendaraan aktif', () async {
      final c = await _container();
      await c.read(vehiclesProvider.notifier).addVehicle(_car());
      expect(c.read(vehiclesProvider).single.name, 'Avanza');
      expect(c.read(activeVehicleIdProvider), 'v1');
      expect(c.read(localStorageServiceProvider).getVehicles().single.id, 'v1');
    });

    test('FLOW-GAR-01-T02 nama satu huruf atau pelat kosong ditolak saat disimpan', () async {
      final s = await _storage();
      expect(() => s.saveVehicles([_car(name: 'A')]), throwsArgumentError);
      expect(AppValidators.validatePlateNumber('  '), 'validationPlateRequired');
      expect(AppValidators.validateVehicleName(''), 'validationVehicleNameRequired');
    });

    test('FLOW-GAR-01-T03 batas panjang: nama 50 dan pelat 15 karakter diterima, lebihnya ditolak', () {
      expect(AppValidators.validateVehicleName('a' * 50), isNull);
      expect(AppValidators.validateVehicleName('a' * 51), 'validationVehicleNameMaxLength');
      expect(AppValidators.validatePlateNumber('B' * 15), isNull);
      expect(AppValidators.validatePlateNumber('B' * 16), 'validationPlateMaxLength');
    });

    test('FLOW-GAR-01-T04 menghapus kendaraan aktif memindahkan pilihan ke kendaraan tersisa', () async {
      final c = await _container();
      await c.read(vehiclesProvider.notifier).addVehicle(_car());
      await c.read(vehiclesProvider.notifier).addVehicle(_car(id: 'v2', name: 'Vario'));
      await c.read(vehiclesProvider.notifier).deleteVehicle('v1');
      expect(c.read(activeVehicleIdProvider), 'v2');
      expect(c.read(activeVehicleProvider)!.id, 'v2');
    });

    test('FLOW-GAR-01-T05 id kendaraan aktif yang hilang di penyimpanan jatuh ke kendaraan pertama', () async {
      final c = await _container();
      await c.read(vehiclesProvider.notifier).addVehicle(_car());
      await c.read(activeVehicleIdProvider.notifier).setActiveId('tidak-ada');
      expect(c.read(activeVehicleProvider)!.id, 'v1');
    });
  });

  group('FLOW-SRV-01 servis & jadwal perawatan', () {
    test('FLOW-SRV-01-T01 tandai jadwal selesai membuat log servis dan menaikkan odometer', () async {
      final c = await _container();
      await c.read(vehiclesProvider.notifier).addVehicle(_car());
      final sch = _schedule(lastOdo: 8000, lastDate: DateTime(2026, 1, 1));
      await c.read(maintenanceSchedulesProvider.notifier).addSchedule(sch);
      await c.read(maintenanceSchedulesProvider.notifier).markScheduleDone(
          schedule: sch, performedOdometer: 13000, performedDate: DateTime(2026, 6, 1), cost: 450000);
      expect(c.read(maintenanceSchedulesProvider).single.lastPerformedOdometer, 13000);
      final log = c.read(serviceLogsProvider).single;
      expect(log.cost, 450000);
      expect(log.isOilChange, isTrue);
      expect(c.read(activeVehicleProvider)!.currentOdometer, 13000);
      expect(c.read(activeVehicleProvider)!.lastOilOdometer, 13000);
    });

    test('FLOW-SRV-01-T02 odometer mundur dari catatan sebelumnya dan biaya negatif ditolak', () {
      expect(AppValidators.validateOdometer(9000, previousKm: 10000), 'validationOdometerLessThanPrevious');
      expect(AppValidators.validateOdometer(-1), 'validationOdometerNegative');
      expect(AppValidators.validateCost(-5), 'validationCostNegative');
    });

    test('FLOW-SRV-01-T03 batas urgensi: sisa 0 km terlewat, sisa 15% interval segera, 2.000.000 km maksimum', () {
      final sch = _schedule(intervalKm: 5000, lastOdo: 10000, lastDate: DateTime.now());
      expect(sch.urgency(15000), ScheduleUrgency.overdue);
      expect(sch.urgency(15000 - 750), ScheduleUrgency.dueSoon);
      expect(sch.urgency(15000 - 751), ScheduleUrgency.safe);
      expect(AppValidators.validateOdometer(2000000), isNull);
      expect(AppValidators.validateOdometer(2000001), 'validationOdometerTooHigh');
    });

    test('FLOW-SRV-01-T04 log servis dengan odometer lebih rendah tidak menurunkan odometer; jadwal melewati tahun', () async {
      final c = await _container();
      await c.read(vehiclesProvider.notifier).addVehicle(_car(odo: 20000));
      await c.read(serviceLogsProvider.notifier).addLog(ServiceLog(
          id: 'l1', vehicleId: 'v1', date: DateTime(2026, 2, 1), odometer: 15000, title: 'Rem', cost: 100000));
      expect(c.read(activeVehicleProvider)!.currentOdometer, 20000);
      final nov = _schedule(intervalMonths: 3, lastDate: DateTime(2026, 11, 15));
      expect(nov.dueDate, DateTime(2027, 2, 15));
    });

    test('FLOW-SRV-01-T05 inspeksi menghitung persentase lolos dari butir tercentang', () {
      final items = InspectionChecklist.generateDefaultItems(VehicleType.car);
      for (var i = 0; i < items.length; i++) {
        items[i].isChecked = i.isEven;
      }
      final insp = InspectionChecklist(
          id: 'i1', vehicleId: 'v1', date: DateTime(2026, 1, 1), odometer: 10000, title: 'Mudik', items: items);
      expect(insp.passedCount, (items.length + 1) ~/ 2);
      expect(insp.passPercentage, closeTo(insp.passedCount / items.length * 100, 0.001));
      expect(insp.isAllPassed, isFalse);
    });
  });

  group('FLOW-FUE-01 log BBM & efisiensi', () {
    test('FLOW-FUE-01-T01 dua pengisian berurutan menghasilkan km/L dan Rp/km', () {
      final s = AnalyticsService.computeFuelEfficiency([_fuel('a', 10000, 30), _fuel('b', 10400, 32, price: 12500)]);
      expect(s.points.single.kmPerLiter, closeTo(400 / 32, 1e-9));
      expect(s.averageCostPerKm, closeTo(32 * 12500 / 400, 1e-9));
      expect(s.totalLiters, 62);
    });

    test('FLOW-FUE-01-T02 volume 0 / negatif dan di atas 500 liter ditolak', () {
      expect(AppValidators.validateFuelLiters(0), 'validationFuelLitersPositive');
      expect(AppValidators.validateFuelLiters(-3), 'validationFuelLitersPositive');
      expect(AppValidators.validateFuelLiters(500.1), 'validationFuelLitersTooHigh');
      expect(AppValidators.validateFuelLiters(500), isNull);
    });

    test('FLOW-FUE-01-T03 tanpa catatan = 0, satu catatan memakai baseline 12,5 km/L', () {
      expect(AnalyticsService.computeFuelEfficiency(const []).averageKmPerLiter, 0);
      final one = AnalyticsService.computeFuelEfficiency([_fuel('a', 10000, 30)]);
      expect(one.averageKmPerLiter, 12.5);
      expect(one.points, isEmpty);
    });

    test('FLOW-FUE-01-T04 catatan acak diurutkan per odometer; odometer sama dilewati tanpa bagi nol', () {
      final s = AnalyticsService.computeFuelEfficiency(
          [_fuel('c', 10800, 40), _fuel('a', 10000, 30), _fuel('b', 10400, 32), _fuel('d', 10800, 5)]);
      expect(s.points.length, 2);
      expect(s.points.every((p) => p.kmPerLiter.isFinite && p.distanceDeltaKm > 0), isTrue);
    });
  });

  group('FLOW-DOC-01 brankas dokumen & pajak', () {
    test('FLOW-DOC-01-T01 mobil contoh punya pengingat PKB tahunan, STNK 5 tahunan, dan asuransi', () {
      final docs = VehicleDocument.defaultDocumentsFor(Vehicle.sampleCar());
      expect(docs.map((d) => d.type), containsAll([DocumentType.stnkTahunan, DocumentType.stnkLimaTahunan, DocumentType.asuransi]));
      expect(docs.first.expiryDate.difference(Vehicle.sampleCar().taxDueDate).inMinutes.abs(), lessThan(1));
    });

    test('FLOW-DOC-01-T02 dokumen lewat jatuh tempo ditandai kedaluwarsa, bukan segera', () {
      expect(_doc(-1).isExpired, isTrue);
      expect(_doc(-1).isDueSoon, isFalse);
    });

    test('FLOW-DOC-01-T03 batas pengingat: hari ini dan H-30 = segera, H-31 = aman', () {
      expect(_doc(0).isDueSoon, isTrue);
      expect(_doc(0).isExpired, isFalse);
      expect(_doc(30).isDueSoon, isTrue);
      expect(_doc(31).isDueSoon, isFalse);
    });

    test('FLOW-DOC-01-T04 tipe dokumen tak dikenal di data tersimpan menjadi Lainnya; tanpa asuransi tidak dibuat', () {
      final json = _doc(10).toJson()..['type'] = 'hilang';
      expect(VehicleDocument.fromJson(json).type, DocumentType.lainnya);
      final docs = VehicleDocument.defaultDocumentsFor(_car());
      expect(docs.any((d) => d.type == DocumentType.asuransi), isFalse);
    });
  });

  group('FLOW-TCO-01 total biaya & skor kesehatan', () {
    test('FLOW-TCO-01-T01 total biaya menjumlahkan BBM, servis, dan dokumen per km', () {
      final r = AnalyticsService.computeTCO(
        vehicle: _car(odo: 10000),
        services: [ServiceLog(id: 's', vehicleId: 'v1', date: DateTime(2026), odometer: 9000, title: 'Oli', cost: 500000)],
        fuels: [_fuel('a', 9500, 10)],
        documents: [VehicleDocument(id: 'd', vehicleId: 'v1', title: 'PKB', type: DocumentType.stnkTahunan, documentNumber: '', expiryDate: DateTime(2027), cost: 400000)],
      );
      expect(r.totalCost, 500000 + 100000 + 400000);
      expect(r.costPerKm, 100);
    });

    test('FLOW-TCO-01-T02 garasi tanpa kendaraan menampilkan biaya nol', () async {
      final c = await _container();
      expect(c.read(activeVehicleProvider), isNull);
      expect(c.read(activeTCOProvider).totalCost, 0);
      expect(c.read(vehicleHealthScoreProvider), isNull);
    });

    test('FLOW-TCO-01-T03 odometer 0 tidak membagi nol pada biaya per km', () {
      final r = AnalyticsService.computeTCO(vehicle: _car(odo: 0), services: const [], fuels: [_fuel('a', 0, 10)], documents: const []);
      expect(r.costPerKm, 0);
      expect(r.totalCost, 100000);
    });

    test('FLOW-TCO-01-T04 oli terlewat dan dokumen kedaluwarsa menurunkan skor kesehatan', () {
      final healthy = AnalyticsService.computeHealthScore(vehicle: _car(odo: 10000, lastOil: 9000), schedules: const [], documents: [_doc(200)]);
      final neglected = AnalyticsService.computeHealthScore(
          vehicle: _car(odo: 20000, lastOil: 9000), schedules: [_schedule(lastOdo: 1000, lastDate: DateTime(2020))], documents: [_doc(-5)]);
      expect(neglected.score, lessThan(healthy.score));
      expect(neglected.warnings, isNotEmpty);
    });
  });

  group('FLOW-SET-01 cadangan & pengaturan', () {
    setUp(() => PackageInfo.setMockInitialValues(
        appName: 'GarageGo', packageName: 'id.faishal.garagego', version: '1.0.8', buildNumber: '9', buildSignature: ''));

    test('FLOW-SET-01-T01 ekspor lalu impor cadangan mengembalikan kendaraan dan log', () async {
      final s = await _storage();
      await s.saveVehicles([_car()]);
      await s.saveFuelLogs([_fuel('a', 10000, 30)]);
      final backup = await s.exportBackupJson();
      await s.clearAllData();
      expect(s.getVehicles(), isEmpty);
      expect(await s.importBackupJson(backup), isTrue);
      expect(s.getVehicles().single.id, 'v1');
      expect(s.getFuelLogs().single.liters, 30);
    });

    test('FLOW-SET-01-T02 berkas JSON mentah ditolak dan data lama tetap utuh', () async {
      final s = await _storage();
      await s.saveVehicles([_car()]);
      await expectLater(s.importBackupJson('{"vehicles":[]}'), throwsA(anything));
      expect(s.getVehicles().single.id, 'v1');
    });

    test('FLOW-SET-01-T03 ekspor CSV kendaraan tanpa log hanya berisi baris judul', () async {
      final s = await _storage();
      expect(s.exportServiceLogsCsv('v1').trim().split('\n').length, 1);
      expect(s.exportFuelLogsCsv('v1').trim().split('\n').length, 1);
    });

    test('FLOW-SET-01-T04 data kendaraan korup di penyimpanan dibaca sebagai garasi kosong; tema korup = sistem', () async {
      final s = await _storage({'garagego_vehicles': '{bukan json', 'theme_mode': 'ungu'});
      expect(s.getVehicles(), isEmpty);
      expect(s.getThemeMode(), ThemeMode.system);
    });
  });
}
