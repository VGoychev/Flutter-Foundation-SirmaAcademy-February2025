import 'package:basic_navigation_app/model/user.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final int selectedIndex;
  final User user;
  const SecondScreen(
      {required this.selectedIndex, required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Second page, here!, Selected index: $selectedIndex'),
        ),
        Center(
          child: Text('User info: ${user.name}, ${user.email}, ${user.age}'),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back to first screen')),
        )
      ],
    );
  }
}
