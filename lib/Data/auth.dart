import 'dart:async';
import 'package:dmrs/Data/Database.dart';
import 'package:dmrs/Data/Singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = new GoogleSignIn();

  static Future<bool> signInWithGoogle({bool silent = false}) async {
    final GoogleSignInAccount googleUser = silent
        ? await _googleSignIn.signInSilently(suppressErrors: true)
        : await _googleSignIn.signIn();

    GoogleSignInAuthentication googleAuth;
    try {
      googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      _auth.signInWithCredential(credential).then((user) {
        UserData().fireUser = user;
        updateUserDB();
      });
    } catch (e) {
      return false;
    }
    return true;
  }
}
