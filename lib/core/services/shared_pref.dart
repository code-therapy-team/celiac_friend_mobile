import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _preferences;

  static Future<void> initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  static String? getString(String key) {
    return _preferences.getString(key);
  }

  static Future<void> setInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  static int? getInt(String key) {
    return _preferences.getInt(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  static Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  static Future<void> clear() async {
    await _preferences.clear();
  }
  static Future<void> saveModel(String key, Map<String, dynamic> model) async {
    String jsonString = jsonEncode(model);
    await _preferences.setString(key, jsonString);
  }
  static Map<String, dynamic>? getModel(String key) {
    String? jsonString = _preferences.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }
}
