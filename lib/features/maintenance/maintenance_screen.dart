import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/utils/validators.dart';
import 'add_schedule_sheet.dart';
import 'inspection_sheet.dart';

class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  ConsumerState<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends ConsumerState<MaintenanceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _scheduleFilter = 'Semua'; // Semua, Perhatian, Aman
  String _serviceSearch = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showAddServiceDialog(BuildContext context, WidgetRef ref, Vehicle active) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final odoController = TextEditingController(text: active.currentOdometer.toString());
    final costController = TextEditingController();
    final notesController = TextEditingController();
    final workshopController = TextEditingController();
    String category = 'Servis Rutin';
    bool isOilChange = true;
    DateTime serviceDate = DateTime.now();

    final categories = ['Servis Rutin', 'Ganti Oli & Filter', 'Pengereman', 'Ban & Suspensi', 'Kelistrikan & Aki', 'Mesin', 'Lainnya'];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: AppColors.bgSurface,
          title: const Text('Catat Servis Baru', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Pekerjaan / Servis', hintText: 'Misal: Ganti Oli Mesin & Filter'),
                    validator: (val) => val == null || val.trim().isEmpty ? 'Nama servis wajib diisi' : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: category,
                    decoration: const InputDecoration(labelText: 'Kategori'),
                    dropdownColor: AppColors.bgCard,
                    items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c, style: const TextStyle(color: Colors.white)))).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          category = val;
                          if (val.contains('Oli')) isOilChange = true;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: odoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Kilometer Odometer (km)', hintText: '25000'),
                    validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: costController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Biaya Total (Rp)', hintText: '450000'),
                    validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: workshopController,
                    decoration: const InputDecoration(labelText: 'Nama Bengkel / Toko', hintText: 'Misal: Bengkel Resmi Astra'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: notesController,
                    maxLines: 2,
                    decoration: const InputDecoration(labelText: 'Catatan Sparepart / Pengerjaan', hintText: 'Rincian part yang diganti...'),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Termasuk Ganti Oli?', style: TextStyle(color: Colors.white, fontSize: 13)),
                    value: isOilChange,
                    activeThumbColor: AppColors.primary,
                    onChanged: (val) => setState(() => isOilChange = val),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
            ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                final log = ServiceLog(
                  id: 'serv_${DateTime.now().millisecondsSinceEpoch}',
                  vehicleId: active.id,
                  date: serviceDate,
                  odometer: int.parse(odoController.text.trim()),
                  title: titleController.text.trim(),
                  cost: double.parse(costController.text.trim()),
                  notes: notesController.text.trim(),
                  isOilChange: isOilChange,
                  workshop: workshopController.text.trim(),
                  category: category,
                );

                ref.read(serviceLogsProvider.notifier).addLog(log);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Catatan servis berhasil ditambahkan!')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMarkDoneDialog(BuildContext context, WidgetRef ref, MaintenanceSchedule schedule, Vehicle active) {
    final formKey = GlobalKey<FormState>();
    final odoController = TextEditingController(text: active.currentOdometer.toString());
    final costController = TextEditingController(text: '0');
    final workshopController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgSurface,
        title: Text('Selesaikan: ${schedule.title}', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tandai selesai akan mereset hitungan interval dan otomatis mencatat ke Riwayat Servis.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: odoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Odometer Pengerjaan (km)'),
                validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: costController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Total Biaya (Rp)'),
                validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: workshopController,
                decoration: const InputDecoration(labelText: 'Nama Bengkel / Toko (Opsional)'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: notesController,
                decoration: const InputDecoration(labelText: 'Catatan (Opsional)'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              ref.read(maintenanceSchedulesProvider.notifier).markScheduleDone(
                    schedule: schedule,
                    performedOdometer: int.parse(odoController.text.trim()),
                    performedDate: DateTime.now(),
                    cost: double.parse(costController.text.trim()),
                    workshop: workshopController.text.trim(),
                    notes: notesController.text.trim(),
                  );
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${schedule.title} berhasil diselesaikan!')),
              );
            },
            child: const Text('Tandai Selesai'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final active = ref.watch(activeVehicleProvider);
    final schedules = ref.watch(activeMaintenanceSchedulesProvider);
    final serviceLogs = ref.watch(activeServiceLogsProvider);
    final inspections = ref.watch(activeInspectionChecklistsProvider);
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(active != null ? 'Perawatan: ${active.name}' : 'Perawatan & Servis'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primaryLight,
          unselectedLabelColor: const Color(0xFF94A3B8),
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.schedule, size: 16),
                  const SizedBox(width: 6),
                  Text('Jadwal (${schedules.length})'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history, size: 16),
                  const SizedBox(width: 6),
                  Text('Riwayat (${serviceLogs.length})'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.fact_check_outlined, size: 16),
                  const SizedBox(width: 6),
                  Text('Inspeksi (${inspections.length})'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: active == null
          ? const Center(child: Text('Pilih atau buat kendaraan terlebih dahulu.'))
          : TabBarView(
              controller: _tabController,
              children: [
                // TAB 1: JADWAL SERVIS BERKALA
                _buildSchedulesTab(context, active, schedules),

                // TAB 2: RIWAYAT SERVIS
                _buildHistoryTab(context, active, serviceLogs, currency),

                // TAB 3: CEKLIS INSPEKSI
                _buildInspectionsTab(context, active, inspections),
              ],
            ),
    );
  }

  Widget _buildSchedulesTab(BuildContext context, Vehicle active, List<MaintenanceSchedule> schedules) {
    List<MaintenanceSchedule> filtered = schedules;
    if (_scheduleFilter == 'Perhatian') {
      filtered = schedules
          .where((s) => s.urgency(active.currentOdometer) != ScheduleUrgency.safe)
          .toList();
    } else if (_scheduleFilter == 'Aman') {
      filtered = schedules
          .where((s) => s.urgency(active.currentOdometer) == ScheduleUrgency.safe)
          .toList();
    }

    return Column(
      children: [
        // Action Bar & Filters
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: AppColors.bgSurface,
          child: Row(
            children: [
              Wrap(
                spacing: 6,
                children: ['Semua', 'Perhatian', 'Aman'].map((f) {
                  final isSelected = _scheduleFilter == f;
                  return ChoiceChip(
                    label: Text(f, style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : const Color(0xFFCBD5E1))),
                    selected: isSelected,
                    selectedColor: AppColors.primary,
                    backgroundColor: AppColors.bgCard,
                    onSelected: (val) {
                      if (val) setState(() => _scheduleFilter = f);
                    },
                  );
                }).toList(),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: AppColors.primaryLight),
                tooltip: 'Opsi Jadwal',
                onSelected: (val) {
                  if (val == 'preset') {
                    ref.read(maintenanceSchedulesProvider.notifier).loadPresetsForVehicle(active);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Rekomendasi pabrik ${active.type.label} berhasil dimuat!')),
                    );
                  } else if (val == 'add') {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColors.bgCard,
                      builder: (_) => AddScheduleSheet(vehicle: active),
                    );
                  }
                },
                itemBuilder: (ctx) => [
                  const PopupMenuItem(
                    value: 'add',
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 18, color: AppColors.primaryLight),
                        SizedBox(width: 8),
                        Text('Tambah Jadwal Baru'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'preset',
                    child: Row(
                      children: [
                        const Icon(Icons.auto_awesome, size: 18, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Text('Muat Standar Pabrik (${active.type.label})'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // List of Schedules
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.schedule, size: 48, color: Color(0xFF64748B)),
                      const SizedBox(height: 12),
                      const Text('Belum Ada Jadwal Servis', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      const Text('Atur pengingat ganti oli, filter, rem, dan sparepart.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          ref.read(maintenanceSchedulesProvider.notifier).loadPresetsForVehicle(active);
                        },
                        icon: const Icon(Icons.auto_awesome),
                        label: Text('Muat Standar Pabrik (${active.type.label})'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    final urgency = item.urgency(active.currentOdometer);
                    final kmLeft = item.kmRemaining(active.currentOdometer);
                    final daysLeft = item.daysRemaining;

                    Color urgencyColor;
                    if (urgency == ScheduleUrgency.overdue) {
                      urgencyColor = AppColors.danger;
                    } else if (urgency == ScheduleUrgency.dueSoon) {
                      urgencyColor = AppColors.warning;
                    } else {
                      urgencyColor = AppColors.success;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: urgencyColor.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: urgencyColor.withValues(alpha: 0.4)),
                                    ),
                                    child: Text(
                                      urgency.label,
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: urgencyColor),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item.category,
                                    style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.edit_outlined, size: 18, color: Color(0xFF94A3B8)),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: AppColors.bgCard,
                                        builder: (_) => AddScheduleSheet(vehicle: active, initialSchedule: item),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.danger),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      ref.read(maintenanceSchedulesProvider.notifier).deleteSchedule(item.id);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(item.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      kmLeft < 0 ? 'Terlewat ${-kmLeft} km' : 'Sisa $kmLeft km lagi',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: urgencyColor),
                                    ),
                                  ),
                                  Text(
                                    daysLeft < 0 ? 'Terlewat ${-daysLeft} hari' : 'Sisa $daysLeft hari lagi',
                                    style: TextStyle(fontSize: 12, color: daysLeft <= 14 ? urgencyColor : const Color(0xFF94A3B8)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Interval info
                              Text(
                                'Setiap ${NumberFormat('#,###', 'id_ID').format(item.intervalKm)} km atau ${item.intervalMonths} bulan • Terakhir: ${item.lastPerformedOdometer} km (${item.lastPerformedDate.day}/${item.lastPerformedDate.month}/${item.lastPerformedDate.year})',
                                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                              ),
                              const Divider(color: AppColors.border, height: 18),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  onPressed: () => _showMarkDoneDialog(context, ref, item, active),
                                  icon: const Icon(Icons.check_circle_outline, size: 16, color: AppColors.accent),
                                  label: const Text('Tandai Selesai / Reset', style: TextStyle(color: AppColors.accent, fontSize: 12, fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildHistoryTab(BuildContext context, Vehicle active, List<ServiceLog> logs, NumberFormat currency) {
    final filtered = logs.where((l) {
      if (_serviceSearch.isEmpty) return true;
      return l.title.toLowerCase().contains(_serviceSearch.toLowerCase()) ||
          l.category.toLowerCase().contains(_serviceSearch.toLowerCase()) ||
          l.workshop.toLowerCase().contains(_serviceSearch.toLowerCase()) ||
          l.notes.toLowerCase().contains(_serviceSearch.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Cari riwayat servis atau bengkel...',
                    prefixIcon: Icon(Icons.search, size: 20),
                    isDense: true,
                  ),
                  onChanged: (val) => setState(() => _serviceSearch = val),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                icon: const Icon(Icons.add),
                tooltip: 'Catat Servis Baru',
                onPressed: () => _showAddServiceDialog(context, ref, active),
              ),
            ],
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.build_circle_outlined, size: 48, color: Color(0xFF64748B)),
                      const SizedBox(height: 12),
                      const Text('Belum Ada Riwayat Servis', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _showAddServiceDialog(context, ref, active),
                        icon: const Icon(Icons.add),
                        label: const Text('Catat Servis Pertama'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final log = filtered[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: (log.isOilChange ? AppColors.accent : AppColors.primary).withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      log.category,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: log.isOilChange ? AppColors.accent : AppColors.primaryLight,
                                      ),
                                    ),
                                  ),
                                  if (log.workshop.isNotEmpty) ...[
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        log.workshop,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                                      ),
                                    ),
                                  ] else
                                    const Spacer(),
                                  Text(
                                    '${log.date.day}/${log.date.month}/${log.date.year}',
                                    style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.danger),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      ref.read(serviceLogsProvider.notifier).deleteLog(log.id);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(log.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                              const SizedBox(height: 4),
                              Text('Odometer: ${NumberFormat('#,###', 'id_ID').format(log.odometer)} km', style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1), fontWeight: FontWeight.w600)),
                              if (log.notes.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(log.notes, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                              ],
                              const Divider(color: AppColors.border, height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Biaya Bengkel', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                                  Text(currency.format(log.cost), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.accent)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildInspectionsTab(BuildContext context, Vehicle active, List<InspectionChecklist> inspections) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Audit kelayakan jalan & keselamatan sebelum perjalanan mudik atau harian.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.bgCard,
                    builder: (_) => InspectionSheet(vehicle: active),
                  );
                },
                icon: const Icon(Icons.fact_check_outlined, size: 18),
                label: const Text('Mulai Ceklis'),
              ),
            ],
          ),
        ),
        Expanded(
          child: inspections.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.checklist, size: 48, color: Color(0xFF64748B)),
                      const SizedBox(height: 12),
                      const Text('Belum Ada Hasil Ceklis', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      const Text('Lakukan inspeksi 10 poin ban, rem, oli, lampu, dan aki.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: AppColors.bgCard,
                            builder: (_) => InspectionSheet(vehicle: active),
                          );
                        },
                        icon: const Icon(Icons.fact_check_outlined),
                        label: const Text('Mulai Inspeksi Pertama'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: inspections.length,
                  itemBuilder: (context, index) {
                    final item = inspections[index];
                    final pct = item.passPercentage;

                    Color badgeColor;
                    if (pct >= 90) {
                      badgeColor = AppColors.success;
                    } else if (pct >= 70) {
                      badgeColor = AppColors.warning;
                    } else {
                      badgeColor = AppColors.danger;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: badgeColor.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      '${pct.toStringAsFixed(0)}% Lolos (${item.passedCount}/${item.totalCount})',
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: badgeColor),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${item.date.day}/${item.date.month}/${item.date.year}',
                                    style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.danger),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      ref.read(inspectionChecklistsProvider.notifier).deleteChecklist(item.id);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(item.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                              const SizedBox(height: 4),
                              Text('Odometer: ${NumberFormat('#,###', 'id_ID').format(item.odometer)} km', style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1))),
                              if (item.inspectorNotes.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(item.inspectorNotes, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
