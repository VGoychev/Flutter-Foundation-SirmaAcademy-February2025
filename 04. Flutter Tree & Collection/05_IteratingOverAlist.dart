void main(){
  List<int> a = [1, 1, 2, 3, 4, 5, 5, 14, 25, 50, 30, 30, 100];
  for (var i = 0; i < a.length; i++) {
    if(a.elementAt(i) % 5 == 0){
      print(a.elementAt(i));
    }
  }
}