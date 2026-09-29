import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
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

enum ScheduleFilterOption {
  all,
  attention,
  safe;

  String localizedLabel(BuildContext context) {
    final isId = Localizations.localeOf(context).languageCode == 'id';
    switch (this) {
      case ScheduleFilterOption.all:
        return isId ? 'Semua' : 'All';
      case ScheduleFilterOption.attention:
        return isId ? 'Perhatian' : 'Attention';
      case ScheduleFilterOption.safe:
        return isId ? 'Aman' : 'Safe';
    }
  }
}

class _MaintenanceScreenState extends ConsumerState<MaintenanceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScheduleFilterOption _scheduleFilter = ScheduleFilterOption.all;
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
    final l10n = AppLocalizations.of(context)!;
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
          backgroundColor: context.cardBg,
          title: Text(
            l10n.catatServisBaru,
            style: TextStyle(color: context.textPrimary, fontSize: 17, fontWeight: FontWeight.w700),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: l10n.pekerjaanServis,
                      hintText: Localizations.localeOf(context).languageCode == 'id'
                          ? 'Misal: Ganti Oli Mesin & Filter'
                          : 'e.g. Engine Oil & Filter Change',
                    ),
                    validator: (val) => val == null || val.trim().isEmpty
                        ? (Localizations.localeOf(context).languageCode == 'id' ? 'Nama servis wajib diisi' : 'Service name is required')
                        : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: category,
                    decoration: InputDecoration(labelText: l10n.kategori),
                    dropdownColor: context.cardBg,
                    items: categories
                        .map((c) => DropdownMenuItem(
                              value: c,
                              child: Text(c, style: TextStyle(color: context.textPrimary, fontSize: 13)),
                            ))
                        .toList(),
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
                    decoration: InputDecoration(
                      labelText: l10n.kilometerOdometerKm,
                      hintText: '25000',
                    ),
                    validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: costController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.biayaTotalRp,
                      hintText: '450000',
                    ),
                    validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: workshopController,
                    decoration: InputDecoration(
                      labelText: l10n.namaBengkelToko,
                      hintText: Localizations.localeOf(context).languageCode == 'id'
                          ? 'Misal: Bengkel Resmi Astra'
                          : 'e.g. Authorized Dealership / Workshop',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: notesController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: l10n.catatanSparepartPengerjaan,
                      hintText: l10n.rincianPartYangDiganti,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      l10n.termasukGantiOli,
                      style: TextStyle(color: context.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    value: isOilChange,
                    activeThumbColor: AppColors.primary,
                    onChanged: (val) => setState(() => isOilChange = val),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
            ),
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
                  SnackBar(content: Text(l10n.catatanServisBerhasilDitambahk)),
                );
              },
              child: Text(l10n.simpan),
            ),
          ],
        ),
      ),
    );
  }

  void _showMarkDoneDialog(BuildContext context, WidgetRef ref, MaintenanceSchedule schedule, Vehicle active) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final odoController = TextEditingController(text: active.currentOdometer.toString());
    final costController = TextEditingController(text: '0');
    final workshopController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.cardBg,
        title: Text(
          l10n.selesaikanJadwal(schedule.title),
          style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.tandaiSelesaiAkanMeresetHitung,
                  style: TextStyle(color: context.textSecondary, fontSize: 12),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: odoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: l10n.odometerPengerjaanKm),
                  validator: (val) => AppValidators.validateOdometer(int.tryParse(val ?? '')),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: costController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: l10n.totalBiayaRp),
                  validator: (val) => AppValidators.validateCost(double.tryParse(val ?? '')),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: workshopController,
                  decoration: InputDecoration(labelText: l10n.namaBengkelTokoOpsional),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: notesController,
                  decoration: InputDecoration(labelText: l10n.catatanOpsional),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
          ),
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
                SnackBar(
                  content: Text(Localizations.localeOf(context).languageCode == 'id'
                      ? '${schedule.title} berhasil diselesaikan!'
                      : '${schedule.title} successfully completed!'),
                ),
              );
            },
            child: Text(l10n.tandaiSelesai),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final active = ref.watch(activeVehicleProvider);
    final schedules = ref.watch(activeMaintenanceSchedulesProvider);
    final serviceLogs = ref.watch(activeServiceLogsProvider);
    final inspections = ref.watch(activeInspectionChecklistsProvider);
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          active != null
              ? '${l10n.navMaintenance}: ${active.name}'
              : (Localizations.localeOf(context).languageCode == 'id' ? 'Perawatan & Servis' : 'Maintenance & Services'),
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: context.textPrimary),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: context.borderColor, width: 1)),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              labelColor: AppColors.primary,
              unselectedLabelColor: context.textSecondary,
              labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.schedule, size: 16),
                      const SizedBox(width: 6),
                      Text(l10n.jadwalCount(schedules.length.toString())),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.history, size: 16),
                      const SizedBox(width: 6),
                      Text(l10n.riwayatCount(serviceLogs.length.toString())),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.fact_check_outlined, size: 16),
                      const SizedBox(width: 6),
                      Text(l10n.inspeksiCount(inspections.length.toString())),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: active == null
          ? Center(
              child: Text(
                l10n.pilihAtauBuatKendaraanTerlebih,
                style: TextStyle(color: context.textSecondary),
              ),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                _buildSchedulesTab(context, active, schedules),
                _buildHistoryTab(context, active, serviceLogs, currency),
                _buildInspectionsTab(context, active, inspections),
              ],
            ),
    );
  }

  Widget _buildSchedulesTab(BuildContext context, Vehicle active, List<MaintenanceSchedule> schedules) {
    final l10n = AppLocalizations.of(context)!;
    List<MaintenanceSchedule> filtered = schedules;
    if (_scheduleFilter == ScheduleFilterOption.attention) {
      filtered = schedules
          .where((s) => s.urgency(active.currentOdometer) != ScheduleUrgency.safe)
          .toList();
    } else if (_scheduleFilter == ScheduleFilterOption.safe) {
      filtered = schedules
          .where((s) => s.urgency(active.currentOdometer) == ScheduleUrgency.safe)
          .toList();
    }

    return Column(
      children: [
        // Action Bar & Filters
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: context.cardBg,
            border: Border(bottom: BorderSide(color: context.borderColor, width: 1)),
          ),
          child: Row(
            children: [
              Wrap(
                spacing: 8,
                children: ScheduleFilterOption.values.map((f) {
                  final isSelected = _scheduleFilter == f;
                  return ChoiceChip(
                    label: Text(f.localizedLabel(context)),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? Colors.white : context.textSecondary,
                    ),
                    selected: isSelected,
                    selectedColor: AppColors.primary,
                    backgroundColor: context.surfaceBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isSelected ? AppColors.primary : context.borderColor,
                      ),
                    ),
                    onSelected: (val) {
                      if (val) setState(() => _scheduleFilter = f);
                    },
                  );
                }).toList(),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: context.textSecondary),
                tooltip: l10n.opsiJadwal,
                color: context.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: context.borderColor),
                ),
                onSelected: (val) {
                  if (val == 'preset') {
                    final isEnglish = Localizations.localeOf(context).languageCode != 'id';
                    ref.read(maintenanceSchedulesProvider.notifier).loadPresetsForVehicle(active, isEnglish: isEnglish);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.rekomendasiPabrikBerhasilDimuat(active.type.getLocalizedLabel(context)))),
                    );
                  } else if (val == 'add') {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: context.cardBg,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (_) => AddScheduleSheet(vehicle: active),
                    );
                  }
                },
                itemBuilder: (ctx) => [
                  PopupMenuItem(
                    value: 'add',
                    child: Row(
                      children: [
                        const Icon(Icons.add, size: 18, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text(
                          l10n.tambahJadwalBaru,
                          style: TextStyle(color: context.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'preset',
                    child: Row(
                      children: [
                        const Icon(Icons.auto_awesome, size: 18, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Text(
                          l10n.muatStandarPabrik(active.type.getLocalizedLabel(context)),
                          style: TextStyle(color: context.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                        ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.schedule, size: 32, color: AppColors.primary),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.belumAdaJadwalServis,
                          style: TextStyle(
                            color: context.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          l10n.aturPengingatGantiOliFilterRem,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: context.textSecondary, fontSize: 12),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: () {
                            final isEnglish = Localizations.localeOf(context).languageCode != 'id';
                            ref.read(maintenanceSchedulesProvider.notifier).loadPresetsForVehicle(active, isEnglish: isEnglish);
                          },
                          icon: const Icon(Icons.auto_awesome, size: 16),
                          label: Text(l10n.muatStandarPabrik(active.type.getLocalizedLabel(context))),
                        ),
                      ],
                    ),
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
                                      color: urgencyColor.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      urgency.getLocalizedLabel(context),
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: urgencyColor),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item.category,
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: context.textSecondary),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.edit_outlined, size: 18, color: context.textSecondary),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: context.cardBg,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                        ),
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
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: context.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      kmLeft < 0
                                          ? (Localizations.localeOf(context).languageCode == 'id'
                                              ? 'Terlewat ${-kmLeft} km'
                                              : 'Overdue by ${-kmLeft} km')
                                          : (Localizations.localeOf(context).languageCode == 'id'
                                              ? 'Sisa $kmLeft km lagi'
                                              : '$kmLeft km remaining'),
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: urgencyColor),
                                    ),
                                  ),
                                  Text(
                                    daysLeft < 0
                                        ? (Localizations.localeOf(context).languageCode == 'id'
                                            ? 'Terlewat ${-daysLeft} hari'
                                            : 'Overdue by ${-daysLeft} days')
                                        : (Localizations.localeOf(context).languageCode == 'id'
                                            ? 'Sisa $daysLeft hari lagi'
                                            : '$daysLeft days remaining'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: daysLeft <= 14 ? urgencyColor : context.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                Localizations.localeOf(context).languageCode == 'id'
                                    ? 'Setiap ${NumberFormat('#,###', 'id_ID').format(item.intervalKm)} km atau ${item.intervalMonths} bulan • Terakhir: ${item.lastPerformedOdometer} km (${item.lastPerformedDate.day}/${item.lastPerformedDate.month}/${item.lastPerformedDate.year})'
                                    : 'Every ${NumberFormat('#,###', 'en_US').format(item.intervalKm)} km or ${item.intervalMonths} months • Last: ${item.lastPerformedOdometer} km (${item.lastPerformedDate.day}/${item.lastPerformedDate.month}/${item.lastPerformedDate.year})',
                                style: TextStyle(fontSize: 11, color: context.textMuted),
                              ),
                              Divider(color: context.borderColor, height: 20),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  onPressed: () => _showMarkDoneDialog(context, ref, item, active),
                                  icon: const Icon(Icons.check_circle_outline, size: 16, color: AppColors.accent),
                                  label: Text(
                                    l10n.tandaiSelesaiReset,
                                    style: const TextStyle(color: AppColors.accent, fontSize: 12, fontWeight: FontWeight.w700),
                                  ),
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
    final l10n = AppLocalizations.of(context)!;
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
                  decoration: InputDecoration(
                    hintText: l10n.cariRiwayatServisAtauBengkel,
                    prefixIcon: const Icon(Icons.search, size: 20),
                    isDense: true,
                  ),
                  onChanged: (val) => setState(() => _serviceSearch = val),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                icon: const Icon(Icons.add),
                tooltip: l10n.catatServisBaru,
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
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.build_circle_outlined, size: 32, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.belumAdaRiwayatServis,
                        style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _showAddServiceDialog(context, ref, active),
                        icon: const Icon(Icons.add, size: 16),
                        label: Text(l10n.catatServisBaru),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                      color: AppColors.primary.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      log.category,
                                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary),
                                    ),
                                  ),
                                  if (log.workshop.isNotEmpty) ...[
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        log.workshop,
                                        style: TextStyle(fontSize: 12, color: context.textSecondary),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ] else
                                    const Spacer(),
                                  Text(
                                    '${log.date.day}/${log.date.month}/${log.date.year}',
                                    style: TextStyle(fontSize: 12, color: context.textSecondary),
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
                              Text(
                                log.title,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: context.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                l10n.odometerValue(NumberFormat('#,###', 'id_ID').format(log.odometer)),
                                style: TextStyle(fontSize: 12, color: context.textSecondary, fontWeight: FontWeight.w600),
                              ),
                              if (log.notes.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(log.notes, style: TextStyle(fontSize: 12, color: context.textSecondary)),
                              ],
                              Divider(color: context.borderColor, height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(l10n.totalBiayaBengkel, style: TextStyle(fontSize: 12, color: context.textSecondary)),
                                  Text(
                                    currency.format(log.cost),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primary,
                                    ),
                                  ),
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
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.auditKelayakanJalanKeselamatan,
                  style: TextStyle(fontSize: 12, color: context.textSecondary),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: context.cardBg,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (_) => InspectionSheet(vehicle: active),
                  );
                },
                icon: const Icon(Icons.fact_check_outlined, size: 18),
                label: Text(l10n.mulaiCeklis),
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
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.checklist, size: 32, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.belumAdaHasilCeklis,
                        style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.lakukanInspeksi10PoinBanRemOli,
                        style: TextStyle(color: context.textSecondary, fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: context.cardBg,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            builder: (_) => InspectionSheet(vehicle: active),
                          );
                        },
                        icon: const Icon(Icons.fact_check_outlined),
                        label: Text(l10n.mulaiInspeksiPertama),
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
                                      color: badgeColor.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      Localizations.localeOf(context).languageCode == 'id'
                                          ? '${pct.toStringAsFixed(0)}% Lolos (${item.passedCount}/${item.totalCount})'
                                          : '${pct.toStringAsFixed(0)}% Passed (${item.passedCount}/${item.totalCount})',
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: badgeColor),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${item.date.day}/${item.date.month}/${item.date.year}',
                                    style: TextStyle(fontSize: 12, color: context.textSecondary),
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
                              Text(
                                item.title,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: context.textPrimary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                l10n.odometerValue(NumberFormat('#,###', 'id_ID').format(item.odometer)),
                                style: TextStyle(fontSize: 12, color: context.textSecondary),
                              ),
                              if (item.inspectorNotes.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(item.inspectorNotes, style: TextStyle(fontSize: 12, color: context.textSecondary)),
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
