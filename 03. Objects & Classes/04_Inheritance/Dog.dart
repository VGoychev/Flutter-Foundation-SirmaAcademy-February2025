import 'Animal.dart';

class Dog extends Animal{

  Dog(super.name);


  @override
  void makeSound(){
    print('Bark bark');
  }
}