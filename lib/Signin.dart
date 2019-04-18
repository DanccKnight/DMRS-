import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dmrs/auth.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => new _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<bool> _loginUser() async {
    final api = await Auth.signInWithGoogle();
    if (api != null)
      return true;
    else
      return false;
  }

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
              padding: EdgeInsets.only(top: 330.0, left: 20.0, right: 20.0),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) return "Enter your email";
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: new TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 401.0, left: 20.0, right: 20.0),
              child: TextFormField(
                validator: (input) {
                  if (input.length < 5)
                    return "Password length has to be at least 5 characters";
                },
                obscureText: true,
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: new TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(155.2, 449.0, 0.0, 0.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: signIn,
                  child: new Text("Sign in"),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(115.0, 500.0, 0.0, 0.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () async {
                    bool b = await _loginUser();
                    b
                        ? Navigator.of(context).pushNamed('/Home')
                        : Scaffold.of(context).showSnackBar(
                            SnackBar(content: new Text('Sign in failed :(')));
                  },
                  child: new Text("Sign in with Google instead"),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pushNamed('/Home');
      } catch (e) {
        print(e.message);
      }
    }
  }
}
