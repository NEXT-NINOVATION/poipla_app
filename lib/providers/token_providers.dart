import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/shared_preference_token_service.dart';
import 'package:poipla_app/models/services/token_service.dart';

class TestToken implements TokenService {
  String? token;
  @override
  Future<String?> get() async {
    return token;
  }

  @override
  Future<void> save({required String? token}) async {
    this.token = token;
  }

}

final tokenProvider = Provider<TokenService>((ref) {
  const isRelease = bool.fromEnvironment('dart.vm.product');

  if (isRelease) {
    return SharedPreferenceTokenService();
  }
  return TestToken();
});
