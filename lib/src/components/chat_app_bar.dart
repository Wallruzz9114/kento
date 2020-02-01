import 'package:flutter/material.dart';
import 'package:kento/src/config/assets.dart';
import 'package:kento/src/config/palette.dart';
import 'package:kento/src/config/styles.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100;
  @override
  Widget build(BuildContext context) {
    // Text style for everything else
    final double width =
        MediaQuery.of(context).size.width; // calculate the screen width

    return Material(
        child: Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[
              //adds a shadow to the appbar
              BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 0.1)
            ]),
            child: Container(
                color: Palette.primaryBackgroundColor,
                child: Row(children: <Widget>[
                  Expanded(
                      //we're dividing the appbar into 7 : 3 ratio. 7 is for content and 3 is for the display picture.
                      flex: 7,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //second row containing the buttons for media
                          Container(
                              height: 23,
                              padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Photos',
                                    style: Styles.text,
                                  ),
                                  VerticalDivider(
                                    width: 30,
                                    color: Palette.primaryTextColor,
                                  ),
                                  Text(
                                    'Videos',
                                    style: Styles.text,
                                  ),
                                  VerticalDivider(
                                    width: 30,
                                    color: Palette.primaryTextColor,
                                  ),
                                  Text('Files', style: Styles.text)
                                ],
                              )),
                        ],
                      ))),
                  //This is the display picture
                  Expanded(
                      flex: 3,
                      child: Container(
                          child: Center(
                              child: CircleAvatar(
                        radius: (80 - (width * .06)) / 2,
                        backgroundImage: Image.asset(
                          Assets.user,
                        ).image,
                      )))),
                ]))));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
