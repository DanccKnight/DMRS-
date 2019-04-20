import 'package:dmrs/Data/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static final UserData _singleton = new UserData._internal();

  FirebaseUser fireUser;
  User user = User(uid:"");

  factory UserData() {
    return _singleton;
  }

  UserData._internal();
}
