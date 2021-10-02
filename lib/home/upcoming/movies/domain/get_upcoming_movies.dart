import 'package:dartz/dartz.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/usecases/usecase.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/repositories/movies_repository.dart';

class GetUpComingMovies implements UseCase<List<Movie>, NoParams> {
  final MoviesRepository repository;

  GetUpComingMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await repository.getUpComings();
  }
}
