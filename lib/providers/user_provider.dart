import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/dao/user_dao.dart';
import 'package:poipla_app/models/repositories/user_repository.dart';
import 'package:poipla_app/providers/api_providers.dart';
import 'package:poipla_app/providers/token_providers.dart';
import 'package:poipla_app/store/auth_store.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserDao(
      service: ref.read(poiplaApiServiceProvider),
      tokenService: ref.read(tokenProvider));
});

final authStore = ChangeNotifierProvider((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return AuthStore(userRepository: userRepository);
});