// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResultCount _$$_ResultCountFromJson(Map<String, dynamic> json) =>
    _$_ResultCount(
      count: json['count'] as int,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResultCountToJson(_$_ResultCount instance) =>
    <String, dynamic>{
      'count': instance.count,
      'session': instance.session,
    };
