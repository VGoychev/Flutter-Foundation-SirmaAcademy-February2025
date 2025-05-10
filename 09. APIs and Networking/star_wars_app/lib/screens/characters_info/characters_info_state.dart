import 'package:flutter/material.dart';
import 'package:star_wars_app/model/person.dart';
import 'package:star_wars_app/model/user.dart';
import 'package:star_wars_app/screens/characters_info/characters_info_view.dart';
import 'package:star_wars_app/services/star_wars_api_service.dart';

class CharactersInfo extends StatefulWidget {
  final User user;
  const CharactersInfo({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => CharactersInfoState();
}

class CharactersInfoState extends State<CharactersInfo> {
  late Future<List<Person>> futurePerson;

  @override
  void initState() {
    super.initState();
    futurePerson = StarWarsApiService().fetchPeopleBySide(widget.user.side);
  }

  @override
  Widget build(BuildContext context) {
    return CharactersInfoView(this);
  }
}
