import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/fuel/fuel_logs_screen.dart';
import '../../features/garage/garage_dashboard_screen.dart';
import '../../features/glovebox/glovebox_screen.dart';
import '../../features/maintenance/maintenance_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/shell/navigation_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationShell(navigationShell: navigationShell);
      },
      branches: [
        // Tab 1: Garasi
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const GarageDashboardScreen(),
            ),
          ],
        ),
        // Tab 2: Perawatan & Servis
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/maintenance',
              builder: (context, state) => const MaintenanceScreen(),
            ),
            // Legacy alias
            GoRoute(
              path: '/service',
              builder: (context, state) => const MaintenanceScreen(),
            ),
          ],
        ),
        // Tab 3: BBM
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/fuel',
              builder: (context, state) => const FuelLogsScreen(),
            ),
          ],
        ),
        // Tab 4: Brankas & Pajak
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/glovebox',
              builder: (context, state) => const GloveboxScreen(),
            ),
          ],
        ),
        // Tab 5: Pengaturan
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
