import 'package:flutter/services.dart';

/// Numeric text-field helpers (§VAL): the field only accepts what it can
/// parse, and decimals take either `,` (id) or `.` (en) as the separator.
class NumberInput {
  NumberInput._();

  /// Whole numbers only (odometer, rupiah amounts).
  static final List<TextInputFormatter> digits = [
    FilteringTextInputFormatter.digitsOnly,
  ];

  /// Digits plus at most one decimal separator (`,` or `.`).
  static final List<TextInputFormatter> decimal = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
    const _SingleSeparatorFormatter(),
  ];

  /// Parses a whole number typed into a [digits] field.
  static int? parseInt(String? raw) => int.tryParse((raw ?? '').trim());

  /// Parses a decimal typed with either separator (`35,5` == `35.5`).
  static double? parseDecimal(String? raw) {
    final text = (raw ?? '').trim().replaceAll(',', '.');
    if (text.isEmpty) return null;
    final value = double.tryParse(text);
    return value != null && value.isFinite ? value : null;
  }
}

/// Rejects an edit that would leave more than one decimal separator.
class _SingleSeparatorFormatter extends TextInputFormatter {
  const _SingleSeparatorFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final separators = RegExp('[.,]').allMatches(newValue.text).length;
    return separators > 1 ? oldValue : newValue;
  }
}
