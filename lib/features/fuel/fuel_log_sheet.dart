import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/fuel_brands.dart';
import '../../core/constants/units.dart';
import '../../core/models/vehicle.dart';
import '../../core/providers/app_providers.dart';
import '../../core/providers/timezone_provider.dart';
import '../../core/theme/app_numeric.dart';
import '../../core/ui/entry_date_field.dart';
import '../../core/ui/form_sheet_body.dart';
import '../../core/ui/press_scale.dart';
import '../../core/utils/app_timezone.dart';
import '../../core/utils/l10n_helpers.dart';
import '../../core/utils/number_input.dart';
import '../../core/utils/validators.dart';
import '../../l10n/app_localizations.dart';

/// Default unit price prefilled for a new fill-up (Rp per litre).
const kDefaultFuelPrice = 13700;

/// Add or edit one fill-up. The odometer must sit strictly between the
/// neighbouring fill-ups of the same vehicle (by date), so a repeated or
/// lower reading can never fake a km/L figure.
class FuelLogSheet extends ConsumerStatefulWidget {
  const FuelLogSheet({super.key, required this.vehicle, this.initial});

  final Vehicle vehicle;

  /// Fill-up being edited; null adds a new one.
  final FuelLog? initial;

  @override
  ConsumerState<FuelLogSheet> createState() => _FuelLogSheetState();
}

