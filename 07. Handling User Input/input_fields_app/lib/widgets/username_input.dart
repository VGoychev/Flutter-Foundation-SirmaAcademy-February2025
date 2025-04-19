import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget{
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  const UsernameInput({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done
    });

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 250,
              child: TextField(
                controller: controller,
                obscureText: false,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
          ),
        );
  }
}