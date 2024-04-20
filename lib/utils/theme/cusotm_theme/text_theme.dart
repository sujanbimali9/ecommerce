import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: const TextStyle()
        ..copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ));
}
