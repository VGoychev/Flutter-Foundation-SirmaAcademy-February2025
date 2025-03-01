void calculateTotalCost(double itemPrice, int quantity){

  double totalCost = itemPrice * quantity;

  print('${totalCost.toStringAsFixed(2)}');
}

void main(){
  double itemPrice = 10.5;
  int quantity = 3;

  calculateTotalCost(itemPrice, quantity);
}