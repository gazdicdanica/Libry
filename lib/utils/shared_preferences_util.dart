import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesUtil._();

  static final SharedPreferencesUtil _instance = SharedPreferencesUtil._();

  factory SharedPreferencesUtil() => _instance;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveLocale(String value) {
    _sharedPreferences.setString("locale", value);
  }

  AppLocale? getLocale() {
    String? locale = _sharedPreferences.getString("locale");
    if (locale == null) {
      return null;
    }
    return AppLocale.values
        .firstWhere((element) => element.languageCode == locale);
  }

  void saveTheme(String value) {
    _sharedPreferences.setString("theme", value);
  }

  ThemeMode? getTheme() {
    String? theme = _sharedPreferences.getString("theme");
    if (theme == null) return null;

    return ThemeMode.values
        .firstWhere((element) => element.toString() == theme);
  }
}
