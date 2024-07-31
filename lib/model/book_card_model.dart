class BookModel {
  String? title;
  String? image;
  String? saleability;
  String? price;

  BookModel.fromJson(String id,Map<String,dynamic> json){
    title = json['volumeInfo']['title'];
    image = json['volumeInfo']['imageLinks']['thumbnail'];
    saleability = json['saleInfo']['saleability'];
    price = json['saleInfo']['listPrice']['amount'];
  }
}