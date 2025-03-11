import 'Car.dart';
import 'Vehicle.dart';

void main(){
  Vehicle vehicle = new Vehicle('Scania', '350');

  vehicle.start();

  print('${vehicle.brand} - ${vehicle.model}');

  Car car = new Car('Audi', 'A4', 4);

  car.start();

  print('${car.brand} - ${car.model} - ${car.numberOfDoors} doors');
}