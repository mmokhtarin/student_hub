import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../providers/app_state_provider.dart';

class StudentRecordPage extends StatefulWidget {
  const StudentRecordPage({super.key});

  @override
  State<StudentRecordPage> createState() => _StudentRecordPageState();
}

class _StudentRecordPageState extends State<StudentRecordPage> {
  int _sortColumnIndex = 1;
  bool _sortAscending = true;
  int Function(Student, Student) _compareStudents = (a, b) =>
      a.name.toLowerCase().compareTo(b.name.toLowerCase());

  void _sortBy(
    int columnIndex,
    bool ascending,
    int Function(Student, Student) compareStudents,
  ) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
      _compareStudents = compareStudents;
    });
  }

  @override
  Widget build(BuildContext context) {
    final students = context.watch<AppStateProvider>().students.toList()
      ..sort(
        (a, b) =>
            _sortAscending ? _compareStudents(a, b) : _compareStudents(b, a),
      );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Student records (${students.length})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  const DataColumn(label: Text('ID')),
                  DataColumn(
                    label: const Text('Name'),
                    onSort: (columnIndex, ascending) => _sortBy(
                      columnIndex,
                      ascending,
                      (a, b) =>
                          a.name.toLowerCase().compareTo(b.name.toLowerCase()),
                    ),
                  ),
                  DataColumn(
                    label: const Text('Matric No.'),
                    onSort: (columnIndex, ascending) => _sortBy(
                      columnIndex,
                      ascending,
                      (a, b) => a.matricNumber.compareTo(b.matricNumber),
                    ),
                  ),
                  const DataColumn(label: Text('Programme')),
                  DataColumn(
                    label: const Text('CGPA'),
                    numeric: true,
                    onSort: (columnIndex, ascending) => _sortBy(
                      columnIndex,
                      ascending,
                      (a, b) => a.cgpa.compareTo(b.cgpa),
                    ),
                  ),
                  DataColumn(
                    label: const Text('Semester'),
                    numeric: true,
                    onSort: (columnIndex, ascending) => _sortBy(
                      columnIndex,
                      ascending,
                      (a, b) => a.semester.compareTo(b.semester),
                    ),
                  ),
                ],
                rows: students
                    .map(
                      (student) => DataRow(
                        key: ValueKey(student.id),
                        cells: [
                          DataCell(Text(student.id)),
                          DataCell(Text(student.name)),
                          DataCell(Text(student.matricNumber)),
                          DataCell(Text(student.programme)),
                          DataCell(Text(student.cgpa.toStringAsFixed(2))),
                          DataCell(Text('${student.semester}')),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
