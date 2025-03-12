import 'Employee.dart';

class Manager extends Employee{
  String department;

  Manager(super.name, super.salary, this.department);

  @override
  void displayInfo() {
    print('Manager\'s name: ${super.name}, salary: ${super.salary}, department: $department');
  }
}