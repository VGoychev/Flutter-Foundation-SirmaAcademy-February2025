import 'Animal.dart';
import 'Cat.dart';
import 'Dog.dart';

void main(){

  Animal cat = new Cat('Pesho');
  Animal elephant = new Animal('Gosho');
  Animal dog = new Dog('Mitko');

  print('Elephant\'s sound:');
  elephant.makeSound();

  print('Cat\'s sound:');
  cat.makeSound();

  print('Dog\'s sound:');
  dog.makeSound();
  
}