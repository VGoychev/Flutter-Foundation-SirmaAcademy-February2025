import 'package:basic_navigation_app/model/user.dart';
import 'package:basic_navigation_app/screens/home/home_screen.dart';
import 'package:basic_navigation_app/screens/second/second_page_view.dart';
import 'package:basic_navigation_app/screens/second/second_screen.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final int selectedIndex;
  final User user;

  const SecondPage({required this.selectedIndex, required this.user, super.key});

  @override
  State<StatefulWidget> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  late int selectedIndex;
  late User user;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    user = widget.user;
  }

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
    return SecondPageView(this);
  }
}
