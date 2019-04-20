import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Comment.g.dart';

@JsonSerializable()
class Comment {
  Comment(
      {this.cid,
      this.name,
      this.feedback,
      this.regNo,
      this.documentSnapshot,
      bool nullObj = true}) {
    if (!nullObj) {
      if (documentSnapshot == null)
        publishDoc();
      else
        loadFromDocumentSnapshot();
    }
  }

  String cid;
  String name;
  String feedback;
  String regNo;

  @JsonKey(ignore: true)
  DocumentSnapshot documentSnapshot;

  Future<void> publishDoc() async {
    DocumentReference reference =
        await Firestore.instance.collection('comments').add(this.toJson());
    cid = reference.documentID;
    reference.updateData({'cid': cid});
    documentSnapshot = await reference.get();
    return;
  }

  void loadFromDocumentSnapshot() {
    Comment comment = _$CommentFromJson(documentSnapshot.data);
    this.regNo = comment.regNo;
    this.name = comment.name;
    this.feedback = comment.feedback;
    this.documentSnapshot = comment.documentSnapshot;
  }

  factory Comment.fromJson(Map<String,dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  void _serverUpdate() {
    if (cid != null && cid != "")
      Firestore.instance.collection('comments').document(cid).setData(toJson());
  }
}
