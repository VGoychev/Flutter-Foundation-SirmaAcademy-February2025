import 'package:basic_navigation_app/screens/second/second_page_state.dart';
import 'package:flutter/material.dart';

class SecondPageView extends StatelessWidget {
  final SecondPageState state;
  const SecondPageView(this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: state.pages[state.selectedIndex],
      bottomNavigationBar:
            BottomNavigationBar(currentIndex: state.selectedIndex,
              onTap: state.onItemTapped, items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ])
    );
  }
}
