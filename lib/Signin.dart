import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => new _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _email, _password;
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
                  if (input.isEmpty) return "Enter your email";
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 0.0)),
              TextFormField(
                validator: (input) {
                  if (input.length < 5)
                    return "Password length has to be at least 5 characters";
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: signIn,
                child: new Text("Sign in"),
              )
            ],
          )),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pushNamed('/Home');
      }catch(e){
        print(e.message);
      }

    }
  }
}
