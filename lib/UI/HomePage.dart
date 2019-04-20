import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dmrs/Data/Singleton.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TapGestureRecognizer _githubTapRecognizer;

  UserData user = UserData();
  bool _ask;
  final String _b = "Breakfast";
  final String _l = "Lunch";
  final String _ht = "Hi-Tea";
  final String _d = "Dinner";

  @override
  void initState() {
    super.initState();
    _githubTapRecognizer = new TapGestureRecognizer()
      ..onTap = () => _openUrl(githubUrl);
    askIfEmployee(user);
    Future.delayed(Duration(seconds: 2), () => setState(() {}));
  }

  askIfEmployee(UserData user) {
    if (user.user.isEmployee == null) {
      _ask = true;
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
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainThing();
  }

  Widget mainThing() {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Today's Menu"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                    UserData().fireUser == null ? "" : UserData().fireUser
                        .displayName),
                accountEmail: Text(
                    UserData().fireUser == null ? "" : UserData().fireUser
                        .email),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        UserData().fireUser == null ? "" : user.fireUser
                            .photoUrl),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              ListTile(
                title: Text('Feedback'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Feedback');
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
          child: Icon(Icons.edit,
            color: Colors.black,
          ),
          backgroundColor: Colors.blueAccent,
        ));
  }

  void onPressedFAB() {
    if (user.user.isEmployee == true) {
      Navigator.of(context).pushNamed('/updateMenu');
    }
    else
      null;
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

  void _showMenu(String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(value),
          content: new Text("Pretend this is the menu"),
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
                          right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
                  child: Icon(Icons.fastfood, color: Colors.white),
                ),
                title: Text(value),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0),
                onTap: () => _showMenu(value)),
          ),
        ));
  }

}
