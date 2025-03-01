import 'dart:io';
import 'dart:math';

void calculateCircumference(int r){
  double result = 2 * pi * r;

  print('${result.toStringAsFixed(2)}');
}

void main(){
  int r = int.parse(stdin.readLineSync()!);

  calculateCircumference(r);
}