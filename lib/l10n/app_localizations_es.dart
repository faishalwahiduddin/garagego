// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'GarageGo';

  @override
  String get appDescription => 'Gestor de Garaje, Mantenimiento y Combustible';

  @override
  String get settings => 'Ajustes';

  @override
  String get appearance => 'Apariencia';

  @override
  String get theme => 'Tema';

  @override
  String get language => 'Idioma';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get selectTheme => 'Seleccionar Tema';

  @override
  String get selectLanguage => 'Seleccionar Idioma';

  @override
  String get localeIndonesian => 'Bahasa Indonesia';

  @override
  String get localeEnglish => 'English';

  @override
  String get localeArabic => 'العربية';

  @override
  String get localeJavanese => 'Basa Jawa';

  @override
  String get localeSundanese => 'Basa Sunda';

  @override
  String get localeChinese => '中文';

  @override
  String get localeJapanese => '日本語';

  @override
  String get localeSpanish => 'Español';

  @override
  String get about => 'Acerca de';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get edit => 'Editar';

  @override
  String get add => 'Añadir';

  @override
  String get search => 'Buscar';

  @override
  String get filter => 'Filtrar';

  @override
  String get reset => 'Restablecer';

  @override
  String get confirm => 'Confirmar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get close => 'Cerrar';

  @override
  String get navGarage => 'Garaje';

  @override
  String get navMaintenance => 'Mantenimiento';

  @override
  String get navFuel => 'Combustible';

  @override
  String get navGlovebox => 'Guantera';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get vehiclesTitle => 'Vehículos en el Garaje';

  @override
  String get addVehicle => 'Añadir Vehículo';

  @override
  String get editVehicle => 'Editar Vehículo';

  @override
  String get vehicleName => 'Nombre del Vehículo';

  @override
  String get plateNumber => 'Matrícula';

  @override
  String get odometer => 'Odómetro (km)';

  @override
  String get car => 'Coche';

  @override
  String get motorcycle => 'Motocicleta';

  @override
  String get vehicleType => 'Tipo de Vehículo';

  @override
  String get brand => 'Marca / Fabricante';

  @override
  String get modelYear => 'Año';

  @override
  String get fuelType => 'Tipo de Combustible';

  @override
  String get oilCapacity => 'Capacidad de Aceite (L)';

  @override
  String get activeVehicle => 'Vehículo Activo';

  @override
  String get setActive => 'Establecer como Activo';

  @override
  String get noVehicles => 'Aún no hay vehículos en el garaje';

  @override
  String get maintenanceTitle => 'Historial y Plan de Mantenimiento';

  @override
  String get addServiceLog => 'Añadir Registro de Servicio';

  @override
  String get serviceDate => 'Fecha de Servicio';

  @override
  String get serviceCost => 'Coste del Servicio';

  @override
  String get workshop => 'Taller';

  @override
  String get notes => 'Notas';

  @override
  String get isOilChange => 'Cambio de Aceite de Motor';

  @override
  String get serviceSchedule => 'Programa de Mantenimiento';

  @override
  String get addSchedule => 'Añadir Programa';

  @override
  String get oilLifeRemaining => 'Vida Útil del Aceite';

  @override
  String get oilResetSuccess =>
      '¡Contador de aceite restablecido al odómetro actual!';

  @override
  String get noServiceLogs => 'No hay registros de servicio aún';

  @override
  String get noSchedules => 'No hay programas de mantenimiento';

  @override
  String get inspectionChecklist => 'Lista de Verificación del Vehículo';

  @override
  String get startInspection => 'Iniciar Inspección';

  @override
  String get fuelTitle => 'Registros de Combustible';

  @override
  String get addFuelLog => 'Registrar Carga de Combustible';

  @override
  String get liters => 'Volumen (Litros)';

  @override
  String get totalCost => 'Coste Total';

  @override
  String get pricePerLiter => 'Precio por Litro';

  @override
  String get fullTank => 'Tanque Lleno';

  @override
  String get gasStation => 'Gasolinera';

  @override
  String get fuelEfficiency => 'Consumo Medio de Combustible';

  @override
  String get costPerKm => 'Coste por Kilómetro';

  @override
  String get noFuelLogs => 'No hay registros de combustible aún';

  @override
  String get gloveboxTitle => 'Guantera y Documentos';

  @override
  String get addDocument => 'Añadir Documento';

  @override
  String get stnkTaxExpiry => 'Vencimiento del Impuesto de Vehículos';

  @override
  String get stnk5YearExpiry => 'Vencimiento de la ITV / Registro';

  @override
  String get simExpiry => 'Vencimiento del Permiso de Conducir';

  @override
  String get insuranceExpiry => 'Seguro del Vehículo';

  @override
  String daysRemaining(Object count) {
    return '$count días restantes';
  }

  @override
  String get expired => 'Caducado';

  @override
  String get noDocuments => 'No hay documentos registrados';

  @override
  String get dataManagement => 'Gestión de Datos y Copias de Seguridad';

  @override
  String get exportBackup => 'Exportar Copia (JSON)';

  @override
  String get importBackup => 'Restaurar Copia (JSON)';

  @override
  String get exportCsv => 'Exportar a CSV';

  @override
  String get resetAllData => 'Restablecer Todos los Datos';

  @override
  String get privacyNotice =>
      'Los datos se almacenan 100% localmente en tu dispositivo.';
}
