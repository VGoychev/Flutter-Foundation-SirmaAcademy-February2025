import 'package:basic_navigation_app/model/user.dart';
import 'package:basic_navigation_app/screens/user_info/user_info_state.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int selectedIndex;
  final User user;
  const HomeScreen(
      {required this.selectedIndex, required this.user, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Selected index: $selectedIndex'),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfo())
              );
            },
            child: Text('Go to User Info Screen'),
          ),
        )
      ],
    );
  }
}
