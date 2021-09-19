part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesState extends Equatable {
  final List<Object> _props;

  PopularMoviesState([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class Init extends PopularMoviesState {}

class Empty extends PopularMoviesState {}

class Loading extends PopularMoviesState {}

class Loaded extends PopularMoviesState {
  final List<Movie> movies;

  Loaded({required this.movies}) : super([movies]);
}

class Error extends PopularMoviesState {
  final String message;

  Error({required this.message}) : super([message]);
}
