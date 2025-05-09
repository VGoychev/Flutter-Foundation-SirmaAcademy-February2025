import 'package:flutter/material.dart';

final ThemeData neutralTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF121212),
  primaryColor: Color(0xFF03A9F4),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF03A9F4),
    secondary: Color(0xFFFFC107),
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white70,
  ),
  cardColor: Color(0xFF1E1E1E),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.white, fontFamily: 'Orbitron'),
    headlineMedium: TextStyle(color: Colors.white, fontFamily: 'Orbitron'),
    headlineSmall: TextStyle(color: Colors.white, fontFamily: 'Orbitron'),
    bodyLarge: TextStyle(color: const Color.fromARGB(220, 255, 255, 255), fontFamily: 'Orbitron'),
    bodyMedium: TextStyle(color: Colors.white60, fontFamily: 'Orbitron'),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Orbitron'),
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
