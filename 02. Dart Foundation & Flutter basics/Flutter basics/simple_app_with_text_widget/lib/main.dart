// ignore_for_file: prefer_const_constructors

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
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          messageWidget('Hello', true),
          messageWidget('Hi', false),
          messageWidget('How\'s going?', true),
          messageWidget('Super!', false),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('seen')],
          )
          ],
          ),
        )
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

