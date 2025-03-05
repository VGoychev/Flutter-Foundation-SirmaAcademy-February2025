import 'dart:io';
void main(){
  int i = int.parse(stdin.readLineSync()!);
  if(i > 0){
    print('The number is positive.');
  } else if (i == 0){
    print('The number is zero.');
  } else {
    print('The number is negative.');
  }
}