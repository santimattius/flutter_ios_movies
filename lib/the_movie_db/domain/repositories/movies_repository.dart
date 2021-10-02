import 'package:dartz/dartz.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getPopulars();
  Future<Either<Failure, List<Movie>>> getUpComings();
}
