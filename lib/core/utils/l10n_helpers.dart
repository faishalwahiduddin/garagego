import '../../l10n/app_localizations.dart';

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
    case 'Nama kendaraan tidak boleh kosong':
      return l10n.validationVehicleNameRequired;
    case 'validationVehicleNameMinLength':
      return l10n.validationVehicleNameMinLength;
    case 'validationVehicleNameMaxLength':
      return l10n.validationVehicleNameMaxLength;
    case 'validationPlateRequired':
    case 'Nomor pelat polisi tidak boleh kosong':
      return l10n.validationPlateRequired;
    case 'validationPlateMaxLength':
      return l10n.validationPlateMaxLength;
    case 'validationOdometerNegative':
    case 'Kilometer odometer tidak boleh negatif':
      return l10n.validationOdometerNegative;
    case 'validationOdometerTooHigh':
    case 'Kilometer odometer melebihi batas wajar':
      return l10n.validationOdometerTooHigh;
    case 'validationOdometerLessThanPrevious':
      return l10n.validationOdometerLessThanPrevious;
    case 'validationCostNegative':
    case 'Biaya tidak boleh bernilai negatif':
      return l10n.validationCostNegative;
    case 'validationFuelLitersPositive':
    case 'Volume bahan bakar harus lebih dari 0 liter':
      return l10n.validationFuelLitersPositive;
    case 'validationFuelLitersTooHigh':
    case 'Volume tangki melebihi kapasitas wajar':
      return l10n.validationFuelLitersTooHigh;
    case 'validationServiceNameRequired':
    case 'Nama servis wajib diisi':
    case 'Nama pekerjaan wajib diisi':
      return l10n.validationServiceNameRequired;
    case 'validationDocNameRequired':
    case 'Nama dokumen wajib diisi':
      return l10n.validationDocNameRequired;
    default:
      if (error.startsWith('Nama kendaraan minimal')) {
        return l10n.validationVehicleNameMinLength;
      }
      if (error.startsWith('Nama kendaraan maksimal')) {
        return l10n.validationVehicleNameMaxLength;
      }
      if (error.startsWith('Nomor pelat maksimal')) {
        return l10n.validationPlateMaxLength;
      }
      if (error.startsWith('Odometer baru')) {
        return l10n.validationOdometerLessThanPrevious;
      }
      return error;
  }
}
