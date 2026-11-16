import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../providers/app_state_provider.dart';
import '../widgets/student_avatar.dart';
import 'student_details_page.dart';

/// Category / Programme Page (Requirement #5)
/// Uses DefaultTabController, TabBar, and TabBarView to group students by programme.
class ProgrammesPage extends StatelessWidget {
  const ProgrammesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Read shared student and programme data from AppStateProvider
    final appState = context.watch<AppStateProvider>();
    final List<String> programmes = appState.uniqueProgrammes;
    final List<Student> allStudents = appState.students;

    if (programmes.isEmpty) {
      return const Center(child: Text('No programmes available'));
    }

    // 2. DefaultTabController coordinates tab selection and swipe animations
    return DefaultTabController(
      length: programmes.length,
      child: Column(
        children: [
          // 3. TabBar displays each academic programme as a scrollable tab
          Material(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            elevation: 1,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: programmes.map((programme) {
                final count = appState.countByProgramme(programme);
                return Tab(text: '$programme ($count)');
              }).toList(),
            ),
          ),

          // 4. TabBarView displays the filtered student list for each tab
          Expanded(
            child: TabBarView(
              children: programmes.map((programme) {
                final filteredStudents = allStudents
                    .where((student) => student.programme == programme)
                    .toList();

                return _ProgrammeStudentList(
                  programmeName: programme,
                  students: filteredStudents,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Helper widget that renders the header summary and student list for one tab.
class _ProgrammeStudentList extends StatelessWidget {
  const _ProgrammeStudentList({
    required this.programmeName,
    required this.students,
  });

  final String programmeName;
  final List<Student> students;

  double get _averageCgpa {
    if (students.isEmpty) return 0.0;
    final total = students.fold<double>(0.0, (sum, s) => sum + s.cgpa);
    return total / students.length;
  }

  void _openDetails(BuildContext context, Student student) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => StudentDetailsPage(student: student),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // Programme overview card at the top of the tab
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Card(
            color: colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.school_rounded,
                    size: 36,
                    color: colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          programmeName,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${students.length} ${students.length == 1 ? 'Student' : 'Students'}  •  Avg CGPA: ${_averageCgpa.toStringAsFixed(2)}',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // List of students enrolled in this programme
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: students.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                leading: StudentAvatar(student: student),
                title: Text(student.name),
                subtitle: Text(
                  '${student.matricNumber}  •  Sem ${student.semester}  •  CGPA ${student.cgpa.toStringAsFixed(2)}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openDetails(context, student),
              );
            },
          ),
        ),
      ],
    );
  }
}
