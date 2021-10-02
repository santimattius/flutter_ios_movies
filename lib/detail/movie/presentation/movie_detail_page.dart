import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_movies/shared/presentation/base_page.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';

class MovieDetailPage extends BaseCupertinoPage {
  final Movie movie;

  MovieDetailPage(this.movie) : super();

  @override
  Widget content(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 250,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
            width: screenWidth,
            child: new Column(
              children: <Widget>[
                new Text(movie.overview),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  String title() => 'MovieDetailPage';
}
