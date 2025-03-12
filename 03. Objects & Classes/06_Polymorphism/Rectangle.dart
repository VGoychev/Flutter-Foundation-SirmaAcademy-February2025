import 'Shape.dart';

class Rectangle extends Shape{
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {

    return width * height;
  }

  @override
  String toString() => 'Rectangle';

}