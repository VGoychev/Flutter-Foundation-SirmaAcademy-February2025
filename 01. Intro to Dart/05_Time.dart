import 'dart:io';

void main(){
  int minutes = int.parse(stdin.readLineSync()!);

  int hours = minutes ~/ 60;
  int finalMinutes = minutes % 60;
  print('${hours.toString().padLeft(2, '0')}:${finalMinutes.toString().padLeft(2, '0')}');
}