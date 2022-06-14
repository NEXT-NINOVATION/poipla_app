import 'package:poipla_app/data/retrofit/service.dart';
import 'package:poipla_app/models/entities/user/user.dart';
import 'package:poipla_app/models/repositories/user_repository.dart';
import 'package:poipla_app/models/services/token_service.dart';

class UserDao implements UserRepository {
  final PoiplaApiService service;
  final TokenService tokenService;
  UserDao({required this.service, required this.tokenService});
  @override
  Future<User> findMe() {
    return service.getMe();
  }

  @override
  Future<void> register() async {
    final res = await service.register();
    final token = res.token;
    await tokenService.save(token: token);
  }
}
