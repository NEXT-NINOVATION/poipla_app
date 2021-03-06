import 'package:freezed_annotation/freezed_annotation.dart';

part 'costume.freezed.dart';
part 'costume.g.dart';

@freezed
class Costume with _$Costume {
  factory Costume({
    required int id,
    @JsonKey(name: 'costume_name') required String costumeName,
    required String image,
    required int? rarity,
    String? description,
    @JsonKey(name: 'animal_type') required String animalType,
    @JsonKey(name: 'pref_id') int? prefId,
    @JsonKey(name: 'event_id') int? eventId,
  }) = _Costume;

  factory Costume.fromJson(Map<String, dynamic> json) =>
      _$CostumeFromJson(json);
}
