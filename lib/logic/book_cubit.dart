import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:books_app/model/book_model.dart';
import 'package:books_app/env/variables.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit():super(BookInitial());

  static BookCubit get(context)=> BlocProvider.of(context);
  List<BookModel> programmingBooks = [];
  List<BookModel> scienceBooks = [];
  List<BookModel> businessBooks = [];

  List<BookModel> freeBooks = [];


  getProgrammingBooks() async {
    emit(Loading());
    try {
      final response = await http.get(Uri.parse('$apiUrl?q=programming'));
      if (response.statusCode == 200) {
        var results = json.decode(response.body);
        for (var element in results['items']) {
          var programmingBook = BookModel.fromJson(element);

          programmingBooks.add(programmingBook);
          // if (programmingBook.saleability == 'NOT_FOR_SALE') {
          //   continue;
          // } else if (programmingBook.saleability == 'FOR_SALE') {
          //   programmingBooks.add(programmingBook);
          // } else {
          //   programmingBook.price = 'FREE';
          //   programmingBooks.add(programmingBook);
          // }
        }
        emit(Success());
      } else {
        emit(Error());
      }
    } catch (e) {
      debugPrint('An error has occurred while attempting to fetch items for category "programming".\nError: ${e.toString()}');
      emit(Error());
    }
  }

  getScienceBooks() async{
    emit(Loading());
    try {
      final response = await http.get(Uri.parse('$apiUrl?q=science'));
      if (response.statusCode == 200) {
        var results = json.decode(response.body);
        debugPrint('Results: $results');

        for (var element in results['items']) {
          // var scienceBook = BookModel.fromJson(element);

          scienceBooks.add(BookModel.fromJson(element));
        }
        emit(Success());
      } else {
        emit(Error());
      }
    }
    catch(e){
      debugPrint('An error has occurred while attempting to fetch items for category "science".\nError: ${e.toString()}');
    }
  }

  getBusinessBooks() async{
    emit(Loading());
    try {
      final response = await http.get(Uri.parse('$apiUrl?q=business'));
      if (response.statusCode == 200) {
        var results = json.decode(response.body);

        for (var element in results['items']) {
          // var businessBook = BookModel.fromJson(element);
          businessBooks.add(BookModel.fromJson(element));

          // if (businessBook.saleability == 'NOT_FOR_SALE') {
          //   continue;
          // } else if (businessBook.saleability == 'FOR_SALE') {
          //   businessBooks.add(businessBook);
          // } else {
          //   businessBook.price = 'FREE';
          //   businessBooks.add(businessBook);
          // }
        }
        emit(Success());
      } else {
        emit(Error());
      }
    }
    catch(e){
      debugPrint('An error has occurred while attempting to fetch items for category "business".\nError: ${e.toString()}');
    }
  }

  getFreeBooks() async{
    emit(Loading());
    try {
      final response = await http.get(Uri.parse('$apiUrl?q=for_free'));
      if (response.statusCode == 200) {
        var results = json.decode(response.body);
        debugPrint('Results: $results');
        for (var element in results['items']) {
          businessBooks.add(BookModel.fromJson(element));
        }
        emit(Success());
      } else {
        emit(Error());
      }
    }
    catch(e){
      debugPrint('An error has occurred while attempting to fetch items free books.\nError: ${e.toString()}');
    }
  }
}