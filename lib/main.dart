import 'package:flurs/login/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
          child: Login(),
        ),
      ),
    );
  }
}
