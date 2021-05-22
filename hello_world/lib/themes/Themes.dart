import 'package:flutter/material.dart';

class Themes {
  static ThemeData darkTheme() {
    return ThemeData(primarySwatch: Colors.cyan, brightness: Brightness.dark);
  }

  static ThemeData lightTheme() {
    return ThemeData(primarySwatch: Colors.red, brightness: Brightness.light);
  }
}
