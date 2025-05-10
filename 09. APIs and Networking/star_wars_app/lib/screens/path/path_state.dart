import 'package:flutter/material.dart';
import 'package:star_wars_app/model/user.dart';
import 'package:star_wars_app/screens/path/path_view.dart';

class Path extends StatefulWidget {
  final User user;
  
  const Path({super.key, required this.user});
  
  @override
  State<StatefulWidget> createState() => PathState();
}

class PathState extends State<Path> {
  @override
  Widget build(BuildContext context) {
    return PathView(widget.user);
  }
}