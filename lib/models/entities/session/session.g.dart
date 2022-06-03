// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as int,
      dustBoxId: json['dust_box_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dust_box_id': instance.dustBoxId,
      'created_at': instance.createdAt.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
    };
