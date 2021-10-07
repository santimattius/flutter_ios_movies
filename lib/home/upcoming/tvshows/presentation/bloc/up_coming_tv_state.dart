part of 'up_coming_tv_bloc.dart';

@immutable
abstract class UpComingTvShowsState extends Equatable {
  final List<Object> _props;

  UpComingTvShowsState([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class Initial extends UpComingTvShowsState {}

class Empty extends UpComingTvShowsState {}

class Loading extends UpComingTvShowsState {}

class Loaded extends UpComingTvShowsState {
  final List<TvShow> tvShows;

  Loaded({required this.tvShows}) : super([tvShows]);
}

class Error extends UpComingTvShowsState {
  final String message;

  Error({required this.message}) : super([message]);
}
