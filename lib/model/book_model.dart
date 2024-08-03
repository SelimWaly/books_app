class BookModel {
  String? title;
  String? image;
  String? description;
  String? publishedDate;
  String? author;
  String? saleability;
  double? price;
  String? buyLink;
  String? readLink;

  BookModel.fromJson(Map<String,dynamic> json){
    title = json['volumeInfo']['title'] ?? 'No title';
    image = json['volumeInfo']['imageLinks']['thumbnail'] ?? 'https://github.com/SelimWaly/drive-temp-1/blob/main/unknown.png?raw=true';
    description = json['volumeInfo']['description'] ?? 'No description';
    publishedDate = json['volumeInfo']['publishedDate'] ?? 'No publish date';
    author = json['volumeInfo']['authors'] != null? json['volumeInfo']['authors'][0]: 'No author'; /// Only show first author
    saleability = json['saleInfo']['saleability'] ?? 'NOT_FOR_SALE';
    price = json['saleInfo']['listPrice'] != null? json['saleInfo']['listPrice']['amount']: 0.0;
    buyLink = json['saleInfo']['buyLink'] ?? json['accessInfo']['webReaderLink'];
    readLink = json['accessInfo']['webReaderLink'] ?? '';
  }
}
