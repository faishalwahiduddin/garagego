import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/app_localizations_ar.dart';
import '../../l10n/app_localizations_en.dart';
import '../../l10n/app_localizations_es.dart';
import '../../l10n/app_localizations_id.dart';
import '../../l10n/app_localizations_ja.dart';
import '../../l10n/app_localizations_jv.dart';
import '../../l10n/app_localizations_su.dart';
import '../../l10n/app_localizations_zh.dart';
import 'locale_provider.dart';

/// Resolves [AppLocalizations] synchronously for [locale].
///
/// Widgets use `AppLocalizations.of(context)`; providers and models have no
/// [BuildContext], so they read this instead. It stays in sync with the
/// selected locale through [localeProvider].
AppLocalizations localizationsFor(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'jv':
      return AppLocalizationsJv();
    case 'su':
      return AppLocalizationsSu();
    case 'ar':
      return AppLocalizationsAr();
    case 'zh':
      return AppLocalizationsZh();
    case 'ja':
      return AppLocalizationsJa();
    case 'es':
      return AppLocalizationsEs();
    default:
      return AppLocalizationsId();
  }
}

final appLocalizationsProvider = Provider<AppLocalizations>(
  (ref) => localizationsFor(ref.watch(localeProvider)),
);
