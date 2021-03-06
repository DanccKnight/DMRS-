import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dmrs/Data/Singleton.dart';
import 'package:dmrs/Data/MessMenu.dart';
import 'package:dmrs/Data/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TapGestureRecognizer _githubTapRecognizer;

  UserData user = UserData();
  final String _b = "Breakfast";
  final String _l = "Lunch";
  final String _ht = "Hi-Tea";
  final String _d = "Dinner";

  @override
  void initState() {
    super.initState();
    _githubTapRecognizer = new TapGestureRecognizer()
      ..onTap = () => _openUrl(githubUrl);
    Future.delayed(Duration(seconds: 1), () => askIfEmployee());
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }

  askIfEmployee() {
    if (UserData().user.isEmployee == null) {
      displayMessage();
    }
  }

  @override
  void dispose() {
    _githubTapRecognizer.dispose();
    super.dispose();
  }

  void _openUrl(String url) async {
    // Close the about dialog.static Future<bool> signUpWithGoogle({bool silent})
    Navigator.pop(context);

    if (await canLaunch(url)) {
      await launch(url);
    } else {_messMenu.dinner = "Not updated yet, keep checking for updates!";
      throw 'Could not launch $url';
    }
  }

  MessMenu _messMenu;

  @override
  Widget build(BuildContext context) {
    return mainThing();
  }

  void showSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
            child: Text("Sorry, this function exists only for Employees."),
          );
        });
  }

  void showEmployeeSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
            child: Text("Sorry, this function exists only for the students."),
          );
        });
  }

  Widget mainThing() {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Today's Menu"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  if (UserData().user.isEmployee == true)
                    Navigator.of(context).pushNamed('/CommentList');
                  else
                    showSheet();
                }),
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Auth().logoutUser().then((_) {
                    Navigator.of(context).pushReplacementNamed('/Login');
                  });
                })
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(UserData().fireUser == null
                    ? ""
                    : UserData().fireUser.displayName),
                accountEmail: Text(UserData().fireUser == null
                    ? ""
                    : UserData().fireUser.email),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        UserData().fireUser == null
                            ? ""
                            : user.fireUser.photoUrl),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('Feedback'),
                onTap: () {
                  if(UserData().user.isEmployee==false)
                    Navigator.of(context).pushNamed('/Feedback');
                  else
                    showEmployeeSheet();
                },
              ),
              ListTile(
                title: Text('About'),
                onTap: () => _showAbout("About"),
              )
            ],
          ),
        ),
        body: Center(
            child: Column(children: <Widget>[
          card(_b),
          card(_l),
          card(_ht),
          card(_d),
        ])),
        floatingActionButton: new FloatingActionButton(
          onPressed: onPressedFAB,
          child: Icon(
            Icons.edit,
            color: Colors.black87,
          ),
          backgroundColor: Colors.blue,
        ));
  }

  void onPressedFAB() {
    //askIfEmployee();
    if (user.user.isEmployee == true) {
      Navigator.of(context).pushNamed('/updateMenu');
    } else {
      showSheet();
    }
  }

  static const String githubUrl = 'https://github.com/DanccKnight/DMRS-';

  void _showAbout(String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(value),
          content: new RichText(
              text: new TextSpan(
                  text:
                      'This app has been made using Flutter and Cloud Firestore. Feel free to check out the code at: ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                new TextSpan(
                    text: 'https://github.com/DanccKnight/DMRS-',
                    recognizer: _githubTapRecognizer,
                    style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline)),
              ])),
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

  MessMenu messMenu = MessMenu();

  void displayMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Are you a student or an employee?",
                style: TextStyle(fontSize: 20.0, color: Colors.black87)),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    UserData().user.isEmployee = true;
                    UserData().user.setEmployee(UserData().user.isEmployee);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Employee",
                  )),
              FlatButton(
                  onPressed: () {
                    UserData().user.isEmployee = false;
                    UserData().user.setEmployee(UserData().user.isEmployee);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Student",
                  ))
            ],
          );
        });
  }

  void _showMenu(String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        if (value == _b)
          return bdialog(value);
        else if (value == _l)
          return ldialog(value);
        else if (value == _ht)
          return htdialog(value);
        else if (value == _d) return ddialog(value);
      },
    );
  }

  Widget bdialog(String value) {
    return AlertDialog(
      title: new Text(value),
      content: FutureBuilder(
          future: Firestore.instance.collection('messmenu').getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.data != null)
              return Text(snapshot.data.documents[0].data['breakfast']);
            return Text("Loading");
          }),
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
  }

  Widget ldialog(String value) {
    return AlertDialog(
      title: new Text(value),
      content: FutureBuilder(
          future: Firestore.instance.collection('messmenu').getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.data != null)
              return Text(snapshot.data.documents[0].data['lunch']);
            return Text("Loading");
          }),
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
  }

  Widget htdialog(String value) {
    return AlertDialog(
      title: new Text(value),
      content: FutureBuilder(
          future: Firestore.instance.collection('messmenu').getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.data != null)
              return Text(snapshot.data.documents[0].data['hitea']);
            return Text("Loading");
          }),
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
  }

  Widget ddialog(String value) {
    return AlertDialog(
      title: new Text(value),
      content: FutureBuilder(
          future: Firestore.instance.collection('messmenu').getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.data != null)
              return Text(snapshot.data.documents[0].data['dinner']);
            return Text("Loading");
          }),
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
  }

  Widget card(String value) {
    return Container(
        child: Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.black))),
              child: Icon(Icons.fastfood, color: Colors.black),
            ),
            title: Text(value),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.black, size: 30.0),
            onTap: () => _showMenu(value)),
      ),
    ));
  }
}
