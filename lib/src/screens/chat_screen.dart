import 'package:flutter/material.dart';
import 'package:kento/src/components/chat_app_bar.dart';
import 'package:kento/src/components/chat_bottom_sheet.dart';
import 'package:kento/src/components/input.dart';
import 'package:kento/src/config/palette.dart';
import 'package:kento/src/components/chat_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: ChatAppBar(), // Custom app bar for chat screen
            body: Container(
                color: Palette.chatBackgroundColor,
                child: Stack(children: <Widget>[
                  Column(
                    children: <Widget>[
                      ChatList(),
                      GestureDetector(
                          child: Input(),
                          onPanUpdate: (DragUpdateDetails details) {
                            if (details.delta.dy < 0) {
                              _scaffoldKey.currentState.showBottomSheet<void>(
                                  (BuildContext context) {
                                return const ChatBottomSheet();
                              });
                            }
                          })
                    ],
                  ),
                ]))));
  }
}
