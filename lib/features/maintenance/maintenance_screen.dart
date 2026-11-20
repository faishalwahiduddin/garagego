import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_numeric.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/timezone_provider.dart';
import '../../core/ui/form_sheet_body.dart';
import '../../core/ui/app_icon.dart';
import '../../core/ui/press_scale.dart';
import '../../core/ui/undo_snackbar.dart';
import '../../core/utils/number_input.dart';
import '../../core/utils/app_timezone.dart';
import '../../core/utils/l10n_helpers.dart';
import '../../core/utils/validators.dart';
import 'add_schedule_sheet.dart';
import 'inspection_sheet.dart';
import 'service_log_sheet.dart';
import '../../core/ui/fleet_sheet.dart';

class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({super.key, this.initialTab = 0});

  /// Tab shown on open: 0 = schedules, 1 = service history, 2 = inspections.
  final int initialTab;

  @override
  ConsumerState<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

enum ScheduleFilterOption {
  all,
  attention,
  safe;

  String localizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case ScheduleFilterOption.all:
        return l10n.filterAll;
      case ScheduleFilterOption.attention:
        return l10n.filterAttention;
      case ScheduleFilterOption.safe:
        return l10n.urgencySafe;
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
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTab.clamp(0, 2),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showServiceSheet(BuildContext context, Vehicle active, {ServiceLog? initial}) {
    showFleetSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.cardBg,
      builder: (_) => ServiceLogSheet(vehicle: active, initial: initial),
    );
  }

  void _deleteServiceLog(BuildContext context, ServiceLog log) {
    final notifier = ref.read(serviceLogsProvider.notifier);
    final index = ref.read(serviceLogsProvider).indexWhere((l) => l.id == log.id);
    notifier.deleteLog(log.id);
    showUndoSnackBar(context, onUndo: () => notifier.restoreLog(log, index));
  }

  void _deleteSchedule(BuildContext context, MaintenanceSchedule schedule) {
    final notifier = ref.read(maintenanceSchedulesProvider.notifier);
    final index = ref.read(maintenanceSchedulesProvider).indexWhere((s) => s.id == schedule.id);
    notifier.deleteSchedule(schedule.id);
    showUndoSnackBar(context, onUndo: () => notifier.restoreSchedule(schedule, index));
  }

  void _deleteInspection(BuildContext context, InspectionChecklist checklist) {
    final notifier = ref.read(inspectionChecklistsProvider.notifier);
    final index = ref.read(inspectionChecklistsProvider).indexWhere((c) => c.id == checklist.id);
    notifier.deleteChecklist(checklist.id);
    showUndoSnackBar(context, onUndo: () => notifier.restoreChecklist(checklist, index));
  }

  void _showMarkDoneDialog(BuildContext context, WidgetRef ref, MaintenanceSchedule schedule, Vehicle active) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final odoController = TextEditingController(text: active.currentOdometer.toString());
    final costController = TextEditingController(text: '0');
    final workshopController = TextEditingController();
    final notesController = TextEditingController();

    showFleetSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.cardBg,
      builder: (ctx) => FormSheetBody(
        title: Text(
          l10n.selesaikanJadwal(schedule.title),
          style: TextStyle(
            color: context.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
          ),
        ),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                  inputFormatters: NumberInput.digits,
                  decoration: InputDecoration(labelText: l10n.odometerPengerjaanKm),
                  validator: (val) => mapValidationError(AppValidators.validateOdometer(int.tryParse(val ?? '')), l10n),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: costController,
                  keyboardType: TextInputType.number,
                  inputFormatters: NumberInput.digits,
                  decoration: InputDecoration(labelText: l10n.totalBiayaRp),
                  validator: (val) => mapValidationError(AppValidators.validateCost(double.tryParse(val ?? '')), l10n),
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
                    l10n: l10n,
                  );
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.scheduleCompleted(schedule.title)),
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
              : l10n.maintenanceScreenTitle,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: context.textPrimary, letterSpacing: -0.4),
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
              labelColor: context.readable(AppColors.primary),
              unselectedLabelColor: context.textSecondary,
              labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon('service_schedule', size: 16),
                      const SizedBox(width: 6),
                      Flexible(child: Text(l10n.jadwalCount(schedules.length.toString()))),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.history, size: 16),
                      const SizedBox(width: 6),
                      Flexible(child: Text(l10n.riwayatCount(serviceLogs.length.toString()))),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon('inspection', size: 16),
                      const SizedBox(width: 6),
                      Flexible(child: Text(l10n.inspeksiCount(inspections.length.toString()))),
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
    // Stored instants are UTC; display in the selected zone (§TZ).
    final loc = ref.watch(timezoneLocationProvider);
    final localeCode = AppTimeZone.intlLocale(Localizations.localeOf(context).languageCode);
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
              // Expanded so the chips wrap to a second line on narrow phones
              // instead of overflowing past the menu button (was 16px at 390pt).
              Expanded(
                child: Wrap(
                spacing: 8,
                runSpacing: 6,
                children: ScheduleFilterOption.values.map((f) {
                  final isSelected = _scheduleFilter == f;
                  return PressScale(
                    scale: 0.95,
                    child: ChoiceChip(
                      label: Text(f.localizedLabel(context)),
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? Colors.white : context.textSecondary,
                      ),
                      selected: isSelected,
                      selectedColor: AppColors.primaryDark,
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
                    ),
                  );
                }).toList(),
                ),
              ),
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
                    ref.read(maintenanceSchedulesProvider.notifier).loadPresetsForVehicle(active, l10n);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.rekomendasiPabrikBerhasilDimuat(active.type.getLocalizedLabel(context)))),
                    );
                  } else if (val == 'add') {
                    showFleetSheet(
                      context: context,
                      useRootNavigator: true,
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
                        Flexible(child: Text(
                          l10n.tambahJadwalBaru,
                          style: TextStyle(color: context.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                        )),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'preset',
                    child: Row(
                      children: [
                        const Icon(Icons.auto_awesome, size: 18, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Flexible(child: Text(
                          l10n.muatStandarPabrik(active.type.getLocalizedLabel(context)),
                          style: TextStyle(color: context.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                        )),
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
                          child: const AppIcon('service_schedule', size: 32, color: AppColors.primary),
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
                        PressScale(
                          scale: 0.97,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ref.read(maintenanceSchedulesProvider.notifier).loadPresetsForVehicle(active, l10n);
                            },
                            icon: const Icon(Icons.auto_awesome, size: 16),
                            label: Text(l10n.muatStandarPabrik(active.type.getLocalizedLabel(context))),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _ScheduleCard(
                        schedule: item,
                        currentOdometer: active.currentOdometer,
                        lastDoneLabel: AppTimeZone.formatDate(item.lastPerformedDate, loc, locale: localeCode),
                        onEdit: () => showFleetSheet(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          backgroundColor: context.cardBg,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                          builder: (_) => AddScheduleSheet(vehicle: active, initialSchedule: item),
                        ),
                        onDelete: () => _deleteSchedule(context, item),
                        onMarkDone: () => _showMarkDoneDialog(context, ref, item, active),
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
    // Stored instants are UTC; display in the selected zone (§TZ).
    final loc = ref.watch(timezoneLocationProvider);
    final localeCode = AppTimeZone.intlLocale(Localizations.localeOf(context).languageCode);
    final filtered = logs.where((l) {
      if (_serviceSearch.isEmpty) return true;
      return l.title.toLowerCase().contains(_serviceSearch.toLowerCase()) ||
          l.category.toLowerCase().contains(_serviceSearch.toLowerCase()) ||
          l.workshop.toLowerCase().contains(_serviceSearch.toLowerCase()) ||
          l.notes.toLowerCase().contains(_serviceSearch.toLowerCase());
    }).toList()
      // Back-dated entries slot into place: newest service first.
      ..sort((a, b) => b.date.compareTo(a.date));

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
              PressScale(
                scale: 0.92,
                child: IconButton.filled(
                  icon: const Icon(Icons.add),
                  tooltip: l10n.catatServisBaru,
                  onPressed: () => _showServiceSheet(context, active),
                ),
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
                        child: const AppIcon('wrench', size: 32, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.belumAdaRiwayatServis,
                        style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: -0.3),
                      ),
                      const SizedBox(height: 16),
                      PressScale(
                        scale: 0.97,
                        child: ElevatedButton.icon(
                          onPressed: () => _showServiceSheet(context, active),
                          icon: const Icon(Icons.add, size: 16),
                          label: Text(l10n.catatServisBaru),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final log = filtered[index];
                    final meta = log.workshop.isNotEmpty
                        ? '${log.category}$kDotSeparator${log.workshop}'
                        : log.category;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          // Tap a row to edit it (date, odometer, cost...).
                          onTap: () => _showServiceSheet(context, active, initial: log),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        meta,
                                        style: TextStyle(fontSize: 12, color: context.textSecondary),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      AppTimeZone.formatDate(log.date, loc, locale: localeCode),
                                      style: TextStyle(fontSize: 12, color: context.textSecondary).tabular,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete_outline, size: 20, color: context.textSecondary),
                                      tooltip: l10n.delete,
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        _deleteServiceLog(context, log);
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
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              const SizedBox(height: 4),
                              Text(
                                l10n.odometerValue(NumberFormat('#,###', 'id_ID').format(log.odometer)),
                                style: TextStyle(fontSize: 12, color: context.textSecondary, fontWeight: FontWeight.w600).tabular,
                              ),
                              if (log.notes.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(log.notes, style: TextStyle(fontSize: 12, color: context.textSecondary)),
                              ],
                              Divider(color: context.borderColor, height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text(l10n.totalBiayaBengkel, style: TextStyle(fontSize: 12, color: context.textSecondary))),
                                  Text(
                                    currency.format(log.cost),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: context.readable(AppColors.primary),
                                    ).tabular,
                                  ),
                                ],
                              ),
                            ],
                          ),
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
    // Stored instants are UTC; display in the selected zone (§TZ).
    final loc = ref.watch(timezoneLocationProvider);
    final localeCode = AppTimeZone.intlLocale(Localizations.localeOf(context).languageCode);
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
              PressScale(
                scale: 0.97,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showFleetSheet(
                      context: context,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      backgroundColor: context.cardBg,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (_) => InspectionSheet(vehicle: active),
                    );
                  },
                  icon: const AppIcon('inspection', size: 18),
                  label: Text(l10n.mulaiCeklis),
                ),
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
                        child: const AppIcon('inspection', size: 32, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.belumAdaHasilCeklis,
                        style: TextStyle(color: context.textPrimary, fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: -0.3),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.inspectionEmptyBody(
                          '${InspectionChecklist.generateDefaultItems(active.type, l10n).length}',
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: context.textSecondary, fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      PressScale(
                        scale: 0.97,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showFleetSheet(
                              context: context,
                              useRootNavigator: true,
                              isScrollControlled: true,
                              backgroundColor: context.cardBg,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                              ),
                              builder: (_) => InspectionSheet(vehicle: active),
                            );
                          },
                          icon: const AppIcon('inspection', size: 18),
                          label: Text(l10n.mulaiInspeksiPertama),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
                  itemCount: inspections.length,
                  itemBuilder: (context, index) {
                    final item = inspections[index];
                    final pct = item.passPercentage;

                    Color badgeColor;
                    if (pct >= 90) {
                      badgeColor = context.readable(AppColors.success);
                    } else if (pct >= 70) {
                      badgeColor = context.readable(AppColors.warning);
                    } else {
                      badgeColor = context.readable(AppColors.danger);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PressScale(
                        scale: 0.98,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Colour lives on the icon; the result reads as neutral text.
                                    Icon(
                                      pct >= 90 ? Icons.check_circle_outline : Icons.error_outline,
                                      size: 18,
                                      color: badgeColor,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        l10n.inspPassedCount(
                                          pct.toStringAsFixed(0),
                                          '${item.passedCount}',
                                          '${item.totalCount}',
                                        ),
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: context.textPrimary).tabular,
                                      ),
                                    ),
                                    Text(
                                      AppTimeZone.formatDate(item.date, loc, locale: localeCode),
                                      style: TextStyle(fontSize: 12, color: context.textSecondary).tabular,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete_outline, size: 20, color: context.textSecondary),
                                      tooltip: l10n.delete,
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        _deleteInspection(context, item);
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
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.odometerValue(NumberFormat('#,###', 'id_ID').format(item.odometer)),
                                  style: TextStyle(fontSize: 12, color: context.textSecondary).tabular,
                                ),
                                if (item.inspectorNotes.isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  Text(item.inspectorNotes, style: TextStyle(fontSize: 12, color: context.textSecondary)),
                                ],
                              ],
                            ),
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

/// Maintenance schedule card: title, category as secondary text, ONE status
/// line (coloured icon + neutral text), interval summary and a single
/// "Mark done" action.
class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({
    required this.schedule,
    required this.currentOdometer,
    required this.lastDoneLabel,
    required this.onEdit,
    required this.onDelete,
    required this.onMarkDone,
  });

  final MaintenanceSchedule schedule;
  final int currentOdometer;
  final String lastDoneLabel;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onMarkDone;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final urgency = schedule.urgency(currentOdometer);
    final trigger = schedule.mostUrgentTrigger(currentOdometer);
    final km = NumberFormat('#,###', 'id_ID');
    final left = trigger.remaining;
    final statusText = trigger.byKm
        ? (left < 0 ? l10n.kmOverdue(km.format(-left)) : l10n.kmRemaining(km.format(left)))
        : (left < 0 ? l10n.daysOverdue('${-left}') : l10n.daysLeft('$left'));
    final (IconData icon, Color iconColor) = switch (urgency) {
      ScheduleUrgency.overdue => (Icons.error_outline, context.readable(AppColors.danger)),
      ScheduleUrgency.dueSoon => (Icons.schedule, context.readable(AppColors.warning)),
      ScheduleUrgency.safe => (Icons.check_circle_outline, context.readable(AppColors.success)),
    };
    final isAlert = urgency != ScheduleUrgency.safe;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          schedule.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: context.textPrimary,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          schedule.category,
                          style: TextStyle(fontSize: 12, color: context.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit_outlined, size: 20, color: context.textSecondary),
                  tooltip: l10n.edit,
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, size: 20, color: context.textSecondary),
                  tooltip: l10n.delete,
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                children: [
                  Icon(icon, size: 18, color: iconColor, semanticLabel: urgency.getLocalizedLabel(context)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isAlert ? FontWeight.w700 : FontWeight.w500,
                        color: isAlert ? context.textPrimary : context.textSecondary,
                      ).tabular,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                l10n.scheduleIntervalSummary(
                  km.format(schedule.intervalKm),
                  '${schedule.intervalMonths}',
                  km.format(schedule.lastPerformedOdometer),
                  lastDoneLabel,
                ),
                style: TextStyle(fontSize: 11, color: context.textMuted),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Divider(color: context.borderColor, height: 16),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onMarkDone,
                icon: const Icon(Icons.check_circle_outline, size: 16, color: AppColors.accent),
                label: Text(
                  l10n.tandaiSelesai,
                  style: TextStyle(color: context.readable(AppColors.accent), fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
