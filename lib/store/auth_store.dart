import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poipla_app/models/entities/user/user.dart';
import 'package:poipla_app/models/repositories/user_repository.dart';

enum AuthType {
  loading,
  unauthorized,
  authorized,
  start,
  tutorial
}

class AuthStore extends ChangeNotifier {
  AuthStore({required this.userRepository});

  final UserRepository userRepository;
  AuthType type = AuthType.loading;
  User? currentUser;

  Future<bool> fetch() async {
    try {
      currentUser = await userRepository.findMe();
      type = AuthType.authorized;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        type = AuthType.unauthorized;
        await start();
        return true;
      } else {
        log(
          'error',
          error: e,
        );
        rethrow;
      }
    } finally {
      notifyListeners();
    }
    return false;
  }

  Future<void> start() async {
    if (type != AuthType.unauthorized) {
      return;
    }
    type = AuthType.start;
    notifyListeners();
  }

  Future<void> register() async {
    await userRepository.register();
    currentUser = await userRepository.findMe();
    type = AuthType.tutorial;
    notifyListeners();
  }
}
