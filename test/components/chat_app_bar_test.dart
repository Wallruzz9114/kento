import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kento/src/components/chat_app_bar.dart';

void main() {
  final MaterialApp app = MaterialApp(
    home: Scaffold(body: ChatAppBar()),
  );
  testWidgets('ChatAppBar UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
