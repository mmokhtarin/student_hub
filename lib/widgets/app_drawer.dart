import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            accountName: const Text(
              'StudentHub Portal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text('admin@studenthub.edu.my'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.school, size: 40, color: Colors.blueAccent),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            selected: appState.currentNavigationIndex == 0,
            onTap: () {
              appState.setNavigationIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text('Student Information'),
            selected: appState.currentNavigationIndex == 1,
            onTap: () {
              appState.setNavigationIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_chart_outlined),
            title: const Text('Student Records'),
            selected: appState.currentNavigationIndex == 2,
            onTap: () {
              appState.setNavigationIndex(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: const Text('Programmes / Tabs'),
            selected: appState.currentNavigationIndex == 3,
            onTap: () {
              appState.setNavigationIndex(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About / Profile'),
            selected: appState.currentNavigationIndex == 4,
            onTap: () {
              appState.setNavigationIndex(4);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
