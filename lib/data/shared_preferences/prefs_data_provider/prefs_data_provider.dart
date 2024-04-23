import 'package:shared_preferences/shared_preferences.dart';

class PrefsDataProvider{

  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  } 

  void saveLocale(String value) {
    _sharedPreferences.setString("locale", value);
  }

  String? getLocale(){
    return _sharedPreferences.getString("locale");
  }

  void saveTheme(String value) {
    _sharedPreferences.setString("theme", value);
  }

  String? getTheme(){
    return _sharedPreferences.getString("theme");
  }
}