import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:star_wars_app/model/person.dart';
import 'package:star_wars_app/model/planet.dart';
import 'package:star_wars_app/model/starship.dart';

class StarWarsApiService {
  //Base API URL
  static const String _baseUrl = 'https://swapi.dev/api';

  //Endpoints
  static const String _peopleEndpoint = '/people';
  static const String _planetsEndpoint = '/planets';
  static const String _starshipsEndpoint = '/starships';

  static const Map<String, String> _peopleAllegianceMap = {
    // Imperial characters
    'Darth Vader': 'Imperial',
    'Palpatine': 'Imperial',
    'Wilhuff Tarkin': 'Imperial',
    'Boba Fett': 'Imperial',
    'Grand Moff Tarkin': 'Imperial',
    'Darth Maul': 'Imperial',
    'Mas Amedda': 'Imperial',

    // Resistance characters
    'Leia Organa': 'Resistance',
    'Luke Skywalker': 'Resistance',
    'Han Solo': 'Resistance',
    'Obi-Wan Kenobi': 'Resistance',
    'Mon Mothma': 'Resistance',
    'Lando Calrissian': 'Resistance',
    'Chewbacca': 'Resistance',
    'C-3PO': 'Resistance',
    'R2-D2': 'Resistance',

    // Other notable characters (added some who may change allegiance across the saga)
    'Anakin Skywalker': 'Imperial',
    'Ahsoka Tano': 'Resistance',
    'Yoda': 'Resistance',
    'Qui-Gon Jinn': 'Resistance',
  };

  static const Map<String, String> _planetAllegianceMap = {
    // Imperial planets
    'Coruscant': 'Imperial',
    'Mustafar': 'Imperial',
    'Kuat': 'Imperial',
    'Eriadu': 'Imperial',
    'Lothal': 'Imperial',
    'Naboo': 'Imperial',
    'Geonosis': 'Imperial',
    'Kamino': 'Imperial',

    // Resistance planets
    'Alderaan': 'Resistance',
    'Yavin IV': 'Resistance',
    'Hoth': 'Resistance',
    'Dagobah': 'Resistance',
    'Endor': 'Resistance',
    'Jakku': 'Resistance',
    'Takodana': 'Resistance',
    'Ahch-To': 'Resistance',
    'Crait': 'Resistance',

    // Other or contested planets
    'Scarif': 'Imperial',
    'Dantooine': 'Resistance',
  };

  static const Map<String, String> _starshipAllegianceMap = {
    // Imperial starships
    'Star Destroyer': 'Imperial',
    'TIE Advanced x1': 'Imperial',
    'Death Star': 'Imperial',
    'Executor': 'Imperial',
    'Imperial Shuttle': 'Imperial',
    'Sentinel-class Landing Craft': 'Imperial',

    // Resistance starships
    'CR90 Corvette': 'Resistance',
    'Millennium Falcon': 'Resistance',
    'X-wing': 'Resistance',
    'Y-wing': 'Resistance',
    'A-wing': 'Resistance',
    'B-wing': 'Resistance',
    'Calamari Cruiser': 'Resistance',
    'EF76 Nebulon-B Escort Frigate': 'Resistance',
  };

  Future<List<Person>> fetchPeopleBySide(String side) async {
    List<Person> matchedPeople = [];

    String? url = '$_baseUrl$_peopleEndpoint';

    while (url != null) {
      final response = await httpClient.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;

        for (var item in results) {
          final person = Person.fromJson(item);
          final allegiance = _peopleAllegianceMap[person.name];

          if (allegiance == side) {
            person.homeworldName =
                await _fetchHomeworldName(person.homeworldUrl);
            matchedPeople.add(person);
          }
        }
        url = data['next'];
      } else {
        throw Exception(
            'Failed to load people. Status code: ${response.statusCode}');
      }
    }
    return matchedPeople;
  }

  Future<String> _fetchHomeworldName(String url) async {
    try {
      final response = await httpClient.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['name'] ?? 'Unknown';
      }
      return 'Unknown';
    } catch (_) {
      return 'Unknown';
    }
  }

  Future<List<Planet>> fetchPlanetsBySide(String side) async {
    List<Planet> matchedPlanets = [];
    String? url = '$_baseUrl$_planetsEndpoint';

    while (url != null) {
      final response = await httpClient.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;

        for (var item in results) {
          final planet = Planet.fromJson(item);
          final allegiance = _planetAllegianceMap[planet.name];

          if (allegiance == side) {
            matchedPlanets.add(planet);
          }
        }
        url = data['next'];
      } else {
        throw Exception(
            'Failed to load planets. Status code: ${response.statusCode}');
      }
    }
    return matchedPlanets;
  }

  Future<List<Starship>> fetchStarshipsBySide(String side) async {
    List<Starship> matchedStarships = [];
    String? url = '$_baseUrl$_starshipsEndpoint';

    while (url != null) {
      final response = await httpClient.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;

        for (var item in results) {
          final starship = Starship.fromJson(item);
          final allegiance = _starshipAllegianceMap[starship.name];

          if (allegiance == side) {
            matchedStarships.add(starship);
          }
        }
        url = data['next'];
      } else {
        throw Exception(
            'Failed to load starships. Status code: ${response.statusCode}');
      }
    }
    return matchedStarships;
  }
}

HttpClient _createHttpClient() {
  final client = HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  return client;
}

final httpClient = IOClient(_createHttpClient());
