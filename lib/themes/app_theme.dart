import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme =  ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.dark(
      secondary: Colors.white70,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
        )
    ),
  );
}

