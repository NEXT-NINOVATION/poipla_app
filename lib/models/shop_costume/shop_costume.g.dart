// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_costume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopCostume _$$_ShopCostumeFromJson(Map<String, dynamic> json) =>
    _$_ShopCostume(
      userId: json['user_id'] as String,
      costumeId: json['costume_id'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_ShopCostumeToJson(_$_ShopCostume instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'costume_id': instance.costumeId,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
