/// Fuel brands sold in Indonesia, kept verbatim.
///
/// Product names are brand names, not interface copy: they are never
/// translated, so they live here as named constants instead of in the ARB
/// files. Values written into a log stay readable after a language change.
class FuelBrands {
  static const pertalite = 'Pertalite (RON 90)';
  static const pertamax = 'Pertamax (RON 92)';
  static const pertamaxTurbo = 'Pertamax Turbo (RON 98)';
  static const pertaminaDex = 'Pertamina Dex (CN 53)';
  static const dexlite = 'Dexlite (CN 51)';
  static const shellSuper = 'Shell Super (RON 92)';
  static const shellVPower = 'Shell V-Power (RON 95)';
  static const shellVPowerNitro = 'Shell V-Power Nitro+';
  static const shellVPowerDiesel = 'Shell V-Power Diesel';
  static const bp92 = 'BP 92';
  static const bpUltimate = 'BP Ultimate';
  static const spklu = 'SPKLU Listrik (kWh)';

  /// Default brand used when a fuel log is created.
  static const defaultBrand = pertamax;

  /// Prefix prefilled into the gas-station field.
  static const stationPrefix = 'Pertamina ';

  /// Sample station shown as a hint.
  static const stationHint = 'Pertamina 34.15321 Serpong';

  static const all = <String>[
    pertalite,
    pertamax,
    pertamaxTurbo,
    pertaminaDex,
    dexlite,
    shellSuper,
    shellVPower,
    shellVPowerNitro,
    shellVPowerDiesel,
    bp92,
    bpUltimate,
    spklu,
  ];
}
