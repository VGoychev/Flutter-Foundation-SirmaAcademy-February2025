import 'package:flutter/material.dart';
import 'package:star_wars_app/model/starship.dart';
import 'package:star_wars_app/model/user.dart';
import 'package:star_wars_app/screens/starships_info/starships_info_view.dart';
import 'package:star_wars_app/services/star_wars_api_service.dart';

class StarshipsInfo extends StatefulWidget {
  final User user;
  const StarshipsInfo({super.key, required this.user});
  @override
  State<StatefulWidget> createState() => StarshipsInfoState();
}

class StarshipsInfoState extends State<StarshipsInfo> {
  late Future<List<Starship>> futurePlanet;

  @override
  void initState() {
    super.initState();
    futurePlanet = StarWarsApiService().fetchStarshipsBySide(widget.user.side);
  }

  @override
  Widget build(BuildContext context) {
    return StarshipsInfoView(this);
  }
}
