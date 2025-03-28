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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("hi there"),
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: 30,
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: 30,
                            color: Colors.amber,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 30,
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Text("$index",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white))),
                      ),
                      title: Text("Item $index"),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
