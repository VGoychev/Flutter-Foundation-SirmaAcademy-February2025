void main(){
  List<int> numbers = [10, 15, 20, 25, 30, 35, 40];
  List<int> filtered = numbers.where((num) => num < 20).toList();
  print(filtered);
}