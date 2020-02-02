import 'package:flutter/material.dart';
import 'package:kento/src/screens/register_screen.dart';

class Kento extends StatelessWidget {
  // This widget is the root of your application.
  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kento',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegisterScreen());
  }
}
