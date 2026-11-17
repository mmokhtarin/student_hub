import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_hub/main.dart';

void main() {
  testWidgets('Students tab lists students and opens details', (tester) async {
    await tester.pumpWidget(const StudentHubApp());

    await tester.tap(find.text('Students'));
    await tester.pumpAndSettle();

    expect(find.text('Muhammad Mokhtarin'), findsOneWidget);

    await tester.tap(find.text('Muhammad Mokhtarin'));
    await tester.pumpAndSettle();

    expect(find.text('Student Details'), findsOneWidget);
    expect(find.text('Copy Info'), findsOneWidget);
    expect(find.text('105256@siswa.unimas.my'), findsOneWidget);
  });

  testWidgets('Search filters the student list', (tester) async {
    await tester.pumpWidget(const StudentHubApp());

    await tester.tap(find.text('Students'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(SearchBar), 'george');
    await tester.pump();

    expect(find.text('George Rusli'), findsOneWidget);
    expect(find.text('Muhammad Mokhtarin'), findsNothing);
  });

  testWidgets('Records table displays students and sorts columns', (
    tester,
  ) async {
    await tester.pumpWidget(const StudentHubApp());
    await tester.tap(find.text('Records'));
    await tester.pumpAndSettle();

    final table = tester.widget<DataTable>(find.byType(DataTable));
    expect(table.columns, hasLength(6));
    expect(table.rows, hasLength(10));
    expect(table.sortColumnIndex, 1);
    expect(table.sortAscending, isTrue);
    expect(_cellText(table.rows.first, 1), 'Ahmad Haziq Irfan');

    await tester.tap(find.text('Name'));
    await tester.pumpAndSettle();

    var sortedTable = tester.widget<DataTable>(find.byType(DataTable));
    expect(sortedTable.sortColumnIndex, 1);
    expect(sortedTable.sortAscending, isFalse);
    expect(_cellText(sortedTable.rows.first, 1), 'Nur Damia Syazana');

    await tester.ensureVisible(find.text('CGPA'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CGPA'));
    await tester.pumpAndSettle();

    sortedTable = tester.widget<DataTable>(find.byType(DataTable));
    expect(sortedTable.sortColumnIndex, 4);
    expect(sortedTable.sortAscending, isTrue);
    expect(_cellText(sortedTable.rows.first, 4), '3.60');
  });
}

String? _cellText(DataRow row, int columnIndex) {
  final child = row.cells[columnIndex].child;
  return child is Text ? child.data : null;
}
