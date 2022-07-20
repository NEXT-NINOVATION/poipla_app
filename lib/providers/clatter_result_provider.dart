import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/dao/clatter_result_dao.dart';
import 'package:poipla_app/models/repositories/clatter_result_repository.dart';
import 'package:poipla_app/providers/api_providers.dart';

final clatterResultRepositoryProvider =
    Provider<ClatterResultRepository>((ref) {
  return ClatterResultDao(apiService: ref.read(poiplaApiServiceProvider));
});

class ClatterResultArgs {
  final int dustBoxId;
  final int sessionId;

  ClatterResultArgs({required this.dustBoxId, required this.sessionId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClatterResultArgs &&
          runtimeType == other.runtimeType &&
          dustBoxId == other.dustBoxId &&
          sessionId == other.sessionId;

  @override
  int get hashCode => dustBoxId.hashCode ^ sessionId.hashCode;
}

final fetchClatterResultFutureProviderFamily =
    FutureProvider.autoDispose.family((ref, ClatterResultArgs args) {
  return ref
      .read(clatterResultRepositoryProvider)
      .findBy(dustBoxId: args.dustBoxId, sessionId: args.sessionId);
});
