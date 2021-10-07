part of 'up_coming_movies_bloc.dart';

@immutable
abstract class UpComingMoviesState extends Equatable {
  final List<Object> _props;

  UpComingMoviesState([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class Initial extends UpComingMoviesState {}

class Empty extends UpComingMoviesState {}

class Loading extends UpComingMoviesState {}

class Loaded extends UpComingMoviesState {
  final List<Movie> movies;

  Loaded({required this.movies}) : super([movies]);
}

class Error extends UpComingMoviesState {
  final String message;

  Error({required this.message}) : super([message]);
}
