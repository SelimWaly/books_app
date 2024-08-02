import 'dart:math';
import 'package:flutter/material.dart';
import 'package:books_app/env/theme.dart';
import 'package:books_app/widgets/styled_image_widget.dart';
import 'package:books_app/model/book_model.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    double width = 75, height = 100;


    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 50, right: 40),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Container(
                  width: width / 2,
                  height: height / 2,
                  decoration: BoxDecoration(
                    color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                  ),
                ),
              ),
              Container(
                width: width,
                height: height,
                padding: const EdgeInsets.all(8),
                child: StyledImage(
                  book.image ?? '',
                  isSVG: false,
                  radius: 8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            book.price ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}