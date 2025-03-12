import 'Circle.dart';
import 'Rectangle.dart';
import 'Shape.dart';

void main(){
  int r = 5;
  double width = 10.0;
  double height = 20.0;
  List<Shape> shapes = new List.empty(growable: true);

  Circle circle = new Circle(r);
  Rectangle rectangle = new Rectangle(width, height);

  shapes.add(circle);
  shapes.add(rectangle);


  for (int i = 0; i < shapes.length; i++) {

    print('Current shape: ${shapes.elementAt(i)}');
    print('Shape\'s area: ${shapes.elementAt(i).area().abs()}');
  }
}