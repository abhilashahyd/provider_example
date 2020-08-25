import 'package:flutter/foundation.dart';
import './../model/movie_model.dart';

class Movies extends ChangeNotifier {
  final List<MovieModel> _movies = [
    MovieModel(
      movieId: 'M1',
      movieName: 'The Godfather',
      posterUrl:
          'https://lunkiandsika.files.wordpress.com/2011/11/the-godfather-alternative-poster-1972-01.png',
    ),
    MovieModel(
      movieId: 'M2',
      movieName: 'The Notebook',
      posterUrl: 'http://www.impawards.com/2004/posters/notebook.jpg',
    ),
  ];

  List<MovieModel> get movies {
    return _movies;
  }

  int get movieCount {
    return _movies.length;
  }

  void updateFavorite(MovieModel movieItem) {
    movieItem.toggleFavorite();
    notifyListeners();
  }

  List<MovieModel> get favoriteMovies {
    return movies.where((movie) => movie.isFavorite).toList();
  }

  int get favCount {
    return favoriteMovies.length;
  }
}
