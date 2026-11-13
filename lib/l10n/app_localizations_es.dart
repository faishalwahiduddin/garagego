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
  String get navMaintenance => 'Servicio';

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
  String get exportBackup => 'Exportar copia (.grg)';

  @override
  String get importBackup => 'Restaurar copia (.grg)';

  @override
  String get exportCsv => 'Exportar a CSV';

  @override
  String get resetAllData => 'Restablecer Todos los Datos';

  @override
  String get privacyNotice =>
      'Los datos se almacenan 100% localmente en tu dispositivo.';

  @override
  String get aksiCepat => 'Acciones Rápidas';

  @override
  String get aksiCepatGarasi => 'Acciones Rápidas del Garaje';

  @override
  String get aturUlangData => 'Restablecer Datos';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'Configura recordatorios de cambio de aceite, filtros, frenos y repuestos.';

  @override
  String get audit10PoinKeselamatanJalanMud =>
      'Inspección de seguridad de 10 puntos para viajes largos y uso diario';

  @override
  String get auditKelayakanJalanKeselamatan =>
      'Auditoría de seguridad y estado del vehículo antes de viajar o para el día a día.';

  @override
  String get bahasaAplikasi => 'Idioma de la Aplicación';

  @override
  String get batal => 'Cancelar';

  @override
  String get belumAdaCatatanBbm => 'Sin Registros de Combustible';

  @override
  String get belumAdaDokumenTercatat => 'Sin Documentos Registrados';

  @override
  String get belumAdaHasilCeklis => 'Sin Inspecciones Realizadas';

  @override
  String get belumAdaJadwalServis => 'Sin Programas de Mantenimiento';

  @override
  String get belumAdaRiwayatServis => 'Sin Historial de Servicio';

  @override
  String get belumAdaCatatanServis => 'Aún no hay registros de servicio.';

  @override
  String get belumAdaJadwalPerawatanBerkala =>
      'Aún no hay programas de mantenimiento periódico.';

  @override
  String get biayaKm => 'Coste / km';

  @override
  String get biayaTotalRp => 'Coste Total (Rp)';

  @override
  String get biayaPerKm => 'Coste por km';

  @override
  String get bukaBrankas => 'Abrir Guantera';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      'Comparte un archivo .grg con vehículos, agendas, documentos y combustible.';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Compartir vehículos, servicio, combustible y agendas como archivo .grg';

  @override
  String get cariRiwayatServisAtauBengkel =>
      'Buscar en el historial de servicio o taller...';

  @override
  String get catatPengisianBbm => 'Registrar Repostaje';

  @override
  String get catatPengisianPertama => 'Registrar Primer Repostaje';

  @override
  String get catatServisBaru => 'Registrar Nuevo Servicio';

  @override
  String get catatServisPertama => 'Registrar Primer Servicio';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'Registra los tickets de combustible para controlar el consumo (km/L) y el coste por km.';

  @override
  String get catatanOpsional => 'Notas (Opcional)';

  @override
  String get catatanLokasiBerkasFisik =>
      'Notas / Ubicación del Documento Físico';

  @override
  String get catatanBbmBerhasilDisimpan =>
      '¡Registro de combustible guardado con éxito!';

  @override
  String get catatanPemeriksaOpsional => 'Notas del Inspector (Opcional)';

  @override
  String get catatanSparepartPengerjaan => 'Notas de Repuestos / Mano de Obra';

  @override
  String get catatanServisBerhasilDitambahk =>
      '¡Registro de servicio añadido con éxito!';

  @override
  String get catatanTambahanKondisiKendaraa =>
      'Notas adicionales sobre el estado del vehículo...';

  @override
  String get ceklisKondisiKendaraan => 'Lista de Control del Vehículo';

  @override
  String get checklistInspeksiKendaraan => 'Inspección Periódica del Vehículo';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      '¡Contador de aceite restablecido al odómetro actual!';

  @override
  String get daftarKendaraanDiGarasi => 'Vehículos en el Garaje';

  @override
  String get daftarMasaBerlakuDokumenLisens =>
      'Vencimiento de Documentos y Licencias';

  @override
  String get dataCsvBerhasilDisalinKeClipbo =>
      '¡Datos CSV copiados al portapapeles!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      '¡Copia de seguridad restaurada en el garaje con éxito!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'Datos en formato CSV listos para exportar a Excel / Hoja de cálculo:';

  @override
  String get dataGarasiBerhasilDiresetKeSta =>
      'Datos del garaje restablecidos a los valores predeterminados.';

  @override
  String get diperlukanUntukAkurasiKalkulas =>
      'Necesario para calcular con precisión el consumo km/L';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'Recordatorio dual: La alerta se activa al alcanzar la distancia (km) O el tiempo (meses).';

  @override
  String get eksporBackupJson => 'Exportar copia (.grg)';

  @override
  String get eksporCsvRiwayatBbm => 'Exportar CSV de Combustible';

  @override
  String get eksporCsvRiwayatServis => 'Exportar CSV de Servicios';

  @override
  String get eksporCadanganJson => 'Exportar copia (.grg)';

  @override
  String get eksporFormatTabelSpreadsheetUn =>
      'Exportar formato tabla para registro de taller';

  @override
  String get eksporSeluruhPengisianBbmKeFor =>
      'Exportar todos los repostajes a formato CSV';

  @override
  String get estimasiBiayaPremiRp => 'Coste / Prima Estimada (Rp)';

  @override
  String get gantiPelat5Th => 'Renovación Matrícula / ITV (5 Años)';

  @override
  String get garasiMasihKosong => 'El Garaje Está Vacío';

  @override
  String get hargaSatuanRpLiter => 'Precio Unitario (Rp/Litro)';

  @override
  String get hasilCeklisInspeksiBerhasilDis =>
      '¡Resultados de la inspección guardados con éxito!';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi =>
      'Calcular consumo km/L y gasto de combustible';

  @override
  String get imporPulihkanBackupJson => 'Importar / Restaurar copia (.grg)';

  @override
  String get intervalJarakKm => 'Intervalo de Distancia (km)';

  @override
  String get intervalOliKm => 'Intervalo de Aceite (km)';

  @override
  String get intervalWaktu => 'Intervalo de Tiempo';

  @override
  String get isiTangkiPenuhFullTank => '¿Llenar Tanque Completo?';

  @override
  String get jadwalServisMendatang => 'Próximos Mantenimientos';

  @override
  String get jenisBahanBakar => 'Tipo de Combustible';

  @override
  String get jenisDokumen => 'Tipo de Documento';

  @override
  String get judulKeteranganDokumen => 'Título / Descripción del Documento';

  @override
  String get kategori => 'Categoría:';

  @override
  String get kembalikanDataDariBerkasCadang =>
      'Restaurar datos desde un archivo .grg válido';

  @override
  String get kilometerOdometerKm => 'Kilómetros Odómetro (km)';

  @override
  String get konfirmasiReset => 'Confirmar Restablecimiento';

  @override
  String get konsumsiBbm => 'Consumo de Combustible';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'Realiza una inspección de 10 puntos: neumáticos, frenos, aceite, luces y batería.';

  @override
  String get lihatSemua => 'Ver Todo';

  @override
  String get lisensiPamakean => 'Licencia de Uso';

  @override
  String get lisensiPanganggo => 'Licencia de Uso';

  @override
  String get lisensiPenggunaan => 'Licencia de Uso';

  @override
  String get menghapusSemuaLogServisBbmDanR =>
      'Elimina todos los registros de servicio, combustible e historial del garaje';

  @override
  String get mobil => 'Coche';

  @override
  String get mobilAtauMotorKeluargaBaru =>
      'Añade un nuevo coche o moto familiar';

  @override
  String get modeTema => 'Modo de Tema';

  @override
  String get motor => 'Moto';

  @override
  String get mulaiCeklis => 'Iniciar Lista';

  @override
  String get mulaiInspeksiPertama => 'Realizar Primera Inspección';

  @override
  String get namaModelKendaraan => 'Nombre / Modelo del Vehículo';

  @override
  String get namaBengkelToko => 'Nombre del Taller / Tienda';

  @override
  String get namaBengkelTokoOpsional => 'Nombre del Taller / Tienda (Opcional)';

  @override
  String get namaPekerjaanKomponen => 'Nombre del Trabajo / Componente';

  @override
  String get namaSpbuLokasi => 'Gasolinera / Ubicación';

  @override
  String get nomorDokumenNoPolisNoPolisi =>
      'Nº de Documento / Nº de Póliza / Matrícula';

  @override
  String get nomorPelatPolisi => 'Número de Matrícula';

  @override
  String get odometerPengerjaanKm => 'Odómetro al Momento del Servicio (km)';

  @override
  String get odometerSaatIniKm => 'Odómetro Actual (km)';

  @override
  String get odometerTerakhirDikerjakanKm => 'Último Odómetro Registrado (km)';

  @override
  String get opsiJadwal => 'Opciones de Programa';

  @override
  String get pkbTahunan => 'Impuesto Anual';

  @override
  String get pajakStnk => 'Impuestos y Documentación';

  @override
  String get pajakPkbTahunan => 'Impuesto Anual de Vehículos';

  @override
  String get pekerjaanServis => 'Trabajo / Servicio Realizado';

  @override
  String get pelat5Th => 'Matrícula 5 Años';

  @override
  String get pengaturanGarasi => 'Ajustes del Garaje';

  @override
  String get penggantianOliMesinResetCounte =>
      'Cambio de Aceite de Motor (Restablecer Contador)';

  @override
  String get pilihBahasaSelectLanguage => 'Seleccionar Idioma';

  @override
  String get pilihAtauBuatKendaraanTerlebih =>
      'Por favor, selecciona o añade un vehículo primero.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Por favor, selecciona o añade un vehículo primero.';

  @override
  String get portabilitasCadanganData => 'Portabilidad y Copias de Seguridad';

  @override
  String get pulihkanData => 'Restaurar Datos';

  @override
  String get pulihkanDariBackupJson => 'Restaurar desde archivo (.grg)';

  @override
  String get rataRataEfisiensi => 'Consumo Medio';

  @override
  String get rekorIritTerbaik => 'Mejor Rendimiento';

  @override
  String get resetCounterOliMesin => 'Restablecer Contador de Aceite';

  @override
  String get resetDataGarasi => 'Restablecer Datos del Garaje';

  @override
  String get resetOli => 'Restablecer Aceite';

  @override
  String get resetSeluruhData => '¿Restablecer Todos los Datos?';

  @override
  String get rincianPartYangDiganti =>
      'Detalle de piezas cambiadas o reparaciones...';

  @override
  String get riwayatLengkap => 'Historial Completo';

  @override
  String get riwayatPengisianBahanBakar => 'Historial de Repostajes';

  @override
  String get salinCsv => 'Copiar CSV';

  @override
  String get salinKeClipboard => 'Copiar al Portapapeles';

  @override
  String get salinanJsonBackupBerhasilDisal =>
      '¡Archivo .grg listo para compartir!';

  @override
  String get servisTerakhir => 'Último Servicio';

  @override
  String get setPengingatBerkalaGantiPartKm =>
      'Configurar recordatorios periódicos por km o meses';

  @override
  String get simpan => 'Guardar';

  @override
  String get simpanAuditInspeksi => 'Guardar Inspección';

  @override
  String get simpanKeGarasi => 'Guardar en el Garaje';

  @override
  String get simpanRiwayatBengkelDanGantiOl =>
      'Guardar historial de taller y cambios de aceite';

  @override
  String get simpanTanggalJatuhTempoStnkAsu =>
      'Guarda las fechas de vencimiento de impuestos, matrícula y seguros de tu vehículo.';

  @override
  String get statusOliMesin => 'Estado del Aceite del Motor';

  @override
  String get tahunPembuatan => 'Año de Fabricación';

  @override
  String get tambahDokumen => 'Añadir Documento';

  @override
  String get tambahDokumenPertama => 'Añadir Primer Documento';

  @override
  String get tambahJadwalBaru => 'Añadir Nuevo Programa';

  @override
  String get tambahJadwalPerawatan => 'Añadir Programa de Mantenimiento';

  @override
  String get tambahKendaraan => 'Añadir Vehículo';

  @override
  String get tambahKendaraanBaru => 'Añadir Nuevo Vehículo';

  @override
  String get tampilanBahasa => 'Apariencia e Idioma';

  @override
  String get tandaiSelesai => 'Marcar como Completado';

  @override
  String get tandaiSelesaiReset => 'Marcar como Completado / Restablecer';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      'Marcar como completado restablecerá el contador de intervalo y se registrará en el Historial de Servicio.';

  @override
  String get tanggalMasaBerlakuJatuhTempo => 'Fecha de Vencimiento / Caducidad';

  @override
  String get tanggalTerakhirDikerjakan => 'Fecha del Último Servicio';

  @override
  String get teksJsonTidakBolehKosong =>
      '¡El archivo de copia no puede estar vacío!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Elija un archivo de copia .grg exportado anteriormente.';

  @override
  String get tentangAplikasiLisensi => 'Acerca de la Aplicación y Licencia';

  @override
  String get termasukGantiOli => '¿Incluye Cambio de Aceite?';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'Esta acción borrará todos los registros y restaurará los datos de ejemplo iniciales del garaje.';

  @override
  String get totalBiayaRp => 'Coste Total (Rp)';

  @override
  String get totalBiayaTco => 'Coste Total de Propiedad (TCO)';

  @override
  String get totalBiayaBengkel => 'Coste Total de Taller';

  @override
  String get totalBiayaKepemilikanTco => 'Coste Total de Propiedad (TCO)';

  @override
  String get totalPengeluaranBbm => 'Gasto Total en Combustible';

  @override
  String get tutup => 'Cerrar';

  @override
  String get ubah => 'Editar';

  @override
  String get volumeLiterKwh => 'Volumen (Litros / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'Error al restaurar la copia de seguridad: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 =>
      'Ej.: Impuesto de Circulación 2026';

  @override
  String get hintPlatB1234 => 'B 1234 ABC';

  @override
  String get misalStnkDiDompet =>
      'Ej.: Permiso de circulación en cartera, ficha técnica en archivo';

  @override
  String get misalKurasMinyakRem => 'Ej.: Purga de Líquido de Frenos DOT 4';

  @override
  String selesaikanJadwal(String title) {
    return 'Completar: $title';
  }

  @override
  String jadwalCount(String count) {
    return 'Programas ($count)';
  }

  @override
  String riwayatCount(String count) {
    return 'Historial ($count)';
  }

  @override
  String inspeksiCount(String count) {
    return 'Inspecciones ($count)';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return '¡Recomendación de fábrica para $label cargada con éxito!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'Cargar Estándar de Fábrica ($label)';
  }

  @override
  String odometerValue(String odo) {
    return 'Odómetro: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return '¡Vehículo $name añadido al garaje con éxito!';
  }

  @override
  String get timezone => 'Zona Horaria';

  @override
  String get timezoneAuto => 'Automático (según dispositivo)';

  @override
  String get licenseUsageTitle => 'Licencia de Uso';

  @override
  String get licenseUsageNotice =>
      'Gratis para uso personal y sin fines de lucro.';

  @override
  String get licenseUsageBadgeText => 'Personal y Sin Fines de Lucro';

  @override
  String get validationVehicleNameRequired =>
      'El nombre del vehículo es obligatorio';

  @override
  String get validationVehicleNameMinLength =>
      'El nombre del vehículo debe tener al menos 2 caracteres';

  @override
  String get validationVehicleNameMaxLength =>
      'El nombre del vehículo no puede superar los 50 caracteres';

  @override
  String get validationPlateRequired => 'El número de matrícula es obligatorio';

  @override
  String get validationPlateMaxLength =>
      'La matrícula no puede superar los 15 caracteres';

  @override
  String get validationOdometerNegative =>
      'La lectura del odómetro no puede ser negativa';

  @override
  String get validationOdometerTooHigh =>
      'La lectura del odómetro supera el límite razonable';

  @override
  String get validationOdometerLessThanPrevious =>
      'El nuevo kilometraje no puede ser menor al anterior';

  @override
  String get validationCostNegative => 'El costo no puede ser negativo';

  @override
  String get validationFuelLitersPositive =>
      'El volumen de combustible debe ser mayor a 0 litros';

  @override
  String get validationFuelLitersTooHigh =>
      'El volumen supera la capacidad razonable del tanque';

  @override
  String get validationServiceNameRequired =>
      'El nombre del servicio es obligatorio';

  @override
  String get validationDocNameRequired =>
      'El nombre del documento es obligatorio';

  @override
  String get appTitle => 'GarageGo';

  @override
  String get appTagline =>
      'Mantenimiento, aceite, combustible e impuestos en un solo garaje';

  @override
  String get loadingLabel => 'Cargando…';

  @override
  String get onbSkip => 'Omitir';

  @override
  String get onbNext => 'Siguiente';

  @override
  String get onbGetStarted => 'Empezar';

  @override
  String get onbPrivacyHeadline => 'Privado y sin conexión';

  @override
  String get onbPrivacyDetail =>
      'Todos los datos del vehículo se quedan en tu dispositivo. Sin rastreadores.';

  @override
  String get onbSlide1Title => 'Tu garaje';

  @override
  String get onbSlide1Sub => 'Coches y motos en un solo lugar';

  @override
  String get onbSlide1Badge => '100% sin conexión y privado';

  @override
  String get onbSlide2Title => 'Mantenimiento';

  @override
  String get onbSlide2Sub => 'Servicio, aceite e impuesto de circulación';

  @override
  String get onbSlide2Badge => 'Recordatorios periódicos';

  @override
  String get onbSlide3Title => 'Combustible';

  @override
  String get onbSlide3Sub => 'Consumo km/L y coste por km';

  @override
  String get onbSlide3Badge => 'Sin anuncios ni cuentas';

  @override
  String get onbSlide4Title => 'Sin conexión y privado';

  @override
  String get onbSlide4Sub => 'Los datos se quedan en tu dispositivo';

  @override
  String get onbSlide4Badge => 'Datos guardados en el dispositivo';

  @override
  String get urgencySafe => 'Seguro';

  @override
  String get urgencyDueSoon => 'Próximo';

  @override
  String get urgencyOverdue => 'Vencido';

  @override
  String get docTypeTax => 'Impuesto anual del vehículo';

  @override
  String get docTypePlate => 'Renovación de placa y permiso (5 años)';

  @override
  String get docTypeInsurance => 'Seguro del vehículo';

  @override
  String get docTypeEmissions => 'Prueba de emisiones / ITV';

  @override
  String get docTypeLicense => 'Permiso de conducir';

  @override
  String get docTypeTitle => 'Título de propiedad del vehículo';

  @override
  String get docTypeOther => 'Otro documento';

  @override
  String get mtCatOilFluids => 'Aceite y fluidos';

  @override
  String get mtCatOilFilter => 'Aceite y filtros';

  @override
  String get mtCatAirFilter => 'Filtros de aire y habitáculo';

  @override
  String get mtCatBrakes => 'Frenos';

  @override
  String get mtCatTires => 'Neumáticos y suspensión';

  @override
  String get mtCatIgnition => 'Encendido';

  @override
  String get mtCatTransmission => 'Transmisión y tracción';

  @override
  String get mtCatCvt => 'Transmisión CVT';

  @override
  String get mtCatElectrical => 'Eléctrico y batería';

  @override
  String get mtCatCoolant => 'Refrigerante y radiador';

  @override
  String get mtCatGeneral => 'Mantenimiento periódico';

  @override
  String get mtPresetCarOil => 'Cambio de aceite sintético';

  @override
  String get mtPresetCarOilFilter => 'Cambio del filtro de aceite';

  @override
  String get mtPresetCarAirFilter => 'Filtro de aire y de habitáculo';

  @override
  String get mtPresetCarBrakeFluid => 'Cambio de líquido y pastillas de freno';

  @override
  String get mtPresetCarTireRotation => 'Rotación de neumáticos y alineación';

  @override
  String get mtPresetCarSparkPlugs => 'Bujías de iridio';

  @override
  String get mtPresetMotoOil => 'Cambio de aceite de la moto';

  @override
  String get mtPresetMotoGearOil => 'Aceite de transmisión final';

  @override
  String get mtPresetMotoCvt => 'Servicio de CVT, correa y rodillos';

  @override
  String get mtPresetMotoBrakes => 'Revisión y cambio de pastillas de freno';

  @override
  String get mtPresetMotoSparkPlug => 'Bujía de la moto';

  @override
  String inspPreTripTitle(String type) {
    return 'Inspección previa al viaje ($type)';
  }

  @override
  String inspRoadworthiness(String passed, String total) {
    return 'Aptitud: $passed de $total puntos superados';
  }

  @override
  String inspPassedCount(String pct, String passed, String total) {
    return '$pct% superado ($passed/$total)';
  }

  @override
  String get inspCatEngine => 'Motor y fluidos';

  @override
  String get inspCatWheelsBrakes => 'Ruedas y frenos';

  @override
  String get inspCatLights => 'Luces y sistema eléctrico';

  @override
  String get inspCatSafety => 'Seguridad';

  @override
  String get inspCatDrivetrain => 'Transmisión';

  @override
  String get inspCatWheelsSteering => 'Ruedas y dirección';

  @override
  String get inspCatBrakes => 'Frenos';

  @override
  String get inspCatElectrical => 'Sistema eléctrico';

  @override
  String get inspCatEquipment => 'Equipamiento';

  @override
  String get inspCar1 => 'Nivel de varilla y limpieza del aceite';

  @override
  String get inspCar2 => 'Nivel del depósito de refrigerante';

  @override
  String get inspCar3 => 'Nivel de líquido de frenos, embrague y dirección';

  @override
  String get inspCar4 =>
      'Presión y dibujo de los 4 neumáticos y el de repuesto';

  @override
  String get inspCar5 => 'Estado de pastillas y freno de mano';

  @override
  String get inspCar6 => 'Faros, luces de freno, intermitentes y emergencia';

  @override
  String get inspCar7 => 'Bornes de batería e indicador de 12 V';

  @override
  String get inspCar8 => 'Escobillas y nivel del limpiaparabrisas';

  @override
  String get inspCar9 => 'Gato, llave de ruedas, triángulo y botiquín';

  @override
  String get inspMoto1 => 'Nivel y estado del aceite de motor';

  @override
  String get inspMoto2 => 'Aceite de transmisión / tensión de la cadena';

  @override
  String get inspMoto3 => 'Presión de neumáticos delantero y trasero';

  @override
  String get inspMoto4 => 'Grosor de pastillas delantera y trasera';

  @override
  String get inspMoto5 => 'Faro, piloto y intermitentes';

  @override
  String get inspMoto6 => 'Funcionamiento del claxon y arranque eléctrico';

  @override
  String get inspMoto7 => 'Espejos retrovisores y kit de herramientas';

  @override
  String gamesLvl(String level) {
    return 'Nv.$level';
  }

  @override
  String gamesProgress(String xp, String unlocked, String total) {
    return '$xp XP • $unlocked/$total insignias desbloqueadas';
  }

  @override
  String gamesNextLevel(String next, String xp) {
    return 'Siguiente: $next ($xp XP)';
  }

  @override
  String get gamesMaxRank => 'Rango máximo alcanzado';

  @override
  String get gamesBadgesTitle => 'Insignias de disciplina de garaje';

  @override
  String get gamesShare => 'Compartir';

  @override
  String get gamesUnlocked => 'Desbloqueada (+100 XP)';

  @override
  String get gamesLocked => 'Aún sin desbloquear';

  @override
  String gamesBadgeUnlockedLine(String highlight) {
    return 'Insignia desbloqueada: $highlight';
  }

  @override
  String get gamesLvl1 => 'Conductor principiante';

  @override
  String get gamesLvl2 => 'Propietario atento';

  @override
  String get gamesLvl3 => 'Guardián de la flota';

  @override
  String get gamesLvl4 => 'Especialista en mantenimiento';

  @override
  String get gamesLvl5 => 'Maestro del garaje';

  @override
  String get badgeFirstRideTitle => 'Primer vehículo';

  @override
  String get badgeFirstRideDesc =>
      'Registraste tu primer vehículo en el garaje digital.';

  @override
  String get badgeOilCareTitle => 'Guardián del aceite';

  @override
  String get badgeOilCareDesc => 'Registraste un cambio de aceite a tiempo.';

  @override
  String get badgeServiceVeteranTitle => 'Cliente habitual del taller';

  @override
  String get badgeServiceVeteranDesc =>
      'Registraste al menos 3 servicios de mantenimiento.';

  @override
  String get badgeFuelWatcherTitle => 'Rastreador de consumo';

  @override
  String get badgeFuelWatcherDesc =>
      'Registraste al menos 3 repostajes para controlar el consumo.';

  @override
  String get badgeSafeVoyageTitle => 'Inspector de seguridad';

  @override
  String get badgeSafeVoyageDesc =>
      'Completaste una lista de inspección de seguridad.';

  @override
  String get badgeDocKeeperTitle => 'Guardián de documentos';

  @override
  String get badgeDocKeeperDesc =>
      'Guardaste los documentos legales del vehículo.';

  @override
  String get badgePrimeFleetTitle => 'Salud óptima';

  @override
  String get badgePrimeFleetDesc =>
      'Alcanzaste una puntuación de salud de 90 o más.';

  @override
  String get badgeRoadWarriorTitle => 'Guerrero de la carretera';

  @override
  String get badgeRoadWarriorDesc => 'Sigues un vehículo con más de 10.000 km.';

  @override
  String healthOilOverdue(String km) {
    return 'El cambio de aceite lleva $km km de retraso';
  }

  @override
  String healthOilDue(String km) {
    return 'Cambio de aceite en $km km';
  }

  @override
  String get healthOilOptimal => 'El intervalo de aceite es óptimo';

  @override
  String get healthTaxOverdue => 'El impuesto anual está vencido';

  @override
  String healthTaxDue(String days) {
    return 'El impuesto anual vence en $days días';
  }

  @override
  String get healthTaxSafe => 'El impuesto anual está al día';

  @override
  String get healthPlateExpired => 'La placa de 5 años ha caducado';

  @override
  String healthPlateDue(String days) {
    return 'Renovación de la placa en $days días';
  }

  @override
  String healthScheduleOverdue(String title) {
    return '$title está vencido';
  }

  @override
  String healthScheduleDueSoon(String title) {
    return '$title está próximo a vencer';
  }

  @override
  String get healthPrime => 'Excelente';

  @override
  String get healthAttention => 'Requiere atención';

  @override
  String get healthCritical => 'Crítico / servicio urgente';

  @override
  String get fuelEstTotalCost => 'Coste total estimado:';

  @override
  String get fuelTripDistance => 'Distancia del trayecto:';

  @override
  String get fuelAvgConsumption => 'Consumo medio:';

  @override
  String get fuelOperatingCost => 'Coste de uso:';

  @override
  String get fuelFullTank => 'Depósito lleno';

  @override
  String get fuelPartial => 'Parcial';

  @override
  String fuelPricePerLiterLine(String price, String state) {
    return '@ $price/L • $state';
  }

  @override
  String fuelOdometerValue(String value) {
    return 'Cuentakilómetros: $value km';
  }

  @override
  String fuelKmL(String value) {
    return '$value km/l';
  }

  @override
  String get aboutApplication => 'Aplicación';

  @override
  String get aboutVersion => 'Versión';

  @override
  String get aboutArchitecture => 'Arquitectura';

  @override
  String get aboutArchitectureValue => '100% offline (sin servidor ni rastreo)';

  @override
  String get aboutDomain => 'Dominio';

  @override
  String get aboutPackageId => 'ID del paquete';

  @override
  String settingsVehicleOdo(String plate, String value) {
    return '$plate • Cuenta: $value km';
  }

  @override
  String get backupInvalidFile => 'El archivo .grg no es válido o está dañado';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterAttention => 'Atención';

  @override
  String get maintenanceScreenTitle => 'Mantenimiento y servicios';

  @override
  String get serviceTitleHint => 'Ej.: cambio de aceite y filtro';

  @override
  String get workshopHint => 'Ej.: concesionario oficial o taller';

  @override
  String get mustBePositive => 'Debe ser mayor que 0';

  @override
  String get editScheduleTitle => 'Editar plan de mantenimiento';

  @override
  String get scheduleUpdated => '¡Plan actualizado!';

  @override
  String get scheduleSaved => '¡Plan de mantenimiento guardado!';

  @override
  String get updateSchedule => 'Actualizar plan';

  @override
  String get saveSchedule => 'Guardar plan de mantenimiento';

  @override
  String scheduleCompleted(String title) {
    return '¡$title completado!';
  }

  @override
  String kmOverdue(String km) {
    return '$km km de retraso';
  }

  @override
  String kmRemaining(String km) {
    return 'Quedan $km km';
  }

  @override
  String kmOverdueShort(String km) {
    return '$km km de más';
  }

  @override
  String kmRemainingShort(String km) {
    return 'Quedan $km km';
  }

  @override
  String daysOverdue(String days) {
    return '$days días de retraso';
  }

  @override
  String daysLeft(String days) {
    return 'Quedan $days días';
  }

  @override
  String scheduleIntervalSummary(
    String km,
    String months,
    String odo,
    String date,
  ) {
    return 'Cada $km km o $months meses • Último: $odo km ($date)';
  }

  @override
  String get shareVehiclePassport => 'Compartir el pasaporte del vehículo';

  @override
  String get shareVehiclePassportSubtitle =>
      'Comparte la tarjeta de estado, la salud y el historial en redes';

  @override
  String get garageEmptyBody =>
      'Añade el primer coche o moto de la familia para empezar a controlar servicios, aceite y combustible.';

  @override
  String resetOilConfirm(String name, String odo) {
    return 'El contador de aceite de $name se reiniciará al cuentakilómetros actual ($odo km).';
  }

  @override
  String get resetOilServiceNote =>
      'Contador de intervalo de aceite reiniciado';

  @override
  String oilIntervalEvery(String km) {
    return 'Intervalo: cada $km km';
  }

  @override
  String garageYear(String year) {
    return 'Año $year';
  }

  @override
  String get shareDialogTitle => 'Compartir el pasaporte del vehículo';

  @override
  String get shareCopySummary => 'Copiar resumen';

  @override
  String get sharePreparing => 'Preparando…';

  @override
  String get shareDownloadPassport => 'Descargar pasaporte';

  @override
  String get shareSharePassport => 'Compartir pasaporte';

  @override
  String get shareImageFailed => 'No se pudo generar la imagen del pasaporte';

  @override
  String get shareImageDownloaded => 'Pasaporte del vehículo descargado';

  @override
  String get shareSummaryCopied => 'Resumen del estado copiado';

  @override
  String get shareCardHealthHeader => 'ESTADO DE SALUD DE LA FLOTA';

  @override
  String shareCardCondition(String status) {
    return 'Estado: $status';
  }

  @override
  String get shareCardOdometer => 'CUENTAKILÓMETROS';

  @override
  String get shareCardOil => 'CAMBIO DE ACEITE';

  @override
  String get shareCardTax => 'IMPUESTO';

  @override
  String get shareCardNeedService => 'Servicio urgente';

  @override
  String shareCardDaysShort(String days) {
    return '$days días';
  }

  @override
  String shareCardLogbook(String date) {
    return 'Registro: $date';
  }

  @override
  String shareTextHeader(String name, String plate) {
    return '🚗 Pasaporte de mantenimiento — $name ($plate)';
  }

  @override
  String shareTextHealth(String score, String status) {
    return '🏆 Salud: $score/100 ($status)';
  }

  @override
  String shareTextOdometer(String odo) {
    return '⚡ Cuentakilómetros: $odo km';
  }

  @override
  String shareTextOil(String km) {
    return '🛢️ Cambio de aceite en $km km';
  }

  @override
  String get shareTextOilDue => '🛢️ Cambio de aceite urgente';

  @override
  String shareTextTax(String days) {
    return '📋 Impuesto: quedan $days días';
  }

  @override
  String get shareTextFooter =>
      'Gestiona todo el mantenimiento del garaje sin conexión en GarageGo: https://garagego.faishal.id';

  @override
  String gloveboxHeader(String name) {
    return 'Guantera digital — $name';
  }

  @override
  String gloveboxDocCount(String plate, String count) {
    return '$plate • $count documentos registrados';
  }

  @override
  String docExpiredAgo(String days) {
    return 'Caducó hace $days días';
  }

  @override
  String docDueIn(String days) {
    return 'Vence en $days días';
  }

  @override
  String docDaysLeft(String days) {
    return 'Quedan $days días';
  }

  @override
  String docValidUntil(String date) {
    return 'Válido hasta: $date';
  }

  @override
  String get docEditTitle => 'Editar documento';

  @override
  String get docAddTitle => 'Añadir documento al garaje';

  @override
  String get docTitleHint => 'Ej.: impuesto anual / seguro a todo riesgo';

  @override
  String get docNumberHint => 'Ej.: B 1234 CD / POL-88902';

  @override
  String get docCostHint => 'Ej.: 3500000';

  @override
  String get docNotesLabel => 'Notas e instrucciones de renovación';

  @override
  String get docNotesHint => 'Ej.: paga en línea o acude a la oficina';

  @override
  String get docUpdated => '¡Documento actualizado!';

  @override
  String get docAdded => '¡Documento añadido!';

  @override
  String get docUpdate => 'Actualizar documento';

  @override
  String get docSave => 'Guardar documento';

  @override
  String get vehicleNameHint => 'Ej.: Honda HR-V / Yamaha NMAX';

  @override
  String get plateHint => 'B 1234 CD';

  @override
  String get invalidYear => 'Año no válido';

  @override
  String get taxDueLabel => 'Vencimiento del impuesto anual';

  @override
  String scheduleDoneNote(String category) {
    return 'Completado según el plan periódico ($category)';
  }

  @override
  String get backupErrEmpty => 'Los datos de copia están vacíos.';

  @override
  String get backupErrRawJson =>
      'Por seguridad no se acepta JSON sin formato. Usa un archivo de copia oficial.';

  @override
  String get backupErrFormat =>
      'El formato del archivo de copia no es válido o no se reconoce.';

  @override
  String backupErrWrongApp(String other, String expected) {
    return 'Esta copia pertenece a $other y no se puede restaurar en $expected.';
  }

  @override
  String get backupErrCorrupt =>
      'Los datos de copia están dañados o mal codificados.';

  @override
  String get backupErrIntegrity =>
      'La verificación de integridad falló: los datos se modificaron o dañaron.';

  @override
  String get backupErrNotObject =>
      'El contenido de la copia no es un objeto de datos válido.';

  @override
  String get mtCatEngine => 'Motor';

  @override
  String get mtCatOther => 'Otros';

  @override
  String get unitMonthsShort => 'mes';

  @override
  String get docNoteTax =>
      'Paga con la app Samsat Digital (SIGNAL) o en la oficina Samsat más cercana';

  @override
  String get docNotePlate =>
      'El vehículo debe pasar una revisión física en la oficina Samsat principal';

  @override
  String get docNoteInsurance =>
      'Los teléfonos de urgencia y grúa figuran en la póliza';

  @override
  String gamesBadgeCount(String unlocked, String total) {
    return '$unlocked/$total insignias desbloqueadas';
  }

  @override
  String get demoServiceTitle =>
      'Servicio programado y cambio de aceite sintético 5W-30';

  @override
  String get demoServiceNotes =>
      'Cambio de filtro de aceite y filtro de aire de cabina en el taller oficial';

  @override
  String get demoRotationTitle => 'Rotación de neumáticos y alineación';

  @override
  String get demoRotationNotes =>
      'Presión de neumáticos ajustada a 33 psi con nitrógeno';

  @override
  String get demoInspectionTitle => 'Inspección completa antes del viaje';

  @override
  String get demoInspectionNotes =>
      'Vehículo en excelente estado; presión de neumáticos y aceite de motor ideales.';
}
