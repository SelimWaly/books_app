import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/logic/book_cubit.dart';
import 'package:books_app/env/theme.dart';
import 'package:books_app/widgets/book_cover_widget.dart';
import 'package:books_app/screens/categories/business_screen.dart';
import 'package:books_app/screens/categories/programming_screen.dart';
import 'package:books_app/screens/categories/science_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                              color: Colors.black
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              Container(
                                margin: const EdgeInsets.only(left: 35, right:15),
                                child: const Text("Welcome to Cyberbooks", style: TextStyle(color: secondary, fontSize: 23, fontWeight: FontWeight.w600),),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                margin: const EdgeInsets.only(left: 35, right:15),
                                child: const Text("The Largest eBooks Library", style: TextStyle(color: secondary, fontSize: 15, fontWeight: FontWeight.w500),),
                              ),
                              const SizedBox(height: 35,),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          color: Colors.black,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: appBgColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(100))
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProgrammingScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Programming Books",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: getProgrammingBanner(),
                ),
                const SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScienceScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Science Books",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: getScienceBanner(),
                ),
                const SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BusinessScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Business Books",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: getBusinessBanner(),
                ),
                const SizedBox(height: 25,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getProgrammingBanner() {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        var cubit = BookCubit.get(context);

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 5),
          scrollDirection: Axis.horizontal,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 15, right: 15),
            itemCount: 4,
            itemBuilder: (context, index) {
              var programmingBook = cubit.programmingBooks[index];
              return BookCover(book: programmingBook);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          ),
        );
      },
    );
  }

  getScienceBanner() {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        var cubit = BookCubit.get(context);

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 5),
          scrollDirection: Axis.horizontal,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 15, right: 15),
            itemCount: 4,
            itemBuilder: (context, index) {
              var scienceBook = cubit.scienceBooks[index];
              return BookCover(book: scienceBook);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          ),
        );
      },
    );
  }

  getBusinessBanner() {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        var cubit = BookCubit.get(context);

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 5),
          scrollDirection: Axis.horizontal,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 15, right: 15),
            itemCount: 4,
            itemBuilder: (context, index) {
              var businessBook = cubit.businessBooks[index];
              return BookCover(book: businessBook);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          ),
        );
      },
    );
  }
}