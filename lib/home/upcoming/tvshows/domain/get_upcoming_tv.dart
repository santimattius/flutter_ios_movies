import 'package:dartz/dartz.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/usecases/usecase.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/repositories/tvshow_repository.dart';

class GetUpComingTvShows implements UseCase<List<TvShow>, NoParams> {
  final TvShowsRepository repository;

  GetUpComingTvShows(this.repository);

  @override
  Future<Either<Failure, List<TvShow>>> call(NoParams params) async {
    return await repository.getTopRated();
  }
}
