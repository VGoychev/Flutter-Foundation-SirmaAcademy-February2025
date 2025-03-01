import 'dart:io';

void calculateWaterCons(double water, int people){
  double consumption = water / 7 / people;

  print('${consumption.toStringAsFixed(2)}');
}

void main(){
  double water = double.parse(stdin.readLineSync()!);
  int people = int.parse(stdin.readLineSync()!);

  calculateWaterCons(water, people);

}