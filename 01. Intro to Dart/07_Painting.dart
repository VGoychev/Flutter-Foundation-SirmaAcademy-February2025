import 'dart:io';

void calculatePaint(double n){
  double x = n / 13;
  double redPaint = x;
  double yellowPaint = 4 * x;
  double whitePaint = 8 * x;

  print('Red: ${redPaint.toStringAsFixed(4)}');
  print('Yellow: ${yellowPaint.toStringAsFixed(4)}');
  print('White: ${whitePaint.toStringAsFixed(4)}');
}

void main(){
   double totalPaint = double.parse(stdin.readLineSync()!);

   calculatePaint(totalPaint);
}