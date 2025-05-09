class Person {
  final String name;
  final String gender;
  final String birthYear;
  final String homeworldUrl;
  String? homeworldName;

  Person(
      {required this.name,
      required this.gender,
      required this.birthYear,
      required this.homeworldUrl,
      this.homeworldName});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        name: json['name'],
        gender: json['gender'],
        birthYear: json['birth_year'],
        homeworldUrl: json['homeworld']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'birth_year': birthYear,
      'homeworld': homeworldUrl,
      'homeworld_name': homeworldName,
    };
  }
}
