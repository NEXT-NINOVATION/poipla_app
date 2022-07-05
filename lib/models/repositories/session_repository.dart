import 'package:poipla_app/models/entities/clatter_result/clatter_result.dart';
import 'package:poipla_app/models/entities/session/session.dart';

class SessionRepository {
  Future<Session> create({required int dustBoxId}) {
    throw UnimplementedError();
  }

  Future<List<ClatterResult>> complete(Session session) {
    throw UnimplementedError();
  }
}
