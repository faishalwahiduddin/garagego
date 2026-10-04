import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/models/garage_gamification.dart';
import '../../providers/garage_gamification_provider.dart';
import 'share_achievement.dart';

class GarageAchievementsCard extends ConsumerWidget {
  const GarageAchievementsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(garageGamificationProvider);
    final isId = Localizations.localeOf(context).languageCode == 'id';
    final numberFmt = NumberFormat('#,###', isId ? 'id_ID' : 'en_US');

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
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'LVL ${state.currentLevel.level}',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              state.currentLevel.getLocalizedTitle(context),
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
                        '${numberFmt.format(state.totalXp)} XP Total • ${state.unlockedCount}/${state.badges.length} ${isId ? "Lencana Terbuka" : "Badges Unlocked"}',
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
                  tooltip: isId ? 'Bagikan' : 'Share',
                  icon: const Icon(Icons.share_outlined),
                  color: AppColors.primary,
                  onPressed: () => shareAchievementText(
                    buildGarageShareText(
                      level: state.currentLevel.level,
                      levelTitle:
                          state.currentLevel.getLocalizedTitle(context),
                      totalXp: state.totalXp,
                      unlockedCount: state.unlockedCount,
                      totalBadges: state.badges.length,
                      isId: isId,
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
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.currentLevel.getLocalizedTitle(context),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: context.textMuted,
                  ),
                ),
                Text(
                  state.nextLevel != null
                    ? '${isId ? "Menuju" : "Next"}: ${state.nextLevel!.getLocalizedTitle(context)} (${numberFmt.format(state.nextLevel!.requiredXp)} XP)'
                    : (isId ? 'Pangkat Maksimal' : 'Max Rank Reached'),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: context.textMuted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Badges grid
            Text(
              isId ? 'Lencana Disiplin Garasi' : 'Garage Maintenance Badges',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: context.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.9,
              ),
              itemCount: state.badges.length,
              itemBuilder: (ctx, index) {
                final item = state.badges[index];
                return _buildBadgeItem(context, item, isId, state);
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
    bool isId,
    GarageGamificationState state,
  ) {
    final unlocked = item.isUnlocked;
    final badge = item.badge;

    return InkWell(
      onTap: () => _showBadgeDetail(context, item, isId, state),
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
                color: unlocked
                    ? AppColors.primary
                    : context.textMuted,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              badge.getLocalizedTitle(context),
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
            if (unlocked)
              InkWell(
                onTap: () => shareAchievementText(
                  buildGarageShareText(
                    level: state.currentLevel.level,
                    levelTitle: state.currentLevel.getLocalizedTitle(context),
                    totalXp: state.totalXp,
                    unlockedCount: state.unlockedCount,
                    totalBadges: state.badges.length,
                    highlight:
                        '${isId ? 'Lencana terbuka' : 'Badge unlocked'}: ${badge.getLocalizedTitle(context)}',
                    isId: isId,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.share_outlined,
                    size: 12,
                    color: AppColors.primary,
                    semanticLabel: isId ? 'Bagikan' : 'Share',
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
    bool isId,
    GarageGamificationState state,
  ) {
    final badge = item.badge;
    final unlocked = item.isUnlocked;

    showModalBottomSheet<void>(
      context: context,
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
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.borderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
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
                badge.getLocalizedTitle(context),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: context.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                badge.getLocalizedDescription(context),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: context.textSecondary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                      unlocked
                          ? (isId ? 'Terbuka (+100 XP)' : 'Unlocked (+100 XP)')
                          : (isId ? 'Belum Tercapai' : 'Not Unlocked Yet'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: unlocked ? AppColors.success : context.textMuted,
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
                    label: Text(isId ? 'Bagikan' : 'Share'),
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
                          levelTitle:
                              state.currentLevel.getLocalizedTitle(context),
                          totalXp: state.totalXp,
                          unlockedCount: state.unlockedCount,
                          totalBadges: state.badges.length,
                          highlight:
                              '${isId ? 'Lencana terbuka' : 'Badge unlocked'}: ${badge.getLocalizedTitle(context)} — ${badge.getLocalizedDescription(context)}',
                          isId: isId,
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
                  child: Text(isId ? 'Tutup' : 'Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
