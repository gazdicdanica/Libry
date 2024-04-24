import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/data/shared_preferences/prefs_data_provider/prefs_data_provider.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class PrefsRepository{
  final PrefsDataProvider _dataProvider;

  PrefsRepository(this._dataProvider);

  AppLocale? getLocale(){
    String? locale = _dataProvider.getLocale();
    return locale != null ? AppLocale.values.firstWhere((element) => element.languageCode == locale) : null;
  }

  void saveLocale(String value){
    _dataProvider.saveLocale(value);
  }

  void saveTheme(String value){
    _dataProvider.saveTheme(value);
  }

  ThemeMode? getTheme(){
    String? theme = _dataProvider.getTheme();
    return theme != null ? ThemeMode.values.firstWhere((element) => element.toString() == theme) : null;
  }
}