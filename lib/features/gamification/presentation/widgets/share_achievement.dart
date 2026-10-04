import 'package:share_plus/share_plus.dart';

/// Teks share pencapaian GarageGo: level, XP, badge.
String buildGarageShareText({
  required int level,
  required String levelTitle,
  required int totalXp,
  required int unlockedCount,
  required int totalBadges,
  String? highlight,
  required bool isId,
}) {
  final buffer = StringBuffer()
    ..write('🚗 GarageGo — ')
    ..write('LVL $level • $levelTitle • ')
    ..write('$totalXp XP • ')
    ..write(
      isId
          ? '$unlockedCount/$totalBadges lencana terbuka'
          : '$unlockedCount/$totalBadges badges unlocked',
    );
  if (highlight != null && highlight.isNotEmpty) {
    buffer.write('\n🏅 $highlight');
  }
  buffer.write('\n#GarageGo https://garagego.faishal.id');
  return buffer.toString();
}

/// Bagikan [text] lewat share sheet sistem.
Future<void> shareAchievementText(String text) async {
  await SharePlus.instance.share(ShareParams(text: text));
}
