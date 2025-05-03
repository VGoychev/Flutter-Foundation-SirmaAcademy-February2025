import 'package:basic_navigation_app/screens/home/home_page_state.dart';
import 'package:basic_navigation_app/screens/home/home_page_view.dart';
import 'package:basic_navigation_app/screens/home/home_screen.dart';
import 'package:basic_navigation_app/screens/second/second_screen.dart';
import 'package:basic_navigation_app/screens/user_info/user_info_state.dart';
import 'package:basic_navigation_app/screens/user_summary/user_summary_state.dart';
import 'package:basic_navigation_app/model/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Navigation App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
