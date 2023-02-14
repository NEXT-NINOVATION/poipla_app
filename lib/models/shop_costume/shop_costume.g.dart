// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_costume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopCostume _$$_ShopCostumeFromJson(Map<String, dynamic> json) =>
    _$_ShopCostume(
      costumeId: json['costume_id'] as int,
      costumeName: json['costume_name'] as String,
      animalType: json['animal_type'] as String,
      reqLv: json['req_lv'] as int?,
      image: json['image'] as String,
      rarity: json['rarity'] as int,
      point: json['point'] as int?,
      hasCostume: json['has_costume'] as bool,
      isBuyable: json['is_buyable'] as bool,
    );

Map<String, dynamic> _$$_ShopCostumeToJson(_$_ShopCostume instance) =>
    <String, dynamic>{
      'costume_id': instance.costumeId,
      'costume_name': instance.costumeName,
      'animal_type': instance.animalType,
      'req_lv': instance.reqLv,
      'image': instance.image,
      'rarity': instance.rarity,
      'point': instance.point,
      'has_costume': instance.hasCostume,
      'is_buyable': instance.isBuyable,
    };