class _FuelLogSheetState extends ConsumerState<FuelLogSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _odo;
  late final TextEditingController _liters;
  late final TextEditingController _price;
  late final TextEditingController _station;
  late bool _isFullTank;
  late String _fuelType;
  late DateTime _date;
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  static final _currency = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  static final _km = NumberFormat('#,###', 'id_ID');

  @override
  void initState() {
    super.initState();
    final log = widget.initial;
    _odo = TextEditingController(
      text: '${log?.odometer ?? widget.vehicle.currentOdometer}',
    );
    _liters = TextEditingController(text: log == null ? '' : _plain(log.liters));
    _price = TextEditingController(
      text: log == null ? '$kDefaultFuelPrice' : _plain(log.pricePerLiter),
    );
    _station = TextEditingController(
      text: log?.gasStation ?? FuelBrands.stationPrefix,
    );
    _isFullTank = log?.isFullTank ?? true;
    final type = log?.fuelType ?? FuelBrands.defaultBrand;
    // A legacy value outside the list would crash the dropdown.
    _fuelType = FuelBrands.all.contains(type) ? type : FuelBrands.defaultBrand;
    _date = log?.date ?? AppTimeZone.nowUtc();
  }

  @override
  void dispose() {
    _odo.dispose();
    _liters.dispose();
    _price.dispose();
    _station.dispose();
    super.dispose();
  }

  /// `35.0` -> `35`, `35.5` -> `35.5`: no trailing `.0` in an edit field.
  static String _plain(double v) =>
      v == v.roundToDouble() ? '${v.round()}' : '$v';

  OdometerBounds get _bounds {
    final logs = ref
        .read(fuelLogsProvider)
        .where((f) => f.vehicleId == widget.vehicle.id)
        .map<OdometerEntry>(
          (f) => (id: f.id, date: f.date, odometer: f.odometer),
        );
    return AppValidators.odometerBounds(
      logs,
      _date,
      excludeId: widget.initial?.id,
    );
  }

  String? _validateOdometer(String? raw, AppLocalizations l10n) {
    final km = NumberInput.parseInt(raw);
    final base = mapValidationError(AppValidators.validateOdometer(km), l10n);
    if (base != null || km == null) return base;
    final bounds = _bounds;
    final code = AppValidators.validateOdometerInHistory(km, bounds);
    final bound = code == 'validationOdometerAbove' ? bounds.above : bounds.below;
    return odometerHistoryMessage(code, _km.format(bound ?? 0), l10n);
  }

  void _save(AppLocalizations l10n) {
    if (!_formKey.currentState!.validate()) {
      setState(() => _autovalidate = AutovalidateMode.onUserInteraction);
      return;
    }
    final editing = widget.initial;
    final log = FuelLog(
      id: editing?.id ?? 'fuel_${DateTime.now().millisecondsSinceEpoch}',
      vehicleId: widget.vehicle.id,
      date: _date,
      odometer: NumberInput.parseInt(_odo.text)!,
      liters: NumberInput.parseDecimal(_liters.text)!,
      pricePerLiter: NumberInput.parseDecimal(_price.text)!,
      isFullTank: _isFullTank,
      fuelType: _fuelType,
      gasStation: _station.text.trim(),
    );
    final notifier = ref.read(fuelLogsProvider.notifier);
    if (editing == null) {
      notifier.addFuelLog(log);
    } else {
      notifier.updateFuelLog(log);
    }
    final messenger = ScaffoldMessenger.of(context);
    Navigator.pop(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          editing == null ? l10n.catatanBbmBerhasilDisimpan : l10n.fuelLogUpdated,
        ),
      ),
    );
  }

  TextTheme get _tt => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final loc = ref.watch(timezoneLocationProvider);
    final inputOdo = NumberInput.parseInt(_odo.text);
    final inputLiters = NumberInput.parseDecimal(_liters.text);
    final inputPrice = NumberInput.parseDecimal(_price.text);
    final previousOdo = _bounds.above;

    final deltaKm = (inputOdo != null && previousOdo != null && inputOdo > previousOdo)
        ? inputOdo - previousOdo
        : 0;
    final totalCost = (inputLiters != null && inputPrice != null && inputLiters > 0 && inputPrice > 0)
        ? inputLiters * inputPrice
        : 0.0;
    final kmPerLiter = (deltaKm > 0 && inputLiters != null && inputLiters > 0)
        ? deltaKm / inputLiters
        : null;
    final costPerKm = (deltaKm > 0 && totalCost > 0) ? totalCost / deltaKm : null;

    return FormSheetBody(
      title: Text(
        widget.initial == null ? l10n.catatPengisianBbm : l10n.fuelEditTitle,
        style: _tt.titleMedium?.copyWith(
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
              EntryDateField(
                label: l10n.fuelDate,
                instant: _date,
                loc: loc,
                onChanged: (d) => setState(() => _date = d),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _fuelType,
                decoration: InputDecoration(labelText: l10n.jenisBahanBakar),
                dropdownColor: context.cardBg,
                items: FuelBrands.all
                    .map((t) => DropdownMenuItem(
                          value: t,
                          child: Text(t, style: _tt.bodyMedium?.copyWith(color: context.textPrimary)),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _fuelType = val);
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('fuel-odometer'),
                controller: _odo,
                keyboardType: TextInputType.number,
                inputFormatters: NumberInput.digits,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: l10n.kilometerOdometerKm,
                  hintText: '25500',
                ),
                validator: (val) => _validateOdometer(val, l10n),
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('fuel-liters'),
                controller: _liters,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: NumberInput.decimal,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: l10n.volumeLiterKwh,
                  hintText: '35,5',
                ),
                validator: (val) => mapValidationError(
                  AppValidators.validateFuelLiters(NumberInput.parseDecimal(val)),
                  l10n,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('fuel-price'),
                controller: _price,
                keyboardType: TextInputType.number,
                inputFormatters: NumberInput.digits,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: l10n.hargaSatuanRpLiter,
                  hintText: '$kDefaultFuelPrice',
                ),
                validator: (val) => mapValidationError(
                  AppValidators.validateFuelPrice(NumberInput.parseDecimal(val)),
                  l10n,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _station,
                decoration: InputDecoration(
                  labelText: l10n.namaSpbuLokasi,
                  hintText: FuelBrands.stationHint,
                ),
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10n.isiTangkiPenuhFullTank,
                  style: _tt.bodyMedium?.copyWith(color: context.textPrimary, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  l10n.diperlukanUntukAkurasiKalkulas,
                  style: _tt.labelSmall?.copyWith(color: context.textSecondary),
                ),
                value: _isFullTank,
                activeColor: AppColors.primary,
                onChanged: (val) => setState(() => _isFullTank = val ?? true),
              ),
              if (totalCost > 0 || deltaKm > 0) ...[
                const SizedBox(height: 10),
                _buildPreview(context, l10n, totalCost, deltaKm, kmPerLiter, costPerKm),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.batal, style: TextStyle(color: context.textSecondary)),
        ),
        PressScale(
          scale: 0.97,
          child: ElevatedButton(
            onPressed: () => _save(l10n),
            child: Text(l10n.simpan),
          ),
        ),
      ],
    );
  }

  /// Live cost / distance / km/L preview while typing.
  Widget _buildPreview(
    BuildContext context,
    AppLocalizations l10n,
    double totalCost,
    int deltaKm,
    double? kmPerLiter,
    double? costPerKm,
  ) {
    TextStyle? label() => _tt.labelSmall?.copyWith(color: context.textSecondary);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.surfaceBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  l10n.fuelEstTotalCost,
                  style: _tt.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: context.textSecondary),
                ),
              ),
              Text(
                _currency.format(totalCost.round()),
                style: _tt.titleSmall?.copyWith(fontWeight: FontWeight.w800, color: context.textPrimary, fontFeatures: AppNumeric.tabularFeatures),
              ),
            ],
          ),
          if (deltaKm > 0) ...[
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(l10n.fuelTripDistance, style: label())),
                Text(
                  '$kPlusSign${_km.format(deltaKm)}$kSpaceChar$kKmUnit',
                  style: _tt.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: context.textPrimary, fontFeatures: AppNumeric.tabularFeatures),
                ),
              ],
            ),
          ],
          if (kmPerLiter != null) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(l10n.fuelAvgConsumption, style: label())),
                Text(
                  l10n.fuelKmL(kmPerLiter.toStringAsFixed(1)),
                  style: _tt.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: context.textPrimary, fontFeatures: AppNumeric.tabularFeatures),
                ),
              ],
            ),
          ],
          if (costPerKm != null) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(l10n.fuelOperatingCost, style: label())),
                Text(
                  '${_currency.format(costPerKm.round())}$kPerKmSuffix',
                  style: _tt.labelSmall?.copyWith(fontWeight: FontWeight.w600, color: context.textSecondary, fontFeatures: AppNumeric.tabularFeatures),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
