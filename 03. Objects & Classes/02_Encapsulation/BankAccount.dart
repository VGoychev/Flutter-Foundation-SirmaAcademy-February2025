class BankAccount {
  String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance);

  double get balance{
    return _balance;
  }
  
  String get accountNumber{
    return _accountNumber;
  }

  void deposit(double amount){
    _balance += amount;
  }

  void withdraw(double amount){
    if(amount > _balance){
      print('Not enough money in the account!');
    } else {
      _balance -= amount;
    }
  }

}