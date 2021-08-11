import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_test/common/color.dart';
import 'package:work_test/data/model/book_model.dart';
import 'package:work_test/data/util/book_util.dart';
import 'package:work_test/data/util/search_util.dart';
import 'package:work_test/presenetation/widget/book_card.dart';

// ignore: must_be_immutable
class Books extends StatefulWidget {
  String? title;
  Books({Key? key, this.title}) : super(key: key);

  @override
  _BooksState createState() => _BooksState();
}

final _textController = TextEditingController();
late List<BookModel>? _bookList = [], _allBookList = [];
bool _isLoading = false;

class _BooksState extends State<Books> {
  futureBilderGetData() async {
    setState(() {
      _isLoading = true;
    });
    List<BookModel>? _tempBook = [];
    _tempBook.sort();
    _tempBook = await BookUtil.fetchBooks(topic: widget.title);
    setState(() {
      _bookList = _tempBook;
      _allBookList = _tempBook;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    futureBilderGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.secondary,
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                getCustomAppBar(context, widget),
                SizedBox(
                  height: 20,
                ),
                getSearchBar(setState),
                SizedBox(
                  height: 20,
                ),
                _isLoading ? RefreshProgressIndicator() : getBookView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget getBookView() {
  return Container(
    color: MyColor.background,
    child: StaggeredGridView.countBuilder(
      primary: false,
      addAutomaticKeepAlives: false,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(
        1,
      ),
      crossAxisSpacing: 1,
      itemCount: _bookList!.length,
      crossAxisCount: 3,
      itemBuilder: (context, index) {
        return BookCard(
          bookModel: BookUtil.bookList[index],
        );
      },
    ),
  );
}

Widget getSearchBar(setState) {
  return Container(
    color: MyColor.background,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(
      horizontal: 15,
    ),
    height: 40,
    child: TextField(
      controller: _textController,
      onChanged: (String? text) async {
        // print('-------------------------------------');
        List<BookModel>? _searchList = [];
        setState(() {
          _isLoading = true;
        });
        _searchList = await SearchUtil.searchBooks(search: text);
        if (_searchList!.length == 0) {
          setState(() {
            _bookList = _allBookList;
            _isLoading = false;
          });
        }
        setState(() {
          _bookList = _searchList;
          _isLoading = false;
        });
      },
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(),
        hintText: 'Search',
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(
            'assets/Search.svg',
            height: 20,
          ),
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 35),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 35),
        suffix: GestureDetector(
          onTap: () {
            _textController.clear();
          },
          child: SvgPicture.asset(
            'assets/Cancel.svg',
            alignment: Alignment.center,
          ),
        ),
      ),
    ),
  );
}

Widget getCustomAppBar(context, widget) {
  return Row(
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/Back.svg',
            height: 20,
          )),
      Text(
        "${widget.title}",
        style: TextStyle(
          color: MyColor.primary,
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
        ),
      )
    ],
  );
}
