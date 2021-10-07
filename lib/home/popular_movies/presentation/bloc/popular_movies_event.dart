part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesEvent extends Equatable {
  final List<Object> _props;

  PopularMoviesEvent([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class GetMoviesEvent extends PopularMoviesEvent {}
