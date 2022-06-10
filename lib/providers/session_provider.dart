
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/dao/session_dao.dart';
import 'package:poipla_app/models/repositories/session_repository.dart';
import 'package:poipla_app/providers/api_providers.dart';

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionDao(apiService: ref.read(poiplaApiServiceProvider));
});