import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poipla_app/models/entities/session/session.dart';

part 'result_count.freezed.dart';
part 'result_count.g.dart';

@freezed
class ResultCount with _$ResultCount {
  factory ResultCount({required int count, required Session session}) =
      _ResultCount;
  factory ResultCount.fromJson(Map<String, dynamic> json) =>
      _$ResultCountFromJson(json);
}
