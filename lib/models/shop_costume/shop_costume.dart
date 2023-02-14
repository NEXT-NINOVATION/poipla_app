import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_costume.freezed.dart';
part 'shop_costume.g.dart';

@freezed
class ShopCostume with _$ShopCostume {
  factory ShopCostume({
    @JsonKey(name: 'costume_id') required int costumeId,
    @JsonKey(name: 'costume_name') required String costumeName,
    @JsonKey(name: 'animal_type') required String animalType,
    @JsonKey(name: 'req_lv') required int? reqLv,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'rarity') required int rarity,
    @JsonKey(name: 'point') required int? point,
    @JsonKey(name: 'has_costume') required bool hasCostume,
    @JsonKey(name: 'is_buyable') required bool isBuyable,
  }) = _ShopCostume;

  factory ShopCostume.fromJson(Map<String, dynamic> json) =>
      _$ShopCostumeFromJson(json);
}
