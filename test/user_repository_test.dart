import 'package:flutter_test/flutter_test.dart';
import 'package:poipla_app/data/dao/user_dao.dart';
import 'package:poipla_app/data/retrofit/service.dart';
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
void main() {
  final token = TestToken();
  final apiService = create(token);
  final userDAO = UserDao(tokenService: token, service: apiService);
  test('登録&取得テスト', () async {
    await userDAO.register();
    final me = await userDAO.findMe();
    expect(me, isNotNull);

    final reMe = await userDAO.findMe();
    expect(me, equals(reMe));
  });

}