import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'util/movie_theme.dart';

import 'screens/movie_listview.dart';
import 'screens/main_drawer.dart';
// import 'model/movie_model.dart';
import './screens/movie_listview.dart';
import './screens/main_drawer.dart';
import 'package:provider_example/screens/favorite_movies.dart';
import 'package:provider_example/providers/movie_provider.dart';
import './providers/book_provider.dart';
// import './screens/login_screen.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<Movies>(
//       create: (context) => Movies(),
//       child: MaterialApp(
//           title: 'Flutter Demo',
//           theme: movieTheme,
//           home: MyHomePage(),
//           routes: {
//             FavoriteMovies.routeName: (context) => FavoriteMovies(),
//           }),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Books(),
        ),
        ChangeNotifierProvider(
          create: (_) => Movies(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: movieTheme,
          home: MyHomePage(),
          routes: {
            FavoriteMovies.routeName: (context) => FavoriteMovies(),
          }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies',
        ),
      ),
      drawer: MainDrawer(),
      body: MovieListView(),
    );
  }
}
