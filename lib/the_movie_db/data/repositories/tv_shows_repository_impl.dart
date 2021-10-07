import 'package:dartz/dartz.dart';
import 'package:flutter_ios_movies/shared/error/exceptions.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/network/network_info.dart';
import 'package:flutter_ios_movies/the_movie_db/data/datasources/tv_show_remote_data_source.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/repositories/tvshow_repository.dart';

class TvShowsRepositoryImpl extends TvShowsRepository {
  final NetworkInfo networkInfo;
  final TvShowRemoteDataSource remoteDataSource;

  TvShowsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<TvShow>>> getPopulars() async {
    return await _getTvShows(() => this.remoteDataSource.getPopularTvShows());
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTopRated() async {
    return await _getTvShows(() => this.remoteDataSource.getTopRatedTvShows());
  }

  Future<Either<Failure, List<TvShow>>> _getTvShows(
      Future<List<TvShow>> Function() call) async {
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
