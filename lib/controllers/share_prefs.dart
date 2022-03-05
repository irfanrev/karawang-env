import 'package:get/get.dart';
import 'package:karawang_env/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  final authC = Get.put(AuthController());
  Future createCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('password', authC.passLogin.text);
  }

  Future readCache(String s) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString('password');
    return cache;
  }

  Future removeCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove('password');
  }
}
