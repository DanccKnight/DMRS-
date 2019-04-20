// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessMenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessMenu _$MessMenuFromJson(Map<String, dynamic> json) {
  return MessMenu(
      mid: json['mid'] as String,
      lunch: json['lunch'] as String,
      breakfast: json['breakfast'] as String,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      dinner: json['dinner'] as String,
      hitea: json['hitea'] as String);
}

Map<String, dynamic> _$MessMenuToJson(MessMenu instance) => <String, dynamic>{
      'breakfast': instance.breakfast,
      'dateTime': instance.dateTime?.toIso8601String(),
      'lunch': instance.lunch,
      'hitea': instance.hitea,
      'dinner': instance.dinner,
      'mid': instance.mid
    };
