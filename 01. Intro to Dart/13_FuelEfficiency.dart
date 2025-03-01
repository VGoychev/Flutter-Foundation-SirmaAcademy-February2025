import 'dart:io';

void calculateFuel(double distance, double liters){
  double fuel = distance / liters;

  print('${fuel}');
}

void main(){
  double distance = double.parse(stdin.readLineSync()!);
  double liters = double.parse(stdin.readLineSync()!);

  calculateFuel(distance, liters);

}