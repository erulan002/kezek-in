import 'package:flutter/material.dart';

class MainTheme {
  static final mainTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.teal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      floatingLabelStyle: TextStyle(color: Colors.teal),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal),
      ),
    ),
  );
}
