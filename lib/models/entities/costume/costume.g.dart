// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Costume _$$_CostumeFromJson(Map<String, dynamic> json) => _$_Costume(
      id: json['id'] as int,
      costumeName: json['costume_name'] as String,
      image: json['image'] as String,
      rarity: json['rarity'] as int?,
      description: json['description'] as String?,
      animalType: json['animal_type'] as String,
      prefId: json['pref_id'] as int?,
      eventId: json['event_id'] as int?,
    );

Map<String, dynamic> _$$_CostumeToJson(_$_Costume instance) =>
    <String, dynamic>{
      'id': instance.id,
      'costume_name': instance.costumeName,
      'image': instance.image,
      'rarity': instance.rarity,
      'description': instance.description,
      'animal_type': instance.animalType,
      'pref_id': instance.prefId,
      'event_id': instance.eventId,
    };
