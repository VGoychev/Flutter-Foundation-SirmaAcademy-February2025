import 'dart:io';

import 'Student.dart';
void main(){
  int n = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n; i++) {
    String name = stdin.readLineSync()!;
    List<int> marks = List.empty(growable: true);
    String input = stdin.readLineSync()!;

    while(input != 'End'){
      int mark = int.parse(input);
      marks.add(mark);

      input = stdin.readLineSync()!;
    }
    Student student = new Student(name, marks);
    print('${student.calculateAverage()}');
    print('${student.name}\'s grades: ${student.getGrade()}');
  }
  
}