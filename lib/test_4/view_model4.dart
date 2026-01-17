import 'package:flutter/material.dart';

class ViewModel4 extends ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }
}