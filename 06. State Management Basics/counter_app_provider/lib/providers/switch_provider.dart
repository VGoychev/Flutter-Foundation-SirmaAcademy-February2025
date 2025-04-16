import 'package:flutter/material.dart';

class SwitchProvider extends ChangeNotifier{
  bool value;
  final ValueNotifier<ThemeMode> themeNotifier;

  SwitchProvider({
    this.value = false,
    required this.themeNotifier,
  });
  void ChangeTheme(){
    value = !value;
    themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}