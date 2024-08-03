import 'package:books_app/screens/book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/screens/home_screen.dart';
import 'package:books_app/env/theme.dart';
import 'package:books_app/logic/book_cubit.dart';
import 'package:books_app/widgets/book_widget.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit()..getBusinessBooks(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                var cubit = BookCubit.get(context);

                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is Success) {
                  if (cubit.businessBooks.isEmpty) {
                    return const Center(child: Text("No business books were found."));
                  }
                }
                return DefaultTabController(
                  length: 1,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      title: const Text(
                        "Business Books",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
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
                                itemCount: cubit.businessBooks.length,
                                itemBuilder: (context, index) {
                                  var businessBook = cubit.businessBooks[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookScreen(book: businessBook),
                                        ),
                                      );
                                    },
                                    child: BookItem(book: businessBook),
                                  );
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
