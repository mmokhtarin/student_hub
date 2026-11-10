import 'package:flutter/material.dart';

import '../models/student.dart';

/// Circular avatar showing a student's initials (no image assets needed).
class StudentAvatar extends StatelessWidget {
  const StudentAvatar({super.key, required this.student, this.radius = 20});

  final Student student;
  final double radius;

  String get _initials {
    final parts = student.name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: radius,
      backgroundColor: colors.primaryContainer,
      foregroundColor: colors.onPrimaryContainer,
      child: Text(
        _initials,
        style: TextStyle(fontSize: radius * 0.7, fontWeight: FontWeight.bold),
      ),
    );
  }
}
