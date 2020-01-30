import 'package:flutter/material.dart';
import 'package:kento/src/screens/chat_list_screen.dart';

class Kento extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kento',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChatListScreen());
  }
}
