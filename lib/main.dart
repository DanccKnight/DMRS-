import 'package:flutter/material.dart';
import 'package:dmrs/UI/Signin.dart';
import 'package:dmrs/UI/HomePage.dart';
import 'package:dmrs/UI/Feedback.dart';
import 'package:dmrs/UI/UpdateMenu.dart';
import 'package:dmrs/UI/CommentsPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Mess Rating Thingy",
      theme: ThemeData.dark(),
      home: new loginPage(),
      routes: <String,WidgetBuilder>{
        '/Login': (BuildContext context) => new loginPage(),
        '/Home': (BuildContext context) => new Home(),
        '/Feedback': (BuildContext context) => new feedback(),
        '/updateMenu': (BuildContext context) => new UpdateMenu(),
        '/CommentList': (BuildContext context) => new CommentsPage()
      }
    );
  }

}