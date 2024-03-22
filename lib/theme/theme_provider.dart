import 'package:flutter/material.dart';
import './theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void setDarkMode(bool isDarkMode) {
    _themeData = isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }
}
