class BookCardModel {
  String? title;
  String? image;
  String? saleability;
  String? price;

  BookCardModel.fromJson(Map<String,dynamic> json){
    title = json['volumeInfo']['title'];
    image = json['volumeInfo']['imageLinks']['thumbnail'];
    saleability = json['saleInfo']['saleability'];
    price = json['saleInfo']['listPrice']['amount'];
  }
}