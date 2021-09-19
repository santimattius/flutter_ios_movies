import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/domain/get_popular_tv_shows.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/usecases/usecase.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';
import 'package:meta/meta.dart';

part 'popular_tv_shows_event.dart';

part 'popular_tv_shows_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class PopularTvShowsBloc
    extends Bloc<PopularTvShowsEvent, PopularTvShowsState> {
  final GetPopularTvShows getPopularTvShows;

  PopularTvShowsBloc({required this.getPopularTvShows}) : super(Init());

  @override
  Stream<PopularTvShowsState> mapEventToState(
    PopularTvShowsEvent event,
  ) async* {
    if (event is GetTvShowsEvent) {
      yield Loading();
      final failureOrPictures = await getPopularTvShows(
        NoParams(),
      );
      yield* _eitherLoadedOrErrorState(failureOrPictures);
    }
  }

  Stream<PopularTvShowsState> _eitherLoadedOrErrorState(
    Either<Failure, List<TvShow>> either,
  ) async* {
    yield either.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (tvShows) => Loaded(tvShows: tvShows),
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
