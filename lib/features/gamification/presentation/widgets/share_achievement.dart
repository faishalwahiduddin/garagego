import 'package:share_plus/share_plus.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

// Share-text fragments that are punctuation or universal units, never copy.
const String kShareSeparator = ' • ';
const String kShareXpUnit = ' XP';
const String kShareHighlightPrefix = '\n🏅 ';
const String kShareHashtagPrefix = '\n#';
const String kShareBrandEmoji = '🚗 ';
const String kShareDash = ' — ';

/// Teks share pencapaian GarageGo: level, XP, badge.
///
/// Every word comes from `AppLocalizations`, so the shared text follows the
/// language the user is running the app in.
String buildGarageShareText({
  required int level,
  required String levelTitle,
  required int totalXp,
  required int unlockedCount,
  required int totalBadges,
  String? highlight,
  required AppLocalizations l10n,
}) {
  final buffer = StringBuffer()
    ..write(kShareBrandEmoji)
    ..write(l10n.appTitle)
    ..write(kShareDash)
    ..write(l10n.gamesLvl('$level'))
    ..write(kShareSeparator)
    ..write(levelTitle)
    ..write(kShareSeparator)
    ..write(totalXp)
    ..write(kShareXpUnit)
    ..write(kShareSeparator)
    ..write(l10n.gamesBadgeCount('$unlockedCount', '$totalBadges'));
  if (highlight != null && highlight.isNotEmpty) {
    buffer
      ..write(kShareHighlightPrefix)
      ..write(highlight);
  }
  buffer
    ..write(kShareHashtagPrefix)
    ..write(l10n.appTitle)
    ..write(' ')
    ..write(AppConstants.appDomain);
  return buffer.toString();
}

/// Bagikan [text] lewat share sheet sistem.
Future<void> shareAchievementText(String text) async {
  await SharePlus.instance.share(ShareParams(text: text));
}
