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
      uid: json['uid'] as String,
      name: json['name'] as String);
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'cid': instance.cid,
      'uid': instance.uid,
      'name': instance.name,
      'feedback': instance.feedback,
      'regNo': instance.regNo
    };
