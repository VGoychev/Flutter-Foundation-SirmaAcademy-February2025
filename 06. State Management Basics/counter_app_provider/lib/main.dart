import 'package:counter_app_provider/pages/home_page.dart';
import 'package:counter_app_provider/providers/counter_provider.dart';
import 'package:counter_app_provider/providers/switch_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider(),
      ),
      ChangeNotifierProvider(create: (context) => SwitchProvider(
        value: false,
        themeNotifier: themeNotifier
      ),
      ),
    ],
    child: ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, mode, __){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: MyHomePage(),
        );
        },
      ),
    );
  }
}