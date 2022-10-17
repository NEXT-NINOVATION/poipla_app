import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poipla_app/models/entities/user/user.dart';
import 'package:poipla_app/models/repositories/user_repository.dart';

enum AppStateType { loading, unauthorized, authorized, start, tutorial }

class AccountStore extends ChangeNotifier {
  AccountStore({required this.userRepository});

  final UserRepository userRepository;
  AppStateType type = AppStateType.loading;
  User? currentUser;

  Future<bool> fetch() async {
    try {
      currentUser = await userRepository.findMe();
      type = AppStateType.authorized;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        type = AppStateType.unauthorized;
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
    if (type != AppStateType.unauthorized) {
      return;
    }
    type = AppStateType.start;
    notifyListeners();
  }

  void completeTutorial() async {
    type = AppStateType.authorized;
    notifyListeners();
  }

  Future<void> register() async {
    await userRepository.register();
    currentUser = await userRepository.findMe();
    type = AppStateType.tutorial;
    notifyListeners();
  }

  Future<void> updateName({required String name}) async {
    currentUser = await userRepository.update(name: name);
    notifyListeners();
  }

  Future<void> changeCurrentCostume({required int? costumeId}) async {
    currentUser = await userRepository.update(
      costumeId: costumeId,
      name: currentUser!.name!,
    );

    notifyListeners();
  }

  Future<void> withdrawal() async {
    currentUser = null;
    type = AppStateType.start;
    await userRepository.withdrawal();
    notifyListeners();
  }
}
