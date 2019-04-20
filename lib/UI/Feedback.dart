import 'package:flutter/material.dart';
import 'package:dmrs/Data/Comment.dart';

class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Comment _comment = Comment(nullObj: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Feedback"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
                children: <Widget>[
            Container(
            padding: EdgeInsets.only(top: 15.0),
          ),
          TextFormField(
            validator: (input) {
              if (input.isEmpty) return "Enter your registration number";
              else _comment.regNo = input;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: 'Registration No',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0)),
          TextFormField(
            validator: (input) {
              if (input.isEmpty)
                return "Enter your name";
              else
                _comment.name = input;
            } ,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: 'Name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            obscureText: false,
          ),
          Padding(padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0)),
          TextFormField(
            validator: (input) {
              if (input.isEmpty)
                return "Enter your comments";
              else
                _comment.feedback = input;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: 'Comments',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            obscureText: false,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () async {
                  if(_formKey.currentState.validate())
                  await _comment.publishDoc();
                },
                child: Text("Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)
                ),
              ),
            ))
            ],
          )),
        ),);
  }
}
