import 'package:data_persistence_app/models/mood.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  late final Box<Mood> _moodBox;

  Future<void> init() async {
    _moodBox = await Hive.openBox<Mood>('moods');
  }

  List<Mood> getMoods() => _moodBox.values.toList();

  Future<void> saveMoods(List<Mood> moods) async {
    await _moodBox.clear();
    for (final mood in moods) {
      await _moodBox.add(mood);
    }
  }

  Future<void> clearAll() async{
    await _moodBox.clear();
  }
}
