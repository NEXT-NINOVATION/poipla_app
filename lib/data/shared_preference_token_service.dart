import 'package:poipla_app/models/services/token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceTokenService implements TokenService {
  @override
  Future<String?> get() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('USER_TOKEN');
  }

  @override
  Future<void> save({required String? token}) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('USER_TOKEN', token ?? '');
  }
}
