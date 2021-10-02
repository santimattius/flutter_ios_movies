import 'package:dartz/dartz.dart';
import 'package:flutter_ios_movies/shared/error/exceptions.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/network/network_info.dart';
import 'package:flutter_ios_movies/the_movie_db/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final NetworkInfo networkInfo;
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Movie>>> getPopulars() async {
    return await _getMovies(() => this.remoteDataSource.getPopularMovies());
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpComings() async {
    return await _getMovies(() => this.remoteDataSource.getUpComingMovies());
  }

  Future<Either<Failure, List<Movie>>> _getMovies(
      Future<List<Movie>> Function() call) async {
    if (await networkInfo.isConnected) {
      try {
        var remoteMovies = await call();
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
