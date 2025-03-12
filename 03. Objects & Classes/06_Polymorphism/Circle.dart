import 'Shape.dart';
import 'dart:math';

class Circle extends Shape{
  int r;

  Circle(this.r);

  @override
  double area() {

    return pi * r * r;
  }

  @override
  String toString() => 'Circle';
}