void main(){
  List<String> words = ["racecar", "radar", "flutter", "widget", "level", "mobile", "dart", "screen", "app", "gesture"];
  for (var i = 0; i < words.length; i++) {
    var reversedArr = words.elementAt(i).split("").reversed;
    String reversedWord = "";

    for (var i = 0; i < reversedArr.length; i++) {
        reversedWord += reversedArr.elementAt(i);
    }
    if(words.elementAt(i) == reversedWord){
       print(words.elementAt(i));
    }
         

  }
}