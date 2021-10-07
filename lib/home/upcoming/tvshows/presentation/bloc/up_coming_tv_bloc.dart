import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/presentation/bloc/popular_tv_shows_bloc.dart';
import 'package:flutter_ios_movies/home/upcoming/tvshows/domain/get_upcoming_tv.dart';
import 'package:flutter_ios_movies/shared/error/failures.dart';
import 'package:flutter_ios_movies/shared/usecases/usecase.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';
import 'package:meta/meta.dart';

part 'up_coming_tv_event.dart';

part 'up_coming_tv_state.dart';

class UpComingTvShowsBloc
    extends Bloc<UpComingTvShowsEvent, UpComingTvShowsState> {
  final GetUpComingTvShows getUpComingTvShows;

  UpComingTvShowsBloc({required this.getUpComingTvShows}) : super(Initial());

  @override
  Stream<UpComingTvShowsState> mapEventToState(
    UpComingTvShowsEvent event,
  ) async* {
    if (event is GetMoviesEvent) {
      yield Loading();
      final failureOrPictures = await getUpComingTvShows(
        NoParams(),
      );
      yield* _eitherLoadedOrErrorState(failureOrPictures);
    }
  }

  Stream<UpComingTvShowsState> _eitherLoadedOrErrorState(
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
