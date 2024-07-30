part of 'book_cubit.dart';

@immutable
sealed class BookState {}

class BookInitial extends BookState {}

class Loading extends BookState {}
class Success extends BookState {}
class Error extends BookState {}