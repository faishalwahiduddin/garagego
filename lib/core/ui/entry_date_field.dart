import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

import '../constants/app_colors.dart';
import '../utils/app_timezone.dart';

/// Earliest date a log entry may be back-dated to.
final kEarliestEntryDate = DateTime(2000);

/// Read-only form field showing an entry's date in the selected zone (§TZ);
/// tapping opens a date picker limited to today and earlier.
class EntryDateField extends StatelessWidget {
  const EntryDateField({
    super.key,
    required this.label,
    required this.instant,
    required this.loc,
    required this.onChanged,
  });

  final String label;

  /// Stored UTC instant currently selected.
  final DateTime instant;
  final tz.Location loc;

  /// Receives the UTC instant to store for the picked day.
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final localeCode = AppTimeZone.intlLocale(
      Localizations.localeOf(context).languageCode,
    );
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        final zoned = AppTimeZone.toZoned(instant, loc);
        final today = AppTimeZone.nowIn(loc);
        final lastDate = DateTime(today.year, today.month, today.day);
        final initial = DateTime(zoned.year, zoned.month, zoned.day);
        final picked = await showDatePicker(
          context: context,
          initialDate: initial.isAfter(lastDate) ? lastDate : initial,
          firstDate: kEarliestEntryDate,
          lastDate: lastDate,
        );
        if (picked != null) onChanged(entryInstantFor(picked, instant, loc));
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: Icon(
            Icons.calendar_today,
            size: 18,
            color: context.textSecondary,
          ),
        ),
        child: Text(
          AppTimeZone.formatDate(instant, loc, locale: localeCode),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.textPrimary),
        ),
      ),
    );
  }
}

/// UTC instant to store when [day] (a calendar day in [loc]) is picked for an
/// entry currently at [current]: the same day keeps the original instant, any
/// other day becomes its local noon, never later than now.
DateTime entryInstantFor(DateTime day, DateTime current, tz.Location loc) {
  final zoned = AppTimeZone.toZoned(current, loc);
  if (zoned.year == day.year &&
      zoned.month == day.month &&
      zoned.day == day.day) {
    return current;
  }
  final noon = AppTimeZone.dayRangeUtc(
    loc,
    DateTime(day.year, day.month, day.day),
  ).startUtc.add(const Duration(hours: 12));
  final now = AppTimeZone.nowUtc();
  return noon.isAfter(now) ? now : noon;
}
