import 'package:flutter/material.dart';
import 'package:star_wars_app/model/planet.dart';
import 'package:star_wars_app/model/user.dart';
import 'package:star_wars_app/screens/planets_info/planets_info_view.dart';
import 'package:star_wars_app/services/star_wars_api_service.dart';

class PlanetsInfo extends StatefulWidget {
  final User user;
  const PlanetsInfo({super.key, required this.user});
  @override
  State<StatefulWidget> createState() => PlanetsInfoState();

}

class PlanetsInfoState extends State<PlanetsInfo>{
    late Future<List<Planet>> futurePlanet;

  @override
  void initState() {
    super.initState();
    futurePlanet = StarWarsApiService().fetchPlanetsBySide(widget.user.side);
  }
  @override
  Widget build(BuildContext context) {
    
    return PlanetsInfoView(this);
  }

}