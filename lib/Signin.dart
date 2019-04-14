import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => new _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _regNo, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Sign In"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) return "Enter your registration number";
                },
                onSaved: (input) => _regNo = input,
                decoration: InputDecoration(labelText: 'Registration Number'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 0.0)),
              TextFormField(
                validator: (input) {
                  if (input.length < 7)
                    return "Too weak(just like your pullout game)";
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {},
                child: new Text("Submit"),
              )
            ],
          )),
    );
  }

  void signIn() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      //TODO:login to firebase
    } else {
      //TODO:don't login to firebase
    }
  }
}