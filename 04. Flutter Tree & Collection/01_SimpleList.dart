import 'dart:io';
void main(){
  String fruit1 = stdin.readLineSync()!;
  String fruit2 = stdin.readLineSync()!;
  String fruit3 = stdin.readLineSync()!;
  List<String> fruits = List.empty(growable: true);

  fruits.add(fruit1);
  fruits.add(fruit2);
  fruits.add(fruit3);

  print(fruits);
}