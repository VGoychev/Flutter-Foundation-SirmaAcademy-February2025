import 'dart:io';

void main(){
  int distance = int.parse(stdin.readLineSync()!);
  int hours = int.parse(stdin.readLineSync()!);
  int minutes = int.parse(stdin.readLineSync()!);
  int seconds = int.parse(stdin.readLineSync()!);

  int time = (hours * 3600) + (minutes * 60) + seconds;

  double speed = distance / time;

  print('${speed.toStringAsFixed(6)}');
}