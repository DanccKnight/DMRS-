import 'package:flutter/material.dart';
import 'package:dmrs/Data/Comment.dart';
import 'package:dmrs/Data/Singleton.dart';

class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Comment comment = Comment(nullObj: true);

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
              else comment.regNo = input;
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
                comment.name = input;
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
                comment.feedback = input;
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
              color: Colors.blue,
              child: MaterialButton(
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () async {
                  comment.uid = UserData().user.uid;
                  if(_formKey.currentState.validate())
                  await comment.publishDoc().then((_)=>_showMessageAfterSubmit());
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

  void _showMessageAfterSubmit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Feedback submitted!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
