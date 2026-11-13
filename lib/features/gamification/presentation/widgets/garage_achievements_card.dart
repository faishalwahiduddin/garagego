import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/garage_gamification.dart';
import '../../providers/garage_gamification_provider.dart';
import 'share_achievement.dart';

class GarageAchievementsCard extends ConsumerWidget {
  const GarageAchievementsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(garageGamificationProvider);
    final l10n = AppLocalizations.of(context)!;
    final numberFmt = NumberFormat(
      '#,###',
      Localizations.localeOf(context).languageCode == 'id' ? 'id_ID' : 'en_US',
    );
    final textScale = MediaQuery.textScalerOf(context).scale(1.0);

    return Card(
      color: context.cardBg,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: context.borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Level badge, title, and XP
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      state.currentLevel.emoji,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              l10n.gamesLvl('${state.currentLevel.level}'),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: context.readable(AppColors.primary),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              state.currentLevel.getLocalizedTitle(l10n),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: context.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        l10n.gamesProgress(
                          numberFmt.format(state.totalXp),
                          '${state.unlockedCount}',
                          '${state.badges.length}',
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          color: context.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 18,
                  tooltip: l10n.gamesShare,
                  icon: const Icon(Icons.share_outlined),
                  color: AppColors.primary,
                  onPressed: () => shareAchievementText(
                    buildGarageShareText(
                      level: state.currentLevel.level,
                      levelTitle: state.currentLevel.getLocalizedTitle(l10n),
                      totalXp: state.totalXp,
                      unlockedCount: state.unlockedCount,
                      totalBadges: state.badges.length,
                      l10n: l10n,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Progress bar to next level
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: state.levelProgress,
                minHeight: 7,
                backgroundColor: context.surfaceBg,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    state.currentLevel.getLocalizedTitle(l10n),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: context.textMuted,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 2,
                  child: Text(
                    state.nextLevel != null
                        ? l10n.gamesNextLevel(
                            state.nextLevel!.getLocalizedTitle(l10n),
                            numberFmt.format(state.nextLevel!.requiredXp),
                          )
                        : l10n.gamesMaxRank,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: context.textMuted,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Badges grid
            Text(
              l10n.gamesBadgesTitle,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: context.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            // Wrap (not GridView.shrinkWrap): a shrink-wrapped grid inside an
            // unbounded Column reserves a phantom extra row, which painted
            // ~40dp of dead space at the card's foot in both themes.
            LayoutBuilder(
              builder: (context, constraints) {
                final cellWidth = (constraints.maxWidth - 24) / 4;
                // Fixed cell height so a 2-line badge label + share row fit;
                // an aspect ratio overflowed by a fraction of a pixel at 411dp.
                final cellHeight = 74 + 22 * textScale;
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final item in state.badges)
                      SizedBox(
                        width: cellWidth,
                        height: cellHeight,
                        child: _buildBadgeItem(context, item, l10n, state),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeItem(
    BuildContext context,
    GarageBadgeStatus item,
    AppLocalizations l10n,
    GarageGamificationState state,
  ) {
    final unlocked = item.isUnlocked;
    final badge = item.badge;

    return InkWell(
      onTap: () => _showBadgeDetail(context, item, l10n, state),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: unlocked
              ? AppColors.primary.withValues(alpha: 0.08)
              : context.surfaceBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: unlocked
                ? AppColors.primary.withValues(alpha: 0.3)
                : context.borderColor,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: unlocked
                    ? AppColors.primary.withValues(alpha: 0.15)
                    : context.borderColor.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                badge.icon,
                size: 18,
                color: unlocked ? AppColors.primary : context.textMuted,
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Text(
                badge.getLocalizedTitle(l10n),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: unlocked ? FontWeight.w700 : FontWeight.w500,
                  color: unlocked ? context.textPrimary : context.textMuted,
                  height: 1.1,
                ),
              ),
            ),
            if (unlocked)
              InkWell(
                onTap: () => shareAchievementText(
                  buildGarageShareText(
                    level: state.currentLevel.level,
                    levelTitle: state.currentLevel.getLocalizedTitle(l10n),
                    totalXp: state.totalXp,
                    unlockedCount: state.unlockedCount,
                    totalBadges: state.badges.length,
                    highlight: l10n.gamesBadgeUnlockedLine(
                      badge.getLocalizedTitle(l10n),
                    ),
                    l10n: l10n,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.share_outlined,
                    size: 12,
                    color: AppColors.primary,
                    semanticLabel: l10n.gamesShare,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showBadgeDetail(
    BuildContext context,
    GarageBadgeStatus item,
    AppLocalizations l10n,
    GarageGamificationState state,
  ) {
    final badge = item.badge;
    final unlocked = item.isUnlocked;

    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      backgroundColor: context.cardBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle comes from bottomSheetTheme.showDragHandle — a
              // second hand-drawn pill painted two handles in every theme.
              const SizedBox(height: 8),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: unlocked
                      ? AppColors.primary.withValues(alpha: 0.15)
                      : context.surfaceBg,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: unlocked ? AppColors.primary : context.borderColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  badge.icon,
                  size: 28,
                  color: unlocked ? AppColors.primary : context.textMuted,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                badge.getLocalizedTitle(l10n),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: context.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                badge.getLocalizedDescription(l10n),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: context.textSecondary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: unlocked
                      ? AppColors.success.withValues(alpha: 0.12)
                      : context.surfaceBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      unlocked ? Icons.check_circle : Icons.lock_outline,
                      size: 16,
                      color: unlocked ? AppColors.success : context.textMuted,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      unlocked ? l10n.gamesUnlocked : l10n.gamesLocked,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: unlocked
                            ? context.readable(AppColors.success)
                            : context.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (unlocked)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.share_outlined, size: 16),
                    label: Text(l10n.gamesShare),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      shareAchievementText(
                        buildGarageShareText(
                          level: state.currentLevel.level,
                          levelTitle: state.currentLevel.getLocalizedTitle(
                            l10n,
                          ),
                          totalXp: state.totalXp,
                          unlockedCount: state.unlockedCount,
                          totalBadges: state.badges.length,
                          highlight: l10n.gamesBadgeUnlockedLine(
                            '${badge.getLocalizedTitle(l10n)}$kShareDash'
                            '${badge.getLocalizedDescription(l10n)}',
                          ),
                          l10n: l10n,
                        ),
                      );
                      Navigator.pop(ctx);
                    },
                  ),
                ),
              if (unlocked) const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(l10n.tutup),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
