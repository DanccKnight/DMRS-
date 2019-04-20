import 'package:flutter/material.dart';
import 'package:dmrs/Data/MessMenu.dart';

class UpdateMenu extends StatefulWidget {
  @override
  _UpdateMenuState createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MessMenu _messMenu = MessMenu(nullObj: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Update Today's Menu"),
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
                    if (input.isEmpty)
                      return "Enter today's breakfast";
                    else
                      _messMenu.breakfast = input;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: 'Breakfast',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0)),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty)
                      return "Enter today's lunch";
                    else
                      _messMenu.lunch = input;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: 'Lunch',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0)),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty)
                      return "Enter today's Hi-Tea";
                    else
                      _messMenu.hitea = input;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: 'Hi-Tea',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0)),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty)
                      return "Enter today's dinner";
                    else
                      _messMenu.dinner = input;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: 'Dinner',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0.0, 28.0, 0.0, 0.0)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xff01A0C7),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {
                          if (_formKey.currentState.validate())
                            await _messMenu.publishDoc();
                        },
                        child: Text("Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
