class BookModel {
  String? title;
  String? image;
  String? description;
  String? publishedDate;
  String? author;
  String? saleability;
  String? price;
  String? buyLink;
  String? readLink;

  BookModel.fromJson(Map<String,dynamic> json){
    title = json['volumeInfo']['title'];
    image = json['volumeInfo']['imageLinks']['thumbnail'];
    description = json['volumeInfo']['description'];
    publishedDate = json['volumeInfo']['publishedDate'];
    author = json['volumeInfo']['authors'][0]; /// Only show first author
    saleability = json['saleInfo']['saleability'];
    price = json['saleInfo']['listPrice']['amount'];
    buyLink = json['saleInfo']['buyLink'];
    readLink = json['accessInfo']['webReaderLink'];
  }
}