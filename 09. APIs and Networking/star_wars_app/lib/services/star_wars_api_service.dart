import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:star_wars_app/model/person.dart';

class StarWarsApiService {
  //Base API URL
  static const String _baseUrl = 'https://swapi.dev/api';

  //Endpoints
  static const String _peopleEndpoint = '/people';

  // Manual allegiance mapping
 static const Map<String, String> _allegianceMap = {
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

  Future<List<Person>> fetchPeopleBySide(String side) async {
    List<Person> matchedPeople = [];

    String? url = '$_baseUrl$_peopleEndpoint';

    while(url != null){
      final response = await httpClient.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;

        for (var item in results) {
          final person = Person.fromJson(item);
          final allegiance = _allegianceMap[person.name];

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
}

HttpClient _createHttpClient() {
  final client = HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  return client;
}

final httpClient = IOClient(_createHttpClient());
