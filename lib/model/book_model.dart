import 'package:flutter/foundation.dart';

class BookModel {
  String bookId;
  String bookName;
  bool isFavorite;
  String author;

  BookModel(
      {@required this.bookId,
      @required this.bookName,
      @required this.author,
      this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
