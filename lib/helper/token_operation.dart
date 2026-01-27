import 'package:celus_fe/core/services/shared_pref.dart';

class TokenStorage {
  static const String _accessTokenKey = 'access_token_key';
  static const String _refreshTokenKey = 'refresh_token_key';

  /// Save access token
  static Future<void> saveAccessToken(String token) async {
    await SharedPref.setString(_accessTokenKey, token);
  }

  /// Save refresh token
  static Future<void> saveRefreshToken(String token) async {
    await SharedPref.setString(_refreshTokenKey, token);
  }

  /// Get access token
  static String? getAccessToken() {
    return SharedPref.getString(_accessTokenKey);
  }

  /// Get refresh token
  static String? getRefreshToken() {
    return SharedPref.getString(_refreshTokenKey);
  }

  /// Remove tokens (logout)
  static Future<void> clearTokens() async {
    await SharedPref.remove(_accessTokenKey);
    await SharedPref.remove(_refreshTokenKey);
  }

  /// Check if user is logged in
  static bool isLoggedIn() {
    return getAccessToken() != null;
  }
}
