import 'package:flutter/material.dart';
import 'package:star_wars_app/model/user.dart';
import 'package:star_wars_app/screens/head/head_view.dart';

class Head extends StatefulWidget {
  final User user;
  const Head({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => HeadState();
}

class HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return HeadView(widget.user);
  }
}
