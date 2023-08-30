import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChangeProvider with ChangeNotifier {

  final SharedPreferences _prefs;
  ThemeChangeProvider(this._prefs);

  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode) async {
    _themeMode = themeMode;
    await _prefs.setInt('theme_mode', themeMode.index); // Store the selected theme mode
    notifyListeners();
  }

  Future<void> initializeTheme() async {
    final savedThemeModeIndex = _prefs.getInt('theme_mode');
    if (savedThemeModeIndex != null) {
      _themeMode = ThemeMode.values[savedThemeModeIndex];
      notifyListeners();
    }
  }
}
  // var _themeMode = ThemeMode.light;
  //
  // ThemeMode get themeMode => _themeMode;
  //
  //
  // setTheme(themeMode){
  //   _themeMode=themeMode;
  //   notifyListeners();
  // }

