import 'dart:io';
void main(){
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  String operator = stdin.readLineSync()!;
  int result = 0;
  switch (operator){
    case '+':
    result = a + b;
    break;
    case '-':
    result = a - b;
    break;
    case '/':
    result = a ~/ b;
    break;
    case '*':
    result = a * b;
    break;
    default:
      print("Error: Invalid operator");
      return;
  }

  print('Result: $result');
}