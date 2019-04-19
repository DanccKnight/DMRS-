import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmrs/Data/User.dart';
import 'package:dmrs/Data/Singleton.dart';

Future<void> updateUserDB() async {
  if (UserData().fireUser != null) {
    final QuerySnapshot result = await Firestore.instance
        .collection('users')
        .where('id', isEqualTo: UserData().fireUser.uid)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    final currentUser = User(
      uid: UserData().fireUser.uid,
      name: UserData().fireUser.displayName,
      profileImage: UserData().fireUser.photoUrl,
      email: UserData().fireUser.email,
      isEmployee: false,
    );
    UserData().user = currentUser;
    if (documents.length == 0) {
      // Update data to server if new user
      Firestore.instance
          .collection('users')
          .document(UserData().user.uid)
          .setData({
        'name': UserData().user.name,
        'photoUrl': UserData().user.profileImage,
        'id': UserData().user.uid,
        'email': UserData().user.email,
        'isEmployee': false
      });
    }
  }
}