import 'package:flutter/material.dart';
import 'package:kento/src/components/chat_app_bar.dart';
import 'package:kento/src/components/chat_list.dart';
import 'package:kento/src/components/input.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: ChatAppBar(), // Custom app bar for chat screen
            body: Stack(children: <Widget>[
              Column(
                children: <Widget>[
                  ChatList(), //Chat list
                  Input() // The input widget
                ],
              ),
            ])));
  }
}
