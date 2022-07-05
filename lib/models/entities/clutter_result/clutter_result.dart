import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';

part 'clutter_result.freezed.dart';
part 'clutter_result.g.dart';

@freezed
class ClutterResult with _$ClutterResult {
  factory ClutterResult({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'costume_id') required int? costumeId,
    @JsonKey(name: 'session_id') required int sessionId,
    @JsonKey(name: 'earn_exp') required int? earnExp,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'costume') required Costume? costume,
  }) = _ClutterResult;

  factory ClutterResult.fromJson(Map<String, dynamic> json) =>
      _$ClutterResultFromJson(json);
}
