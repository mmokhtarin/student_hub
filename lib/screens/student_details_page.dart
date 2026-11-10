import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/student.dart';
import '../widgets/student_avatar.dart';

/// Student Details page: full info, with SelectableText for key fields.
class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key, required this.student});

  final Student student;

  Future<void> _copyInfo(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(
      ClipboardData(
        text:
            'Name: ${student.name}\n'
            'Matric No: ${student.matricNumber}\n'
            'Programme: ${student.programme}\n'
            'Email: ${student.email}',
      ),
    );
    messenger.showSnackBar(
      const SnackBar(content: Text('Student info copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            StudentAvatar(student: student, radius: 56),
            const SizedBox(height: 16),
            Text(
              student.name,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            SelectableText(student.matricNumber, style: textTheme.titleMedium),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  _InfoTile(
                    icon: Icons.school_outlined,
                    label: 'Programme',
                    value: student.programme,
                  ),
                  const Divider(height: 1),
                  _InfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: student.email,
                  ),
                  const Divider(height: 1),
                  _InfoTile(
                    icon: Icons.calendar_today_outlined,
                    label: 'Semester',
                    value: '${student.semester}',
                  ),
                  const Divider(height: 1),
                  _InfoTile(
                    icon: Icons.grade_outlined,
                    label: 'CGPA',
                    value: student.cgpa.toStringAsFixed(2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _copyInfo(context),
              icon: const Icon(Icons.copy),
              label: const Text('Copy Info'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Icon(icon),
      title: Text(label, style: textTheme.bodySmall),
      subtitle: SelectableText(value, style: textTheme.bodyLarge),
    );
  }
}
