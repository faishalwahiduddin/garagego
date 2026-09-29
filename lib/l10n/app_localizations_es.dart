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
      'La copia de seguridad completa con vehículos, mantenimientos, documentos y combustible se puede copiar abajo:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Hacer copia de todos los vehículos, servicios, combustible y calendarios';

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
  String get eksporBackupJson => 'Exportar Copia JSON';

  @override
  String get eksporCsvRiwayatBbm => 'Exportar CSV de Combustible';

  @override
  String get eksporCsvRiwayatServis => 'Exportar CSV de Servicios';

  @override
  String get eksporCadanganJson => 'Exportar Copia de Seguridad JSON';

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
  String get imporPulihkanBackupJson => 'Importar / Restaurar Copia JSON';

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
      'Restaurar datos desde un archivo de copia de seguridad JSON válido';

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
  String get pulihkanDariBackupJson => 'Restaurar desde Copia JSON';

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
      '¡Copia de seguridad JSON copiada al portapapeles con éxito!';

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
  String get teksJsonTidakBolehKosong => '¡El texto JSON no puede estar vacío!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Pega aquí el texto de la copia de seguridad JSON exportada anteriormente:';

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
}
