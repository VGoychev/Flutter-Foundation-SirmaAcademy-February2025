import 'dart:io';

void calculateSpeed(double distance, double time){
  double averageSpeed = distance / time;

  print('${averageSpeed.toStringAsFixed(2)}');
}

void main(){
  double distance = double.parse(stdin.readLineSync()!);
  double time = double.parse(stdin.readLineSync()!);

  calculateSpeed(distance, time);
}