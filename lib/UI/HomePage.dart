import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              onTap: () {},
            ),
            ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.of(context).pushNamed('/About');
                })
          ],
        ),
      ),
      body: Center(
        child: new Text("Hello there"),
      ),
    );
  }
}
