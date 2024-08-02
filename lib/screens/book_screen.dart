import 'dart:math';
import 'package:flutter/material.dart';
import 'package:books_app/model/book_model.dart';
import 'package:books_app/widgets/styled_image_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class BookScreen extends StatelessWidget {
  BookScreen({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: StyledImage(
                  book.image ?? '',
                  width: 80,
                  height: 100,
                  isSVG: false,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              book.title ?? 'No Title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: primaryColor,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 10),
            Text(
              book.description ?? 'No Description',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              'Author: ${book.author ?? 'Unknown'}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              'Published Date: ${book.publishedDate ?? 'Unknown'}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ${book.price ?? 'Free'}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 20),
            if (book.saleability == 'FOR_SALE' && book.buyLink != null)
              ElevatedButton(
                onPressed: () => _launchURL(book.buyLink!),
                child: Text('Buy Book'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            if (book.price == 'FREE' && book.readLink != null)
              ElevatedButton(
                onPressed: () => _launchURL(book.readLink!),
                child: Text('Read Book'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
          ],
        ),
      ),
    );
  }
}