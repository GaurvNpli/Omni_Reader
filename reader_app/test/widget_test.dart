// Basic smoke test for Reader app.
import 'package:flutter_test/flutter_test.dart';
import 'package:reader_app/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ReaderApp());

    // Verify that the app renders without crashing.
    expect(find.byType(ReaderApp), findsOneWidget);
  });
}
