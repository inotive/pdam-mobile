// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_NAME = "PREFS_KEY_NAME";
const String PREFS_KEY_EMAIL = "PREFS_KEY_EMAIL";
const String PREFS_KEY_ROLE_NAME = "PREFS_KEY_ROLE_NAME";
const String PREFS_KEY_USERNAME = "PREFS_KEY_USERNAME";
const String PREFS_KEY_IMAGE = "PREFS_KEY_IMAGE";
const String PREFS_KEY_NOTIFICATION_COUNT = "PREFS_KEY_NOTIFICATION_COUNT";

class AppPreference {
  final SharedPreferences _sharedPreferences;
  AppPreference(this._sharedPreferences);

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }

  Future<void> setString(String key, String value) async {
    _sharedPreferences.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    _sharedPreferences.setInt(key, value);
  }

  Future<String> getString(String key) async {
    return _sharedPreferences.getString(key) ?? "";
  }

  Future<int> getInt(String key) async {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  Future<void> removeString(String key) async {
    _sharedPreferences.remove(key);
  }
}
