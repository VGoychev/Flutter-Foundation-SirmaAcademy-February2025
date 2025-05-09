import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/registration/registration_state.dart';
import 'package:star_wars_app/themes/neutral_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars App',
      theme: neutralTheme,
      home: Registration(),
      debugShowCheckedModeBanner: false,
    );
  }
}