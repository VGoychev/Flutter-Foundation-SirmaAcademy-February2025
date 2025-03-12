import 'dart:io';

import 'Developer.dart';
import 'Employee.dart';
import 'Manager.dart';

void main(){
  int n = int.parse(stdin.readLineSync()!);
  List<Employee> employees = List.empty(growable: true);

  for (int i = 0; i < n; i++) {
    String name = stdin.readLineSync()!;
    double salary = double.parse(stdin.readLineSync()!);
    String depOrLang = stdin.readLineSync()!;

    Employee employee;
    if(depOrLang != 'Java'){
    employee = new Manager(name, salary, depOrLang);
    } else {
    employee = new Developer(name, salary, depOrLang);
    }

    employees.add(employee);
  }

  for (int i = 0; i < employees.length; i++) {
    employees.elementAt(i).displayInfo();
  }
}