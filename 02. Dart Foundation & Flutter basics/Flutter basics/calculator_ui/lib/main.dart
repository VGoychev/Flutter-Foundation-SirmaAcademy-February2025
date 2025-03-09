// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator UI',
      home: CalculatorScreen(),
    );
  }
}
class CalculatorScreen extends StatefulWidget {
    @override
    _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>{
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double result = 0;

  void calculate(String operator){
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      switch(operator){
        case '+':
        result = num1 + num2;
        break;
        case '-':
        result = num1 - num2;
        break;
        case '/':
        result = num2 != 0 ? num1 / num2 : double.infinity;
        break;
        case '*':
        result = num1 * num2;
        break;
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Calculator UI', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 5),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: num1Controller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey, width: 2), // Default border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2), // Border color when focused
                        ),
                        labelText: 'Number1',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 10),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: num2Controller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey, width: 2), // Default border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2), // Border color when focused
                        ),
                        labelText: 'Number2',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => calculate('+'), child: Text('+'),
                  style:ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () => calculate('-'), child: Text('-'),
                  style:ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () => calculate('/'), child: Text('/'),
                  style:ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () => calculate('*'), child: Text('*'),
                  style:ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
