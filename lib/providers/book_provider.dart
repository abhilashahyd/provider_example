import 'package:flutter/foundation.dart';
import './../model/book_model.dart';

class Books extends ChangeNotifier {
  final List<BookModel> _books = [
    BookModel(
      bookId: 'M1',
      bookName: 'The Godfather',
      author: 'Mario Puzo',
    ),
    BookModel(
      bookId: 'M2',
      bookName: 'The Notebook',
      author: 'Nicholas Sparks',
    ),
  ];

  List<BookModel> get books {
    return _books;
  }

  int get bookCount {
    return _books.length;
  }

  BookModel getBookDetails(String bookId) {
    return _books.firstWhere((book) => book.bookId == bookId);
    // notifyListeners();
  }
  // void updateFavorite(BookModel bookItem) {
  //   bookItem.toggleFavorite();
  //   notifyListeners();
  // }

  // List<BookModel> get favoritebooks {
  //   return books.where((book) => book.isFavorite).toList();
  // }

  // int get favCount {
  //   return favoritebooks.length;
  // }
}
