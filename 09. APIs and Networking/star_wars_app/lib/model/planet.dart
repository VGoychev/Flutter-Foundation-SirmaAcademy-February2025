class Planet {
  final String name;
  final String terrain;
  final String population;
  final String climate;

  Planet({required this.name,
  required this.terrain,
  required this.population,
  required this.climate});


  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
        name: json['name'],
        terrain: json['terrain'],
        population: json['population'],
        climate: json['climate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'terrain': terrain,
      'population': population,
      'climate': climate,
    };
  }
}