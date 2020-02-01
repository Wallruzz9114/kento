import 'package:flutter/material.dart';
import 'package:kento/src/screens/chat_screen.dart';
import 'package:rubber/rubber.dart';

class ChatSlideScreen extends StatefulWidget {
  const ChatSlideScreen();

  @override
  _ChatSlideScreenState createState() => _ChatSlideScreenState();
}

class _ChatSlideScreenState extends State<ChatSlideScreen>
    with SingleTickerProviderStateMixin {
  RubberAnimationController controller;

  @override
  void initState() {
    controller = RubberAnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <ChatScreen>[ChatScreen(), ChatScreen(), ChatScreen()],
    );
  }
}
