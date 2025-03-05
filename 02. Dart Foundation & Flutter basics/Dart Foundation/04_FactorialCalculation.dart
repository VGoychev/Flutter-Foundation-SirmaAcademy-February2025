import 'dart:io';
void main(){
  int num = int.parse(stdin.readLineSync()!);

  int factorial = 1;
  int i = num;

  while(i > 1){
    factorial *= i;
    i--;
  }

  print('$factorial');
}