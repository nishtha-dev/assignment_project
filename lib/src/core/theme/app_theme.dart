import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  static final lightThemeData = ThemeData(
      appBarTheme: lightAppBarTheme,
      primaryColor: Colors.white,
      splashColor: Colors.blue);

  static const AppBarTheme lightAppBarTheme =
      AppBarTheme(backgroundColor: Colors.blue);

  static final ThemeData darkThemeData = ThemeData(
      appBarTheme: darkAppBarTheme,
      primaryColor: Colors.black,
      splashColor: Colors.blue);

  static const AppBarTheme darkAppBarTheme =
      AppBarTheme(backgroundColor: Colors.white);
}
