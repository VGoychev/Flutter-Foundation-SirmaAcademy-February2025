import 'package:data_persistence_app/models/mood.dart';
import 'package:data_persistence_app/screens/home/home_view.dart';
import 'package:data_persistence_app/services/hive_service.dart';
import 'package:data_persistence_app/services/shared_prefs_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  const Home({required this.onToggleTheme, required this.themeMode, super.key});
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final SharedPrefsService _prefsService = SharedPrefsService();
  final HiveService _hiveService = HiveService();
  final List<Mood> moods = List.empty(growable: true);
  final TextEditingController controller = TextEditingController();
  bool isLoading = true;
  String? selectedMood;
    static const List<String> moodOptions = [
    '😊 Happy',
    '😢 Sad',
    '😡 Angry',
    '😌 Calm',
    '😴 Tired',
    '😱 Anxious',
  ];

  Future<void> _initializeServices() async {
    await _prefsService.init();
    await _hiveService.init();
    final storedMoods = _hiveService.getMoods();
    setState(() {
      moods.addAll(storedMoods);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  void onMoodChanged(String? value) {
  setState(() {
    selectedMood = value;
  });
}

  Future<String> getUserName() async {
    try {
      String? name = await _prefsService.getString('user_name');
      if (name != null) {
        return name;
      }
    } catch (e) {
      throw ErrorDescription('Error fetching name from SharedPrefs: $e');
    }
    return '';
  }

  void addMood() {
    final text = controller.text.trim();
    if(text.isEmpty) return;

    setState(() {
      moods.add(Mood(date: DateTime.now(), mood: selectedMood!, note: text));
      controller.clear();
    });

    _hiveService.saveMoods(moods);
  }

    void deleteMoods(int index) {
    setState(() {
      moods.removeAt(index);
    });

    _hiveService.saveMoods(moods);
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}
