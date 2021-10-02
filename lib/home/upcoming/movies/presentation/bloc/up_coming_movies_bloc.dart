import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/presentation/bloc/popular_tv_shows_bloc.dart';
import 'package:flutter_ios_movies/home/upcoming/movies/domain/get_upcoming_movies.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/usecases/usecase.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';
import 'package:meta/meta.dart';

part 'up_coming_movies_event.dart';

part 'up_coming_movies_state.dart';

class UpComingMoviesBloc
    extends Bloc<UpComingMoviesEvent, UpComingMoviesState> {

  final GetUpComingMovies getUpComingMovies;

  UpComingMoviesBloc({required this.getUpComingMovies}) : super(Initial());


  @override
  Stream<UpComingMoviesState> mapEventToState(
      UpComingMoviesEvent event,
      ) async* {
    if (event is GetMoviesEvent) {
      yield Loading();
      final failureOrPictures = await getUpComingMovies(
        NoParams(),
      );
      yield* _eitherLoadedOrErrorState(failureOrPictures);
    }
  }

  Stream<UpComingMoviesState> _eitherLoadedOrErrorState(
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
