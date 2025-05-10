class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String hyperdrive_rating;

  Starship(
      {required this.name,
      required this.model,
      required this.manufacturer,
      required this.hyperdrive_rating});

   factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
        name: json['name'],
        model: json['model'],
        manufacturer: json['manufacturer'],
        hyperdrive_rating: json['hyperdrive_rating']);
  }

    Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
      'manufacturer': manufacturer,
      'hyperdrive_rating': hyperdrive_rating,
    };
  }
}
