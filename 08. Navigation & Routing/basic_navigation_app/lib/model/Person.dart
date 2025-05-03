class Person {
  String firstName;
  String lastName;
  Person({required this.firstName, required this.lastName});

  void setFirstName(String newName){
    firstName = newName;
  }

  void setLastName(String newLastName){
    lastName = newLastName;
  }
}