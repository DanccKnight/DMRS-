import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dmrs/Data/Singleton.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback")),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('comments').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Connecting...');
          final int cardLength = snapshot.data.documents.length;
          return ListView.builder(
            itemCount: cardLength,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot _card = snapshot.data.documents[index];
              return ListTile(
                leading: CircleAvatar(backgroundImage: new NetworkImage(UserData().fireUser.photoUrl)),
                title: Text(_card['name']),
                subtitle: Text(_card['feedback']),
              );
            },
          );
        },
      ),
    );
  }
}
