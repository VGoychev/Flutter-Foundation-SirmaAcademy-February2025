import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier{
  int value;
  CounterProvider({
    this.value = 0,
  });
  void incrementCounter(){
    value++;
    notifyListeners();
  }

  void decrementCounter(){
    value--;
    notifyListeners();
  }
}