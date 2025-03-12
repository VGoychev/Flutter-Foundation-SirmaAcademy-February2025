import 'Employee.dart';

class Developer extends Employee{
  String programmingLang;

  Developer(super.name, super.salary, this.programmingLang);

  @override
  void displayInfo() {
    print('Developer\'s name: ${super.name}, salary: ${super.salary}, programming language: $programmingLang');
  }
}