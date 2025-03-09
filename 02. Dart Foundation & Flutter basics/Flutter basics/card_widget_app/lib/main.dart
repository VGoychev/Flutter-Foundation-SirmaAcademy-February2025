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
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Image and Button'),),
        body: Center(
          child: ImageButtonWidget(),
        ),
      ),
    );
  }
}

class ImageButtonWidget extends StatefulWidget{
  @override
  _ImageButtonWidgetState createState() => _ImageButtonWidgetState();
}

class _ImageButtonWidgetState extends State<ImageButtonWidget> {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVvcGxlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVvcGxlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVvcGxlfGVufDB8fDB8fHww',
  ];

  int currentImageIndex = 0;

  void changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % imageUrls.length;
    });
}
@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Image.network(imageUrls[currentImageIndex],
          width: 300,
          height: 400,
          key: ValueKey(currentImageIndex)),
        ),
        ElevatedButton(
          onPressed: changeImage,
          child: Text('Change Image'),
        ),
      ],
    );
  }
}