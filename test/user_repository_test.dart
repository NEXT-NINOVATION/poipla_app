import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poipla_app/data/dao/user_dao.dart';
import 'package:poipla_app/data/retrofit/service.dart';
import 'package:poipla_app/providers/token_providers.dart';


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
    log('me$reMe');
  });

  test('未認証時のエラー', () async {
    token.save(token: null);
    expect(() async {
      await userDAO.findMe();
    }, throwsA(predicate((e) => e is DioError && e.response?.statusCode == 401)));

  });
}