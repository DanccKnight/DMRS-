import 'package:flutter/material.dart';
import 'package:dmrs/UI/Signin.dart';
import 'package:dmrs/UI/HomePage.dart';
import 'package:dmrs/UI/SignUp.dart';
import 'package:dmrs/UI/About.dart';
import 'package:dmrs/UI/Menu.dart';
import 'package:dmrs/Data/MenuTile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Mess Rating Thingy",
      theme: ThemeData(primaryColor: Color.fromRGBO(58,66,86,1.0)),
      home: new loginPage(),
      routes: <String,WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/SignUp': (BuildContext context) => new SignupPage(),
        '/About': (BuildContext context) => new AboutPage(),
        '/Menu': (BuildContext context) => new Menu()
      }
    );
  }

}