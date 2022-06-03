
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'total_pet') required int totalPet,
    @JsonKey(name: 'costume_id') required int costumeId,

  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


}