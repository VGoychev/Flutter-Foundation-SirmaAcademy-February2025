// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states/screens/catalog/catalog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog',
      debugShowCheckedModeBanner: false,
      home: CatalogPage(),
    );
  }
}

