import 'package:flutter/material.dart';

ThemeData createAppTheme() {
  final _primaryColor = Color.fromRGBO(136, 14, 79, 1);
  final _primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
  final _primaryColorLight = Color.fromRGBO(188, 71, 123, 1);
  final _textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: _primaryColorDark,
    ),
  );

  final _buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: _primaryColor),
    buttonColor: _primaryColor,
    splashColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final _inputDecorationTheme = InputDecorationTheme(
    alignLabelWithHint: true,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: _primaryColorLight),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: _primaryColor,
      ),
    ),
  );

  return ThemeData(
    primaryColor: _primaryColor,
    primaryColorDark: _primaryColorDark,
    primaryColorLight: _primaryColorLight,
    accentColor: _primaryColor,
    backgroundColor: Colors.white,
    textTheme: _textTheme,
    buttonTheme: _buttonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
