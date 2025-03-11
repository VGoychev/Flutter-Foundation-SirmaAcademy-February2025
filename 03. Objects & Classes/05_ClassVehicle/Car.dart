import 'Vehicle.dart';

class Car extends Vehicle{
  int numberOfDoors;

  Car(super.brand, super.model, this.numberOfDoors);

  @override
  void start() {
    print('The car is starting');
  }
}