import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChangerProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode; // getter method

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners(); // observe the change 
  }
}
