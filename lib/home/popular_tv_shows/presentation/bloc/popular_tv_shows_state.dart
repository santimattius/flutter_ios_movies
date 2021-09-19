part of 'popular_tv_shows_bloc.dart';

@immutable
abstract class PopularTvShowsState extends Equatable {
  final List<Object> _props;

  PopularTvShowsState([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class Init extends PopularTvShowsState {}

class Empty extends PopularTvShowsState {}

class Loading extends PopularTvShowsState {}

class Loaded extends PopularTvShowsState {
  final List<TvShow> tvShows;

  Loaded({required this.tvShows}) : super([tvShows]);
}

class Error extends PopularTvShowsState {
  final String message;

  Error({required this.message}) : super([message]);
}