import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../providers/book_provider.dart';

class FavoriteMovies extends StatelessWidget {
  static final routeName = '/favoriteMovies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: FavoritePage(),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int favCount = Provider.of<Movies>(context, listen: false).favCount;
    print(favCount);
    return (favCount > 0) ? FavoritesGrid() : NoFavorite();
  }
}

class FavoritesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: Provider.of<Movies>(context, listen: false).favCount,
      itemBuilder: (context, index) => FavoriteGridItem(
        favMovieIndex: index,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

class FavoriteGridItem extends StatelessWidget {
  final int favMovieIndex;

  FavoriteGridItem({@required this.favMovieIndex});

//   @override
//   Widget build(BuildContext context) {
//     final movies = Provider.of<Movies>(context, listen: false);
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(5),
//       child: GridTile(
//         child: Image.network(
//           movies.favoriteMovies[favMovieIndex].posterUrl,
//           fit: BoxFit.cover,
//         ),
//         footer: GridTileBar(
//           backgroundColor: Colors.black87,
//           trailing: IconButton(
//             icon: Icon(
//               Icons.play_arrow,
//               size: 22.0,
//             ),
//             color: Theme.of(context).accentColor,
//             onPressed: () {},
//           ),
//           leading: Column(
//             children: [
//               Text(
//                 movies.favoriteMovies[favMovieIndex].movieName,
//                 // 'Book details:',
//                 style: TextStyle(
//                   fontSize: 10.0,
//                 ),
//               ),
//               Consumer<Books>(
//                 builder: (context, books, _) {
//                   return Text(
//                     books
//                         .getBookDetails(
//                             movies.favoriteMovies[favMovieIndex].movieId)
//                         .bookName,
//                     style: TextStyle(
//                       fontSize: 13.0,
//                     ),
//                   );
//                 },
//               ),
//               Consumer<Books>(
//                 builder: (context, books, _) {
//                   return Text(
//                     books
//                         .getBookDetails(
//                             movies.favoriteMovies[favMovieIndex].movieId)
//                         .author,
//                     style: TextStyle(
//                       fontSize: 11.0,
//                       color: Colors.orange,
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//           // ]),
//         ),
//       ),
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movies>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        child: Image.network(
          movies.favoriteMovies[favMovieIndex].posterUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Books>(
            builder: (context, books, child) => Column(
              children: [
                child,
                Text(
                  books
                      .getBookDetails(
                          movies.favoriteMovies[favMovieIndex].movieId)
                      .bookName,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  books
                      .getBookDetails(
                          movies.favoriteMovies[favMovieIndex].movieId)
                      .author,
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
            child: Text(
              'Book details:',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nothing to Show',
        style:
            Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black),
      ),
    );
  }
}
