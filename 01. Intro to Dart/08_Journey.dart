import 'dart:io';

void calculateDistance(double x, double y){
  double distance = ( 5 * x - 3 * y).abs();
  print(distance.toStringAsFixed(0));
}

void main(){
  double x = double.parse(stdin.readLineSync()!);
  double y = double.parse(stdin.readLineSync()!);

  calculateDistance(x, y);
}