import 'package:flutter/material.dart';

import '../models/student.dart';

class AppStateProvider extends ChangeNotifier {
  int _currentNavigationIndex = 0;
  final List<Student> _students = List<Student>.from(sampleStudents);

  int get currentNavigationIndex => _currentNavigationIndex;
  List<Student> get students => _students;

  void setNavigationIndex(int index) {
    if (_currentNavigationIndex != index) {
      _currentNavigationIndex = index;
      notifyListeners();
    }
  }

  int get totalStudents => _students.length;

  int countByProgramme(String programmeName) {
    return _students.where((s) => s.programme == programmeName).length;
  }
}
