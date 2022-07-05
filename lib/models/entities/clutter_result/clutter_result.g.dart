// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clutter_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClutterResult _$$_ClutterResultFromJson(Map<String, dynamic> json) =>
    _$_ClutterResult(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      costumeId: json['costume_id'] as int?,
      sessionId: json['session_id'] as int,
      earnExp: json['earn_exp'] as int?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      costume: json['costume'] == null
          ? null
          : Costume.fromJson(json['costume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClutterResultToJson(_$_ClutterResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'costume_id': instance.costumeId,
      'session_id': instance.sessionId,
      'earn_exp': instance.earnExp,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'costume': instance.costume,
    };
