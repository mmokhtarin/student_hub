import 'package:flutter_test/flutter_test.dart';
import 'package:student_hub/main.dart';

void main() {
  testWidgets('StudentHub smoke test verifies initial home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StudentHubApp());
    expect(find.text('Welcome to StudentHub'), findsOneWidget);
  });
}
