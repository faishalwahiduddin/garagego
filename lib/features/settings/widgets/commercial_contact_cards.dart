import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/contact_constants.dart';
import '../../../core/constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';

/// Two tappable cards (commercial use, app acquisition) that open a
/// pre-filled email to [kContactEmail].
class CommercialContactCards extends StatelessWidget {
  const CommercialContactCards({super.key, required this.appName});

  final String appName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        _ContactCard(
          icon: Icons.business_center_outlined,
          title: l10n.commercialContactTitle,
          description: l10n.commercialContactDesc,
          trailingText: kContactEmail,
          onTap: () => _openMail(context, '[Commercial] $appName'),
        ),
        const SizedBox(height: 10),
        _ContactCard(
          icon: Icons.handshake_outlined,
          title: l10n.acquireAppTitle,
          description: l10n.acquireAppDesc,
          onTap: () => _openMail(context, '[Acquisition] $appName'),
        ),
      ],
    );
  }

  Future<void> _openMail(BuildContext context, String subject) async {
    final l10n = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.maybeOf(context);
    var launched = false;
    try {
      final info = await PackageInfo.fromPlatform();
      final platform = kIsWeb ? 'web' : defaultTargetPlatform.name;
      final body =
          'App: $appName v${info.version}+${info.buildNumber}\nPlatform: $platform\n\n';
      final uri = Uri(
        scheme: 'mailto',
        path: kContactEmail,
        query: encodeQueryParameters({'subject': subject, 'body': body}),
      );
      launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      launched = false;
    }
    if (launched) return;
    var copied = true;
    try {
      await Clipboard.setData(const ClipboardData(text: kContactEmail));
    } catch (_) {
      copied = false;
    }
    if (!context.mounted) return;
    messenger?.showSnackBar(
      SnackBar(content: Text(copied ? l10n.contactEmailCopied : kContactEmail)),
    );
  }
}

/// Encodes with %20 (not '+') so mail clients show spaces correctly.
@visibleForTesting
String encodeQueryParameters(Map<String, String> params) => params.entries
    .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
    .join('&');

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    this.trailingText,
  });

  final IconData icon;
  final String title;
  final String description;
  final String? trailingText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = context.readable(AppColors.primary);
    return Semantics(
      button: true,
      container: true,
      label: '$title. $description',
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ExcludeSemantics(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, size: 20, color: accent),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: context.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 12,
                              color: context.textSecondary,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (trailingText != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        trailingText!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: accent,
                        ),
                      ),
                    ],
                    const SizedBox(width: 4),
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: context.textMuted,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
