import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _cache;

  static Future<void> startCache() async {
    _cache = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({required String key, required bool value}) async {
    await _cache.setBool(key, value);
    print("Saved $key: $value");
    return value;
  }

  static bool getData({required String key}) {
    return _cache.getBool(key) ?? false;
  }
}