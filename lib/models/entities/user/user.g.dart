// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      level: json['level'] as int,
      exp: json['exp'] as int,
      point: json['point'] as int,
      name: json['name'] as String?,
      totalPet: json['total_pet'] as int,
      costumeId: json['costume_id'] as int?,
      costume: json['costume'] == null
          ? null
          : Costume.fromJson(json['costume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'exp': instance.exp,
      'point': instance.point,
      'name': instance.name,
      'total_pet': instance.totalPet,
      'costume_id': instance.costumeId,
      'costume': instance.costume,
    };
