import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_costume.freezed.dart';
part 'shop_costume.g.dart';

@freezed
class ShopCostume with _$ShopCostume {
  factory ShopCostume({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'costume_id') required String costumeId,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'id') required String id,
  }) = _ShopCostume;

  factory ShopCostume.fromJson(Map<String, dynamic> json) =>
      _$ShopCostumeFromJson(json);
}
