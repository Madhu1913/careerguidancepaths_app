import 'package:flutter/material.dart';
ThemeData lightMode=ThemeData(
  // useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.black87,
    primary: Colors.teal.shade300,
    secondary: Colors.blue.shade400,
    onBackground: Colors.greenAccent.shade200,
    primaryContainer: Colors.brown.shade300,
    secondaryContainer: Colors.purple.shade300,
    tertiary: Colors.indigo.shade400,
    tertiaryContainer: Colors.yellow.shade300,
      error: Color(0xffEE6C4D),
    errorContainer: Colors.grey.shade300,
    surface: Colors.white60,
    surfaceVariant: Colors.white,
  )

);
ThemeData darkMode=ThemeData(
  // useMaterial3: true,
  brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.white,
      primary: Color(0xff3D405B),
      secondary: Colors.blue.shade800,
      onBackground: Colors.greenAccent.shade700,
      primaryContainer: Colors.brown.shade800,
        secondaryContainer: Colors.purple.shade700,
      tertiary: Colors.indigo.shade800,
      tertiaryContainer: Colors.yellow.shade600,
      error: Color(0xffEE6C4D),
      errorContainer: Colors.grey.shade600,
      surface: Colors.grey.shade900,
      surfaceVariant: Colors.grey.shade700,

    )

);