import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/env/theme.dart';
import 'package:books_app/logic/book_cubit.dart';
import 'package:books_app/widgets/book_widget.dart';
import 'package:books_app/widgets/book_card_widget.dart';

class ProgrammingScreen extends StatelessWidget {
  const ProgrammingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit,BookState>(
      builder: (context, state) {
        var cubit = BookCubit.get(context);

        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Success) {
          if (cubit.programmingBooks.isEmpty) {
            return const Center(child: Text("No programming books were found."));
          }
        }
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 1)
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        itemCount: cubit.programmingBooks.length,
                        itemBuilder: (context, index){
                          var programmingBook = cubit.programmingBooks[index];
                          return BookItem(book: programmingBook);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
