import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MessMenu.g.dart';

@JsonSerializable()
class MessMenu {
  MessMenu(
      {this.mid,
      this.lunch,
      this.breakfast,
      this.dinner,
      this.hitea,
      this.ds,
      bool nullObj = true}) {
    if (!nullObj) {
      if (ds == null)
        publishDoc();
      else
        loadfromds();
    }
  }

  String breakfast;
  String lunch;
  String hitea;
  String dinner;
  String mid;

  @JsonKey(ignore: true)
  DocumentSnapshot ds;

  Future<void> publishDoc() async {
    DocumentReference reference =
        await Firestore.instance.collection('messmenu').add(this.toJson());
    mid = reference.documentID;
    reference.updateData({'mid': mid});
    ds = await reference.get();
    return;
  }

  void loadfromds() {
    MessMenu menu = _$MessMenuFromJson(ds.data);
    this.breakfast = menu.breakfast;
    this.hitea = menu.hitea;
    this.lunch = menu.lunch;
    this.ds = menu.ds;
    this.dinner = menu.dinner;
  }

  factory MessMenu.fromJson(Map<String, dynamic> json) =>
      _$MessMenuFromJson(json);

  Map<String, dynamic> toJson() => _$MessMenuToJson(this);

  Future<void> _serverUpdate() async {
    if (mid != null && mid != "")
      await Firestore.instance
          .collection('messmenu')
          .document(mid)
          .setData(toJson());
  }
}
