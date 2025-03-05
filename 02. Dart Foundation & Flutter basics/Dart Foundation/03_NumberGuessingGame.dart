import 'dart:io';
import 'dart:math';

void main(){
  Random random = new Random();
  int secretNumber = random.nextInt(10) + 1;
  int guess;

  do{
    guess = int.parse(stdin.readLineSync()!);

    if(guess < 1 || guess > 10){
      print('Please enter a number between 1 and 10.');
    } else if (guess > secretNumber){
      print('Too high! Try again.');
    } else if (guess < secretNumber){
      print('Too low! Try again.');
    }
  } while (guess != secretNumber);

  print('Congratulations! You guessed the correct number : $secretNumber');
}