import 'package:flutter/material.dart';
import 'package:kento/src/components/navigation_pill.dart';
import 'package:kento/src/config/palette.dart';
import 'package:kento/src/config/styles.dart';
import 'package:kento/src/components/chat_row.dart';

class ChatBottomSheet extends StatefulWidget {
  const ChatBottomSheet();

  @override
  _ChatBottomSheetState createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(children: <Widget>[
              GestureDetector(
                child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: <Widget>[
                      NavigationPill(),
                      Center(
                          child: Text('Messages', style: Styles.textHeading)),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
                onVerticalDragEnd: (DragEndDetails details) {
                  print('Dragged Down');
                  if (details.primaryVelocity > 50) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(left: 75, right: 20),
                    child: Divider(
                      color: Palette.accentColor,
                    )),
                itemBuilder: (BuildContext context, int index) {
                  return ChatRow();
                },
              )
            ])));
  }
}
