import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../providers/app_state_provider.dart';
import '../widgets/app_drawer.dart';
import 'home_page.dart';
import 'student_list_page.dart';
import 'programmes_page.dart';
import 'about_page.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);

    final List<Widget> pages = [
      const HomePage(),
      const StudentListPage(),
      const Center(child: Text('Student Records Page (Fer)')),
      const ProgrammesPage(),
      const AboutPage(),
    ];

    final List<String> titles = [
      'StudentHub - Dashboard Portal',
      'Student Information',
      'Student Records',
      'Programmes',
      'About',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[appState.currentNavigationIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const AppDrawer(),
      body: pages[appState.currentNavigationIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: appState.currentNavigationIndex,
        onDestinationSelected: (int index) {
          appState.setNavigationIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Icon(Icons.table_chart_outlined),
            selectedIcon: Icon(Icons.table_chart),
            label: 'Records',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Programmes',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
