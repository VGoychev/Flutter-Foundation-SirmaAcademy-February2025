int add(int a, int b){
  return a + b;
}

int subtract(int a, int b){
  return a - b;
}

int multiply(int a, int b){
  return a * b;
}

void main(){
  
  int a = 10;
  int b = 5;

  print('${add(a, b)}');
  print('${subtract(a, b)}');
  print('${multiply(a, b)}');

}