import 'dart:io';

void calculateBmi(double weight, double height){

  double bmi = weight / (height * height);
  
  print(bmi.toStringAsFixed(2));
}
void main(){
  double weight = double.parse(stdin.readLineSync()!);
  double height = double.parse(stdin.readLineSync()!);

  calculateBmi(weight, height);
}