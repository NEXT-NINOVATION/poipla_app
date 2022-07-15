import 'package:poipla_app/data/retrofit/service.dart';
import 'package:poipla_app/models/entities/clatter_result/clatter_result.dart';
import 'package:poipla_app/models/entities/session/session.dart';
import 'package:poipla_app/models/repositories/session_repository.dart';

class SessionDao implements SessionRepository {
  final PoiplaApiService apiService;
  SessionDao({required this.apiService});
  @override
  Future<List<ClatterResult>> complete(Session session) {
    return apiService.completeSession(
        session.dustBoxId.toString(), session.id.toString());
  }

  @override
  Future<Session> create({required int dustBoxId}) {
    return apiService.createSession(dustBoxId.toString());
  }
}
