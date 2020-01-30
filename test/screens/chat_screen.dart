import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kento/src/components/chat_app_bar.dart';
import 'package:kento/src/components/chat_list.dart';
import 'package:kento/src/components/input.dart';

void main() {
  final MaterialApp app = MaterialApp(
    home: Scaffold(body: ChatList()),
  );

  testWidgets('ConversationPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    expect(find.byType(ChatAppBar), findsOneWidget);
    expect(find.byType(Input), findsOneWidget);
    expect(find.byType(ChatList), findsOneWidget);
  });
}
