import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  User(
      {@required this.uid,
        this.email,
        this.name,
        this.profileImage,
        this.isEmployee}) {
    _fetchUser(setInitialize: true);
  }

  String uid;
  String email;
  String name;
  String profileImage;
  bool isEmployee;
  bool initialized = false;

  void _fetchUser({bool setInitialize = false}) {
    Firestore.instance
        .collection('users')
        .where('id', isEqualTo: this.uid)
        .getDocuments()
        .then((result) {
      if (result.documents.length == 0) return;
      name = result.documents.elementAt(0)['name'];
      email = result.documents.elementAt(0)['email'];
      profileImage = result.documents.elementAt(0)['photoUrl'];
      isEmployee = result.documents.elementAt(0)['isEmployee'];
      serverUpdate();
      initialized = true;
    });
  }

  void setEmployee(bool isEmployee) {
    this.isEmployee = isEmployee;
    serverUpdate();
  }

  Map<String, dynamic> toJson() => {
    "id": uid,
    'email': email,
    'name': name,
    'photoUrl': profileImage,
    'isEmployee': isEmployee
  };

  void serverUpdate() {
    if (uid != null && uid != "")
      Firestore.instance.collection('users').document(uid).setData(toJson());
  }
}