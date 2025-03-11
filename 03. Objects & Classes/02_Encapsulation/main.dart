import 'BankAccount.dart';

void main(){
  BankAccount bankAccount = new BankAccount('DF125734', 1200.00);

  bankAccount.deposit(100);
  print('${bankAccount.balance}');

  bankAccount.withdraw(300);
  print('${bankAccount.balance}');
}