import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_test/common/color.dart';
import 'package:work_test/data/model/book_model.dart';

// ignore: must_be_immutable
class BookCard extends StatelessWidget {
  BookModel? bookModel;
  BookCard({Key? key, this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: FittedBox(
        child: GestureDetector(
          onTap: () async => await canLaunch(
                  "${bookModel!.formats!.textPlainCharsetUtf8}")
              ? await launch("${bookModel!.formats!.textPlainCharsetUtf8}")
              : throw 'Could not launch "${bookModel!.formats!.textPlainCharsetUtf8}"',
          child: Container(
            height: 162,
            width: 114,
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: 120,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Color.fromARGB(1, 211, 209, 238),
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    // elevation: 5,
                    margin: EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "${bookModel!.formats!.imageJpeg}",
                        fit: BoxFit.fitHeight,
                        height: 110,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  width: 90,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${bookModel!.title}",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "${bookModel!.title}",
                        maxLines: 1,
                        style: TextStyle(
                          color: MyColor.font16,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
