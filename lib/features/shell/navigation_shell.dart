import 'package:flutter/material.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class NavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationShell({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: context.borderColor, width: 1),
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _onTap,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.garage_outlined),
              selectedIcon: const Icon(Icons.garage),
              label: l10n.navGarage,
            ),
            NavigationDestination(
              icon: const Icon(Icons.build_outlined),
              selectedIcon: const Icon(Icons.build),
              label: l10n.navMaintenance,
            ),
            NavigationDestination(
              icon: const Icon(Icons.local_gas_station_outlined),
              selectedIcon: const Icon(Icons.local_gas_station),
              label: l10n.navFuel,
            ),
            NavigationDestination(
              icon: const Icon(Icons.folder_shared_outlined),
              selectedIcon: const Icon(Icons.folder_shared),
              label: l10n.navGlovebox,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: l10n.navSettings,
            ),
          ],
        ),
      ),
    );
  }
}
