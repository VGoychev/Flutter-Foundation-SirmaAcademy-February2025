import 'dart:io';
void main(){
  int a = int.parse(stdin.readLineSync()!);

  for(int i = 1; i <= 10; i++){
    print('$a x $i = ${a*i}');
  }
}