import 'dart:convert';

import 'package:celus_fe/core/models/login_model.dart';
import 'package:celus_fe/core/services/shared_pref.dart';


class LoginOperation {
  static const String _key = "login_model";

  /// Save LoginModel as JSON string
  static Future<void> saveLoginModel(LoginModel loginModel) async {
    final jsonString = jsonEncode(loginModel.toJson());
    await SharedPref.setString(_key, jsonString);
  }

  /// Get LoginModel – return null if not found
  static LoginModel? getLoginModel() {
    final jsonString = SharedPref.getString(_key);
    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return LoginModel.fromJson(jsonMap);
  }

  /// Remove login model
  static Future<void> removeLoginModel() async {
    await SharedPref.remove(_key);
  }
}
