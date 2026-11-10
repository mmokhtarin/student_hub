import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../providers/app_state_provider.dart';
import '../widgets/student_avatar.dart';
import 'student_details_page.dart';

/// Student Information page: searchable list of students.
///
/// Shown inside MainScreen, so it has no Scaffold/AppBar of its own.
class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  String _query = '';

  List<Student> _filter(List<Student> students) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return students;
    return students.where((student) {
      return student.name.toLowerCase().contains(query) ||
          student.matricNumber.toLowerCase().contains(query) ||
          student.programme.toLowerCase().contains(query);
    }).toList();
  }

  void _openDetails(Student student) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => StudentDetailsPage(student: student),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final students = _filter(context.watch<AppStateProvider>().students);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: SearchBar(
            hintText: 'Search student...',
            leading: const Icon(Icons.search),
            onChanged: (value) => setState(() => _query = value),
          ),
        ),
        Expanded(
          child: students.isEmpty
              ? const Center(child: Text('No students found'))
              : ListView.separated(
                  itemCount: students.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return ListTile(
                      leading: StudentAvatar(student: student),
                      title: Text(student.name),
                      subtitle: Text(
                        '${student.matricNumber}  •  ${student.programme}',
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => _openDetails(student),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
