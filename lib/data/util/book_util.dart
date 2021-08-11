import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work_test/data/model/book_model.dart';

class BookUtil extends ChangeNotifier {
  static List<BookModel> bookList = [];

  static Future<List<BookModel>?> fetchBooks({String? topic}) async {
    print(topic);
    try {
      String url = 'http://gutendex.com/books/?topic=$topic';
      final response = await http.get(Uri.parse(url));

      var data = jsonDecode(response.body);

      List<dynamic> list = data["results"]
          .map((result) => new BookModel.fromJson(result))
          .toList();
      bookList.clear();
      for (int b = 0; b < list.length; b++) {
        BookModel bookModel = list[b] as BookModel;
        bookList.add(bookModel);
      }
      // print("____________________${bookList.length}_______________________");
      return bookList;
    } catch (e) {
      print("Exception________$e");
    }
  }
}
