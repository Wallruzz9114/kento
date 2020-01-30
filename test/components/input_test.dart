import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kento/src/components/input.dart';

void main() {
  final MaterialApp app = MaterialApp(
    home: Scaffold(body: Input()),
  );

  testWidgets('InputWidget UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    expect(find.byType(IconButton), findsNWidgets(2));
    expect(find.byType(EditableText), findsOneWidget);
  });
}
