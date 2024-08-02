import 'dart:ui';
import 'package:books_app/logic/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:books_app/env/theme.dart';
import 'package:books_app/widgets/styled_image_widget.dart';
import 'package:books_app/widgets/book_card_widget.dart';
import 'package:books_app/widgets/book_cover_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          // backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            ],),
        ),
        body: SingleChildScrollView(
          child: Column(
            children :[
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                          color: Colors.black
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            margin: const EdgeInsets.only(left: 35, right:15),
                            child: const Text("Welcome to Cyberbooks", style: TextStyle(color: secondary,fontSize: 23, fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            margin: const EdgeInsets.only(left: 35, right:15),
                            child: const Text("The Largest eBooks Library", style: TextStyle(color: secondary,fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
                          SizedBox(height: 35,),
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      color: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
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
          SizedBox(height: 15,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Text("Latest Books", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
                ),
          SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: getProgrammingBanner(),
                ),
                SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: getScienceBanner(),
                ),
                SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: getBusinessBanner(),
                ),
                SizedBox(height: 25,),
                  ],
                ),
              ],
            ),
          ),
      );
  }

  getProgrammingBanner(){
    return BlocBuilder<BookCubit, BookState>(
        builder: (context, state){
          var cubit = BookCubit.get(context);

          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemCount: 4,
              itemBuilder: (context, index) {
                var programmingBook = cubit.programmingBooks[index];
                BookCover(book: programmingBook);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
            ),
          );
        }
    );
  }

  getScienceBanner(){
    return BlocBuilder<BookCubit, BookState>(
        builder: (context, state){
          var cubit = BookCubit.get(context);

          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemCount: 4,
              itemBuilder: (context, index) {
                var scienceBook = cubit.scienceBooks[index];
                BookCover(book: scienceBook);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
            ),
          );
        }
    );
  }

  getBusinessBanner(){
    return BlocBuilder<BookCubit, BookState>(
        builder: (context, state){
          var cubit = BookCubit.get(context);

          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemCount: 4,
              itemBuilder: (context, index) {
                var businessBook = cubit.businessBooks[index];
                BookCover(book: businessBook);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
            ),
          );
        }
    );
  }

}