import 'package:flutter/material.dart';
import 'package:dmrs/Data/auth.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => new _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final snackbar = SnackBar(content: new Text("Google Sign In Failed"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            /*Container(
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
            ),*/
            Container(
              padding: EdgeInsets.fromLTRB(107.0, 150.0, 0.0, 0.0),
              child: FlutterLogo(size: 150.0),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(95.0, 389.0, 0.0, 0.0),
              child: Text("The Mess Rating System",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20.0, 468.0, 20.0, 0.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      if (await Auth.signInWithGoogle() == true)
                        Future.delayed(
                            Duration(seconds: 1),
                                () => Navigator.of(context)
                                .pushReplacementNamed('/Home'));
                    },
                    child: Text("Login with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle().copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
