import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;

  //get

  ThemeMode get themeMode => _themeMode;

  //set

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();


  }


  







}
