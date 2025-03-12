class Student {
  String name;
  List<int> marks;

  Student(this.name, this.marks);

  double calculateAverage(){
    int sum = 0;
    for (int i = 0; i < marks.length; i++) {
      sum += marks.elementAt(i);
    }
    double average = sum / marks.length;
    return average;
  }

  String getGrade(){
    double avg = calculateAverage();
    if(avg >= 90){
      return 'A';
    } else if(avg >= 80 && avg <= 89){
      return 'B';
    } else if (avg >= 70 && avg <= 79){
      return 'C';
    }

    return 'F';
  }
}