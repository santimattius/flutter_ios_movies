import 'package:flutter_ios_movies/detail/shared/presentation/base_detail_page.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';

class MovieDetailPage extends BaseDetailPage {
  final Movie movie;

  MovieDetailPage(this.movie) : super();

  @override
  String title() => movie.title;

  @override
  String description() => movie.overview;

  @override
  String poster() => movie.posterPath;
}
