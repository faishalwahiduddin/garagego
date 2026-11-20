import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/timezone_provider.dart';
import '../../core/ui/entry_date_field.dart';
import '../../core/ui/form_sheet_body.dart';
import '../../core/utils/app_timezone.dart';
import '../../core/utils/l10n_helpers.dart';
import '../../core/utils/number_input.dart';
import '../../core/utils/validators.dart';
import '../../l10n/app_localizations.dart';

/// Add or edit one service log, with its date (back-dating allowed) and an
/// odometer that stays between the neighbouring services of the vehicle.
class ServiceLogSheet extends ConsumerStatefulWidget {
  const ServiceLogSheet({super.key, required this.vehicle, this.initial});

  final Vehicle vehicle;

  /// Log being edited; null adds a new one.
  final ServiceLog? initial;

  @override
  ConsumerState<ServiceLogSheet> createState() => _ServiceLogSheetState();
}

class _ServiceLogSheetState extends ConsumerState<ServiceLogSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _title;
  late final TextEditingController _odo;
  late final TextEditingController _cost;
  late final TextEditingController _notes;
  late final TextEditingController _workshop;
  late String _category;
  late bool _isOilChange;
  late DateTime _date;
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;
  bool _categoryReady = false;

  static final _km = NumberFormat('#,###', 'id_ID');

  @override
  void initState() {
    super.initState();
    final log = widget.initial;
    _title = TextEditingController(text: log?.title ?? '');
    _odo = TextEditingController(
      text: '${log?.odometer ?? widget.vehicle.currentOdometer}',
    );
    _cost = TextEditingController(text: log == null ? '' : '${log.cost.round()}');
    _notes = TextEditingController(text: log?.notes ?? '');
    _workshop = TextEditingController(text: log?.workshop ?? '');
    _date = log?.date ?? AppTimeZone.nowUtc();
    // Off by default: a tyre or AC job must not silently reset the oil
    // counter. Picking an oil category turns it on.
    _isOilChange = log?.isOilChange ?? false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_categoryReady) {
      _categoryReady = true;
      final l10n = AppLocalizations.of(context)!;
      _category = widget.initial?.category ?? l10n.mtCatGeneral;
    }
  }

  @override
  void dispose() {
    _title.dispose();
    _odo.dispose();
    _cost.dispose();
    _notes.dispose();
    _workshop.dispose();
    super.dispose();
  }

  List<String> _categories(AppLocalizations l10n) {
    final list = [
      l10n.mtCatGeneral,
      l10n.mtCatOilFilter,
      l10n.mtCatBrakes,
      l10n.mtCatTires,
      l10n.mtCatElectrical,
      l10n.mtCatEngine,
      l10n.mtCatOther,
    ];
    // A stored category from another language stays selectable when editing.
    return list.contains(_category) ? list : [_category, ...list];
  }

  bool _isOilCategory(String c, AppLocalizations l10n) =>
      c == l10n.mtCatOilFilter || c == l10n.mtCatOilFluids || c == kOilChangeServiceCategory;

  String? _validateOdometer(String? raw, AppLocalizations l10n) {
    final km = NumberInput.parseInt(raw);
    final base = mapValidationError(AppValidators.validateOdometer(km), l10n);
    if (base != null || km == null) return base;
    final entries = ref
        .read(serviceLogsProvider)
        .where((l) => l.vehicleId == widget.vehicle.id)
        .map<OdometerEntry>((l) => (id: l.id, date: l.date, odometer: l.odometer));
    final bounds = AppValidators.odometerBounds(
      entries,
      _date,
      excludeId: widget.initial?.id,
    );
    final code = AppValidators.validateOdometerInHistory(km, bounds, strict: false);
    final bound = code == 'validationOdometerAtLeast' ? bounds.above : bounds.below;
    return odometerHistoryMessage(code, _km.format(bound ?? 0), l10n);
  }

  void _save(AppLocalizations l10n) {
    if (!_formKey.currentState!.validate()) {
      setState(() => _autovalidate = AutovalidateMode.onUserInteraction);
      return;
    }
    final editing = widget.initial;
    final log = ServiceLog(
      id: editing?.id ?? 'serv_${DateTime.now().millisecondsSinceEpoch}',
      vehicleId: widget.vehicle.id,
      date: _date,
      odometer: NumberInput.parseInt(_odo.text)!,
      title: _title.text.trim(),
      cost: NumberInput.parseInt(_cost.text)!.toDouble(),
      notes: _notes.text.trim(),
      isOilChange: _isOilChange,
      workshop: _workshop.text.trim(),
      category: _category,
    );
    final notifier = ref.read(serviceLogsProvider.notifier);
    if (editing == null) {
      notifier.addLog(log);
    } else {
      notifier.updateLog(log);
    }
    final messenger = ScaffoldMessenger.of(context);
    Navigator.pop(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          editing == null ? l10n.catatanServisBerhasilDitambahk : l10n.serviceLogUpdated,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final loc = ref.watch(timezoneLocationProvider);
    return FormSheetBody(
      title: Text(
        widget.initial == null ? l10n.catatServisBaru : l10n.serviceEditTitle,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: context.textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
        ),
      ),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidate,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                key: const Key('service-title'),
                controller: _title,
                decoration: InputDecoration(
                  labelText: l10n.pekerjaanServis,
                  hintText: l10n.serviceTitleHint,
                ),
                validator: (val) => val == null || val.trim().isEmpty
                    ? l10n.validationServiceNameRequired
                    : null,
              ),
              const SizedBox(height: 12),
              EntryDateField(
                label: l10n.serviceDate,
                instant: _date,
                loc: loc,
                onChanged: (d) => setState(() => _date = d),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: InputDecoration(labelText: l10n.kategori),
                dropdownColor: context.cardBg,
                items: _categories(l10n)
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: context.textPrimary)),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val == null) return;
                  setState(() {
                    _category = val;
                    _isOilChange = _isOilCategory(val, l10n);
                  });
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('service-odometer'),
                controller: _odo,
                keyboardType: TextInputType.number,
                inputFormatters: NumberInput.digits,
                decoration: InputDecoration(
                  labelText: l10n.kilometerOdometerKm,
                  hintText: '25000',
                ),
                validator: (val) => _validateOdometer(val, l10n),
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('service-cost'),
                controller: _cost,
                keyboardType: TextInputType.number,
                inputFormatters: NumberInput.digits,
                decoration: InputDecoration(
                  labelText: l10n.biayaTotalRp,
                  hintText: '450000',
                ),
                validator: (val) => mapValidationError(
                  AppValidators.validateCost(NumberInput.parseInt(val)?.toDouble()),
                  l10n,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _workshop,
                decoration: InputDecoration(
                  labelText: l10n.namaBengkelToko,
                  hintText: l10n.workshopHint,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notes,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: l10n.catatanSparepartPengerjaan,
                  hintText: l10n.rincianPartYangDiganti,
                ),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                key: const Key('service-oil-switch'),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10n.termasukGantiOli,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: context.textPrimary, fontWeight: FontWeight.w600),
                ),
                value: _isOilChange,
                activeThumbColor: AppColors.primary,
                onChanged: (val) => setState(() => _isOilChange = val),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
        ),
        ElevatedButton(
          onPressed: () => _save(l10n),
          child: Text(l10n.simpan),
        ),
      ],
    );
  }
}
