import 'package:flutter/material.dart';
import 'package:dmrs/UI/Signin.dart';
import 'package:dmrs/UI/HomePage.dart';
import 'package:dmrs/UI/SignUp.dart';
import 'package:dmrs/UI/Feedback.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Mess Rating Thingy",
      theme: ThemeData.dark(),
      home: new loginPage(),
      routes: <String,WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/SignUp': (BuildContext context) => new SignupPage(),
        '/Feedback': (BuildContext context) => new feedback(),
      }
    );
  }

}