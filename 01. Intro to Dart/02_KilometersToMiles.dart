import 'dart:io';
void main(){
  double km = double.parse(stdin.readLineSync()!);

  double miles = km * 0.621371192;


  print(miles);
}