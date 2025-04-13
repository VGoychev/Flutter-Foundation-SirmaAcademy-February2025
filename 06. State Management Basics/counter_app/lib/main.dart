import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String text = 'Hello, Flutter!';
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key});

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String text = 'Loading...';
  int number = 0;
  String parentMessage = 'Hello from Parent';
  String childMessage = 'Hey there!';
  String max = 'Max Reached';

  @override
  void initState(){
    super.initState();
    _updateText();
  }
  void _updateText() {
      Timer(Duration(seconds: 3), loadData);
  }
  void loadData(){
    setState(() {
      text = 'Data Loaded!';
    });
  }

  void _updateCount() {
    setState(() {
      if(number < 10){
      number++;
      } else {
        number = 0;
      }
    });
  }

  void updateFromChild(String newMessage){
    setState(() {
      childMessage = newMessage;
    });
  }
  
   @override
  Widget build(BuildContext context) {
       double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
       
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter App'),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateText,
              child: const Text('Click me!'),
            ),

            Text("Message to child: $parentMessage"),
            SizedBox(height: 20),
            ChildWidget(message: parentMessage, onSendMessage: updateFromChild,
            ),
            SizedBox(height: 20),
            Text("Message from child: $childMessage"),
            Text(number < 10 ? number.toString() : 'Max reached!'),
            ElevatedButton(onPressed: _updateCount, child: Text('Count up!'))
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final String message;
  final void Function(String) onSendMessage;
  const ChildWidget({
    Key? key,
    required this.message,
    required this.onSendMessage
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Child received: $message"),
        ElevatedButton(
          onPressed: () {
            onSendMessage("Hey from child!");
          },
          child: Text("Send data!"),
        )
      ],
    );
  }
}


