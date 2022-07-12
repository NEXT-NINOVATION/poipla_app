import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();
  factory User({
    required int id,
    required int level,
    required int exp,
    required int point,
    required String? name,
    @JsonKey(name: 'total_pet') required int totalPet,
    @JsonKey(name: 'costume_id') required int? costumeId,
    Costume? costume,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
