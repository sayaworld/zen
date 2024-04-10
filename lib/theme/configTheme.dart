import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        background: Color.fromRGBO (239, 239, 239, 1.0), //239, 239, 239, 1.0
        primary: Color.fromRGBO(244, 245, 246, 1), //244, 245, 246, 1
        secondary: Color.fromRGBO(24, 24, 25, 1),
        primaryContainer: Color.fromRGBO(255, 255, 255, 1.0),
        onError: Colors.black

    )
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        background: Color.fromRGBO(1, 4, 10, 1.0),
        primary: Color.fromRGBO(1, 4, 10, 1.0),
        secondary: Color.fromRGBO(235,236,237,1),
        primaryContainer: Color.fromRGBO(26, 29, 45, 1.0),
        onError: Colors.white
    )
);

var accentColor = const Color.fromRGBO(0,208,133,1);