import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UserData._();

  // Attention!!
  // Don't use create or default constructor. Use getInstance() method to get UserData object
  factory UserData.create() => UserData._();

  Future<void> setLang(String lang) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('lang', lang);
  }

  Future<String> getLang() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('lang') ?? "ru";
  }

  Future<String?> accessToken() async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    return prefs.getString('general_access_token');
  }

  Future<String?> refreshToken() async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    return prefs.getString('general_refresh_token');
  }

  Future<void> saveGeneralToken(String accessToken, String refreshToken) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('general_access_token', accessToken);
    await prefs.setString('general_refresh_token', refreshToken);
  }

  Future<void> saveAccessToken(String accessToken) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('general_access_token', accessToken);
  }

  Future<void> saveRefreshToken(String accessToken) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('general_refresh_token', accessToken);
  }

  Future<void> clearAllData() async {
    final SharedPreferences prefs = await _prefs;
    final a = prefs.getKeys().toList();
    for (int i = 0; i < a.length; i++) {
      await prefs.remove(a[i]);
    }
  }
}
