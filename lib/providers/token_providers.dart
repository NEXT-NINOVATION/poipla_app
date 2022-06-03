
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/shared_preference_token_service.dart';
import 'package:poipla_app/models/services/token_service.dart';

final tokenProvider = Provider<TokenService>((ref) {
  return SharedPreferenceTokenService();
});