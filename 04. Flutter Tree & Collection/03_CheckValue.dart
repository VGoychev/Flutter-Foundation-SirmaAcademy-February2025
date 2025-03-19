void main(){
  Set<String> fruits = {"Apple", "Orange", "Mango"};
  fruits.add("Lemon");
  Set<String> fruit = {"Pizza", "Lemon", "Banana", "Tomato"};

  for(String item in fruits){
    if(fruit.contains(item)){
      print(item);
    }
  }
}