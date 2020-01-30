import 'package:flutter/material.dart';
import 'package:kento/src/screens/chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[ChatScreen(), ChatScreen(), ChatScreen()],
    );
  }
}
