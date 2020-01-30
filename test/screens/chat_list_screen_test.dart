import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kento/src/components/chat_list.dart';
import 'package:kento/src/screens/chat_list_screen.dart';

void main() {
  final MaterialApp app = MaterialApp(
    home: Scaffold(body: ChatListScreen()),
  );

  testWidgets('ConversationPageList UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);
    expect(find.byType(ChatList), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
  });
}
