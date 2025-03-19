void main(){
  List<int> numbers = [2, 4, 6, 8, 10];

  List<int> newList = numbers.map((num) => num * 2).toList();

  print(newList);
}