import 'package:flutter/material.dart';
import 'package:star_wars_app/model/person.dart';
import 'package:star_wars_app/screens/info/info_view.dart';
import 'package:star_wars_app/services/star_wars_api_service.dart';

class Info extends StatefulWidget {
  final String side;
  const Info({super.key, required this.side});

  @override
  State<StatefulWidget> createState() => InfoState();
}

class InfoState extends State<Info> {
  late Future<List<Person>> futurePerson;

  @override
  void initState() {
    super.initState();
    futurePerson = StarWarsApiService().fetchPeopleBySide(widget.side);
  }

  @override
  Widget build(BuildContext context) {
    return InfoView(this);
  }
}
