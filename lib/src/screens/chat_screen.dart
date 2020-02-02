import 'package:flutter/material.dart';
import 'package:kento/src/components/chat_app_bar.dart';
import 'package:kento/src/config/palette.dart';
import 'package:kento/src/components/chat_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Column build(BuildContext context) {
    return Column(children: <Widget>[
      const Expanded(
          flex: 2, child: ChatAppBar()), // Custom app bar for chat screen
      Expanded(
          flex: 11,
          child: Container(
            color: Palette.chatBackgroundColor,
            child: ChatList(),
          ))
    ]);
  }
}
