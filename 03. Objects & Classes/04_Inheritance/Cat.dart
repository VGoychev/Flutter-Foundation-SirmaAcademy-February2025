import 'Animal.dart';

class Cat extends Animal{

  Cat(super.name);

  @override
  void makeSound() {
   print('Meow meow');
  }
}