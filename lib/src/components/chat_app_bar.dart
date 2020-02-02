import 'package:flutter/material.dart';
import 'package:kento/src/config/assets.dart';
import 'package:kento/src/config/palette.dart';
import 'package:kento/src/config/styles.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar();

  double get height => 100.0;

  @override
  Material build(BuildContext context) {
    return Material(
        child: Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[
              //adds a shadow to the appbar
              BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 0.1)
            ]),
            child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: Palette.primaryBackgroundColor,
                child: Row(children: <Widget>[
                  Expanded(
                      //we're dividing the appbar into 7 : 3 ratio. 7 is for content and 3 is for the display picture.
                      flex: 7,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                              flex: 7,
                              child: Container(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.attach_file,
                                                color: Palette.secondaryColor,
                                              ),
                                              onPressed: () {}))),
                                  Expanded(
                                      flex: 6,
                                      child: Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text('Aditya Gurjar',
                                              style: Styles.textHeading),
                                          Text('@adityagurjar',
                                              style: Styles.text)
                                        ],
                                      ))),
                                ],
                              ))),
                          //second row containing the buttons for media
                          Expanded(
                              flex: 3,
                              child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  ))),
                        ],
                      ))),
                  //This is the display picture
                  Expanded(
                      flex: 3,
                      child: Container(
                          child: Center(
                              child: CircleAvatar(
                        radius: 30,
                        backgroundImage: Image.asset(
                          Assets.user,
                        ).image,
                      )))),
                ]))));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
