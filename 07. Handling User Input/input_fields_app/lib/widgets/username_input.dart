import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? labelText;
  final String? Function(String?) validator;
  final bool obsecureText;

  const UsernameInput({
    super.key,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.labelText,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 250,
          child: TextFormField(
            controller: controller,
            obscureText: obsecureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: labelText,
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
