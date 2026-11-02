import '../../l10n/app_localizations.dart';
import 'backup_codec.dart';

String languageName(String code, AppLocalizations l10n) {
  return switch (code) {
    'id' => l10n.localeIndonesian,
    'en' => l10n.localeEnglish,
    'ar' => l10n.localeArabic,
    'jv' => l10n.localeJavanese,
    'su' => l10n.localeSundanese,
    'zh' => l10n.localeChinese,
    'ja' => l10n.localeJapanese,
    'es' => l10n.localeSpanish,
    _ => code,
  };
}

String? mapValidationError(String? error, AppLocalizations l10n) {
  if (error == null) return null;
  switch (error) {
    case 'validationVehicleNameRequired':
      return l10n.validationVehicleNameRequired;
    case 'validationVehicleNameMinLength':
      return l10n.validationVehicleNameMinLength;
    case 'validationVehicleNameMaxLength':
      return l10n.validationVehicleNameMaxLength;
    case 'validationPlateRequired':
      return l10n.validationPlateRequired;
    case 'validationPlateMaxLength':
      return l10n.validationPlateMaxLength;
    case 'validationOdometerNegative':
      return l10n.validationOdometerNegative;
    case 'validationOdometerTooHigh':
      return l10n.validationOdometerTooHigh;
    case 'validationOdometerLessThanPrevious':
      return l10n.validationOdometerLessThanPrevious;
    case 'validationCostNegative':
      return l10n.validationCostNegative;
    case 'validationFuelLitersPositive':
      return l10n.validationFuelLitersPositive;
    case 'validationFuelLitersTooHigh':
      return l10n.validationFuelLitersTooHigh;
    case 'validationServiceNameRequired':
      return l10n.validationServiceNameRequired;
    case 'validationDocNameRequired':
      return l10n.validationDocNameRequired;
    default:
      return error;
  }
}

/// Turns a backup-decoding failure into localized copy.
///
/// The codec throws stable codes (never sentences) so exported/imported data
/// carries no language; this maps them for the snackbar that reports the error.
String localizeBackupError(Object error, AppLocalizations l10n) {
  if (error is FormatException) {
    switch (error.message) {
      case kBackupErrEmpty:
        return l10n.backupErrEmpty;
      case kBackupErrRawJson:
        return l10n.backupErrRawJson;
      case kBackupErrFormat:
        return l10n.backupErrFormat;
      case kBackupErrWrongApp:
        final source = error.source?.toString() ?? '';
        final parts = source.split('|');
        return l10n.backupErrWrongApp(
          parts.isNotEmpty ? parts.first : '',
          parts.length > 1 ? parts[1] : '',
        );
      case kBackupErrCorrupt:
        return l10n.backupErrCorrupt;
      case kBackupErrIntegrity:
        return l10n.backupErrIntegrity;
      case kBackupErrNotObject:
        return l10n.backupErrNotObject;
      case kBackupErrNoVehicles:
      case kBackupErrInvalidVehicles:
        return l10n.backupErrFormat;
    }
  }
  return l10n.gagalMemulihkanBackup(error.toString());
}
