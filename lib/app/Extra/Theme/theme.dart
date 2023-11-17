import 'package:flutter/material.dart';
ThemeData lightMode=ThemeData(
  // useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.black87,
    primary: Color(0xbd03ce32),
    secondary: Color(0xff5b8bf5),
    primaryContainer: Color(0xfff33a6a),
    secondaryContainer: Color(0xfffce7a2),
    tertiary: Color(0xcdf6804e),
  )

);
ThemeData darkMode=ThemeData(
  // useMaterial3: true,
  brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.white,
      primary: Color(0xff00B921),
      secondary: Color(0xda6257f5),
      primaryContainer: Color(0xffef0707),
      secondaryContainer: Color(0xfff8cf4b),
      tertiary: Color(0xffd57101),
      //onBackground: Colors.greenAccent.shade700,

     // tertiaryContainer: Colors.yellow.shade600,
     // error: Color(0xffEE6C4D),
      //errorContainer: Colors.grey.shade600,
     // surface: Colors.grey.shade900,
      //surfaceVariant: Colors.grey.shade700,

    )

);