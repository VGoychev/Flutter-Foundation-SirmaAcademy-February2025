import 'package:complete_interactive_app/providers/switch_provider.dart';
import 'package:complete_interactive_app/screens/registration/registration_state.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              SwitchProvider(value: false, themeNotifier: themeNotifier),
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (_, mode, __) {
            return MaterialApp(
              title: 'Complete Interactive App',
              debugShowCheckedModeBanner: false,
              themeMode: mode,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              home: Registration(),
            );
          }),
    );
  }
}
