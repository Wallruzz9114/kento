import 'package:flutter/material.dart';
import 'package:kento/src/components/chat_bottom_sheet.dart';
import 'package:kento/src/config/palette.dart';

class Input extends StatelessWidget {
  Input();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Material build(BuildContext context) {
    return Material(
        elevation: 60.0,
        child: Container(
          child: Row(
            children: <Widget>[
              Material(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: IconButton(
                    icon: Icon(Icons.face),
                    color: Palette.accentColor,
                    onPressed: () {
                      showModalBottomSheet<ChatBottomSheet>(
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              child: Wrap(
                                children: const <ChatBottomSheet>[
                                  ChatBottomSheet()
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
                color: Colors.white,
              ),

              // Text input
              Flexible(
                child: Material(
                    child: Container(
                  child: TextField(
                    style: TextStyle(
                        color: Palette.primaryTextColor, fontSize: 15.0),
                    controller: textEditingController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: Palette.greyColor),
                    ),
                  ),
                )),
              ),

              // Send Message Button
              Material(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                    color: Palette.accentColor,
                  ),
                ),
                color: Colors.white,
              ),
            ],
          ),
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(color: Palette.greyColor, width: 0.5)),
              color: Colors.white),
        ));
  }
}
