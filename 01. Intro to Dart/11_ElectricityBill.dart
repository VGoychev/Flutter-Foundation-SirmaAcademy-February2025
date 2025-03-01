import 'dart:io';

void calculateElectricity(int units, double rate){

  double total = (units * rate) + 10;
  print('${total.toStringAsFixed(2)}');
}

void main(){
  int units = int.parse(stdin.readLineSync()!);
  double rate = double.parse(stdin.readLineSync()!);

  calculateElectricity(units, rate);
}