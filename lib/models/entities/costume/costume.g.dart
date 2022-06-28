// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Costume _$$_CostumeFromJson(Map<String, dynamic> json) => _$_Costume(
      title: json['title'] as String,
      image: json['image'] as String,
      rarity: json['rarity'] as int?,
      prefId: json['pref_id'] as int?,
      eventId: json['event_id'] as int?,
    );

Map<String, dynamic> _$$_CostumeToJson(_$_Costume instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'rarity': instance.rarity,
      'pref_id': instance.prefId,
      'event_id': instance.eventId,
    };
