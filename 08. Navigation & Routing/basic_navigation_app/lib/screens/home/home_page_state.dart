import 'package:basic_navigation_app/model/user.dart';
import 'package:basic_navigation_app/screens/home/home_page_view.dart';
import 'package:basic_navigation_app/screens/home/home_screen.dart';
import 'package:basic_navigation_app/screens/second/second_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  User user =
      User(name: 'Vladimir', email: 'vladimirgoichev@gmail.com', age: 23);

  List<Widget> get pages => [
        HomeScreen(
          selectedIndex: selectedIndex,
          user: user,
        ),
        SecondScreen(
          selectedIndex: selectedIndex,
          user: user,
        ),
      ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyHomePageView(this);
  }
}
