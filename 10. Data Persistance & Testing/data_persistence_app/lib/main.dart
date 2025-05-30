import 'package:data_persistence_app/screens/home/home.dart';
import 'package:data_persistence_app/screens/registration/registration.dart';
import 'package:data_persistence_app/services/hive_service.dart';
import 'package:data_persistence_app/services/shared_prefs_service.dart';
import 'package:data_persistence_app/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'models/mood.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    final prefsService = SharedPrefsService();
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(MoodAdapter());
    final hiveService = HiveService();
    await hiveService.init();
    await prefsService.init();
    final isRegistered =
        prefsService.getString('user_email')?.isNotEmpty ?? false;

    runApp(MyApp(
      isRegistered: isRegistered,
      prefsService: prefsService,
      hiveService: hiveService,
    ));
  } catch (e) {
    throw ErrorDescription('Error: $e');
  }
}

class MyApp extends StatefulWidget {
  final SharedPrefsService prefsService;
  final HiveService hiveService;
  final bool isRegistered;
  const MyApp(
      {super.key,
      required this.isRegistered,
      required this.prefsService,
      required this.hiveService});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;
  @override
  void initState() {
    super.initState();
    _themeMode =
        widget.prefsService.getThemeMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void _toggleTheme() async {
    final isDark = _themeMode == ThemeMode.dark;
    final newMode = isDark ? ThemeMode.light : ThemeMode.dark;
    await widget.prefsService.setThemeMode(!isDark);
    setState(() => _themeMode = newMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Persistence App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: widget.isRegistered
          ? Home(
              onToggleTheme: _toggleTheme,
              themeMode: _themeMode,
            )
          : Registration(
              onToggleTheme: _toggleTheme,
              themeMode: _themeMode,
            ),
      debugShowCheckedModeBanner: false,
    );
  }
}
