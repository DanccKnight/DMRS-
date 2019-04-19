import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TapGestureRecognizer _githubTapRecognizer;

  @override
  void initState() {
    super.initState();
    _githubTapRecognizer = new TapGestureRecognizer()
      ..onTap = () => _openUrl(githubUrl);
  }

  @override
  void dispose() {
    _githubTapRecognizer.dispose();
    super.dispose();
  }

  void _openUrl(String url) async {
    // Close the about dialog.
    Navigator.pop(context);

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Username'),
              decoration: BoxDecoration(color: Colors.indigoAccent),
            ),
            ListTile(
              title: Text('Mess Menu'),
              onTap: () {
                Navigator.of(context).pushNamed('/Menu');
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
        child: new Text("Hello there"),
      ),
    );
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
                      'The app has been made using Flutter, check out the source code from: ',
                  children: <TextSpan>[
                new TextSpan(
                    text: 'https://github.com/DanccKnight/DMRS-',
                    recognizer: _githubTapRecognizer,
                    style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline))
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
}
