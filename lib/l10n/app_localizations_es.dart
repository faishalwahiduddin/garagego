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
  String get aksiCepat => 'Aksi Cepat';

  @override
  String get aksiCepatGarasi => 'Aksi Cepat Garaje';

  @override
  String get aturUlangData => 'Atur Ulang Data';

  @override
  String get aturPengingatGantiOliFilterRem =>
      'Atur pengingat ganti oli, filter, rem, dan sparepart.';

  @override
  String get audit10PoinKeselamatanJalanMud =>
      'Audit 10-poin keselamatan jalan & mudik';

  @override
  String get auditKelayakanJalanKeselamatan =>
      'Audit kelayakan jalan & keselamatan sebelum perjalanan mudik atau harian.';

  @override
  String get bahasaAplikasi => 'Bahasa Aplikasi';

  @override
  String get batal => 'Cancelar';

  @override
  String get belumAdaCatatanBbm => 'Belum Ada Catatan BBM';

  @override
  String get belumAdaDokumenTercatat => 'Belum Ada Dokumen Tercatat';

  @override
  String get belumAdaHasilCeklis => 'Belum Ada Hasil Ceklis';

  @override
  String get belumAdaJadwalServis => 'Belum Ada Jadwal Servis';

  @override
  String get belumAdaRiwayatServis => 'Belum Ada Riwayat Servis';

  @override
  String get belumAdaCatatanServis => 'Belum ada catatan servis.';

  @override
  String get belumAdaJadwalPerawatanBerkala =>
      'Belum ada jadwal perawatan berkala.';

  @override
  String get biayaKm => 'Biaya / KM';

  @override
  String get biayaTotalRp => 'Biaya Total (Rp)';

  @override
  String get biayaPerKm => 'Biaya per KM';

  @override
  String get bukaBrankas => 'Buka Brankas';

  @override
  String get cadanganLengkapSeluruhDataGara =>
      'Cadangan lengkap seluruh data Garaje, jadwal servis, dokumen, dan log BBM dapat disalin ke clipboard di bawah:';

  @override
  String get cadangkanSeluruhKendaraanServi =>
      'Cadangkan seluruh Vehículo, servis, BBM, dan jadwal';

  @override
  String get cariRiwayatServisAtauBengkel =>
      'Cari riwayat servis atau bengkel...';

  @override
  String get catatPengisianBbm => 'Catat Pengisian BBM';

  @override
  String get catatPengisianPertama => 'Catat Pengisian Pertama';

  @override
  String get catatServisBaru => 'Catat Servis Baru';

  @override
  String get catatServisPertama => 'Catat Servis Pertama';

  @override
  String get catatStrukPengisianBensinUntuk =>
      'Catat struk pengisian bensin untuk memantau konsumsi km/L dan cost/km.';

  @override
  String get catatanOpsional => 'Catatan (Opsional)';

  @override
  String get catatanLokasiBerkasFisik => 'Catatan / Lokasi Berkas Fisik';

  @override
  String get catatanBbmBerhasilDisimpan => 'Catatan BBM berhasil disimpan!';

  @override
  String get catatanPemeriksaOpsional => 'Catatan Pemeriksa (Opsional)';

  @override
  String get catatanSparepartPengerjaan => 'Catatan Sparepart / Pengerjaan';

  @override
  String get catatanServisBerhasilDitambahk =>
      'Catatan servis berhasil ditambahkan!';

  @override
  String get catatanTambahanKondisiKendaraa =>
      'Catatan tambahan kondisi Vehículo...';

  @override
  String get ceklisKondisiKendaraan => 'Ceklis Kondisi Vehículo';

  @override
  String get checklistInspeksiKendaraan => 'Checklist Inspeksi Vehículo';

  @override
  String get counterOliBerhasilDiresetKeOdo =>
      'Counter oli berhasil direset ke odometer saat ini!';

  @override
  String get daftarKendaraanDiGarasi => 'Daftar Vehículo di Garaje';

  @override
  String get daftarMasaBerlakuDokumenLisens =>
      'Daftar Masa Berlaku Dokumen & Lisensi';

  @override
  String get dataCsvBerhasilDisalinKeClipbo =>
      'Data CSV berhasil disalin ke Clipboard!';

  @override
  String get dataCadanganBerhasilDipulihkan =>
      'Data cadangan berhasil dipulihkan ke Garaje!';

  @override
  String get dataFormatCsvSiapDieksporKeExc =>
      'Data format CSV siap diekspor ke Excel / Spreadsheet:';

  @override
  String get dataGarasiBerhasilDiresetKeSta =>
      'Data Garaje berhasil direset ke standar.';

  @override
  String get diperlukanUntukAkurasiKalkulas =>
      'Diperlukan untuk akurasi kalkulasi km/L';

  @override
  String get dualTriggerReminderAlarmAkanAk =>
      'Dual-Trigger Reminder: Alarm akan aktif jika jarak (km) ATAU waktu (bulan) tercapai.';

  @override
  String get eksporBackupJson => 'Ekspor Backup JSON';

  @override
  String get eksporCsvRiwayatBbm => 'Ekspor CSV Riwayat BBM';

  @override
  String get eksporCsvRiwayatServis => 'Ekspor CSV Riwayat Servis';

  @override
  String get eksporCadanganJson => 'Ekspor Cadangan JSON';

  @override
  String get eksporFormatTabelSpreadsheetUn =>
      'Ekspor format tabel spreadsheet untuk pencatatan bengkel';

  @override
  String get eksporSeluruhPengisianBbmKeFor =>
      'Ekspor seluruh pengisian BBM ke format CSV spreadsheet';

  @override
  String get estimasiBiayaPremiRp => 'Estimasi Biaya / Premi (Rp)';

  @override
  String get gantiPelat5Th => 'Ganti Pelat 5 Th';

  @override
  String get garasiMasihKosong => 'Garaje Masih Kosong';

  @override
  String get hargaSatuanRpLiter => 'Harga Satuan (Rp/Liter)';

  @override
  String get hasilCeklisInspeksiBerhasilDis =>
      'Hasil ceklis inspeksi berhasil disimpan!';

  @override
  String get hitungKonsumsiKmLDanBiayaBensi =>
      'Hitung konsumsi km/L dan biaya bensin';

  @override
  String get imporPulihkanBackupJson => 'Impor / Pulihkan Backup JSON';

  @override
  String get intervalJarakKm => 'Interval Jarak (km)';

  @override
  String get intervalOliKm => 'Interval Oli (km)';

  @override
  String get intervalWaktu => 'Interval Waktu';

  @override
  String get isiTangkiPenuhFullTank => 'Isi Tangki Penuh (Full Tank)?';

  @override
  String get jadwalServisMendatang => 'Jadwal Servis Mendatang';

  @override
  String get jenisBahanBakar => 'Jenis Bahan Bakar';

  @override
  String get jenisDokumen => 'Jenis Dokumen';

  @override
  String get judulKeteranganDokumen => 'Judul / Keterangan Dokumen';

  @override
  String get kategori => 'Kategori:';

  @override
  String get kembalikanDataDariBerkasCadang =>
      'Kembalikan data dari berkas cadangan JSON yang valid';

  @override
  String get kilometerOdometerKm => 'Kilometer Odometer (km)';

  @override
  String get konfirmasiReset => 'Konfirmasi Reset';

  @override
  String get konsumsiBbm => 'Konsumsi BBM';

  @override
  String get lakukanInspeksi10PoinBanRemOli =>
      'Lakukan inspeksi 10 poin ban, rem, oli, lampu, dan aki.';

  @override
  String get lihatSemua => 'Lihat Semua';

  @override
  String get lisensiPamakean => 'Lisensi Pamakean';

  @override
  String get lisensiPanganggo => 'Lisensi Panganggo';

  @override
  String get lisensiPenggunaan => 'Lisensi Penggunaan';

  @override
  String get menghapusSemuaLogServisBbmDanR =>
      'Menghapus semua log servis, BBM, dan riwayat Garaje';

  @override
  String get mobil => 'Mobil';

  @override
  String get mobilAtauMotorKeluargaBaru => 'Mobil atau motor keluarga baru';

  @override
  String get modeTema => 'Mode Tema';

  @override
  String get motor => 'Motor';

  @override
  String get mulaiCeklis => 'Mulai Ceklis';

  @override
  String get mulaiInspeksiPertama => 'Mulai Inspeksi Pertama';

  @override
  String get namaModelKendaraan => 'Nama / Model Vehículo';

  @override
  String get namaBengkelToko => 'Nama Bengkel / Toko';

  @override
  String get namaBengkelTokoOpsional => 'Nama Bengkel / Toko (Opsional)';

  @override
  String get namaPekerjaanKomponen => 'Nama Pekerjaan / Komponen';

  @override
  String get namaSpbuLokasi => 'Nama SPBU / Lokasi';

  @override
  String get nomorDokumenNoPolisNoPolisi =>
      'Nomor Dokumen / No. Polis / No. Polisi';

  @override
  String get nomorPelatPolisi => 'Nomor Pelat Polisi';

  @override
  String get odometerPengerjaanKm => 'Odometer Pengerjaan (km)';

  @override
  String get odometerSaatIniKm => 'Odometer Saat Ini (km)';

  @override
  String get odometerTerakhirDikerjakanKm =>
      'Odometer Terakhir Dikerjakan (km)';

  @override
  String get opsiJadwal => 'Opsi Jadwal';

  @override
  String get pkbTahunan => 'PKB Tahunan';

  @override
  String get pajakStnk => 'Pajak & STNK';

  @override
  String get pajakPkbTahunan => 'Pajak PKB Tahunan';

  @override
  String get pekerjaanServis => 'Pekerjaan / Servis';

  @override
  String get pelat5Th => 'Pelat 5 Th';

  @override
  String get pengaturanGarasi => 'Pengaturan Garaje';

  @override
  String get penggantianOliMesinResetCounte =>
      'Penggantian Oli Mesin (Reset Counter)';

  @override
  String get pilihBahasaSelectLanguage => 'Pilih Bahasa / Select Language';

  @override
  String get pilihAtauBuatKendaraanTerlebih =>
      'Pilih atau buat Vehículo terlebih dahulu.';

  @override
  String get pilihAtauTambahKendaraanTerleb =>
      'Pilih atau Agregar Vehículo terlebih dahulu.';

  @override
  String get portabilitasCadanganData => 'Portabilitas & Cadangan Data';

  @override
  String get pulihkanData => 'Pulihkan Data';

  @override
  String get pulihkanDariBackupJson => 'Pulihkan dari Backup JSON';

  @override
  String get rataRataEfisiensi => 'Rata-Rata Efisiensi';

  @override
  String get rekorIritTerbaik => 'Rekor Irit Terbaik';

  @override
  String get resetCounterOliMesin => 'Reset Counter Oli Mesin';

  @override
  String get resetDataGarasi => 'Reset Data Garaje';

  @override
  String get resetOli => 'Reset Oli';

  @override
  String get resetSeluruhData => 'Reset Seluruh Data?';

  @override
  String get rincianPartYangDiganti => 'Rincian part yang diganti...';

  @override
  String get riwayatLengkap => 'Riwayat Lengkap';

  @override
  String get riwayatPengisianBahanBakar => 'Riwayat Pengisian Bahan Bakar';

  @override
  String get salinCsv => 'Salin CSV';

  @override
  String get salinKeClipboard => 'Salin ke Clipboard';

  @override
  String get salinanJsonBackupBerhasilDisal =>
      'Salinan JSON backup berhasil disalin ke Clipboard!';

  @override
  String get servisTerakhir => 'Servis Terakhir';

  @override
  String get setPengingatBerkalaGantiPartKm =>
      'Set pengingat berkala ganti part km/bulan';

  @override
  String get simpan => 'Guardar';

  @override
  String get simpanAuditInspeksi => 'Guardar Audit Inspeksi';

  @override
  String get simpanKeGarasi => 'Guardar ke Garaje';

  @override
  String get simpanRiwayatBengkelDanGantiOl =>
      'Guardar riwayat bengkel dan ganti oli';

  @override
  String get simpanTanggalJatuhTempoStnkAsu =>
      'Guardar tanggal jatuh tempo STNK, asuransi, dan dokumen Vehículo Anda.';

  @override
  String get statusOliMesin => 'Status Oli Mesin';

  @override
  String get tahunPembuatan => 'Tahun Pembuatan';

  @override
  String get tambahDokumen => 'Agregar Dokumen';

  @override
  String get tambahDokumenPertama => 'Agregar Dokumen Pertama';

  @override
  String get tambahJadwalBaru => 'Agregar Jadwal Baru';

  @override
  String get tambahJadwalPerawatan => 'Agregar Jadwal Perawatan';

  @override
  String get tambahKendaraan => 'Agregar Vehículo';

  @override
  String get tambahKendaraanBaru => 'Agregar Vehículo Baru';

  @override
  String get tampilanBahasa => 'Tampilan & Bahasa';

  @override
  String get tandaiSelesai => 'Tandai Selesai';

  @override
  String get tandaiSelesaiReset => 'Tandai Selesai / Reset';

  @override
  String get tandaiSelesaiAkanMeresetHitung =>
      'Tandai selesai akan mereset hitungan interval dan otomatis mencatat ke Riwayat Servis.';

  @override
  String get tanggalMasaBerlakuJatuhTempo =>
      'Tanggal Masa Berlaku / Jatuh Tempo';

  @override
  String get tanggalTerakhirDikerjakan => 'Tanggal Terakhir Dikerjakan';

  @override
  String get teksJsonTidakBolehKosong => 'Teks JSON tidak boleh kosong!';

  @override
  String get tempelkanTeksDataJsonCadanganY =>
      'Tempelkan teks data JSON cadangan yang pernah diekspor sebelumnya:';

  @override
  String get tentangAplikasiLisensi => 'Tentang Aplikasi & Lisensi';

  @override
  String get termasukGantiOli => 'Termasuk Ganti Oli?';

  @override
  String get tindakanIniAkanMengosongkanSem =>
      'Tindakan ini akan mengosongkan semua data dan mengembalikan contoh awal Garaje.';

  @override
  String get totalBiayaRp => 'Total Biaya (Rp)';

  @override
  String get totalBiayaTco => 'Total Biaya (TCO)';

  @override
  String get totalBiayaBengkel => 'Total Biaya Bengkel';

  @override
  String get totalBiayaKepemilikanTco => 'Total Biaya Kepemilikan (TCO)';

  @override
  String get totalPengeluaranBbm => 'Total Pengeluaran BBM';

  @override
  String get tutup => 'Cerrar';

  @override
  String get ubah => 'Ubah';

  @override
  String get volumeLiterKwh => 'Volume (Liter / kWh)';

  @override
  String gagalMemulihkanBackup(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get misalPajakPkbTahunanStnk2026 => 'E.g.: Annual Vehicle Tax 2026';

  @override
  String get hintPlatB1234 => 'B 1234 ABC';

  @override
  String get misalStnkDiDompet =>
      'E.g.: Registration in wallet, Title in cabinet';

  @override
  String get misalKurasMinyakRem => 'E.g.: Flush Brake Fluid DOT 4';

  @override
  String selesaikanJadwal(String title) {
    return 'Complete: $title';
  }

  @override
  String jadwalCount(String count) {
    return 'Schedules ($count)';
  }

  @override
  String riwayatCount(String count) {
    return 'History ($count)';
  }

  @override
  String inspeksiCount(String count) {
    return 'Inspections ($count)';
  }

  @override
  String rekomendasiPabrikBerhasilDimuat(String label) {
    return 'Factory recommendation $label loaded!';
  }

  @override
  String muatStandarPabrik(String label) {
    return 'Load Factory Standard ($label)';
  }

  @override
  String odometerValue(String odo) {
    return 'Odometer: $odo km';
  }

  @override
  String kendaraanBerhasilDitambahkan(String name) {
    return 'Vehicle $name successfully added to garage!';
  }
}
