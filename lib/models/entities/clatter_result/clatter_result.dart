import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';

part 'clatter_result.freezed.dart';
part 'clatter_result.g.dart';

@freezed
class ClatterResult with _$ClatterResult {
  factory ClatterResult({
    required int id,
    @JsonKey(name: 'costume_id') required int? costumeId,
    @JsonKey(name: 'session_id') required int sessionId,
    @JsonKey(name: 'earn_exp') required int? earnExp,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'costume') required Costume? costume,
  }) = _ClatterResult;

  factory ClatterResult.fromJson(Map<String, dynamic> json) =>
      _$ClatterResultFromJson(json);
}
