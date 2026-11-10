import 'package:flutter/material.dart';
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
}
