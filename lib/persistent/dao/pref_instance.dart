import 'package:shared_preferences/shared_preferences.dart';

class PrefInstance {
  static late SharedPreferences _sharedPreferences;

  static SharedPreferences get getSharedPreferences => _sharedPreferences;

  static Future<void> createSharedPreferencesInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return Future.value();
  }
}
