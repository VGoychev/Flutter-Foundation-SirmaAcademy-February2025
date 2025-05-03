import 'package:basic_navigation_app/screens/home/home_page_state.dart';
import 'package:flutter/material.dart';

class MyHomePageView extends StatelessWidget {
  final MyHomePageState state;

  const MyHomePageView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Basic Navigation'),
        ),
        body: state.pages[state.selectedIndex],
        bottomNavigationBar:
            BottomNavigationBar(currentIndex: state.selectedIndex,
              onTap: state.onItemTapped, items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ]));
  }
}
