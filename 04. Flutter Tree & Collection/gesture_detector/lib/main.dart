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
      title: 'Gesture Detector Demo',
      home: GestureDetectorScreen(),
    );
  }
}

class GestureDetectorScreen extends StatefulWidget{
  @override
  _GestureDetectorState createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorScreen>{
  String text = "Hello, Flutter!";
  String tappedText = "Tap me!";
  String swipeLeftText = "Swiped Left!";
  String swipeRightText = "Swiped Right!";
  String longPressedText = "Long Pressed!";
  Offset position = Offset(0, 0);

  void changeText(){
    setState(() {
      text = text == "Hello, Flutter!" ? "Hello, there!" : "Hello, Flutter!";
    });
  }

  void tapText(){
    setState(() {
      tappedText = "Tapped!";
    });
  }
  void longPress(){
    setState(() {
      tappedText = "Long Pressed!";
    });
  }

  void swipeLeft(){
    setState(() {
      tappedText = swipeLeftText;
    });
  }

  void swipeRight(){
    setState(() {
      tappedText = swipeRightText;
    });
  }

  void updatePosition(DragUpdateDetails details) {
    setState(() {
      position += details.delta;
      print('New position: x=${position.dx}, y=${position.dy}');
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.favorite),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => tapText(),
                  onLongPress: () => longPress(),
                  onHorizontalDragUpdate:(details) {
                    if(details.primaryDelta! > 0){
                      swipeRight();
                    } else if (details.primaryDelta! < 0){
                      swipeLeft();
                    }
                  },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 120,
                  height: 80,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(tappedText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ),
                ElevatedButton(
                  onPressed: () => changeText(),
                  child: Text("Press me!")
                ),
              ],
            ),
          ),
          Positioned(
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              onPanUpdate: updatePosition,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Drag me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





