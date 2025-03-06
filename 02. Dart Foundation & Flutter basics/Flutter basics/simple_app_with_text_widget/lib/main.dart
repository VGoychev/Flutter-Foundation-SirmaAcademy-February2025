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
      home: Scaffold(
        appBar: AppBar(title: Text('Hello Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Row 1',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(50),
                    margin: EdgeInsets.only(left: 20, bottom: 50),
                    color: Colors.black,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Row 2',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                    ),
                    ),
                    Container(
                    padding: EdgeInsets.all(50),
                    margin: EdgeInsets.only(left: 20, bottom: 50),
                    color: Colors.green,
                  )
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Row 3',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(50),
                      margin: EdgeInsets.only(left: 20, bottom: 50),
                      color: Colors.red,
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget messageWidget(String text, bool isMe){
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: isMe ? Colors.amber : Colors.blue,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: isMe ? Radius.circular(0) : Radius.circular(20),
            bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(20)),
          ),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
            fontSize: 22.5,
            color: Colors.black),
            ),
        );
  }
}

