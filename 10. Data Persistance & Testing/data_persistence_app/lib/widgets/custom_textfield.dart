import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? label;
  final String? Function(String?) validator;
  final bool obsecure;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.validator,
    this.label,
    this.obsecure = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(Object context) {
    return TextFormField(
      controller: controller,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: label),
      validator: validator,
      obscureText: obsecure,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}