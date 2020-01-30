import 'package:flutter_test/flutter_test.dart';
import 'package:kento/src/kento.dart';
import 'package:kento/src/screens/chat_list_screen.dart';

void main() {
  testWidgets('Main UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Kento());

    expect(find.byType(ChatListScreen), findsOneWidget);
  });
}
