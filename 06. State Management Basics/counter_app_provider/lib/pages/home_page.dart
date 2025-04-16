
import 'package:counter_app_provider/main.dart';
import 'package:counter_app_provider/providers/counter_provider.dart';
import 'package:counter_app_provider/providers/switch_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(context.watch<CounterProvider>().value.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Switch(value: context.watch<SwitchProvider>().value, onChanged: (_) {
              context.read<SwitchProvider>().ChangeTheme();
            })],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {context.read<CounterProvider>().incrementCounter();},
            ),
            SizedBox(height: 10.0,),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {context.read<CounterProvider>().decrementCounter();},
            ),
        ],
      ),
    );
  }
}