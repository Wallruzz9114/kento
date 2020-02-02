import 'package:flutter/material.dart';
import 'package:kento/src/components/chat_bottom_sheet.dart';
import 'package:kento/src/components/input.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = RubberAnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            body: Column(
              children: <Widget>[
                Expanded(
                    child: PageView(
                  children: const <Widget>[
                    ChatScreen(),
                    ChatScreen(),
                    ChatScreen()
                  ],
                )),
                Container(
                    child: GestureDetector(
                        child: Input(),
                        onPanUpdate: (DragUpdateDetails details) {
                          if (details.delta.dy < 0) {
                            _scaffoldKey.currentState
                                .showBottomSheet<void>((BuildContext context) {
                              return const ChatBottomSheet();
                            });
                          }
                        }))
              ],
            )));
  }
}
