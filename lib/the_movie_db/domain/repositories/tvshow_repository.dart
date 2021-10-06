import 'package:dartz/dartz.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';

abstract class TvShowsRepository {
  Future<Either<Failure, List<TvShow>>> getPopulars();

  Future<Either<Failure, List<TvShow>>> getTopRated();
}
