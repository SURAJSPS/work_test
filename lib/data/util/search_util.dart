import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:work_test/data/model/book_model.dart';

class SearchUtil {
  static List<BookModel> bookSearchList = [];

  static Future<List<BookModel>?> searchBooks({String? search}) async {
    try {
      String url = "http://gutendex.com/books/?search=$search%20";
      print(url);
      final response = await http.get(Uri.parse(url));

      var data = jsonDecode(response.body);

      List<dynamic> list = data["results"]
          .map((result) => new BookModel.fromJson(result))
          .toList();
      bookSearchList.clear();
      for (int b = 0; b < list.length; b++) {
        BookModel bookModel = list[b] as BookModel;
        bookSearchList.add(bookModel);
      }
      // print(
      //     "_______________________${bookSearchList.length}_________________________________");
      return bookSearchList;
    } catch (e) {
      print("Exception________$e");
    }
  }
}
