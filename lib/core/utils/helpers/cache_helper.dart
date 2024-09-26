import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._();
  static late SharedPreferences storage;
  static Future init() async {
    storage = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return storage.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    return storage.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return storage.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    return storage.getInt(key);
  }

  static Future<bool> remove(String key) async {
    return storage.remove(key);
  }

  static Future<bool> clear(String key) async {
    return storage.clear();
  }
}
