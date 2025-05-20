  import 'package:hive_flutter/hive_flutter.dart';
  
  part 'mood.g.dart';

  @HiveType(typeId: 0)
  class Mood extends HiveObject {
    @HiveField(0)
    final DateTime date;

    @HiveField(1)
    final String mood;

    @HiveField(2)
    final String? note;

    Mood({
      required this.date,
      required this.mood,
      required this.note,
    });
  }
