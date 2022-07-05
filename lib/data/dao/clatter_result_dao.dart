import 'package:poipla_app/data/retrofit/service.dart';
import 'package:poipla_app/models/entities/clatter_result/clatter_result.dart';
import 'package:poipla_app/models/repositories/clatter_result_repository.dart';

class ClatterResultDao implements ClatterResultRepository {
  ClatterResultDao({required this.apiService});

  final PoiplaApiService apiService;

  @override
  Future<List<ClatterResult>> findBy({
    required int dustBoxId,
    required int sessionId,
  }) {
    return apiService.getClatterResults(
        dustBoxId.toString(), sessionId.toString());
  }
}
