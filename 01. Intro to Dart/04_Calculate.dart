import 'dart:io';

void main(){
  int numOne = int.parse(stdin.readLineSync()!);
  int numTwo = int.parse(stdin.readLineSync()!);

  print('The sum is: ${numOne + numTwo}');
  print('The difference is: ${numOne - numTwo}');
  print('The product is: ${numOne * numTwo}');
  print('The average is: ${(numOne + numTwo) / 2}');
}