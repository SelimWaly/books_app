import 'dart:math';
import 'package:books_app/env/theme.dart';
import 'package:books_app/widgets/styled_image_widget.dart';
import 'package:books_app/model/book_model.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  BookItem({ Key? key, required this.book }) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    double width = 80, height = 110;

    if (book.saleability == 'NOT_FOR_SALE') {
      return SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(top: 15),
      child: Row(
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
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title ?? 'Unknown Title',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${book.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: "   "),
                         TextSpan(
                          text: 'By ${book.author}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
