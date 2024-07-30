class BookModel {
  String? id;
  String? name;
  String? image;

  BookModel.fromJson(String id,Map<String,dynamic> json){
    this.id = id;
    name = json['name'];
    image = json['image'];
  }
}