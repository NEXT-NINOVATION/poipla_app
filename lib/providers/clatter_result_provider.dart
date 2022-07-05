import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/dao/clatter_result_dao.dart';
import 'package:poipla_app/models/repositories/clatter_result_repository.dart';
import 'package:poipla_app/providers/api_providers.dart';

final clatterResultRepositoryProvider =
    Provider<ClatterResultRepository>((ref) {
  return ClatterResultDao(apiService: ref.read(poiplaApiServiceProvider));
});
