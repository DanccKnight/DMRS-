import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dmrs/Data/auth.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => new _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final snackbar = SnackBar(content: new Text("Google Sign In Failed"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(18.0, 120.0, 0.0, 0.0),
              child: new Text(
                'Hello',
                style: new TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.5, 187.0, 0.0, 0.0),
              child: new Text(
                'There.',
                style: new TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(180.0, 459.0, 0.0, 0.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () async {
                    if (await Auth.signInWithGoogle() == true)
                      Navigator.of(context).pushReplacementNamed('/Home');
                  },
                  child: new Text("Sign in with Google"),
                )),
          ],
        ),
      ),
    );
  }
}
