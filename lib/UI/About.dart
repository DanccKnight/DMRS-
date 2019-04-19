import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          child: Center(
              child: new Text(
            "Made with blood, sweat and tears by Ansuman Acharya",
          ))),
    );
  }
}
