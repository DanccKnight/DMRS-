// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
      cid: json['cid'] as String,
      feedback: json['feedback'] as String,
      regNo: json['regNo'] as String,
      name: json['name'] as String,
      uid: json['uid'] as String);
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'uid': instance.uid,
      'feedback': instance.feedback,
      'regNo': instance.regNo
    };
