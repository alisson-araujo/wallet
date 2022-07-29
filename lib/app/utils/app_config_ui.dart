import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();

  static const MaterialColor _primarySwatch = MaterialColor(0XFF0066B0, {
    50: Color(0XFF003d6a),
    100: Color(0XFF00375f),
    200: Color(0XFF003155),
    300: Color(0XFF002b4a),
    400: Color(0XFF002540),
    500: Color(0XFF001f35),
    600: Color(0XFF00182a),
    700: Color(0XFF001220),
    800: Color(0XFF000c15),
    900: Color(0XFF00060b),
  });

  static final ThemeData theme = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: const Color(0XFF0066B0),
    primaryColorLight: const Color(0XFF219FFF),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
