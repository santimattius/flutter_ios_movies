import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ios_movies/home/popular_movies/domain/get_popular_movies.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/presentation/bloc/popular_tv_shows_bloc.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/usecases/usecase.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';
import 'package:meta/meta.dart';

part 'popular_movies_event.dart';

part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies}) : super(Init());

  @override
  Stream<PopularMoviesState> mapEventToState(
    PopularMoviesEvent event,
  ) async* {
    if (event is GetMoviesEvent) {
      yield Loading();
      final failureOrPictures = await getPopularMovies(
        NoParams(),
      );
      yield* _eitherLoadedOrErrorState(failureOrPictures);
    }
  }

  Stream<PopularMoviesState> _eitherLoadedOrErrorState(
    Either<Failure, List<Movie>> either,
  ) async* {
    yield either.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (movies) => Loaded(movies: movies),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
