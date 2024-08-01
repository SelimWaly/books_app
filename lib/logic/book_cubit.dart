import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/model/book_model.dart';
import 'package:books_app/model/book_card_model.dart';
import 'package:books_app/env/variables.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit():super(BookInitial());

  static BookCubit get(context)=> BlocProvider.of(context);
  List<BookModel> programmingBooks = [];
  List<BookModel> scienceBooks = [];
  List<BookModel> businessBooks = [];

  List<BookModel> programmingBannerBooks = [];
  List<BookModel> scienceBannerBooks = [];
  List<BookModel> businessBannerBooks = [];


  List<BookModel> freeBooks = [];


  getProgrammingBooks() async{
    try {
      emit(Loading());
      final response = http.get(Uri.parse('${apiUrl}?q=programming'))
      if (response.statusCode == 200) {
        var results = json.decode(response.body);
        debugPrint('Results: $results')
        for (var element in results) {
          programmingBooks.add(BookModel.fromJson(element));
        }
      } else {
        emit(Error());
      }
      // var data = await FirebaseFirestore.instance.collection('products').get();
      //
      // // data.docs.forEach((element){});
      //
      // for (var element in data.docs) {
      //   products.add(ProductsModel.fromJson(element.id, element.data()));
      //   // print('====${element.data()}====');
      //
      // }

      emit(Success());
    }
    catch(e){
      debugPrint('An error has occurred while attempting to fetch items for category "programming".\nError:'${e.toString()}');
    }
  }
}