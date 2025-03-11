class Book {
  String title;
  String author;
  double price;


  Book(this.title, this.author, this.price);

  void displayDetails(){
    print('Book\'s information:\nTitle: ${title}\nAuthor: ${author}\nPrice: ${price}');
  }
}