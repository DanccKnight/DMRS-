import 'package:flutter/material.dart';
import 'package:dmrs/Signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Mess Rating Thingy",
      theme: ThemeData.dark(),
      home: new loginPage(),
    );
  }
}